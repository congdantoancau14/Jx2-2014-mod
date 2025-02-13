--跨服公共函数库
Include("\\script\\task_access_code_def.lua")
Include("\\script\\lib\\define.lua")
Include("\\script\\system_switch_config.lua")
Include("\\script\\missions\\kuafu_battle\\kf_head.lua")
Include("\\settings\\static_script\\exchg_server\\exchange_paycoin_head.lua")
Include("\\script\\misc\\globaldatasync.lua")
Include("\\script\\missions\\nvn\\3v3.lua")

ESF_SZ_THIS_SCRIPT = "\\settings\\static_script\\exchg_server\\exchange_server_func.lua"

t_auto_sync_task_group = 
{
	--一组同步的变量不能过多 已知超过10个变量一起同步会同步不回来 所以五毒变量分成了2组分开同步
	--task list,access code,route
	{{2204,2207,2210,2213,2216}, 0, 21},--五毒蛊师变量组1
	{{3132}, 12, nil}, --跨服战场传回的任务变量
	{{3134}, 13, nil}, --通用金币消耗
	{{2219,2222,2225,2228,2231}, 0, 21},--五毒蛊师变量组2
	{{3187,3188}, 0, nil}, --3v3每场奖励
	{{3202,3203}, 20, nil}, --帮会大乱斗每场奖励
	{{661, 662,665, 666, 667}, 21, nil}, --比武大会战斗数据
	{{668, 669, 670, 671, 672}, 21, nil}, --比武大会战斗数据
	{{3219, 3220, 3221, 3222, 3223}, 21, nil}, --比武大会战斗数据2
	{{3224, 3225, 3226, 3227, 3228}, 21, nil}, --比武大会战斗数据2
	{{3254, 3255, 3256, 3257, 3258}, 30, nil}, --武林功勋和剑侠点数
	{{3271, 3272, 3274}, 33, nil}, --恩怨台战场
	{{3273}, 34, nil}, --跨服消耗天骄令
	{{3275, 3276, 3277}, 0, nil}, --跨服炮台战结果，个人积分和积分奖励
}

t_kf_reset_task_group = 
{
	--task list, resetvalue, access code, route
	{{2201,2202,2203,2205,2206,2208,2209,2211,2212,2214,2215,2217,2218,2220,2221,2223,2224,2226,2227,2229,2230}, 999,0, 21},--五毒蛊师变量
}

------------------------------------------------------------------------------------------------------------
--登入处理
function exgsvr_func_on_player_login()
	--print("exgsvr_func_on_player_login:",GetName())
	if kf_is_in_match_area() == 0 then	--原服
		sf_sync_task_group_from_kuafu() --变量同步回源服
	else								--跨服
		kf_reset_all_task_list()
	end
	exgsvr_func_check_init_p3v3(); --3v3搞起
end

--登出处理
function exgsvr_func_on_player_logout()
	--print("exgsvr_func_on_player_logout:",GetName())
	exgsvr_func_save_player_task()
	--3v3 uninit
	exgsvr_func_check_exit_p3v3()
end

function exgsvr_func_save_player_task()
	_tjl_player_syn_record() --记录天骄令
	
	if kf_is_in_match_area() == 0 then	--原服
			
	else								--跨服
		kf_sync_all_task_to_source()
	end
end

------------------------------------------------------------------------------------------------------------

--源服任务变量同步后的回调，跟具体功能相关
function on_kuafu_task_synced(nGroupId)
	--同步完成后执行的操作
	if 2 == nGroupId then
		KF_PlayerLoginOriginServer() --跨服战场玩家跨回源服需完成的操作（扣金）
	end	
	if 3 == nGroupId then
		pc_back_originalserver_pay() --通用金币消耗
	end
	if 5 == nGroupId then
		_3v3_every_match_award() --3v3每场奖励
	end
	if 13 == nGroupId then
		_tjl_player_syn_delitem(); --天骄令跨服消耗
	end
	--print(format("\n%son_kuafu_task_synced(%d)",GetName(), nGroupId))
	--Msg2Player(format("task saved group %d",nGroupId))
end

function kf_reset_all_task_list()
	if kf_is_in_match_area() == 0 then--不是跨服，不用同步了
		return 0
	end
	for i = 1,getn(t_kf_reset_task_group) do
		_kf_reset_task_group(i)
	end
end

function _kf_reset_task_group(nGroupId)
	if kf_is_in_match_area() == 0 then--不是跨服，不用同步了
		return 0
	end
	
	local t = t_kf_reset_task_group[nGroupId]
	if t then
		if not t[4] or GetPlayerRoute() == t[4] then
			for k,v in t[1] do
				SetTask(v,t[2],t[3])
    		end
		end
	end
end

--(跨服)同步所有变量到原服
function kf_sync_all_task_to_source()
	if kf_is_in_match_area() == 0 then--不是跨服，不用同步了
		return 0
	end
	for i = 1,getn(t_auto_sync_task_group) do
		_kf_sync_task_group_to_source(i)
	end
end

--修改跨服需要同步的变量
function kf_set_auto_sync_task(nGroupId, nIndexInGroup, nValue)
	local t = t_auto_sync_task_group[nGroupId]
	if t then
		local nTaskId = t[1][nIndexInGroup]
		if nTaskId then
			SetTask(nTaskId, nValue, t[2])
			return _kf_sync_task_group_to_source(nGroupId)
		end
	end
	return 0
end

--获取跨服需要同步的变量
function kf_get_auto_sync_task(nGroupId, nIndexInGroup)
	local t = t_auto_sync_task_group[nGroupId]
	if t then
		local nTaskId = t[1][nIndexInGroup]
		if nTaskId then
			return GetTask(nTaskId)
		end
	end
	return 0
end

--解包table。
--参数1：输入table
--参数2：开始位置。默认值为1
--参数3：结束位置。默认值为table大小
function gf_UnPack(tbTable,nStartIdx,nEndIdx)
	local nSize = getn(tbTable);
	nStartIdx = nStartIdx or 1;
	nEndIdx = nEndIdx or nSize;
	if tbTable[nStartIdx] and nStartIdx <= nEndIdx then
		return tbTable[nStartIdx],gf_UnPack(tbTable,nStartIdx+1,nEndIdx);
	end;
end;

--任务变量同步源服
function _kf_sync_task_group_to_source(nGroupId)
	if kf_is_in_match_area() == 0 then--不是跨服，不用同步了
		return 0
	end
	
	local t = t_auto_sync_task_group[nGroupId]
	if t then
		if (not t[3]) or (GetPlayerRoute() == t[3]) then
    		local strGbGroup,strName = _kf_GetRealmName(GetName())
    		local szKey, nKey1, nKey2,szItem = _kf_get_kuafu_share_data_keys(strName, nGroupId)
    		local strFormat = ""
    		local tb_value = {}
    		for k,v in t[1] do
    			local nValue = GetTask(v)
    			strFormat = strFormat.."dd"
    			tinsert(tb_value,v)
    			tinsert(tb_value,nValue)
    		end
    		--print(format("\nAddRelayShareDataToSourceRealm(%s,%d,%d,%s)",szKey, nKey1, nKey2,szItem))
    		AddRelayShareDataToSourceRealm(szKey, nKey1, nKey2,ESF_SZ_THIS_SCRIPT,"_kf_callback_nothing",0, szItem ,strFormat,gf_UnPack(tb_value))
    	end
	end
	return 0
end

function _kf_callback_nothing()
	--print("\n_kf_callback_nothing")
end

function _kf_get_kuafu_share_data_keys(szName, nGroupId)
	szName ="KF_"..szName
	local szItem = "GSTSK"..tostring(nGroupId)
	return szName,0, nGroupId, szItem
end

--从跨服同步任务变量数据
function sf_sync_task_group_from_kuafu()
	if kf_is_in_match_area() == 1 then--是跨服，就不用同步了
		return 0
	end
	
	--print("kf_sync_task_group_from_kuafu")
	
	for i= 1,getn(t_auto_sync_task_group) do
		if not t_auto_sync_task_group[i][3] or GetPlayerRoute() == t_auto_sync_task_group[i][3] then
			local szKey, nKey1, nKey2,szItem = _kf_get_kuafu_share_data_keys(GetName(), i)
			ApplyRelayShareData(szKey,nKey1,nKey2,ESF_SZ_THIS_SCRIPT,"_kf_sync_task_group_from_kuafu_callback")
			--print(format("\nApplyRelayShareData(%s,%d,%d,%s)",szKey,nKey1,nKey2,szItem))
		end
	end
	return getn(t_auto_sync_task_group)
end

function _kf_sync_task_group_from_kuafu_callback(strName,nKey1,nKey2,nItemCount, strSrcName,nSrcKey1,nSrcKey2)
	if strSrcName and nSrcKey1 and nSrcKey2 then--指定的数据不存在
		DelRelayShareDataCopy(strSrcName,nSrcKey1,nSrcKey2)
		ClearRelayShareData(strSrcName,nSrcKey1,nSrcKey2,ESF_SZ_THIS_SCRIPT,"_kf_clear_relay_share_data_callback")
		
		local szMsg = format("kuafu share data(%s,%d,%d) not exist",strSrcName,nSrcKey1,nSrcKey2)
		--print(format("\n%s",szMsg))
		WriteLogEx(szMsg)
		return
	end
	
	--print(format("\n_get relay share data(%s,%d,%d,%d)",strName,nKey1,nKey2,nItemCount))
	
	local szItem = "GSTSK"..tostring(nKey2)
	local nValue = GetRelayShareDataByKey(strName,nKey1,nKey2,szItem)
	if nValue == nil or nValue < 0 then
		WriteLogEx(format("get relay share data(%s,%d,%d,%s) fail",strName,nKey1,nKey2,szItem))
		return 0
	end
	
	local TbList = _kf_return_tb(GetRelayShareDataByKey(strName,nKey1,nKey2,szItem))
	if getn(TbList) < 2 then
		return 0
	end
	local t = t_auto_sync_task_group[nKey2] or {}
	local nAcc = t[2]
	for i=1,getn(TbList),2 do
		if TbList[i] ~= 0 and TbList[i+1] ~= nil then
			SetTask(TbList[i],TbList[i+1], nAcc)
		end
	end
	
	DelRelayShareDataCopy(strName,nKey1,nKey2)
	ClearRelayShareData(strName,nKey1,nKey2,ESF_SZ_THIS_SCRIPT,"_kf_clear_relay_share_data_callback")
	on_kuafu_task_synced(nKey2)
	return 1
end

function _kf_clear_relay_share_data_callback(strName,nKey1,nKey2)
	--do nothing
end

function _kf_return_tb(...)
	local nReturnTb = {}
	for i=1,arg.n do
		tinsert(nReturnTb,arg[i])
	end
	return nReturnTb
end

function kf_is_in_match_area()
	local nVersion,nCurGs = GetRealmType()
	return nCurGs or 0
end

--获取跨服玩家区服和名字
function _kf_GetRealmName(strName)
	local aa,bb,strGbGroup,strGbName = strfind(strName,"(.-)*(.*)")
	return strGbGroup,strGbName
end

--是否要搞起3v3
function exgsvr_func_check_init_p3v3()
	if Is3v3SystemOpen() ~= 1 then
		return 0;
	end
	--同步3v3任务变量
	local nVersion,nCurGs = GetRealmType()
	--源服
	if nCurGs ~= 1 then
		if GetTask(TASKID_NEED_SYNC_REALM_DATA) ~= 0 then
			SetTask(TASKID_NEED_SYNC_REALM_DATA, 0);
			GDS_updateTask(5,0);
		end
		--跨赛季的话初始化任务变量
		_3v3_CrossMatchRetsetPlayerTask();
	end
	--跨服，是搞3v3的，飘过
	local nMap_ID = GetWorldPos();
	if nCurGs == 1 and nMap_ID == 8000 then
		P3v3_Join();
		SendScript2Client("Open('3v3')");
	end
end

function exgsvr_func_check_exit_p3v3()
	if Is3v3SystemOpen() ~= 1 then
		return 0;
	end
	local nVersion,nCurGs = GetRealmType()
	local nMap_ID = GetWorldPos();
	if nCurGs == 1 and nMap_ID == 8000 then
		P3v3_Leave();
	end
end

--playerlogout
function _tjl_player_syn_record()
	--记录天骄令数目------
	local nTJL = BigGetItemCount(2, 97, 236);
	SetTask(TASKID_PLAYER_TJL_COUNT, nTJL, TASK_ACCESS_CODE_KFTJL);
	local _,nCurGs = GetRealmType()
	WriteLog(format("[_tjl_player_syn_record]PlayerLogout\t%s\t%s\t%d\t%d", GetAccount(), GetName(), nTJL, nCurGs));
end

--playerlogin
function _tjl_player_syn_delitem()
	local nTJL = BigGetItemCount(2, 97, 236);
	local nTaskTJL = GetTask(TASKID_PLAYER_TJL_COUNT);
	local nNeedDel = max(nTJL-nTaskTJL, 0);
	if nNeedDel <= 0 then
		return 0;
	end
	--优先消耗背包内道具
	local realcost = 0;
	local bagCount = GetItemCount(2, 97, 236);
	if bagCount >= nNeedDel then
		if DelItem(2, 97, 236, nNeedDel) == 1 then
			realcost = realcost + nNeedDel;
		end
	else
		if bagCount > 0 then
			if DelItem(2, 97, 236, bagCount) == 1 then
				realcost = realcost + bagCount; 
			end
		end
		if BigDelItem(2, 97, 236, nNeedDel - bagCount) == 1 then
			realcost = realcost + (nNeedDel - bagCount);
		end
	end
	SetTask(TASKID_PLAYER_TJL_COUNT, nTaskTJL - realcost, TASK_ACCESS_CODE_KFTJL);
	WriteLog(format("[_tjl_player_syn_delitem]PlayerLogin\t%s\t%s\t%d\t%d\t%d\t%d", GetAccount(), GetName(), nTJL, nTaskTJL, nNeedDel, realcost));
	if realcost < nNeedDel then
		WriteLog(format("[ERROR]_tjl_player_syn_delitem name:%s realcost:%d < nNeedDel:%d", GetName(), realcost, nNeedDel));
	end
end

--跨服接引人
t_kuafu_guide_npc_pos_gs={
	{300, 1850, 3550, "V� L﹎ Minh Ch�1", "Lien Dau Tiep Dan Quan", "\\script\\exchg_server\\exchg_server_npc.lua"},
	{100, 1344, 2939, "V� L﹎ Minh Ch�1", "Lien Dau Tiep Dan Quan", "\\script\\exchg_server\\exchg_server_npc.lua"},
	{150, 1775, 3119, "V� L﹎ Minh Ch�1", "Lien Dau Tiep Dan Quan", "\\script\\exchg_server\\exchg_server_npc.lua"},
	{350, 1606, 2937, "V� L﹎ Minh Ch�1", "Lien Dau Tiep Dan Quan", "\\script\\exchg_server\\exchg_server_npc.lua"},
}
--跨服领奖人
t_kuafu_award_npc_pos_gs={
	{300, 1855, 3556, "ZM_jieyingren", "Ngi Ph竧 Thng Li猲 Server", "\\script\\exchg_server\\exchg_server_award_npc.lua"},
	{350, 1613, 2944, "ZM_jieyingren", "Ngi Ph竧 Thng Li猲 Server", "\\script\\exchg_server\\exchg_server_award_npc.lua"},
	{100, 1350, 2946, "ZM_jieyingren", "Ngi Ph竧 Thng Li猲 Server", "\\script\\exchg_server\\exchg_server_award_npc.lua"},
	{150, 1781, 3126, "ZM_jieyingren", "Ngi Ph竧 Thng Li猲 Server", "\\script\\exchg_server\\exchg_server_award_npc.lua"},
}
--跨服接引人
t_kuafu_guide_npc_pos_ggs = {
	{8899, 1290, 2693, "V� L﹎ Minh Ch�1", "Lien Dau Tiep Dan Quan", "\\script\\exchg_server\\exchg_server_npc.lua"},
	{8899, 1431, 2809, "V� L﹎ Minh Ch�1", "Lien Dau Tiep Dan Quan", "\\script\\exchg_server\\exchg_server_npc.lua"},
	{8899, 1512, 2720, "V� L﹎ Minh Ch�1", "Lien Dau Tiep Dan Quan", "\\script\\exchg_server\\exchg_server_npc.lua"},
	{8899, 1347, 2592, "V� L﹎ Minh Ch�1", "Lien Dau Tiep Dan Quan", "\\script\\exchg_server\\exchg_server_npc.lua"},
}
--跨服报名人1
t_kuafu_join_npc_pos1_ggs={
	{8899, 1310, 2671, "KFZC_songshangbing", "Chi課 trng li猲 u","\\script\\missions\\kuafu_battle\\npc\\kf_jieyinren.lua"},
	{8899, 1403, 2778, "KFZC_songshangbing", "Chi課 trng li猲 u","\\script\\missions\\kuafu_battle\\npc\\kf_jieyinren.lua"},
	{8899, 1483, 2723, "KFZC_songshangbing", "Chi課 trng li猲 u","\\script\\missions\\kuafu_battle\\npc\\kf_jieyinren.lua"},
	{8899, 1376, 2588, "KFZC_songshangbing", "Chi課 trng li猲 u","\\script\\missions\\kuafu_battle\\npc\\kf_jieyinren.lua"},
}
--跨服报名人2
t_kuafu_join_npc_pos2_ggs={
	{8899, 1310, 2714, "T鑞g Tng Qu﹏", "Чi S� Bang Ph竔","\\script\\世界地图\\跨服演武场\\npc\\tong_ambassagor.lua"},
	{8899, 1413, 2828, "T鑞g Tng Qu﹏", "Чi S� Bang Ph竔","\\script\\世界地图\\跨服演武场\\npc\\tong_ambassagor.lua"},
	{8899, 1501, 2724, "T鑞g Tng Qu﹏", "Чi S� Bang Ph竔","\\script\\世界地图\\跨服演武场\\npc\\tong_ambassagor.lua"},
	{8899, 1358, 2588, "T鑞g Tng Qu﹏", "Чi S� Bang Ph竔","\\script\\世界地图\\跨服演武场\\npc\\tong_ambassagor.lua"},
}
--跨服报名人3
t_kuafu_join_npc_pos3_ggs = {
	{8899, 1330, 2695, "EYT_NPC", "Ngi ti誴 d蒼  O竛 Уi","\\script\\missions\\eyt_battle\\join_npc.lua"},
	{8899, 1387, 2802, "EYT_NPC", "Ngi ti誴 d蒼  O竛 Уi","\\script\\missions\\eyt_battle\\join_npc.lua"},
	{8899, 1490, 2755, "EYT_NPC", "Ngi ti誴 d蒼  O竛 Уi","\\script\\missions\\eyt_battle\\join_npc.lua"},
	{8899, 1359, 2618, "EYT_NPC", "Ngi ti誴 d蒼  O竛 Уi","\\script\\missions\\eyt_battle\\join_npc.lua"},
}

function _kf_create_npc_list(tNpcList)
	for _, tNpc in tNpcList do
		local npc = CreateNpc(tNpc[4], tNpc[5], tNpc[1], tNpc[2], tNpc[3]);
		if npc > 0 then
			SetNpcScript(npc, tNpc[6] or "");
		else
			WriteLogEx(format("Create[%s] Npc[%s][%s] fail", tNpc[1], tNpc[2], tNpc[6] or ""))
		end
	end
end

function _kf_create_npc_server_start()
	local _, at_ggs = GetRealmType()
	if at_ggs == 0 then
		_kf_create_npc_list(t_kuafu_guide_npc_pos_gs)
		_kf_create_npc_list(t_kuafu_award_npc_pos_gs)
	else
		_kf_create_npc_list(t_kuafu_guide_npc_pos_ggs)
		_kf_create_npc_list(t_kuafu_join_npc_pos1_ggs)
		_kf_create_npc_list(t_kuafu_join_npc_pos2_ggs)
		if ISEytSystemOpen() ~= 0 then
			_kf_create_npc_list(t_kuafu_join_npc_pos3_ggs)
		end
	end
end

function _check_to_kuafu_condition()
	local nTransLevel = gf_GetPlayerRebornCount() * 100 + GetLevel()
	if nTransLevel < 596 or GetPlayerRoute() == 0 then
		Talk(1, "", "Chuy觧 sinh 5 c蕄 96 v�  gia nh藀 l璾 ph竔 m韎 c� th� v祇 li猲 server")
		return 0;
	end
	if 1 ~= _check_exgsvr_click_time() then
		return 0;
	end
	if 1 ~= _check_exgsvr_pay_money() then
		return 0;
	end
	return 1;
end

--检查时间间隔
function _check_exgsvr_click_time()
	local NEED_TIME = 15
	local nLastTime = GetTask(TASKID_EXCHG_SVR_TIME);
	local nCurTime = GetTime();
	local nPastTime = nCurTime - nLastTime;
	if nPastTime < NEED_TIME then
		Talk(1,"",format("Thao t竎 qu� nhi襲, %ds sau h穣 th� l筰", NEED_TIME - nPastTime));
		return 0;
	end
	return 1;	
end

--跨服消耗金子
function _check_exgsvr_pay_money()
	local nPay = 10 --10银
	if GetCash() < nPay then
		Talk(1, "", format("V祅g kh玭g  %d", nPay))
		return 0;
	end
	Msg2Player(format("Li猲 server s� ti猽 hao %d b筩", nPay));
	return 1;
end


