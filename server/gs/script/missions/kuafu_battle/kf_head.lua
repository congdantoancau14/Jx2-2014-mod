Include("\\script\\lib\\globalfunctions.lua")
Include("\\script\\missions\\kuafu_battle\\kf_define.lua")
Include("\\script\\system_switch_config.lua")
Include("\\script\\task_access_code_def.lua")
Include("\\script\\lib\\missionfunctions.lua")
Include("\\script\\tmp_task_id_def.lua")
Include("\\script\\online\\award_head.lua")
Include("\\script\\missions\\kuafu_battle\\runtime_data_stat.lua")

----战场接引人创建
--function KF_Battle_BMR()
--	local nVersion,nCurGs = GetRealmType();
--	if IsSubSystemOpen(SYS_SWITCH_KF_BATTLE) == 1 and SubWorldID2Idx(KF_NPC_POS[1]) ~= -1 and nCurGs ~= 0 then
--			local nNpcIndex = CreateNpc("ZM_jieyingren", "跨服战场报名人", KF_NPC_POS[1], KF_NPC_POS[2], KF_NPC_POS[3]);
--			SetNpcScript(nNpcIndex, "\\script\\missions\\kuafu_battle\\npc\\kf_jieyinren.lua");
--	end
--end

--function KF_Battle_LJR()
--	local nVersion,nCurGs = GetRealmType();
--	if IsSubSystemOpen(SYS_SWITCH_KF_BATTLE) == 1 and SubWorldID2Idx(KF_NPC_POS_SRC[1]) ~= -1 and nCurGs == 0 then
--			local nNpcIndex = CreateNpc("ZM_jieyingren", "跨服战场领奖人", KF_NPC_POS_SRC[1], KF_NPC_POS_SRC[2], KF_NPC_POS_SRC[3]);
--			SetNpcScript(nNpcIndex, "\\script\\missions\\kuafu_battle\\npc\\kf_jieyinren.lua");
--	end
--end

--根据活跃度计算Index
function KF_Locate_Index(nActivity)
	if nActivity < 0 then return 1; end
	for i = 1, getn(KF_ACTIVITY_LEVEL) do
		if i ~= getn(KF_ACTIVITY_LEVEL) then
			if nActivity >= KF_ACTIVITY_LEVEL[i] and nActivity < KF_ACTIVITY_LEVEL[i+1] then
				return i;
			end
		else
			return i;
		end
	end	
end


--计算奖励
function KF_Calculate_Award()
	--经验，军功，道具
	local tResult = {0, 0, {0, 0, 0, 0, ""}};
	--获取结果
	local nRet = KF_GetBattleRezult();
	local tAward = KF_BATTLE_AWARD[nRet];
	if not tAward then  return tResult; end
	--获取活跃度
	local nActivity = KF_GetActivity();
	local nIndex = KF_Locate_Index(nActivity);
	local tSubAward = tAward[nIndex];
	if not tSubAward then return tResult; end
	local nExp = tSubAward[2][1] + tSubAward[2][2] * (nActivity - 10);
	local nExpAdd = (KF_EXP_EXT_RATE + 1)*(1 + GetVipCardParam())
	local nJunGongAdd = (1+KF_JUNGONG_EXT_RATE)
	return {nExp * nExpAdd, tSubAward[3] * nJunGongAdd, tSubAward[4]};
end

--奖励领取
function KF_GetAward(nKind)
	nKind = nKind or 0;
	local tRet;
	if nKind > 0 and nKind <= getn(KF_TMULTIPLE) then
		tRet = KF_TMULTIPLE[nKind];
	end
	if not tRet then return 0; end
	local tAward = KF_Calculate_Award();
	if tAward and tAward[1] == 0 and tAward[2] == 0 then
		return 0;
	end 
	if GetFreeItemRoom() < 4 then
		Talk(1,"","Kh玭g gian h祅h trang kh玭g ");
		return 0;
	end
	local tJGZ = {
		[2] = {2, 1, 9999, "Qu﹏ C玭g Chng"},
		[3] = {2, 1, 9998, "Qu﹏ C玭g Чi"},
		[4] = {2, 1, 9977, "Qu﹏ C玭g Huy Ho祅g"},
		[5] = {2, 1, 30642, "qu﹏ c玭g chng vinh d� "},
	}
	if tJGZ[nKind] then
		if DelItem(tJGZ[nKind][1], tJGZ[nKind][2], tJGZ[nKind][3], 1) ~= 1 then
			Talk(1,"",format("H祅h trang kh玭g  <color=green>%s<color>", tJGZ[nKind][4]));
			return 0;
		end
	end
	--给奖励
	gf_Modify("Exp", tAward[1] * tRet[1]);
	gf_EventGiveCustomAward(31, tAward[2] * tRet[2], 1, KF_LOGTITEL, tRet[4]);
	KF_ParkAward(tAward[3][1], tAward[3][2])
	if tRet[3] and getn(tRet[3]) == 2 and tRet[3][2] > 0 then
		KF_ParkAward(tRet[3][1], tRet[3][2]);
	end
	
	local nActivity = KF_GetActivity();
	local nActivityLevel = KF_Locate_Index(nActivity);
	_stat_when_award(nKind-1, nActivityLevel)

	--给当天第一次领奖奖励
--	local nActivity = KF_GetActivity();
--	local nIndex = KF_Locate_Index(nActivity);
--	if gf_GetTaskBit(KF_BATTLE_TASK, 28) == 0 and (nIndex > 3 or nKind > 2) then
--		local nRet = KF_GetBattleRezult();
--		if nRet == 2 then
--			gf_AddItemEx2({2,1,30498,2}, "勇士勋章", KF_LOGTITEL, "第一领奖额外奖励", 0, 1);
--			--第一次标志否
--			gf_SetTaskBit(KF_BATTLE_TASK, 28, 1, TASK_ACCESS_CODE_KF_BATTLE);
--		elseif nRet == 3 or nRet == 4 then
--			gf_AddItemEx2({2,1,30498,1}, "勇士勋章", KF_LOGTITEL, "第一领奖额外奖励", 0, 1);
--			--第一次标志否
--			gf_SetTaskBit(KF_BATTLE_TASK, 28, 1, TASK_ACCESS_CODE_KF_BATTLE);
--		end
--	end	
	
	--其他功能或活动给的奖励
	aw_kfbattle_award(nKind-1);
	--武林功勋
	local nRet = KF_GetBattleRezult();
	if nRet == 2 then
		merit_KfBattle(1, nKind - 1);
	elseif nRet == 3 then
		merit_KfBattle(0, nKind - 1);
	elseif nRet == 4 then
		merit_KfBattle(-1, nKind - 1);
	end
	
	--重置标记变量
	KF_SetBattleRezult(0);
	KF_SetActivity(0);
end

--战场结果
function KF_SetBattleRezult(nValue)
	--1未开启，2胜利，3失败，4平局
	if nValue < 0 or nValue > 4 then
		return 0;
	end
	gf_SetMyTaskBit(KF_BATTLE_TASK, 29, 31, nValue, TASK_ACCESS_CODE_KF_BATTLE);
end

function KF_GetBattleRezult()
	return gf_GetMyTaskBit(KF_BATTLE_TASK, 29, 31);
end

--活跃度
function KF_SetActivity(nValue)
	if nValue < 0 or nValue > 2^11 - 1 then
		return 0;
	end
	--累计自己
	gf_SetMyTaskBit(KF_BATTLE_TASK, 6, 16, nValue, TASK_ACCESS_CODE_KF_BATTLE);
end

function KF_AddActivity(nValue, nCamp)
	local nActivity = KF_GetActivity();
	if nActivity + nValue < 0 or nActivity + nValue > 2^11 - 1 then
		print("UDERROR: KF_SetActivity nValue illegality");
		return 0;
	end
	--累计到MISSION上去
	if nCamp == nil then
		nCamp = KF_GetCamp();
	end
	if nCamp == KF_CampOne_ID then
		SetMissionV(KF_MV_BATTLE_SONG_ACTIVITY, GetMissionV(KF_MV_BATTLE_SONG_ACTIVITY) + nValue);
	elseif nCamp == KF_CampTwo_ID then
		SetMissionV(KF_MV_BATTLE_LIAO_ACTIVITY, GetMissionV(KF_MV_BATTLE_LIAO_ACTIVITY) + nValue);
	end
	--累计自己
	gf_SetMyTaskBit(KF_BATTLE_TASK, 6, 16, nActivity + nValue, TASK_ACCESS_CODE_KF_BATTLE);
	Msg2Player(format("ч t輈h c鵦 t╪g %d,  t輈h c鵦 hi謓 t筰 l� %d", nValue, nActivity + nValue));
end

function KF_GetActivity()
	return gf_GetMyTaskBit(KF_BATTLE_TASK, 6, 16);
end

--参加次数
function KF_SetJoinTimes(nValue)
	if nValue < 0 or nValue > KF_JOIN_TIMES_MAX then
		print("UDERROR: KF_SetJoinTimes nValue < 0 or nValue > KF_JOIN_TIMES_MAX");
		return 0;
	end
	gf_SetTaskByte(KF_BATTLE_TASK, 3, nValue, TASK_ACCESS_CODE_KF_BATTLE);
end

function KF_GetJoinTimes()
	return gf_GetTaskByte(KF_BATTLE_TASK, 3);
end

--阵营
function KF_SetCamp(nCamp)
	if nCamp ~= KF_CampOne_ID and nCamp ~= KF_CampTwo_ID then
		print("UDERROR: KF_SetCamp nCamp illegality");
		return 0;
	end
	gf_SetMyTaskBit(KF_BATTLE_TASK, 25, 26, nCamp, TASK_ACCESS_CODE_KF_BATTLE);
	return 1;
end

function KF_GetCamp()
	return gf_GetMyTaskBit(KF_BATTLE_TASK, 25, 26, TASK_ACCESS_CODE_KF_BATTLE);
end

--积分增加
function KF_AddScore(nValue, nCamp, f)
	if not nValue or nValue < 0 then return 0; end
	if SubWorld and SubWorld > 0 then
		if nCamp == nil then
			nCamp = KF_GetCamp();
			SetTaskTemp(TMP_TASK_KF_SCORE, GetTaskTemp(TMP_TASK_KF_SCORE) + nValue);
		end
	else --npc杀死npc
		if nCamp == nil then	return 0;	end
		SubWorld = f
	end
	if nCamp == KF_CampOne_ID then
		local  nScore = GetMissionV(KF_MV_BATTLE_SONG_SCORE);
		SetMissionV(KF_MV_BATTLE_SONG_SCORE, min(nScore + nValue, GetMissionV(KF_SCORE_MAX)));
	elseif nCamp == KF_CampTwo_ID then
		local  nScore = GetMissionV(KF_MV_BATTLE_LIAO_SCORE);
		SetMissionV(KF_MV_BATTLE_LIAO_SCORE, min(nScore + nValue, GetMissionV(KF_SCORE_MAX)));
	end
	return 1;
end

--获得积分
function KF_GetScore()
	local nCamp = KF_GetCamp();
	if nCamp == KF_CampOne_ID then
		return GetMissionV(KF_MV_BATTLE_SONG_SCORE);
	elseif nCamp == KF_CampTwo_ID then
		return GetMissionV(KF_MV_BATTLE_LIAO_SCORE);
	else
		return 0;
	end
end
--隔天清理的
function KF_Daily_Reset()
	--清理参加次数
	KF_SetJoinTimes(0);
	--清理第一次领奖标记
	gf_SetTaskBit(KF_BATTLE_TASK, 28, 0, TASK_ACCESS_CODE_KF_BATTLE);
end

--找到合适的MISSION
function KF_GetSuitMap(nPlayerNum)
	local tbMapID = gf_GetDataTable(GetSameMaps(KF_MAP_ID));
	local tbRetzult = {};
	for i =1, getn(tbMapID) do
		--不是动态地图的不要
		if tbMapID[i] ~= KF_MAP_ID and 
			mf_GetMissionV(KF_MISSION_ID, KF_MV_BATTLE_STATE, tbMapID[i]) == KF_MS_STATE_PEACE and
			(mf_GetPlayerCount(KF_MISSION_ID, KF_CampOne_ID, tbMapID[i]) + nPlayerNum <= KF_PLAYER_MAX_NUM
			or mf_GetPlayerCount(KF_MISSION_ID, KF_CampTwo_ID, tbMapID[i]) + nPlayerNum <= KF_PLAYER_MAX_NUM) then
			--print("tinsert(tbRetzult, tbMapID[i]);",tbMapID[i])
			tinsert(tbRetzult, tbMapID[i]);
		end
	end
	if getn(tbRetzult) == 0 then
		return 0;
	end
	if getn(tbRetzult) ~= 1 then
		print("UDERROR: getn(tbRetzult) ~= 1");
	end
	return tbRetzult[1];
end

--玩家加入战场
function KF_JoinBattle(nCamp)
	CleanInteractive();
	local nMapID = gf_GetCurMapID();
	if NewWorld(nMapID, KF_JOIN_MISSION_POS[nCamp][1], KF_JOIN_MISSION_POS[nCamp][2]) == 1 then
		Msg2MSAll(KF_MISSION_ID, GetName().."  gia nh藀 "..KF_tCampName[nCamp]);
		Msg2Player("C竎 h�  gia nh藀 r錳"..KF_tCampName[nCamp]);
		KF_SetPlayerState(nCamp);
		AddMSPlayer(KF_MISSION_ID, nCamp);
		KF_SetCamp(nCamp);
		if GetItemCount(KF_ITEM_LINGPAI[nCamp][1], KF_ITEM_LINGPAI[nCamp][2], KF_ITEM_LINGPAI[nCamp][3]) < 1 then
			AddItem(KF_ITEM_LINGPAI[nCamp][1], KF_ITEM_LINGPAI[nCamp][2], KF_ITEM_LINGPAI[nCamp][3], 1);
			Msg2Player(format("B筺 nh薾 頲 %s",KF_ITEM_LINGPAI[nCamp][4]));
		end
		EnterChannel(KF_BATTLE_CHANNEL[KF_ALL_ID][1]..nMapID);
		EnterChannel(KF_BATTLE_CHANNEL[nCamp][1]..nMapID);
		KF_SetJoinTimes(KF_GetJoinTimes() + 1);
		KF_SetBattleRezult(1);
		if gf_GetCaptainName() == GetName() then
			gf_SetMyTaskBit(KF_BATTLE_TASK, 1, 5, gf_GetMyTaskBit(KF_BATTLE_TASK, 1, 5) + gf_GetTeamSize(), TASK_ACCESS_CODE_KF_BATTLE);
			Pay(gf_GetTeamSize() * KF_ENTRY_FEE * 10000); --实际上这里是未扣金的这里是跨服
		end
		return 1;
	else
		return 0;
	end;
end

--设置状态
function KF_SetPlayerState(nCamp)
	SetLogoutRV(1);	--设置登陆点为城市重生点
	SetDeathPunish(0);	--无死亡惩罚
	ForbitTrade(1);	--禁止交易
	InteractiveEnable(0);	--关闭交互
	StallEnable(0);	--禁止摆摊(下线后会被清掉)
	UseScrollEnable(0);	--禁止使用回城符
	ForbidChangePK(0);	--允许改变PK状态
	SetPKFlag(1,nCamp);
	ForbidChangePK(1);	--禁止改变PK状态
	SetFightState(0);
	KillFollower();	--删除跟班
	SetMomentumBoundSwitch(1);	--不可增加杀气值
	SetDeathScript(KF_PLAYER_DEATH_SCRIPT); --死亡脚本
	SetCampToPlayer(KF_tCampType[nCamp]); --设置阵营
	local nMapID = GetWorldPos();
	SetTempRevPos(nMapID, KF_JOIN_MISSION_POS[nCamp][1], KF_JOIN_MISSION_POS[nCamp][2]);
	SetTaskTemp(TMP_TASK_KF_KILL_NUM, 0);
	SetTaskTemp(TMP_TASK_KF_SCORE, 0);
	DelNBWeapon();
	local nCurrMapId, nModelMapID = SubWorldIdx2ID(SubWorld);
	SetTempRevPos(nCurrMapId, KF_JOIN_MISSION_POS[nCamp][1]*32, KF_JOIN_MISSION_POS[nCamp][2]*32);
	SetCreateTeam(1);--组队关闭
end

--重置状态
function KF_ResetPlayerState()
	SetLogoutRV(0);
	SetDeathPunish(1);
	InteractiveEnable(1);	
	UseScrollEnable(1);
	ForbidChangePK(0);	--允许改变PK状态	
	SetPKFlag(0,0);	
	SetFightState(0);
	SetDeathScript("");
	SetTempRevPos(0,0,0);
	SetCampToPlayer("");
	KillFollower();	--删除跟班
	SetMomentumBoundSwitch(0);
	RemvoeTempEffect(); --清除玩家身上的所有临时状态
	SetTaskTemp(TMP_TASK_KF_KILL_NUM, 0);
	SetTaskTemp(TMP_TASK_KF_SCORE, 0);
	--清雪恨状态
	RemoveState(9908);
	RemoveState(9909);
	RemoveState(9910);
	RemoveState(9911);
	RemvoeTempEffect();
	local nCamp = KF_GetCamp();
	local nMapID = gf_GetCurMapID();
	LeaveChannel(KF_BATTLE_CHANNEL[KF_ALL_ID][1]..nMapID);
	LeaveChannel(KF_BATTLE_CHANNEL[nCamp][1]..nMapID);
	FloatMsg2Player();
	DelNBWeapon();
	SetTempRevPos(0,0,0)
	SetCreateTeam(0);--组队打开
end

--离开战场或登出触发器
function KF_LeaveBattle()
	local nCurMapId = GetWorldPos();
	KF_ResetPlayerState();
	local tCell = KF_OUT_POS[random(getn(KF_OUT_POS))];
	if 1 == NewWorld(tCell[1], tCell[2], tCell[3]) then
		local nCamp = KF_GetCamp();
		if nCamp ~= KF_CampOne_ID and nCamp ~= KF_CampTwo_ID then
			return 0;
		end
		if GetItemCount(KF_ITEM_LINGPAI[nCamp][1], KF_ITEM_LINGPAI[nCamp][2], KF_ITEM_LINGPAI[nCamp][3]) > 0 then
			DelItem(KF_ITEM_LINGPAI[nCamp][1], KF_ITEM_LINGPAI[nCamp][2], KF_ITEM_LINGPAI[nCamp][3], 1);
		end
		local nBattleState = mf_GetMissionV(KF_MISSION_ID, KF_MV_BATTLE_STATE, nCurMapId);
		if nBattleState == KF_MS_STATE_FIGHT then
			KF_SetBattleRezult(1);--中途退出
		end
		if nBattleState ~= KF_MS_STATE_COMPLETE then
			Msg2MSAll(KF_MISSION_ID, KF_tCampName[nCamp].."-"..GetName().."Х r阨 kh醝 chi課 trng li猲 u");
		end;		
	end
end

--初始化战场数据
function KF_InItBattle()
	SetMissionV(KF_MV_BATTLE_TIMER_LOOP, KF_PEACE_TIMER_LOOP); --等待时间的timer次数
	StartMissionTimer(KF_MISSION_ID, KF_TIMER_ID, KF_PEACE_TIME); --启动timer
	SetMissionV(KF_MV_BATTLE_STATE, KF_MS_STATE_PEACE);		--设置当前mission状态
	SetMissionV(KF_MV_BATTLE_GAME_FRAMETIME, GetGameLoop()); --记录游戏帧
end

--启动战场
function KF_RunBattle()
	Msg2MSAll(KF_MISSION_ID, "Th竚 t� h錳 b竜, phe ch  b総 u h祅h ng, c竎 h祇 ki謙 h穣 nhanh ch鉵g ti課 v祇 ti襫 tuy課 quy誸 m閠 tr薾 t� chi課 v韎 ch.");
	StartMissionTimer(KF_MISSION_ID, KF_TIMER_ID, KF_FIGHT_TIME);
	SetMissionV(KF_MV_BATTLE_TIMER_LOOP, KF_FIGHT_TIMER_LOOP);
	SetMissionV(KF_MV_BATTLE_STATE, KF_MS_STATE_FIGHT);
	KF_OperateAllPlayer(KF_SetBattleRezult, 3, KF_ALL_ID); --开启了战场默认是失败的
end

--结束战场
function KF_EndBattle()
	local nPlayerOne = GetMSPlayerCount(KF_MISSION_ID, KF_CampOne_ID);
	local nPlayerTwo = GetMSPlayerCount(KF_MISSION_ID, KF_CampTwo_ID);	
	WriteLog("[Chi課 trng li猲 u k誸 th骳]: th阨 gian l�"..tostring(date()).."Chi課 trng li猲 u  k誸 th骳, s� ngi cu鑙 c飊g l�: ["..nPlayerOne.."]:["..nPlayerTwo.."], t鎛g s� ngi l�: "..(nPlayerOne+nPlayerTwo)); 
	KF_ProcessBattleOver();
	--未成功开启则战场开启数不增加
	if GetMissionV(KF_MV_BATTLE_IS_OPEN_SUCC) == KF_MISSION_OPEN_FAIL_FLAG then
		local nMissionCount = GetMapTaskTemp(KF_MAP_TASK_TEMP_ID, KF_CURR_OPEN_COUNT);
		SetMapTaskTemp(KF_MAP_TASK_TEMP_ID ,KF_CURR_OPEN_COUNT, nMissionCount - 1);
	end
	local nMapID = GetMissionV(KF_MV_BATTLE_MAP_ID);	
	ClearMapNpc(nMapID);
	local nMapIdx = GetMissionV(KF_MV_BATTLE_MAP_INDEX);
	mf_ClearMissionData();
	local nRetCode = FreeDynamicMap(nMapID, nMapIdx);	--FreeDynamicMap也会调用CloseMisssion
	if nRetCode ~= 1 then
		WriteLog("[Chi課 trng li猲 u]: FreeDynamicMap b竜 l鏸, nRetCode:"..nRetCode);
	end;		
	KF_DeleteChannel();
end

function KF_OpenBattleFail()
	--恢复一下数据
	KF_SetBattleRezult(0);
	KF_SetActivity(0);
	KF_SetJoinTimes(KF_GetJoinTimes() - 1);
	if gf_GetCaptainName() == GetName() then
		local nCount = gf_GetMyTaskBit(KF_BATTLE_TASK, 1, 5) - gf_GetTeamSize();
		if nCount >= 0 then
			gf_SetMyTaskBit(KF_BATTLE_TASK, 1, 5, nCount, TASK_ACCESS_CODE_KF_BATTLE);
			Earn(gf_GetTeamSize() * KF_ENTRY_FEE * 10000); --实际上这里是未给金的这里是跨服
		end
	end
end

--处理战场结束
function KF_ProcessBattleOver()
	local udFunc = function()
		--判断胜负
		local nWinner = GetMissionV(KF_MV_BATTLE_WINNER);
		local nCamp = KF_GetCamp();
		if nWinner == nCamp then
			KF_SetBattleRezult(2); --胜利
		elseif nWinner == KF_ALL_ID then
			if GetMissionV(KF_MV_BATTLE_IS_OPEN_SUCC) == KF_MISSION_OPEN_FAIL_FLAG then
				KF_OpenBattleFail();
			else
				KF_SetBattleRezult(4); --平手
			end
		else
			KF_SetBattleRezult(3); --失败
		end
		--
		DelMSPlayer(KF_MISSION_ID, nCamp);
	end
	KF_OperateAllPlayer(udFunc, {}, KF_ALL_ID);
end

--初始化战场NPC创建
function KF_CreateNpc()
	local nMapID = SubWorldIdx2ID(SubWorld);
	local npcIndex;
	--对话NPC
	for i, npc in pairs(KF_TALK_NPC) do
		npcIndex = CreateNpc(npc[1], npc[2], nMapID, npc[3], npc[4]);
		SetNpcScript(npcIndex, npc[5]);
	end
	--怪物NPC
	for i, npc in pairs(KF_MONSTER_NPC) do
		npcIndex = CreateNpc(npc[1], npc[2], nMapID, npc[3], npc[4]);
		--他们都有默认的死亡脚本
		SetCampToNpc(npcIndex, KF_Neutral_Type);
	end
	--阵旗
	for i, npc in pairs(KF_FLAG_NPC) do
		npcIndex = CreateNpc(npc[1], npc[2], nMapID, npc[3], npc[4]);
		SetNpcDeathScript(npcIndex, npc[5]);
		SetCampToNpc(npcIndex, KF_Neutral_Type);
	end
	
	--八个小佛
	for i, npc in pairs(KF_tPositionFo) do
		npcIndex = CreateNpc(npc[1], npc[2], nMapID, npc[3], npc[4]);
		if npcIndex <= 0 then
			print(format("create npc fail: [%s][%s][%d][%d][%d]",npc[1], npc[2], nMapID, npc[3], npc[4]))
		end
		SetCampToNpc(npcIndex,npc[5]);
	end
end

--初始化战场频道
function KF_CreateChannel()
	local nMapID = gf_GetCurMapID();
	for i, nChannel in pairs(KF_BATTLE_CHANNEL) do
		CreateChannel(nChannel[1]..nMapID, nChannel[2]);
	end
end

function KF_DeleteChannel()
	local nMapID = gf_GetCurMapID();
	for i, nChannel in pairs(KF_BATTLE_CHANNEL) do
		DeleteChannel(nChannel[1]..nMapID, nChannel[2]);
	end
end

--对Mission中某一阵营玩家进行统一操作
--使用方法：先定义一个执行函数，这个函数的输入参数为一table。
--然后把这个函数作为第一个输入参数给OP_AllMSPlayer函数。
--通过传table的方式可以传多个参数给执行函数。
function KF_OperateAllPlayer(ufunc, tArg, nCamp)
	local OldPlayerIndex = PlayerIndex;
	local IDTab = mf_GetMSPlayerIndex(KF_MISSION_ID, nCamp);
	local nPlayerCount = getn(IDTab);
	for i = 1, nPlayerCount do
		PlayerIndex = IDTab[i];
		if PlayerIndex > 0 then
			ufunc(tArg);
		else
			Write_Log("[Chi課 trng li猲 u]","KF_OperateAllPlayer(), ngi ch琲 ti誴 d蒼 nh� h琻 ho芻 b籲g 0");
		end;
	end
	PlayerIndex = OldPlayerIndex;
end;

--设置战场结果
function KF_SetRezultToPlayer(nWinner)
	if not nWinner then return 0; end
	if type(nWinner) == "table" then
		if getn(nWinner) < 1 then
			return 0;
		end
		if nWinner[1] ~= GetMissionV(KF_MV_BATTLE_WINNER) then
			return 0;
		end
	end
	local nCamp = KF_GetCamp();
	local tMissionV = {
		[KF_CampOne_ID] = KF_MV_BATTLE_SONG_SCORE,
		[KF_CampTwo_ID] = KF_MV_BATTLE_LIAO_SCORE,	
	}
	if nWinner[1] == nCamp then
		KF_SetBattleRezult(2);
	elseif nWinner[1] == KF_ALL_ID then
		KF_SetBattleRezult(4);
	else
		KF_SetBattleRezult(3);
	end
	if nWinner[1] == KF_ALL_ID then
		Talk(1, "", format("K誸 th骳 chi課 trng, hai b猲 b蕋 ph﹏ th緉g b筰, h穣 ch� r阨 kh醝 chi課 trng!\n%s phe ta 頲 t鎛g t輈h l騳 <color=green>%d<color>\nC鑞g hi課 t� t輈h 甶觤 c� nh﹏ <color=green>%d<color>\nч t輈h c鵦 c� nh﹏ <color=green>%d<color>", 
			 KF_tCampName[nCamp], GetMissionV(KF_MV_BATTLE_LIAO_SCORE), GetTaskTemp(TMP_TASK_KF_SCORE), KF_GetActivity()));
	else
		Talk(1, "", format("K誸 th骳 chi課 trng, %s gi祅h chi課 th緉g, h穣 ch� r阨 kh醝 chi課 trng!\n%s phe ta 頲 t鎛g t輈h l騳<color=green>%d<color>\nC鑞g hi課 t� t輈h 甶觤 c� nh﹏ <color=green>%d<color>\nч t輈h c鵦 c� nh﹏ <color=green>%d<color>",
			 KF_tCampName[nWinner[1]], KF_tCampName[nCamp], GetMissionV(tMissionV[nCamp]), GetTaskTemp(TMP_TASK_KF_SCORE), KF_GetActivity()));
	end
end

function KF_KickSleep()
	local nCamp = KF_GetCamp();
	if IsSleeping() == 1 then
		Talk(1,"","K� th� trc m苩 v藋 m� d竚 ng� g藅, ngi u l玦 ra cho ta!");
		LeaveTeam();
		DelMSPlayer(KF_MISSION_ID, nCamp);
		Msg2MSAll(KF_MISSION_ID, GetName().."R阨 kh醝 chi課 trng.");
		return 1;
	end;
	return 0;
end

function KF_KickDeather()
	if IsPlayerDeath() == 1 then
		local nLeftLoop = tonumber(GetTime()) - GetTaskTemp(TMP_TASK_KF_TIME)
		local nCamp = KF_GetCamp();
		if nLeftLoop >= 60 and GetTaskTemp(TMP_TASK_KF_TIME) ~= 0 then --60s
			LeaveTeam();
			DelMSPlayer(KF_MISSION_ID, nCamp);
			Msg2MSAll(KF_MISSION_ID, GetName().."R阨 kh醝 chi課 trng.");
		end
		return 1;
	else
		SetTaskTemp(TMP_TASK_KF_TIME, 0);
	end;
	return 0;
end

--刷4个士兵
function KF_CreateShiBing(nKind, nCamp)
	local tNpcTable = KF_SHIBINF_NPC[nKind]
	if not tNpcTable then return 0;  end
	if nCamp ~= KF_CampOne_ID and nCamp ~= KF_CampTwo_ID then
		return 0;
	end
	local tNeedNpcTable = tNpcTable[nCamp];
	if not tNeedNpcTable then return 0; end
	local npcIndex;
	local nMapID = SubWorldIdx2ID(SubWorld);
	for i, npcInfo in pairs(tNeedNpcTable) do
		npcIndex = CreateNpc(npcInfo[1], npcInfo[2], nMapID, npcInfo[3], npcInfo[4]);
		SetNpcScript(npcIndex, npcInfo[5]);
		SetCampToNpc(npcIndex, KF_tCampType[nCamp]);
	end
end

function KF_CreateZhenqi(nKind, id, f, x)
	local tNpcList = KF_FLAG_NPCLIST[nKind];
	if not tNpcList then return 0; end
	local nMap, nX, nY = GetNpcWorldPos(id);
	if 0 == f then --玩家杀死NPC
		local  nCamp = KF_GetCamp();
		local npcIndex = CreateNpc(tNpcList[nCamp][1], tNpcList[nCamp][2], nMap, nX, nY);
		SetNpcScript(npcIndex, tNpcList[nCamp][3]);
		SetCampToNpc(npcIndex, KF_tCampType[nCamp]);
		Msg2MSAll(KF_MISSION_ID, format("%s, anh h飊g %s,  chi誱 %s.", KF_tCampName[nCamp], GetName(), tNpcList[0][2]));
		--相关设置
		SetMissionV(tNpcList[nCamp][4], nCamp);
		KF_AddScore(KF_SCORE_ZHENQI, nCamp);
		KF_AddActivity(KF_ACTIVITY_ZHENQI, nCamp);
		KF_CreateShiBing(nKind, nCamp);
		
		_stat_when_kill_flag()
	elseif x and x > 0 then --NPC杀NPC
		local szCampName = GetNpcCampName(x);
		local tMap = {
			["camp_player"] = KF_CampOne_ID,
			["camp_enemy"] = KF_CampTwo_ID,
		}
		if tMap[szCampName] then
			local npcIndex = CreateNpc(tNpcList[tMap[szCampName]][1], tNpcList[tMap[szCampName]][2], nMap, nX, nY);
			SetNpcScript(npcIndex, tNpcList[tMap[szCampName]][3]);
			SetCampToNpc(npcIndex, KF_tCampType[tMap[szCampName]]);
			Msg2MSAll(KF_MISSION_ID, format("%s chi誱 th祅h c玭g %s.", KF_tCampName[tMap[szCampName]], tNpcList[0][2]));
			--相关设置
			--mf_SetMissionV(KF_MISSION_ID, tNpcList[tMap[szCampName]][4], tMap[szCampName], GetMissionV(KF_MV_BATTLE_MAP_ID));
			SubWorld = f; -- npc杀死npc的时候脚本PlayerIndex没有，SubWorld为-1
			SetMissionV(tNpcList[tMap[szCampName]][4], tMap[szCampName]);
			KF_AddScore(KF_SCORE_ZHENQI, tMap[szCampName]);
			--npc杀npc不能累加到活跃度上去没有PlayerInde
			--KF_AddActivity(KF_ACTIVITY_ZHENQI, tMap[szCampName]);
			KF_CreateShiBing(nKind, tMap[szCampName]);
		else
			local npcIndex = CreateNpc(tNpcList[KF_ALL_ID][1], tNpcList[KF_ALL_ID][2], nMap, nX, nY);
			SetNpcScript(npcIndex, tNpcList[KF_ALL_ID][3]);
			SetCampToNpc(npcIndex, KF_tCampType[KF_ALL_ID]);
			Msg2MSAll(KF_MISSION_ID, format("Phe trung l藀  chi誱 %s.", tNpcList[0][2]));
			SetMissionV(tNpcList[KF_ALL_ID][4], KF_ALL_ID);		
		end
	end
end

--派遣功能的TABLE
--bTag = 0派先锋
--bTag = 1派都尉
function KF_GetSayTale(nCamp, nKind, bTag)
	local tRet = {};
	if not bTag then return tRet; end
	local tTemp = {
		{KF_MV_BATTLE_FLAG_JM, "Ph竔 n C秐h M玭"},
		{KF_MV_BATTLE_FLAG_MM, "Ph竔 n Di謙 M玭"},
		{KF_MV_BATTLE_FLAG_SM, "Ph竔 n Sinh M玭"},
		{KF_MV_BATTLE_FLAG_SI, "Ph竔 n T� M玭"},
		{KF_MV_BATTLE_FLAG_DA, "Ph竔 n Чi Tr薾 K�"},	
	}
	local strFunc = {
		[1] = "/#KF_Order_XianFeng(%d)",
		[2] = "/#KF_Order_Duwei(%d)",
	}
	if nKind ~= 1 and nKind ~= 2 then return 0; end
	for i = 1, getn(tTemp) do
		if bTag == 0 then
			tinsert(tRet, tTemp[i][2]..format(strFunc[nKind], i));
		elseif bTag == 1 then
			if GetMissionV(tTemp[i][1]) == nCamp then
				tinsert(tRet, tTemp[i][2]..format(strFunc[nKind], i));
			end
		end
	end
	tinsert(tRet, "Ra kh醝/nothing");
	return tRet;
end

--获取先锋CD时间
function KF_GetXianfengCD()
	local nCamp = KF_GetCamp();
	local tMissionV = {
		[KF_CampOne_ID] = {KF_MV_BATTLE_XIANFENG_TAG_SONG, KF_MV_BATTLE_XIANFENG_DEATHTIME_SONG},
		[KF_CampTwo_ID] = {KF_MV_BATTLE_XIANFENG_TAG_LIAO, KF_MV_BATTLE_XIANFENG_DEATHTIME_LIAO},
	}
	local nTag = GetMissionV(tMissionV[nCamp][1]);
	if nTag == 0 then --未派遣
		return 0;
	elseif nTag == 1 then --已派遣
		return KF_ORDER_XF_CD;
	elseif nTag == 2 then
		local nDeathTime = GetMissionV(tMissionV[nCamp][2]);
		local nSpaceTime = GetTime() - nDeathTime;
		if nSpaceTime >= KF_ORDER_XF_CD then
			SetMissionV(tMissionV[nCamp][1], 0);
			return 0;
		else
			return min(KF_ORDER_XF_CD - nSpaceTime, KF_ORDER_XF_CD);
		end
	end
end

--获取都尉CD时间
function KF_GetDuWeiCD()
	local nCamp = KF_GetCamp();
	local tMissionV = {
		[KF_CampOne_ID] = {KF_MV_BATTLE_DUWEI_TAG_SONG, KF_MV_BATTLE_DUWEI_DEATHTIME_SONG},
		[KF_CampTwo_ID] = {KF_MV_BATTLE_DUWEI_TAG_LIAO, KF_MV_BATTLE_DUWEI_DEATHTIME_LIAO},
	}
	local nTag = GetMissionV(tMissionV[nCamp][1]);
	if nTag == 0 then --未派遣
		return 0;
	elseif nTag == 1 then --已派遣
		return KF_ORDER_DW_CD;
	elseif nTag == 2 then --已死亡
		local nDeathTime = GetMissionV(tMissionV[nCamp][2]);
		local nSpaceTime = GetTime() - nDeathTime;
		if nSpaceTime >= KF_ORDER_DW_CD then
			SetMissionV(tMissionV[nCamp][1], 0);
			return 0;
		else
			return min(KF_ORDER_DW_CD - nSpaceTime, KF_ORDER_DW_CD);
		end
	end
end

function KF_Order_XianFeng(nWhich)
	if KF_GetXianfengCD() ~= 0 then
		Talk(1,"","Ch鴆 n╪g tri謚 g鋓 v蒼 c遪 產ng trong th阨 gian ch� h錳 ph鬰, t筸 th阨 kh玭g th� tri謚 g鋓!");
		return 0;
	end
	local tPos = KF_ORDER_POS[nWhich];
	if not tPos then return 0;  end
	local nMapID = GetWorldPos();
	local nCamp = KF_GetCamp();
	local tNpc = {
		[KF_CampOne_ID] = {"KFZC_songxianfeng", "T鑞g Ti猲 Phong", "\\script\\missions\\kuafu_battle\\npc\\death_xianfeng_song.lua", KF_MV_BATTLE_XIANFENG_TAG_SONG},
		[KF_CampTwo_ID] = {"KFZC_liaoxianfeng", "Li猽 Ti猲 Phong", "\\script\\missions\\kuafu_battle\\npc\\death_xianfeng_liao.lua", KF_MV_BATTLE_XIANFENG_TAG_LIAO},	
	}
	local npcIndex = CreateNpc(tNpc[nCamp][1], tNpc[nCamp][2], nMapID, tPos[1], tPos[2]);
	SetNpcDeathScript(npcIndex, tNpc[nCamp][3]);
	SetCampToNpc(npcIndex, KF_tCampType[nCamp]);
	KF_CreateShiBing(nWhich, nCamp);
	SetMissionV(tNpc[nCamp][4], 1);
	Msg2MSAll(KF_MISSION_ID, format("%s (Nguy猲 So竔/Tng Qu﹏): %s Ti猲 Phong ph鬾g m謓h t k輈h %s.", GetName(), KF_tCampName[nCamp], tPos[3]));
end

function KF_Order_Duwei(nWhich)
	if KF_GetDuWeiCD() ~= 0 then
		Talk(1,"","Ch鴆 n╪g tri謚 g鋓 v蒼 c遪 產ng trong th阨 gian ch� h錳 ph鬰, t筸 th阨 kh玭g th� tri謚 g鋓!");
		return 0;
	end
	local tPos = KF_ORDER_POS[nWhich];
	if not tPos then return 0;  end
	local nMapID = GetWorldPos();
	local nCamp = KF_GetCamp();
	local tNpc = {
		[KF_CampOne_ID] = {"KFZC_songdutong", "T鑞g Й Th鑞g", "\\script\\missions\\kuafu_battle\\npc\\death_duwei_song.lua", KF_MV_BATTLE_DUWEI_TAG_SONG},
		[KF_CampTwo_ID] = {"KFZC_liaodutong", "Li猽 Й Th鑞g", "\\script\\missions\\kuafu_battle\\npc\\death_duwei_liao.lua", KF_MV_BATTLE_DUWEI_TAG_LIAO},	
	}
	local npcIndex = CreateNpc(tNpc[nCamp][1], tNpc[nCamp][2], nMapID, tPos[1], tPos[2]);
	SetNpcDeathScript(npcIndex, tNpc[nCamp][3]);
	SetCampToNpc(npcIndex, KF_tCampType[nCamp]);
	KF_CreateShiBing(nWhich, nCamp);
	SetMissionV(tNpc[nCamp][4], 1);
	Msg2MSAll(KF_MISSION_ID, format("%s (Nguy猲 So竔/Tng Qu﹏): %s Й 髖 ph鬾g m謓h t k輈h %s.", GetName(), KF_tCampName[nCamp], tPos[3]));
end

--将军出现
function KF_CreateJiangJun()
	local nMapID = GetMissionV(KF_MV_BATTLE_MAP_ID);
	local npcIndex = CreateNpc("KFZC_songjiangjun", "T鑞g Tng Qu﹏", nMapID, 1660, 3671);
	SetNpcDeathScript(npcIndex, "\\script\\missions\\kuafu_battle\\npc\\death_song_jiangjun.lua");
	SetCampToNpc(npcIndex, KF_tCampType[KF_CampOne_ID]);
	KF_CreateShiBing(6, KF_CampOne_ID);
	npcIndex = CreateNpc("KFZC_liaojiangjun", "Li猽 Tng Qu﹏", nMapID, 1823, 3373);
	SetNpcDeathScript(npcIndex, "\\script\\missions\\kuafu_battle\\npc\\death_liao_jiangjun.lua");
	SetCampToNpc(npcIndex, KF_tCampType[KF_CampTwo_ID]);
	KF_CreateShiBing(6, KF_CampTwo_ID);
	SetMissionV(KF_MV_BATTLE_JIANGJUN_TAG, 1);
	Msg2MSAll(KF_MISSION_ID, "Chi課 tr薾 hi謓 t筰 v� c飊g kh鑓 li謙, Tng Qu﹏ 2 phe  th鑞g l躰h s� binh x玭g tr薾 quy誸 chi課.");
end

--野怪BOSS给BUFF的机制
function KF_GiveMonsterBuff(nValue)
	if not nValue then return 0;  end
	local nKind = 1;
	if type(nValue) == "table" then
		nKind = nValue[1];
	else
		nKind = nValue;
	end
	if nKind < 1 or nKind > getn(KF_TSTATEMAGICATTR) then
		print("UDERROR:KF_GiveMonsterBuff nValue illegality");
		return 0;
	end
	local tMagic = KF_TSTATEMAGICATTR[nKind];
	if not tMagic then return 0; end
	local msg = "";
	for i = 1, getn(tMagic) do
		CastState(tMagic[i][1], tMagic[i][2], tMagic[i][3], 1, tMagic[i][4], 1);
		msg = msg..format(tMagic[i][6], tMagic[i][2]);
		if i ~= getn(tMagic) then
			msg = msg..","
		end
	end
	SyncCustomState(1, tMagic[1][4], tMagic[1][5], msg);
	Msg2Player("C竎 h� nh薾 頲 hi謚 qu� h� tr� sau khi ti猽 di謙 qu竔 tr猲 chi課 trng:"..msg);
end

function KF_Add_XueHenBuff()
	local nKillNum = gf_GetMyTaskTempByte(TMP_TASK_KF_KILL_NUM, 3, 4);
	local nKilledNum = gf_GetMyTaskTempByte(TMP_TASK_KF_KILL_NUM, 1, 2);
	local nKillDistance = nKilledNum - nKillNum;
	local nTbIdx = 0;
	if nKillDistance > 0 then
		for i = 1,getn(KF_XUEHEN) do
			if nKillDistance >= KF_XUEHEN[i][1] then
				nTbIdx = i;
				break;
			end
		end
	end
	--先清雪恨状态再加
	RemoveState(9908);
	RemoveState(9909);
	RemoveState(9910);
	RemoveState(9911);
	if nTbIdx ~= 0 then
		CastState("state_p_attack_percent_add",KF_XUEHEN[nTbIdx][2],2*60*18,1,9908,1); --外攻攻击
		CastState("state_m_attack_percent_add",KF_XUEHEN[nTbIdx][2],2*60*18,1,9909,1);	--内攻攻击
		CastState("state_life_max_percent_add",KF_XUEHEN[nTbIdx][3],2*60*18,1,9910,1);		--生命上限
		CastState("state_buff_resist",KF_XUEHEN[nTbIdx][4],2*60*18,1,9911,1);					--免疫负面状态
		SyncCustomState(1,9908,1,KF_XUEHEN[nTbIdx][5]);
		Msg2Player("B筺 nh薾 頲 "..KF_XUEHEN[nTbIdx][5].."Hi謚 qu�: "..format(KF_XUEHEN[nTbIdx][6], KF_XUEHEN[nTbIdx][2], KF_XUEHEN[nTbIdx][3], KF_XUEHEN[nTbIdx][4]).."Duy tr� 2 ph髏.");
		if nTbIdx <= 9 then
			SetCurrentNpcSFX(PIdx2NpcIdx(), 921,1,0,18*3);
		end
	end
end

--杀人数排行
function KF_KillPaiMing()
	for nCamp = 1, 2 do
		local tKiller = {};
		local OldPlayerIndex = PlayerIndex;
		local IDTab = mf_GetMSPlayerIndex(KF_MISSION_ID, nCamp);
		local nPlayerCount = getn(IDTab);
		for i = 1, nPlayerCount do
			PlayerIndex = IDTab[i];
			if PlayerIndex > 0 then
				tKiller[i] = {gf_GetMyTaskTempByte(TMP_TASK_KF_KILL_NUM, 3, 4),GetName()};
			end;
		end
		PlayerIndex = OldPlayerIndex;
		SORT_COUNT_MAX = 3; 
		if getn(tKiller) >= SORT_COUNT_MAX then
			local _sort = function(tTable1, tTable2)
				if tTable1[1] > tTable2[1] then
					return 1;
				else
					return nil;
				end
			end
			sort(tKiller, _sort);
			local msg = format("X誴 h筺g cao th� %s: ",KF_tCampName[nCamp]);
			for j = 1, SORT_COUNT_MAX do
				msg = msg..format("%s(%d)", tKiller[j][2], tKiller[j][1]);
				if j ~= SORT_COUNT_MAX then
					msg = msg..","
				end
			end
			Msg2MSAll(KF_MISSION_ID, msg);
		end
	end
end

function KF_GetZhenQiNum(nCamp)
	if nCamp ~= KF_CampOne_ID and nCamp ~= KF_CampTwo_ID then
		return 0;
	end
	local tTemp = {
		KF_MV_BATTLE_FLAG_JM, --阵旗0中立，1宋，2辽
		KF_MV_BATTLE_FLAG_MM, --阵旗0中立，1宋，2辽
		KF_MV_BATTLE_FLAG_SM,	--阵旗0中立，1宋，2辽
		KF_MV_BATTLE_FLAG_SI,	--阵旗0中立，1宋，2辽
		KF_MV_BATTLE_FLAG_DA,	--阵旗0中立，1宋，2辽
	}
	local nCount = 0;
	for i = 1, getn(tTemp) do
		if GetMissionV(tTemp[i]) == nCamp then
			nCount = nCount + 1;
		end
	end
	return nCount;
end

function KF_MsgZhenQiState()
	local tMsg = {
		[0] = "Trung l藀",
		[1] = "Qu﹏ T鑞g",
		[2] = "Qu﹏ Li猽",	
	}
	Msg2MSAll(KF_MISSION_ID, format("Tr薾 k� chi誱 l躰h: C秐h M玭 (%s), Di謙 M玭 (%s), Sinh M玭 (%s), T� M玭 (%s), Чi Tr薾 K� (%s).", 
		tMsg[GetMissionV(KF_MV_BATTLE_FLAG_JM)], tMsg[GetMissionV(KF_MV_BATTLE_FLAG_MM)], tMsg[GetMissionV(KF_MV_BATTLE_FLAG_SM)], 
		tMsg[GetMissionV(KF_MV_BATTLE_FLAG_SI)], tMsg[GetMissionV(KF_MV_BATTLE_FLAG_DA)]));
end

function KF_ParkAward(nKind, nCount)
	local tTemp = {
		KF_PARK_AWARD_PT,
		KF_PARK_AWARD_GJ,
		KF_PARK_AWARD_JY,
	}
	local tTempAdd = {
		KF_PARK_AWARD_PT_ADD,
		KF_PARK_AWARD_GJ_ADD,
		KF_PARK_AWARD_JY_ADD,
	}
	local tAward = tTemp[nKind];
	local tAwardAdd = tTempAdd[nKind];
	if not tAward or not tAwardAdd then
		return 0;
	end
	if GetFreeItemRoom() < 2 then
		Talk(1,"","Kh玭g gian h祅h trang kh玭g ");
		return 0;
	end
	for i = 1, nCount do
		gf_EventGiveRandAward(tAward, gf_SumRandBase(tAward), 1, KF_LOGTITEL, KF_LOGTITEL);
		
		gf_EventGiveAllAward(tAwardAdd, KF_LOGTITEL, KF_LOGTITEL);
	end
end

--哈哈奇葩的重生
function KF_RevivePlayer()
	local nMapID, nX, nY = GetWorldPos();
	local nCamp = KF_GetCamp();
	SetTempRevPos(nMapID, KF_JOIN_MISSION_POS[nCamp][1]*32, KF_JOIN_MISSION_POS[nCamp][2]*32);
	SetFightState(0);
end

--前线士兵传送
function KF_TransmitPlayer(nPos, nX, nY)
	local tTemp = {
		KF_MV_BATTLE_FLAG_JM, --阵旗0中立，1宋，2辽
		KF_MV_BATTLE_FLAG_MM, --阵旗0中立，1宋，2辽
		KF_MV_BATTLE_FLAG_SM,	--阵旗0中立，1宋，2辽
		KF_MV_BATTLE_FLAG_SI,	--阵旗0中立，1宋，2辽
		KF_MV_BATTLE_FLAG_DA,	--阵旗0中立，1宋，2辽
	}
	local nCamp = KF_GetCamp();
	if nPos > 0 and nPos <= getn(tTemp) then
		local nCurrFlagCamp = GetMissionV(tTemp[nPos]);
		if nCurrFlagCamp == KF_ALL_ID then
			Talk(1,"","Tr薾 K� trung l藀 kh玭g th� d辌h chuy觧");
			return 0;
		end
		if nCurrFlagCamp ~= nCamp then
			Talk(1,"",format("Tr薾 K�  b� %s chi誱, d辌h chuy觧 th蕋 b筰.", KF_tCampName[GetMissionV(tTemp[nPos])]))
			return 0;
		end
	end
	CastState("state_dispear",100,18*3)
	SetPos(nX, nY);
	KF_Add_XueHenBuff();
	Restore();
	RestoreNeili();
	SetFightState(1);
	Msg2Player("Khai chi課 n祇!");
end

--临时庇护点传送
function KF_SafeTransmitPlayer(nIndex)
	local nCamp = KF_GetCamp();
	if nCamp ~= KF_CampOne_ID and nCamp ~= KF_CampTwo_ID then
		return 0;
	end
	local tPos = KF_TEMP_SAFE_POS[nCamp]
	if not tPos then
		return 0
	end
	if nIndex <= 0 or nIndex > getn(tPos) then
		return 0;
	end
	CastState("state_dispear",100,18*3)
	SetPos(tPos[nIndex][1], tPos[nIndex][2]);
	KF_Add_XueHenBuff();
	Restore();
	RestoreNeili();
	SetFightState(1);
	Msg2Player("Khai chi課 n祇!");
end

--FloatMsg2Player
function KF_FloatMsg2PlayerToAll()
	local uMsg2Player = function ()
		local sMsg = format("觤 t輈h l騳 t n %d b猲 th緉g: \n T鑞g %d: Li猽 %d\n s� l莕 chi誱 l躰h:\n T鑞g %d: Li猽 %d\n nh﹏ s�:\n T鑞g %d: Li猽 %d\n s� ngi ti猽 di謙:%d\n s� l莕 b� ti猽 di謙:%d", 
			GetMissionV(KF_SCORE_MAX), 
			GetMissionV(KF_MV_BATTLE_SONG_SCORE), GetMissionV(KF_MV_BATTLE_LIAO_SCORE), KF_GetZhenQiNum(KF_CampOne_ID), KF_GetZhenQiNum(KF_CampTwo_ID),
			GetMSPlayerCount(KF_MISSION_ID,KF_CampOne_ID), GetMSPlayerCount(KF_MISSION_ID,KF_CampTwo_ID),
			gf_GetMyTaskTempByte(TMP_TASK_KF_KILL_NUM, 3, 4), gf_GetMyTaskTempByte(TMP_TASK_KF_KILL_NUM, 1, 2));
		FloatMsg2Player(sMsg);
	end
	KF_OperateAllPlayer(uMsg2Player, {}, KF_ALL_ID);
end

function KF_ReviveRestoreAll()
	local uRestoreAll = function ()
		if gf_GetTaskBit(KF_BATTLE_TASK, 27) == 1 then
			RestoreAll();
			gf_SetTaskBit(KF_BATTLE_TASK, 27, 0, TASK_ACCESS_CODE_KF_BATTLE);
		end
	end
	KF_OperateAllPlayer(uRestoreAll, {}, KF_ALL_ID);
end

function KF_GetNBWeapon()
	local nRoute = GetPlayerRoute();
	local tWeapon = KF_NB_WEAPON_TABLE[nRoute];
	if not tWeapon or getn(tWeapon) ~= 14 then  return 0;  end
	if GetFreeItemRoom() < 1 then
		Msg2Player("H祅h trang y, kh玭g th� nh薾 V� Kh� Cam +15.")
		return 0;
	end
	local nRet, nItemIndex
	if BigGetItemCount(tWeapon[1],tWeapon[2],tWeapon[3]) < 1 then
		nRet, nItemIndex = AddItem(tWeapon[1],tWeapon[2],tWeapon[3],tWeapon[4],tWeapon[5],
				tWeapon[6],tWeapon[7],tWeapon[8],tWeapon[9],tWeapon[10],tWeapon[11],tWeapon[12],tWeapon[13])
		if nRet == 1 then
			SetItemExpireTime(nItemIndex, KF_WEAPON_EXIST_TIME);
			--HeadMsg2Player(format("你获得<color=gold>%s<color>", tWeapon[14]));
		end
	end
end

function DelNBWeapon()
	local nRoute = GetPlayerRoute();
	local tWeapon = KF_NB_WEAPON_TABLE[nRoute];
	if not tWeapon or getn(tWeapon) ~= 14 then  return 0;  end
	if BigGetItemCount(tWeapon[1],tWeapon[2],tWeapon[3]) > 0 then
		BigDelItem(tWeapon[1],tWeapon[2],tWeapon[3], BigGetItemCount(tWeapon[1],tWeapon[2],tWeapon[3]));
	end
end

--跨回源服需要执行的扣金函数
function KF_PlayerLoginOriginServer()
	--这东西是否开启
	if IsSubSystemOpen(SYS_SWITCH_KF_BATTLE) ~= 1 then
		return 0;
	end	
	--扣金操作
	local nCount = gf_GetMyTaskBit(KF_BATTLE_TASK, 1, 5);
	if nCount > 0 then
		if Pay(nCount * KF_ENTRY_FEE * 10000) == 1 then
			gf_SetMyTaskBit(KF_BATTLE_TASK, 1, 5, 0, TASK_ACCESS_CODE_KF_BATTLE);
		end	
	end
end