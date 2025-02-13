--===============================================
--create by baiyun 2009.8.31
--describe:越南版9月份中秋活动走军灯笼mission函数
--===============================================
Include("\\script\\online\\viet_event\\200909\\2\\mission_head.lua");
Include("\\script\\lib\\globalfunctions.lua");

t_denglong_sets20101201 = {
	[0] = {"Thi誹 L﹎", {204, 1526, 3269}},--星期日
	[1] = {"Nga My", {303, 1552, 3232}},--星期一
	[2] = {"Л阯g M玭", {305, 1530, 2921}},--星期二
	[3] = {"C竔 Bang", {209, 1515, 3265}},--星期三
	[4] = {"V� ng", {312, 1707, 3477}},--星期四
	[5] = {"Ng� чc", {407, 1555, 3286}},--星期五
	[6] = {"Dng M玭", {219, 1655, 3301}},--星期六
};


--Mission函数==============================================================================
--初始化Mission
function MS_InitMission()
	MS_ChangeMSState(MS_STATE_STARTED);
	local nMSUID = MS_CreateMSUID();	--创建一个Mission唯一ID
	SetMissionV(MV_MISSION_UID,nMSUID);
	gf_WriteLog(LOG_HEAD,"Mission  b総 u, MSUID:"..nMSUID);
end;
--Mission开始
function MS_StartMission()
	MS_ChangeMSState(MS_STATE_STARTED);
end;
--Mission结束
function MS_EndMission()
	MS_ChangeMSState(MS_STATE_IDEL);
	local nMSUID = GetMissionV(MV_MISSION_UID);
	mf_DelAllMSPlayer(MISSION_ID,CAMP_ALL);	--从Mission里面删除所有的玩家
	mf_ClearMissionData();
	gf_WriteLog(LOG_HEAD,"Mission  k誸 th骳, MSUID:"..nMSUID);
end;
--离开Mission
function MS_LeaveMission()	
	NewWorld();
	MS_RestorePlayerState();
end;
--加入Mission
function MS_JoinMission(nCamp)
	CleanInteractive();
	AddMSPlayer(MISSION_ID,nCamp)
	MS_SetPlayerState();
end;
--处理准备阶段的计时器函数
function MS_ProcessReadyTimer()
	local nLoop = GetMissionV(MV_TIMER_LOOP);
	if nLoop == 0 then
		RunMission(MISSION_ID);
	else
		SetMissionV(MV_TIMER_LOOP,nLoop-1);
	end;
end;
--处理Mission开始后的计时器函数
function MS_ProcessStartedTimer()
	local nLoop = GetMissionV(MV_TIMER_LOOP);
	if nLoop == 0 then
		MS_ChangeMSState(MS_STATE_ENDING);
	else
		SetMissionV(MV_TIMER_LOOP,nLoop-1);
		local nMapId = GetGlbValue(1015);
		local nMapX = GetGlbValue(1016);
		local nMapY = GetGlbValue(1017);
		local nDengLongIndex = GetGlbValue(1014);
		
		-- tham s� 5: s� lng boss,
		-- tham s� 6: 甶觤 HP
		local tBossParam = {
			    [1] = {"Th� M藀", 25, "Th� M藀", "\\script\\online\\viet_event\\200909\\2\\death_pangtuzi.lua", 20, 5000},   --24
            	[2] = {"chicken_viet", 25, "G� M藀", "\\script\\online\\viet_event\\200909\\2\\death_ji.lua", 20, 5000},  --24
            	[3] = {"dark_viet",  25, "V辴 M藀", "\\script\\online\\viet_event\\200909\\2\\death_ya.lua", 20, 5000},  --24
            	[4] = {"ship_viet", 25, "D� M藀", "\\script\\online\\viet_event\\200909\\2\\death_yang.lua", 20, 5000},  --24
            	[5] = {"Чi Ni猲 Th�", 25, "Чi Ni猲 Th�", "\\script\\online\\viet_event\\200909\\2\\death_niansou.lua", 1, 30 * 60 * 100}   	 -- 4
		}		
        
        local tGoldBossParam = {        	
        		[2] = {"Ti觰 k�", "G� M藀 Ho祅g Kim", "\\script\\online\\viet_event\\200909\\2\\death_goldboss.lua", 1, 500},
        		[3] = {"Ti觰 竝", "V辴 M藀 Ho祅g Kim", "\\script\\online\\viet_event\\200909\\2\\death_goldboss.lua", 1, 500},
        		[4] = {"Ti觰 dng", "D� M藀 Ho祅g Kim", "\\script\\online\\viet_event\\200909\\2\\death_goldboss.lua", 1, 500},
        	}
        	
       	local nBossRand = GetRandByID(tBossParam);       	
        local nDay = tonumber (date("%w"))
        
        	
		--这里创建胖兔子
		-- xu蕋 hi謓 10 con boss con
		for i = 1, tBossParam[nBossRand][5] do
			local nNpcIndex = CreateNpc(tBossParam[nBossRand][1], tBossParam[nBossRand][3], nMapId, nMapX, nMapY);
			SetNpcLifeTime(nNpcIndex, tBossParam[nBossRand][6]);   					--- thiet lap th琲 gian t錸 t筰
			SetNpcDeathScript(nNpcIndex, tBossParam[nBossRand][4]);
			
		end
		
		-- boss h遖ng kim
		if nBossRand >=  2 and 	 nBossRand <= 4 then
			for i = 1, tGoldBossParam[nBossRand][4] do
				local nNpcIndex = CreateNpc(tGoldBossParam[nBossRand][1], tGoldBossParam[nBossRand][2], nMapId, nMapX, nMapY);
				SetNpcLifeTime(nNpcIndex, tGoldBossParam[nBossRand][5]);
				SetNpcDeathScript(nNpcIndex, tGoldBossParam[nBossRand][3]);
			end
		end
		local nState = GetUnitCurStates(nDengLongIndex, 4)
		AddUnitStates(nDengLongIndex, 4, (0 - nState));--把此状态清0
	end;
end;
--处理等待结束的计时器函数
function MS_ProcessEndingTimer()
	local nLoop = GetMissionV(MV_TIMER_LOOP);
	if nLoop == 0 then
		CloseMission(MISSION_ID);
	else
		SetMissionV(MV_TIMER_LOOP,nLoop-1);
	end;
end;
--登陆触发器函数
function OnLogin()

end;
--=====================================================================================
--转换Mission当前状态
function MS_ChangeMSState(nState)
	if nState == MS_STATE_IDEL then
		StopMissionTimer(MISSION_ID,TIMER_ID);	--结束前一个计时器
		SetMissionV(MV_MISSION_STATE,MS_STATE_IDEL);
	elseif nState == MS_STATE_READY then
		SetMissionV(MV_MISSION_STATE,MS_STATE_READY);	--设置Mission的状态为准备状态
		SetMissionV(MV_TIMER_LOOP,READY_TIMER_COUNT);	--设置计时器总计时次数
		StopMissionTimer(MISSION_ID,TIMER_ID);	--结束前一个计时器
		StartMissionTimer(MISSION_ID,TIMER_ID,READY_TIMER_INTERVAL*FRAME_PER_MIN);	--开始一个计时器	
	elseif nState == MS_STATE_STARTED then
		SetMissionV(MV_MISSION_STATE,MS_STATE_STARTED);	--设置Mission的状态为开始状态
		SetMissionV(MV_TIMER_LOOP,floor(GetGlbValue(1018)/STARTED_TIMER_INTERVAL)-1);	--设置开始状态的持续时间
		StopMissionTimer(MISSION_ID,TIMER_ID);	--结束前一个计时器
		StartMissionTimer(MISSION_ID,TIMER_ID,STARTED_TIMER_INTERVAL*FRAME_PER_MIN);	--开始一个新的计时器
	elseif nState == MS_STATE_ENDING then
		SetMissionV(MV_MISSION_STATE,MS_STATE_ENDING);
		SetMissionV(MV_TIMER_LOOP,ENDING_TIMER_COUNT);
		StopMissionTimer(MISSION_ID,TIMER_ID);
		StartMissionTimer(MISSION_ID,TIMER_ID,ENDING_TIMER_INTERVAL*FRAME_PER_MIN);
	end;
end;
--创建一个MSUID（当前Mission唯一标识）
function MS_CreateMSUID()
	local nMSUID = 0;
	return nMSUID;
end;
--进入场地时统一进行的操作
function MS_SetPlayerState()

end;
--离开场地时统一进行的操作
function MS_RestorePlayerState()

end;
