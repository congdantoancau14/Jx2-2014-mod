--head文件
Include("\\settings\\static_script\\online\\olympic\\oly_define.lua")
Include("\\script\\lib\\globalfunctions.lua")
Include("\\script\\online_activites\\task_values.lua")
Include("\\script\\task_access_code_def.lua")
Include("\\settings\\static_script\\online\\olympic\\oly_award_table.lua")
Include("\\script\\tmp_task_id_def.lua")
Include("\\settings\\static_script\\missions\\base\\mission_award_base.lua")
Include("\\script\\lib\\sdb.lua")

--回调函数路径
Oly_CallBack_Script = "\\script\\online\\olympic\\oly_head.lua";

OLY_ACTIVITY_TAG = 3 --每次重开都必须+1
-- OLY_ACTIVITY_DURATION = 1296000 --3600 * 24 * 15活动时长
OLY_ACTIVITY_DURATION = 630720000 -- 3600*24*365*20 (20 years)

--活动开始时间(根据格式调整)!!!!!!!!!
--activity start time
ACTIVITY_START_DATE = {2014,12,17} --{year，mouth，day}

--是否重开活动需要重置变量
function oly_CheckAndResetTask()
	if gf_GetTaskByte(VET_OLY_TASK4, 2) ~= OLY_ACTIVITY_TAG then
		SetTask(VET_OLY_TASK, 0, TASK_ACCESS_CODE_OLYMPIC)
		SetTask(VET_OLY_TASK1, 0, TASK_ACCESS_CODE_OLYMPIC)
		SetTask(VET_OLY_TASK2, 0, TASK_ACCESS_CODE_OLYMPIC)
		SetTask(VET_OLY_TASK3, 0, TASK_ACCESS_CODE_OLYMPIC)
		SetTask(VET_OLY_TASK4, 0, TASK_ACCESS_CODE_OLYMPIC)
		gf_SetTaskByte(VET_OLY_TASK4, 2, OLY_ACTIVITY_TAG, TASK_ACCESS_CODE_OLYMPIC)
	end
end

--活动开启时间判断
function oly_IsActivityOpen()
	local nCurrTime = GetTime();
	local nStartTime = MkTime(ACTIVITY_START_DATE[1],ACTIVITY_START_DATE[2],ACTIVITY_START_DATE[3],0,0,0);
	local nEndTime = nStartTime + OLY_ACTIVITY_DURATION;
	if nCurrTime >= nStartTime and nCurrTime <= nEndTime then
		oly_CheckAndResetTask();
		return 1;
	else
		return 0;
	end
end

--每日清理
function oly_DailyReset()
	if oly_IsActivityOpen() == 1 then
		--当天点火次数
		gf_SetTaskByte(VET_OLY_TASK,1,0,TASK_ACCESS_CODE_OLYMPIC);
		--猜数字领奖次数
		gf_SetTaskByte(VET_OLY_TASK1,1,0,TASK_ACCESS_CODE_OLYMPIC);
		--幸运数字
		gf_SetMyTaskByte(VET_OLY_TASK1,2,3,0,TASK_ACCESS_CODE_OLYMPIC);
		--猜数字领奖次数
		gf_SetTaskByte(VET_OLY_TASK1,4,0,TASK_ACCESS_CODE_OLYMPIC);
		--点火标记置0
		SetTask(VET_OLY_TASK3,0,TASK_ACCESS_CODE_OLYMPIC);
		--冥火鬼灵触发次数
		gf_SetTaskByte(VET_OLY_TASK4,1,0,TASK_ACCESS_CODE_OLYMPIC);
	end
end

--计算活动已开启天数
function oly_GetActivityOpenDays()
	local nCurrTime = GetTime();
	local nStartTime = MkTime(ACTIVITY_START_DATE[1],ACTIVITY_START_DATE[2],ACTIVITY_START_DATE[3],0,0,0);
	local nSpaceTimeSceconds = nCurrTime - nStartTime;
	return floor(nSpaceTimeSceconds / (3600 * 24)) + 1;
end

--等级流派限制
function oly_Is_LevelSkill()
	local nLevel = GetLevel();
	--if nLevel < 70 or gf_Check55FullSkill() == 0 or GetPlayerFaction() == 0 then
	--	Talk(1,"","玩家<color=green>70<color>级以上、已加入流派学会<color=green>1<color>套<color=green>55<color>级技能才可以参加活动");
	if nLevel < 80 or gf_Check55FullSkill() == 0 or GetPlayerFaction() == 0 then
		Talk(1,"",format("Ngi ch琲 c蕄 <color=green>%d<color> tr� l猲  gia nh藀 h� ph竔 h鋍 頲 <color=green>1<color> k� n╪g c蕄 <color=green>55<color> m韎 c� th� tham gia ho箃 ng.", 80));
		return 0;
	end
	return 1;
end

--满足nNum数量的圣火石
function oly_GetFlameNum(nKind,nNum)
	if GetItemCount(Flame_Table[nKind][1],Flame_Table[nKind][2],Flame_Table[nKind][3]) >= nNum then
		return 1;
	end
	return 0;
end

function oly_CreateShenghuoTan()
	if oly_IsActivityOpen() == 1 then
		local npcIndex = CreateNpc("aoyunshenghuotai","Th竛h H醓 Tuy襫 Ch﹗",100,1327,3077);
		SetNpcScript(npcIndex,"\\script\\online\\olympic\\npc\\red_sh.lua");
		local npcIndex = CreateNpc("aoyunshenghuotai","Th竛h H醓 Чi L�",400,1444,2876);
		SetNpcScript(npcIndex,"\\script\\online\\olympic\\npc\\black_sh.lua");
		local npcIndex = CreateNpc("aoyunshenghuotai","Th竛h H醓 Th祅h Й",300,1833,3670);
		SetNpcScript(npcIndex,"\\script\\online\\olympic\\npc\\green_sh.lua");
		local npcIndex = CreateNpc("aoyunshenghuotai","Th竛h H醓 Phng Tng",500,1768,3136);
		SetNpcScript(npcIndex,"\\script\\online\\olympic\\npc\\yellow_sh.lua");
		local npcIndex = CreateNpc("aoyunshenghuotai","Th竛h H醓 Tng Dng ",350,1431,2810);
		SetNpcScript(npcIndex,"\\script\\online\\olympic\\npc\\blue_sh.lua");
		local npcIndex = CreateNpc("aoyunshenghuotai","Th竛h H醓 Bi謓 Kinh",200,1470,2778);
		SetNpcScript(npcIndex,"\\script\\online\\olympic\\npc\\wuhuan_sh.lua");
	end	
end

--IB合成
function begin_combining_1(nKind)
	if oly_Is_LevelSkill() ~= 1 then
		return 0;
	end
	if oly_GetFlameNum(nKind,Compose_ShengHuo_Num_1) == 0 then
		Talk(1,"","S� lng Th竛h H醓 Th筩h kh玭g ");
		return 0;
	end
	local nNum = GetItemCount(Flame_Table[nKind][1],Flame_Table[nKind][2],Flame_Table[nKind][3]);
	local nNum1 = GetItemCount(WuCai_Shenshi[1],WuCai_Shenshi[2],WuCai_Shenshi[3]);
	SetTaskTemp(TMP_TASK_ID_OLY_COMPOSE_TEMP_INDEX,nKind);
	AskClientForNumber("begin_combining_1_callback",0,min(nNum,nNum1),"H穣 nh藀 s� lng v祇");
end

function begin_combining_1_callback(nNum)
	if gf_Judge_Room_Weight(1,1,"") ~= 1 then
  	Talk(1,"","Kh玭g gian h祅h trang kh玭g ")
  	return 0
	end
	local nKind = GetTaskTemp(TMP_TASK_ID_OLY_COMPOSE_TEMP_INDEX);
	if oly_GetFlameNum(nKind,Compose_ShengHuo_Num_1) == 0 then
		Talk(1,"","S� lng Th竛h H醓 Th筩h kh玭g ");
		return 0;
	end
	if nKind < 1 or nKind > 5 then return 0; end
	local nNum1 = GetItemCount(Flame_Table[nKind][1],Flame_Table[nKind][2],Flame_Table[nKind][3]);
	if nNum1 < nNum * Compose_ShengHuo_Num_1 then
		return 0;
	end
	local nNum2 = GetItemCount(WuCai_Shenshi[1],WuCai_Shenshi[2],WuCai_Shenshi[3]);
	if nNum2 < nNum * Compose_ShenShi_Num_1 then
		return 0;
	end
	--DelItem(g,d,p,num)
	if DelItem(Flame_Table[nKind][1],Flame_Table[nKind][2],Flame_Table[nKind][3],nNum * Compose_ShengHuo_Num_1) == 1 and DelItem(WuCai_Shenshi[1],WuCai_Shenshi[2],WuCai_Shenshi[3],nNum * Compose_ShenShi_Num_1) == 1 then
		gf_AddItemEx2({WuCai_ShenHuoZhong[1],WuCai_ShenHuoZhong[2],WuCai_ShenHuoZhong[3],nNum}, "Ng� S綾 Th竛h H醓 Th筩h", szLogTitle, "Gh衟 Th竛h H醓 Th筩h", 0, 1);
	end
end

--免费合成
function begin_combining_2(nKind)
	if oly_Is_LevelSkill() ~= 1 then
		return 0;
	end
	if oly_GetFlameNum(nKind,Compose_ShengHuo_Num_2) == 0 then
		Talk(1,"","S� lng Th竛h H醓 Th筩h kh玭g ");
		return 0;
	end
	local nNum = GetItemCount(Flame_Table[nKind][1],Flame_Table[nKind][2],Flame_Table[nKind][3]) / Compose_ShengHuo_Num_2;
	local nNum1 = floor(GetCash() / (Compose_Coin_Num_2 * 10000));
	SetTaskTemp(TMP_TASK_ID_OLY_COMPOSE_TEMP_INDEX,nKind);
	AskClientForNumber("begin_combining_2_callback",0,min(nNum,nNum1),"H穣 nh藀 s� lng v祇");
end

function begin_combining_2_callback(nNum)
	if gf_Judge_Room_Weight(1,1,"") ~= 1 then
  	Talk(1,"","Kh玭g gian h祅h trang kh玭g ")
  	return 0
	end
	local nKind = GetTaskTemp(TMP_TASK_ID_OLY_COMPOSE_TEMP_INDEX);
	if oly_GetFlameNum(nKind,Compose_ShengHuo_Num_2) == 0 then
		Talk(1,"","S� lng Th竛h H醓 Th筩h kh玭g ");
		return 0;
	end
	if nKind < 1 or nKind > 5 then return 0; end
	local nNum1 = GetItemCount(Flame_Table[nKind][1],Flame_Table[nKind][2],Flame_Table[nKind][3]);
	if nNum1 < nNum * Compose_ShengHuo_Num_2 then
		return 0;
	end
	local nNum2 = GetCash();
	if nNum2 < nNum * Compose_Coin_Num_2 * 10000 then
		return 0;
	end
	--DelItem(g,d,p,num)
	if DelItem(Flame_Table[nKind][1],Flame_Table[nKind][2],Flame_Table[nKind][3],nNum * Compose_ShengHuo_Num_2) == 1 and Pay(Compose_Coin_Num_2 * 10000 * nNum) == 1 then
		gf_AddItemEx2({WuCai_ShenHuoZhong[1],WuCai_ShenHuoZhong[2],WuCai_ShenHuoZhong[3],nNum}, "Ng� S綾 Th竛h H醓 Th筩h", szLogTitle, "Gh衟 Th竛h H醓 Th筩h", 0, 1);
	end
end

--猜数字游戏
function oly_begin_guess()
	if oly_Is_LevelSkill() ~= 1 then
		return 0;
	end
	--游戏开始，生成目标数
	local nTarget = random(1,OLY_MAX_RAND);
	gf_SetTaskByte(VET_OLY_TASK,2,nTarget,TASK_ACCESS_CODE_OLYMPIC); --生成的数
	gf_SetTaskByte(VET_OLY_TASK,3,0,TASK_ACCESS_CODE_OLYMPIC); --猜的次数
	gf_SetTaskByte(VET_OLY_TASK,4,0,TASK_ACCESS_CODE_OLYMPIC); --递归次数
	oly_begin_guess_input();
end

function oly_begin_guess_input()
	gf_SetTaskByte(VET_OLY_TASK,4,gf_GetTaskByte(VET_OLY_TASK,4) + 1,TASK_ACCESS_CODE_OLYMPIC)
	AskClientForNumber("oly_begin_guess_Child1",1,OLY_MAX_RAND,"Nh藀 ch� s� c竎 h� 畂竛 tr髇g");
end

--临时全局缓存猜的数字
function oly_begin_guess_Child1(nNum)
	local nTarget = gf_GetTaskByte(VET_OLY_TASK,2);
	local nTimes = gf_GetTaskByte(VET_OLY_TASK,4);
	if nNum == nTarget then
		Talk(1,"",format("Ch骳 m鮪g c竎 h�  畂竛 tr髇g r錳!!!  \n Ch� s� may m緉 c馻 c竎 h� l�<color=green>%d<color>, s� l莕 畂竛 l�<color=green>%d<color>",nTarget,nTimes));
		gf_SetTaskByte(VET_OLY_TASK,3,nTimes,TASK_ACCESS_CODE_OLYMPIC);
		gf_SetTaskByte(VET_OLY_TASK,4,Guess_Flag,TASK_ACCESS_CODE_OLYMPIC);
	else
		if nTimes >= OLY_MAX_GUESS then
			Talk(1,"",format("S� l莕 畂竛 qu�<color=green>%d<color>l莕, <color=red> 畂竛 sai<color>, Ch� s� may m緉 c馻 c竎 h� l�<color=red>%d<color>.",OLY_MAX_GUESS,nTarget));
			return 0;
		end
		if nNum > nTarget then
			Talk(1,"oly_begin_guess_input",format("Ch� s� 畂竛 l莕 %d c馻 c竎 h� l�<color=red>%d<color>, qu� l韓 r錳, h穣 畂竛 s� nh� h琻 t�.",nTimes,nNum));
		else
			Talk(1,"oly_begin_guess_input",format("Ch� s� 畂竛 l莕 %d c馻 c竎 h� l�<color=red>%d<color>, qu� nh� r錳, h穣 畂竛 s� l韓 h琻 t�.",nTimes,nNum));
		end
	end
end

--猜数字奖励
function oly_get_last_guess_award()
	if gf_GetTaskByte(VET_OLY_TASK,4) == 0 then
		Talk(1,"","Hi謓 t筰 c竎 h� kh玭g c遪 ph莕 thng  nh薾 n鱝 r錳!")
		return 0;
	end
	if gf_GetTaskByte(VET_OLY_TASK,4) ~= Guess_Flag then
		Talk(1,"","L莕 trc c竎 h�  畂竛 sai, kh玭g th� nh薾 ph莕 thng!")
		return 0;
	end
	local nNum = gf_GetTaskByte(VET_OLY_TASK1,1);
	if nNum >= OLY_MAX_AWARD_NUM then
		Talk(1,"","S� l莕 nh薾 ph莕 thng  qu� 3 l莕, kh玭g th� nh薾 th猰 頲 n鱝.");
		return 0;
	end
	if gf_Judge_Room_Weight(1,1,"") ~= 1 then
  	Talk(1,"","Kh玭g gian h祅h trang kh玭g ");
  	return 0
	end
	local nTimes = gf_GetTaskByte(VET_OLY_TASK,3);--竞猜次数
	if nTimes < 1 or nTimes > 5 then return 0; end
	--领奖
	gf_SetTaskByte(VET_OLY_TASK1,1,nNum + 1,TASK_ACCESS_CODE_OLYMPIC);
	gf_SetTaskByte(VET_OLY_TASK,4,0,TASK_ACCESS_CODE_OLYMPIC);
	gf_Modify("Exp",OLY_GUESS_AWARD_TABLE[nTimes][1]);
	gf_AddItemEx2(OLY_GUESS_AWARD_TABLE[nTimes][2], "Lam S綾 Th竛h H醓 Th筩h", szLogTitle, "Ph莕 thng 畂竛 s�", 0, 1);
end

--返回当前时间s
function oly_GetDayCurrTime()
	local nHour = tonumber(date("%H"));
	local nMinute = tonumber(date("%M"));
	local nSecond = tonumber(date("%S"));
	return nHour * 3600 + nMinute * 60 + nSecond;
end

--获得已发出数量
function oly_CallBack_GetTGNum(szKey, nKey1, nKey2, nCount, _szkey, _nkey1, _nkey2)
--	print("oly_CallBack_GetTGNum")
	if szKey == "" then
		szKey, nKey1, nKey2 = _szkey, _nkey1, _nkey2
	end
	if nCount == 0 then
		-- 没有记录
		AddRelayShareData(szKey, nKey1, nKey2, Oly_CallBack_Script, "do_nothing", Oly_Record.nSortType, Oly_Record.itemkey,"d",0);
	end
	local nFlag, nRank = GetRelayShareDataByKey(szKey, nKey1, nKey2, Oly_Record.itemkey)
	nFlag = nFlag or 0;
	SetGlbValue(Glb_Oly_TGL_NUM,nFlag);
	--这里的Relay数据是随时变化的，所以要删除Gamesvr这边的副本记录
	DelRelayShareDataCopy(szKey, nKey1, nKey2);
end

--已发出数量+
function oly_CallBack_ModifyTGNum(szKey, nKey1, nKey2, nCount, _szkey, _nkey1, _nkey2)
--	print("oly_CallBack_ModifyTGNum")
	if szKey == "" then
		szKey, nKey1, nKey2 = _szkey, _nkey1, _nkey2
	end
	local nTglNum = gf_GetMyTaskByte(VET_OLY_TASK2,3,4);
	if nCount == 0 then
		-- 没有记录
		AddRelayShareData(szKey, nKey1, nKey2, Oly_CallBack_Script, "do_nothing", Oly_Record.nSortType, Oly_Record.itemkey,"d",nTglNum);
		--这里的Relay数据是随时变化的，所以要删除Gamesvr这边的副本记录
		DelRelayShareDataCopy(szKey, nKey1, nKey2);
		return 0;
	end
	local nFlag, nRank = GetRelayShareDataByKey(szKey, nKey1, nKey2, Oly_Record.itemkey)
	nFlag = nFlag or 0;
	AddRelayShareData(szKey, nKey1, nKey2, Oly_CallBack_Script, "do_nothing", Oly_Record.nSortType, Oly_Record.itemkey,"d",nFlag + nTglNum);
	--这里的Relay数据是随时变化的，所以要删除Gamesvr这边的副本记录
	DelRelayShareDataCopy(szKey, nKey1, nKey2);
end

--获取累计数目
function oly_GetAccumulatedTglNum()
	--为0去共享数据库取
	ApplyRelayShareData(Oly_Record.szKey,Oly_Record.nKey1,Oly_Record.nKey2,Oly_CallBack_Script,"oly_CallBack_GetTGNum");
	local nDaysNum = oly_GetActivityOpenDays() * 50; --一天发50个
	nTgl = GetGlbValue(Glb_Oly_TGL_NUM) or 0; --已发出数量
	local nTglNum = nDaysNum - nTgl; --累计数目
	if nTglNum < 0 or nTglNum > (OLY_ACTIVITY_DURATION/(3600 * 24))*50  then
		print("ERROE:oly_GetAccumulatedTglNum() TGL")
		return -1;
	end
	return nTglNum;
end

function oly_CreateDlgTable()
	local tbSay = {};
	local nDayTime = oly_GetDayCurrTime(); --当天时间
	--	print("nDayTime",nDayTime);
	--可以猜幸运数字，显示幸运数字
	--0-21
	if nDayTime >= 0 and nDayTime < OLY_TIME_START then
		if gf_GetTaskByte(VET_OLY_TASK,1) < 6 then
			tinsert(tbSay,"Ch璦 ho祅 th祅h th緋 s竛g 6 l莕 /do_nothing");
		else
			if gf_GetMyTaskByte(VET_OLY_TASK1,2,3) == 0 then
				tinsert(tbSay,"Nh藀 ch� s� may m緉 v祇 /input_luck_num_201207");
			else
				tinsert(tbSay,format("Ch� s� may m緉 h玬 nay c馻 c竎 h� l�%d/do_nothing",gf_GetMyTaskByte(VET_OLY_TASK1,2,3)));
			end
		end
	end
	--不可以猜数字了，显示中没中，中了显示登记
	--21:00-21:30
	if nDayTime >= OLY_TIME_START and nDayTime < OLY_TIME_MID then
		--全局量为0，去共享数据库取
		--if GetGlbValue(Glb_Oly_Luck_NUM) == 0 then
		ApplyRelayShareData(Oly_Record2.szKey,Oly_Record2.nKey1,Oly_Record2.nKey2,Oly_CallBack_Script,"oly_CallBack_GetLuckNum");
		--end
		local nRelayLuckNum = GetGlbValue(Glb_Oly_Luck_NUM) or 0;
		local nMyluckNum = gf_GetMyTaskByte(VET_OLY_TASK1,2,3) or 0;
		if nRelayLuckNum == nMyluckNum and nRelayLuckNum ~= 0 then
			if gf_GetTaskByte(VET_OLY_TASK1,4) ~= 1 then
				tinsert(tbSay,"Tr髇g thng r錳, t筰 h� mu鑞 ng k�/register_mylucknum_201207");
			else
				tinsert(tbSay,"Tr髇g thng r錳,  頲 ng k�/do_nothing");
			end
		else
			tinsert(tbSay,"C竎 h�  kh玭g tr髇g thng, h穣 may m緉 l莕 sau/do_nothing");
		end
	end
	--不可以猜数字了，显示中没中，登记了显示领奖
	--21:30-22:00
	if nDayTime >= OLY_TIME_MID and nDayTime < OLY_TIME_END then
		--全局量为0，去共享数据库取
		if GetGlbValue(Glb_Oly_Luck_NUM) == 0 then
			ApplyRelayShareData(Oly_Record2.szKey,Oly_Record2.nKey1,Oly_Record2.nKey2,Oly_CallBack_Script,"oly_CallBack_GetLuckNum");
		end
		local nRelayLuckNum = GetGlbValue(Glb_Oly_Luck_NUM) or 0;
		local nMyluckNum = gf_GetMyTaskByte(VET_OLY_TASK1,2,3) or 0;
		if nMyluckNum == 0 or nRelayLuckNum ~= nMyluckNum then
			tinsert(tbSay,"C竎 h�  kh玭g tr髇g thng, h穣 may m緉 l莕 sau/do_nothing");
		else
			if gf_GetTaskByte(VET_OLY_TASK1,4) == 1 then
				tinsert(tbSay,"Tr髇g thng r錳, t筰 h� mu鑞 nh薾 ph莕 thng/get_lucknum_award_201207");
			else
				tinsert(tbSay,"Tr髇g thng r錳, nh璶g ch璦 ng k� ho芻  nh薾 ph莕 thng r錳/do_nothing");
			end
		end
	end
	--22:00-24:00
	if nDayTime >= OLY_TIME_END then
		tinsert(tbSay,"Ng祔 mai h穣 n/do_nothing");
	end

	return tbSay;
end

--Relay共享数据库回调函数
--每天21点调用一次
--每台gs都执行一次以最后随机数为准
function oly_CallBack_Relay_Random(szKey, nKey1, nKey2, nCount, _szkey, _nkey1, _nkey2)
--	print("oly_Callback_Relay_Random")
	if szKey == "" then
		szKey, nKey1, nKey2 = _szkey, _nkey1, _nkey2
	end
	local nRandom = random(1,OLY_MAX_LUCK_NUM);
	AddRelayShareData(szKey, nKey1, nKey2, Oly_CallBack_Script, "do_nothing", Oly_Record2.nSortType, Oly_Record2.itemkey,"d",nRandom);
	--这里的Relay数据是随时变化的，所以要删除Gamesvr这边的副本记录
	DelRelayShareDataCopy(szKey, nKey1, nKey2);
end

--获取幸运数字
--Glb_Oly_Luck_NUM
function oly_CallBack_GetLuckNum(szKey, nKey1, nKey2, nCount, _szkey, _nkey1, _nkey2)
--	print("oly_CallBack_GetLuckNum")
	if szKey == "" then
		szKey, nKey1, nKey2 = _szkey, _nkey1, _nkey2
	end
	--0到21点之间
	local nDayTime = oly_GetDayCurrTime(); --当天时间
	if nDayTime >= 0 and nDayTime < OLY_TIME_START then
		SetGlbValue(Glb_Oly_Luck_NUM,0);
		return 0;
	end
	local nFlag, nRank = GetRelayShareDataByKey(szKey, nKey1, nKey2, Oly_Record2.itemkey)
	nFlag = nFlag or 0;
	SetGlbValue(Glb_Oly_Luck_NUM,nFlag);
	--这里的Relay数据是随时变化的，所以要删除Gamesvr这边的副本记录
	DelRelayShareDataCopy(szKey, nKey1, nKey2);
end

function do_nothing()
	--do nothing
end

--累计数目，幸运数字，玩家幸运数字
function oly_GetBaseInfo()
	--数目
	local nTglNum = oly_GetAccumulatedTglNum();
	if nTglNum < 0 then
		print("ERROR:TGL Num is error");
		return 0,"",0;
	end
	--今天的幸运数字
	local strNum = "";
	if oly_GetDayCurrTime() < OLY_TIME_START then
		strNum = "21:00 t鑙 nay m� thng, trc 21:30 ng k� tr髇g thng, trc 22:00 nh薾 thng";
	else
		--幸运数据为0，去共享数据库取
		if GetGlbValue(Glb_Oly_Luck_NUM) == 0 then
			ApplyRelayShareData(Oly_Record2.szKey,Oly_Record2.nKey1,Oly_Record2.nKey2,Oly_CallBack_Script,"oly_CallBack_GetLuckNum");
		end
		local nNumTemp = GetGlbValue(Glb_Oly_Luck_NUM);
		if nNumTemp ~= 0 then
			strNum = tostring(nNumTemp);
		else
			strNum = "21:00 t鑙 nay m� thng, trc 21:30 ng k� tr髇g thng, trc 22:00 nh薾 thng";
		end
	end
	--我的幸运数字
	local nMyluckNum = gf_GetMyTaskByte(VET_OLY_TASK1,2,3);
	return nTglNum,strNum,nMyluckNum;
end

--登记中奖人数+1
function oly_CallBack_Rigister(szKey, nKey1, nKey2, nCount, _szkey, _nkey1, _nkey2)
--	print("oly_CallBack_Rigister")
	if szKey == "" then
		szKey, nKey1, nKey2 = _szkey, _nkey1, _nkey2
	end
	if nCount == 0 then
		-- 没有记录
		AddRelayShareData(szKey, nKey1, nKey2, Oly_CallBack_Script, "do_nothing", Oly_Record3.nSortType, Oly_Record3.itemkey,"d",0);
	end
	local nFlag, nRank = GetRelayShareDataByKey(szKey, nKey1, nKey2, Oly_Record3.itemkey)
	nFlag = nFlag or 0;
	--登记数量不超过10
	if nFlag < MAX_WIN_NUM then
		AddRelayShareData(szKey, nKey1, nKey2, Oly_CallBack_Script, "do_nothing", Oly_Record3.nSortType, Oly_Record3.itemkey,"d",nFlag + 1);
		--登记名字
		gf_SetTaskByte(VET_OLY_TASK1,4,1,TASK_ACCESS_CODE_OLYMPIC);
		Talk(1,"",format("C竎 h�  ng k� r錳, t� %d:%dn%d:%dgi� h穣 n nh薾 ph莕 thng",floor(OLY_TIME_MID/3600),floor(mod(OLY_TIME_MID,3600)/60),floor(OLY_TIME_END/3600),floor(mod(OLY_TIME_END,3600)/60)));
	else
		Talk(1,"",format("S� l莕 ng k�  vt qua %d l莕, kh玭g th� ng k� n鱝",MAX_WIN_NUM));
	end
	--这里的Relay数据是随时变化的，所以要删除Gamesvr这边的副本记录
	DelRelayShareDataCopy(szKey, nKey1, nKey2);
end

--登记中奖人数-1
function oly_CallBack_Rigister_Dec(szKey, nKey1, nKey2, nCount, _szkey, _nkey1, _nkey2)
	if szKey == "" then
		szKey, nKey1, nKey2 = _szkey, _nkey1, _nkey2
	end
	if nCount == 0 then
		-- 没有记录
		AddRelayShareData(szKey, nKey1, nKey2, Oly_CallBack_Script, "do_nothing", Oly_Record3.nSortType, Oly_Record3.itemkey,"d",0);
		--这里的Relay数据是随时变化的，所以要删除Gamesvr这边的副本记录
		DelRelayShareDataCopy(szKey, nKey1, nKey2);
		return 0;
	end
	local nFlag, nRank = GetRelayShareDataByKey(szKey, nKey1, nKey2, Oly_Record3.itemkey)
	--登记数量不小于0
	if nFlag > 0 then
		AddRelayShareData(szKey, nKey1, nKey2, Oly_CallBack_Script, "do_nothing", Oly_Record3.nSortType, Oly_Record3.itemkey,"d",nFlag - 1);
	end
	--这里的Relay数据是随时变化的，所以要删除Gamesvr这边的副本记录
	DelRelayShareDataCopy(szKey, nKey1, nKey2);
end

--取幸运数字领奖
function oly_CallBack_GetLuckPersonNum(szKey, nKey1, nKey2, nCount, _szkey, _nkey1, _nkey2)
--	print("oly_CallBack_GetLuckPersonNum")
	if szKey == "" then
		szKey, nKey1, nKey2 = _szkey, _nkey1, _nkey2
	end
	local nFlag, nRank = GetRelayShareDataByKey(szKey, nKey1, nKey2, Oly_Record3.itemkey)
	nFlag = nFlag or 0; --人数
	--领奖咯
	oly_GetLuckNumAward(nFlag);
	--这里的Relay数据是随时变化的，所以要删除Gamesvr这边的副本记录
	DelRelayShareDataCopy(szKey, nKey1, nKey2);
end

function oly_GetLuckNumAward(nFlag)
	if nFlag <= 0 or nFlag == nil then return 0; end
	local nTgl = oly_GetAccumulatedTglNum();
	if nTgl <= 0 then return 0; end
	if gf_Judge_Room_Weight(1,1,"") ~= 1 then
		Talk(1,"","Kh玭g gian h祅h trang kh玭g ")
		return 0;
	end
	--=======发奖
	gf_AddItemEx2({2,97,236,floor(nTgl/nFlag)}, "Thi猲 Ki猽 L謓h", szLogTitle, "Nh薾 thng ch� s� may m緉", 0, 1);
	Msg2Global(format("Ch骳 m鮪g %s trong R髏 Th╩ May M緉 nh薾 頲 %s*%d",GetName(), "Thi猲 Ki猽 L謓h", floor(nTgl/nFlag)));
	--领奖标记
	gf_SetTaskByte(VET_OLY_TASK1,4,0,TASK_ACCESS_CODE_OLYMPIC);
	--设置领取数量
	gf_SetMyTaskByte(VET_OLY_TASK2,3,4,floor(nTgl/nFlag),TASK_ACCESS_CODE_OLYMPIC);
	--累计数量+
	ApplyRelayShareData(Oly_Record.szKey,Oly_Record.nKey1,Oly_Record.nKey2,Oly_CallBack_Script,"oly_CallBack_ModifyTGNum");
	--登记人数减1
	ApplyRelayShareData(Oly_Record3.szKey,Oly_Record3.nKey1,Oly_Record3.nKey2,Oly_CallBack_Script,"oly_CallBack_Rigister_Dec");
end

--幸运数字值0
function oly_CallBack_LuckNum_ReSet(szKey, nKey1, nKey2, nCount, _szkey, _nkey1, _nkey2)
--	print("oly_CallBack_LuckNum_ReSet")
	if szKey == "" then
		szKey, nKey1, nKey2 = _szkey, _nkey1, _nkey2
	end
	AddRelayShareData(szKey, nKey1, nKey2, Oly_CallBack_Script, "do_nothing", Oly_Record2.nSortType, Oly_Record2.itemkey,"d",0);
	SetGlbValue(Glb_Oly_TGL_NUM,0);
	SetGlbValue(Glb_Oly_Luck_NUM,0);
	--这里的Relay数据是随时变化的，所以要删除Gamesvr这边的副本记录
	DelRelayShareDataCopy(szKey, nKey1, nKey2);
end

--登记数量置0
function oly_CallBack_Register_ReSet(szKey, nKey1, nKey2, nCount, _szkey, _nkey1, _nkey2)
--	print("oly_CallBack_Register_ReSet")
	if szKey == "" then
		szKey, nKey1, nKey2 = _szkey, _nkey1, _nkey2
	end
	AddRelayShareData(szKey, nKey1, nKey2, Oly_CallBack_Script, "do_nothing", Oly_Record3.nSortType, Oly_Record3.itemkey,"d",0);
end

--活动结束清除数目
function oly_CallBack_TGL_ReSet(szKey, nKey1, nKey2, nCount, _szkey, _nkey1, _nkey2)
	if szKey == "" then
		szKey, nKey1, nKey2 = _szkey, _nkey1, _nkey2
	end
	AddRelayShareData(szKey, nKey1, nKey2, Oly_CallBack_Script, "do_nothing", Oly_Record.nSortType, Oly_Record.itemkey,"d",0);
end

--点火次数累计奖励
function oly_Accumulate_FireNum()
	local nNum = gf_GetMyTaskByte(VET_OLY_TASK2,1,2);
	if nNum >= OLY_ACCUMULATE_FIRE_AWARD_TABLE[getn(OLY_ACCUMULATE_FIRE_AWARD_TABLE)][1] then
		return 0;
	end
	--次数+1
	gf_SetMyTaskByte(VET_OLY_TASK2,1,2,nNum+1,TASK_ACCESS_CODE_OLYMPIC);
	for i = 1, getn(OLY_ACCUMULATE_FIRE_AWARD_TABLE) do
		if OLY_ACCUMULATE_FIRE_AWARD_TABLE[i][1] == nNum+1  then
			if OLY_ACCUMULATE_FIRE_AWARD_TABLE[i][2] == 1 then
				gf_AddItemEx2(OLY_ACCUMULATE_FIRE_AWARD_TABLE[i][3], OLY_ACCUMULATE_FIRE_AWARD_TABLE[i][4], szLogTitle, "Ph莕 thng th緋 s竛g c閚g d錸 ", OLY_ACCUMULATE_FIRE_AWARD_TABLE[i][6], 1);
			elseif OLY_ACCUMULATE_FIRE_AWARD_TABLE[i][2] == 2 then
				gf_EventGiveCustomAward(OLY_ACCUMULATE_FIRE_AWARD_TABLE[i][3][1],OLY_ACCUMULATE_FIRE_AWARD_TABLE[i][3][2],OLY_ACCUMULATE_FIRE_AWARD_TABLE[i][3][3],OLY_ACCUMULATE_FIRE_AWARD_TABLE[i][3][4],OLY_ACCUMULATE_FIRE_AWARD_TABLE[i][3][5])
			elseif OLY_ACCUMULATE_FIRE_AWARD_TABLE[i][2] == 3 then
				if type(OLY_ACCUMULATE_FIRE_AWARD_TABLE[i][3]) == "string" then
					dostring(OLY_ACCUMULATE_FIRE_AWARD_TABLE[i][3]);
				end
			elseif OLY_ACCUMULATE_FIRE_AWARD_TABLE[i][2] == 4 then
				CustomAwardGiveGroup(OLY_ACCUMULATE_FIRE_AWARD_TABLE[i][3], 0)
			end
			--自行扩展
			if OLY_ACCUMULATE_FIRE_AWARD_TABLE[i][4] == "Thi猲 Cang L謓h" then
				--gf_SetMyTaskByte(VET_OLY_TASK2,1,2,0,TASK_ACCESS_CODE_OLYMPIC);
				Msg2Global(format("Ch骳 m鮪g %s t n s� l莕 th緋 s竛g Th竛h H醓 Уn nh薾 頲 Thi猲 Cang L謓h x 1",GetName()));
			end
			break
		end
	end
end

--随机星刻
function oly_XingKe_Award()
	gf_EventGiveRandAward(OLY_XINGKE_AWARD_TB, gf_SumRandBase(OLY_XINGKE_AWARD_TB), 1);
end

--随机天仪
function oly_TianYi_Award()
	gf_EventGiveRandAward(OLY_TIANYI_AWARD_TB, gf_SumRandBase(OLY_TIANYI_AWARD_TB), 1);
end

--师门4套
function oly_ShiMeng4_Award()
	MA_GiveFactionEquip4({1, nil, nil, 0}, szLogTitle);
end

--蕴灵2
function oly_YunLing2_Award()
	MA_GiveLevel2WenShi({1, nil, 30, 0}, szLogTitle);
end

--给奖励1
function oly_GiveAward1()
--	print("oly_GiveAward1")
--	gf_Modify("Exp",120000);
	gf_Modify("Exp",180000);
	gf_EventGiveRandAward(OLY_AWARD_1_TABLE,gf_SumRandBase(OLY_AWARD_1_TABLE),1,szLogTitle,"Ph莕 thng 1");
end

--给奖励2
function oly_GiveAward2()
--	print("oly_GiveAward2")
--	gf_Modify("Exp",200000);
	gf_Modify("Exp",OLY_EXP_2);
	gf_EventGiveRandAward(OLY_AWARD_2_TABLE,gf_SumRandBase(OLY_AWARD_2_TABLE),1,szLogTitle,"Ph莕 thng 2");
end

--给奖励3
function oly_GiveAward3()
--	print("oly_GiveAward3")
--	gf_Modify("Exp",300000);
	gf_Modify("Exp",OLY_EXP_3);
--	local nRand = gf_EventGiveRandAward(OLY_AWARD_3_TABLE,1000000,1,szLogTitle,"给奖励3");
--	if nRand == 30 or nRand == 23 or nRand == 22 or nRand == 21 or nRand == 20  then
--		local strName = OLY_AWARD_3_TABLE[nRand][3];
--		if nRand == 30 then
--			strName = "7级灵石";
--		end
--		Msg2Global(format("恭喜玩家%s在奥运活动中获得%s*1",GetName(),strName));
--	end
	gf_EventGiveRandAward(OLY_AWARD_3_TABLE,gf_SumRandBase(OLY_AWARD_3_TABLE),1,szLogTitle,"Ho箃 ng Th竛h H醓 Уn");
end

--给圣火石
function oly_AddShengHuo(nNum,nIndex)
	if oly_IsActivityOpen() == 1 then
		AddItem(Flame_Table[nIndex][1],Flame_Table[nIndex][2],Flame_Table[nIndex][3],nNum);
		Msg2Player(format("C竎 h� nh薾 頲 %s x %d",Flame_Table[nIndex][5],nNum));
	end
end

function oly_GetCountStep(nNum)
--	if nNum >= 0 and nNum < 50 then
--		return 50;
--	elseif nNum >= 50 and nNum < 100 then
--		return 100;
--	elseif nNum >= 100 and nNum < 150 then
--		return 150;
--	elseif nNum >= 150 and nNum < 300 then
--		return 300;
--	elseif nNum >= 300 and nNum < 600 then
--		return 600;
--	elseif nNum >= 600 and nNum < 800 then
--		return 800;
--	elseif nNum >= 800 and nNum < 1000 then
--		return 1000;
--	elseif nNum >= 1000 and nNum < 1200 then
--		return 1200;
--	end
	for i = 1, getn(OLY_ACCUMULATE_FIRE_AWARD_TABLE) do
		if nNum < OLY_ACCUMULATE_FIRE_AWARD_TABLE[i][1] then
			return i;
		end
	end
	return 0;
end

function oly_StarEquip_Award()
	gf_EventGiveRandAward(OLY_STAREQUIP_AWARD_TB, gf_SumRandBase(OLY_STAREQUIP_AWARD_TB), 1, szLogTitle, "Ho箃 ng Th竛h H醓 Уn");
end

--全服点火次数-----------------------------
function oly_AddFireCount(nNum)
	if not nNum or nNum <= 0 then
		return 0;
	end
	local s = SDB("olympic_addfire", 0, 0);
	s:apply2(callout(oly_AddFireCount_CB, tonumber(nNum)));
end

function oly_AddFireCount_CB(nNum, nCount, sdb)
	local sData = sdb["data"];
	if not sData[1] or nCount <= 0 then
		sData = {0}; --没有任何记录，置零
	end
	local s = SDB("olympic_addfire", 0, 0);
	sData[1] = sData[1] + nNum;
	s["data"] = {"d", sData[1]}; 
	Msg2Player(format("Th竛h H醓 Уn c馻 server  th緋 s竛g %d l莕", sData[1]))
end

function oly_GetFireCount()
	local s = SDB("olympic_addfire", 0, 0);
	s:apply2(oly_GetFireCount_CB);
end

function oly_GetFireCount_CB(nCount, sdb)
	local sData = sdb["data"];
	Talk(1,"",format("Th竛h H醓 Уn c馻 server  th緋 s竛g %d l莕", sData[1] or 0))
end
---------------------------------------------
