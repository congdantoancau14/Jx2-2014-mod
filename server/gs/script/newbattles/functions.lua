--函数集合
Include("\\script\\newbattles\\head.lua")
Include("\\script\\lib\\time.lua");
Include("\\script\\lib\\globalfunctions.lua");
Include("\\script\\lib\\writelog.lua")
Include("\\script\\online\\award_head.lua")

THIS_FILE_NAME = "\\script\\newbattles\\functions.lua";

function BT_SetData(nTaskID, nValue)
	SetTask(nTaskID + BATTLE_OFFSET, nValue)
end

function BT_GetData(nTaskID)
	return GetTask(nTaskID + BATTLE_OFFSET)
end
--得到玩家在战场中的阵营
function BT_GetCamp()
	local nSignUpInfo = BT_GetData(PT_SIGN_UP);
	if nSignUpInfo == 0 then
		return 0;
	end;
	if mod(nSignUpInfo,10) == 1 then
		return SONG_ID;
	else
		return LIAO_ID;
	end;
end;
--得到玩家参加的战场ID
function BT_GetBattleType()
	local nSignUpInfo = BT_GetData(PT_SIGN_UP);
	if nSignUpInfo == 0 then
		return 0;
	end;
	return floor(nSignUpInfo/10);
end;
--根据玩家索引获得玩家名字，默认为当前玩家索引
function BT_GetName(nIndex)
	if nIndex == nil then
		nIndex = PlayerIndex;
	end;
	local nOldPlayer = PlayerIndex
	PlayerIndex = nIndex
	local sName = GetName()
	PlayerIndex = nOldPlayer
	return sName
end
--设置临时变量
function BT_SetTempData(nTaskID, nValue)
	SetTaskTemp(nTaskID, nValue)
end
--获取临时变量
function BT_GetTempData(nTaskID)
	return GetTaskTemp(nTaskID)
end
--增加个人的战场总积分
function BT_AddTotalPoint(nPoint)
	if nPoint == 0 then
		return
	end
	local nValue = BT_GetData(PT_TOTALPOINT)
	if nValue+nPoint < 0 then
		BT_SetData(PT_TOTALPOINT, 0);
	else
		BT_SetData(PT_TOTALPOINT, nValue + nPoint);
	end;
	SetRankPoint(RANK_BATTLE_POINT,BATTLE_OFFSET+PT_TOTALPOINT,1);
end
--增加个人在某场战役中的个人得分（战役结束后清0）
function BT_AddBattlePoint(nPoint)
	if nPoint == 0 then
		return
	end
	local nValue = BT_GetData(PTNC_BATTLEPOINT)
	if nValue+nPoint < 0 then
		BT_SetData(PTNC_BATTLEPOINT, 0);
		return nValue;	--返回扣了多少分，表示由于分数不够扣了，要扣完剩下的积分
	else
		BT_SetData(PTNC_BATTLEPOINT, nValue + nPoint);
		return nil;	--返回nil，表示成功扣除了积分
	end;
end
--增加玩家某战役的得分
function BT_AddPlayerCampPoint(nPoint)
	local nBattleType = BT_GetData(PT_BATTLE_TYPE);
	local nCamp = BT_GetCamp();
	local nValue = 0;
	local tMapping = {
				[1] = {PT_VILL_POINT,RANK_VILLAGE},
				[2] = {PT_RESO_POINT,RANK_RESOURCE},
				[3] = {PT_EMPL_POINT,RANK_EMPLACEMENT},
				[4] = {PT_MAIN_POINT,RANK_MAIN},
				}
	local nTaskID = tMapping[nBattleType][1];
	nValue = BT_GetData(nTaskID) + nPoint;
	if nValue < 0 then
		nValue = 0;
	end;
	BT_SetData(nTaskID,nValue);
	SetRankPoint(tMapping[nBattleType][2],BATTLE_OFFSET+nTaskID,1);
end;
--增加个人积分，第二个参数表示是否不显示信息，０为显示，非０为不显示。默认是显示。
--第三个参数表示是否可为队伍成员增加积分。０为不增加，非０为增加。默认不增加
function BT_AddPersonalPoint(nPoint,bNotShowMsg,bTeamPoint)
	if nPoint == 0 then	--如果是0分就不管了
		return 0;
	end;
	local nTeamMemberCount = GetTeamSize();
	if nTeamMemberCount == 0 or FORBIDENT_CREATE_TEAM == 1 or bTeamPoint == 0 or bTeamPoint == nil then
		if BT_GetData(PTNC_BATTLEPOINT) + nPoint >= POINT_LIMITED then
			nPoint = POINT_LIMITED - BT_GetData(PTNC_BATTLEPOINT);
			Msg2Player("Tr薾 chi課 n祔 b筺 nh薾 頲 甶觤 t輈h l騳 t鑙 產:"..POINT_LIMITED);
		end;
		if bNotShowMsg == nil or bNotShowMsg == 0 then
			Msg2Player("B筺 nh薾 頲 甶觤 t輈h l騳:"..nPoint);
		end;
		BT_AddContribution(nPoint);
		BT_AddTotalPoint(nPoint);
		BT_AddBattlePoint(nPoint);
		BT_AddPlayerCampPoint(nPoint);
	else
		BT_AddTeamPoint(nPoint,bNotShowMsg);
	end;
end
--获取某个战场事件所对应的分数，第一个参数为事件ID，第二个参数表示是否是基础分数，0为不是，非0为是，默认不是
function BT_GetBattleEvenPoint(nEvenID,bBasePoint)
	local nRoute = GetPlayerRoute();
	local nBasePoint = tBPEven[nEvenID];
	local nPoint = ceil(nBasePoint*tBPFactionAdjustment[nEvenID][nRoute]);
	if bBasePoint == 0 or bBasePoint == nil then
		return nPoint;
	else
		return nBasePoint;
	end;
end;
--根据战场事件来给积分。第一个参数为事件ID，第二个参数表示是否显示提示信息，０为显示，非０为不显示。默认是显示。
--第三个参数表示是否可为队伍成员增加积分。０为不增加，非０为增加。默认不增加
function BT_AddBattleEvenPoint(nEvenID,bNotShowMsg,bTeamPoint)
	local nPoint = BT_GetBattleEvenPoint(nEvenID);
	BT_AddPersonalPoint(nPoint,bNotShowMsg,bTeamPoint);
end;
--增加队伍积分
function BT_AddTeamPoint(nPoint,bNotShowMsg)
	local nTeamMemberCount = GetTeamSize();
	if nTeamMemberCount == 0 then
		return 0;
	end;
	local nOldPlayerIndex = PlayerIndex;
	local _,nPosX,nPosY = GetWorldPos();	--获得触发事件的玩家的坐标
	local nTeamPoint = ceil(nPoint*TEAM_POINT_ATTENUATION);
	for i=1,nTeamMemberCount do
		PlayerIndex = GetTeamMember(i)
		if BT_GetDistance(nPosX,nPosY) <= TEAM_MEMBER_DISTANCE then
			if bNotShowMsg == nil or bNotShowMsg == 0 then
				Msg2Player("B筺 nh薾 頲 甶觤 t輈h l騳 i ng� chi課 trng:"..nTeamPoint);
			end;
			BT_AddContribution(nTeamPoint);
			BT_AddTotalPoint(nTeamPoint);
			BT_AddBattlePoint(nTeamPoint);
			BT_AddPlayerCampPoint(nTeamPoint);			
		end;
	end;
	PlayerIndex = nOldPlayerIndex;
end;
--减少个人战场积分，是否要加入组队的情况呢？
function BT_DecPersonalPoint(nPoint)
	if nPoint == 0 then	--如果是0分就不管了
		return 0;
	end;
	local nRetValue = BT_AddBattlePoint(-nPoint);
	if nRetValue ~= nil then	--如果个人积分扣完了
		nPoint = nRetValue;
		BT_ShowDebugInfor("Hi謓 產ng tr� 甶 甶觤 t輈h l騳 c� nh﹏ t� t鎛g 甶觤 t輈h l騳"..nRetValue.." 甶觤");
	end;

	BT_AddPlayerCampPoint(-nPoint);
	BT_AddTotalPoint(-nPoint);
	Msg2Player(" 觤 t輈h l騳 c� nh﹏ b� tr� 甶"..nPoint.." 甶觤");
	BT_AddContribution(-ceil(nPoint/3));	--如果被敌方杀死，则增加自己在敌方的战功（做内奸？）
end;
--增加军功：宋方的军功为正数，辽方的军功为负数
function BT_AddContribution(nPoint)
	--处理间谍装束效果
	if GetTime() - BT_GetData(PT_SPYCLOTH_TIME) < ITEM_SPYCLOTH_TIME then	--在间谍装束有效时间内
		return 0;
	end;
	if BT_GetCamp() == LIAO_ID then
		nPoint = -nPoint;
	end;
	BT_SetData(PT_RANKPOINT,BT_GetData(PT_RANKPOINT)+nPoint);
	local nContribution = BT_GetData(PT_RANKPOINT);
	local nMaxSongCon = BT_GetData(PT_MAX_RANKPOINT_SONG);
	local nMaxLiaoCon = BT_GetData(PT_MAX_RANKPOINT_LIAO);
	if nContribution > nMaxSongCon then	
		BT_SetData(PT_MAX_RANKPOINT_SONG,nContribution);
	elseif nContribution < nMaxLiaoCon then
		BT_SetData(PT_MAX_RANKPOINT_LIAO,nContribution);
	end;
	SetRankPoint(RANK_BATTLE_CONTRIBUTION,BATTLE_OFFSET+PT_RANKPOINT,1);
	return nPoint;
end;
--增加某阵营的公共积分
function BT_AddMissionPoint(nCamp,nPoint)
	if nPoint == 0 then
		return
	end
	if GetMissionV(MV_BATTLE_POINT_SONG+nCamp-1)+nPoint < 0 then
		SetMissionV(MV_BATTLE_POINT_SONG+nCamp-1,0);
	else
		SetMissionV(MV_BATTLE_POINT_SONG+nCamp-1, GetMissionV(MV_BATTLE_POINT_SONG+nCamp-1) + nPoint)
	end;
end
--减少某阵营的公共积分
function BT_DecMissionPoint(nCamp,nPoint)
	BT_AddMissionPoint(nCamp,-nPoint);
end;
--得到某一阵营的公共积分
function BT_GetMissionPoint(nCamp)
	return GetMissionV(MV_BATTLE_POINT_SONG+nCamp-1);
end;
--皇帝奖励;输入参数是获得奖励的机率，可以是浮点数，如1.45%则输入1.45即可
function BT_EmperorAward(nProbability)
	local StringFind = function(sString,nTag)
		for i=1,strlen(sString) do
			if strsub(sString,i,i) == nTag then
				return i;
			end;
		end;
		return 0;
	end;
	if nProbability > 100 or nProbability < 0 then
		return 0;
	end;
	local nDotPos = StringFind(tostring(nProbability),".")
	local nStrLen = strlen(tostring(nProbability));
	local nRandomNum = random(1,100*(10^(nStrLen-nDotPos)));
	if nRandomNum < nProbability*(10^(nStrLen-nDotPos)) then
		Talk(1,"","<color=yellow>Gi� thng l謓h: <color><enter>Do b筺 l藀 頲 c玭g l韓 n猲 nh薾 頲 <color=yellow>"..EMPEROR_AWARD_POINT.." 甶觤, kinh nghi謒"..EMPEROR_AWARD_EXP.."<color>.");
		ModifyExp(EMPEROR_AWARD_EXP);
		BT_AddPersonalPoint(EMPEROR_AWARD_POINT);
		BT_SetData(PT_EMPEROR_AWARD_COUNT,BT_GetData(PT_EMPEROR_AWARD_COUNT)+1);
		Msg2MSGroup(MISSION_ID,"Ngi ch琲 "..GetName().."  l藀 頲 c玭g l韓 n猲 頲 ban thng 甶觤 t輈h l騳"..EMPEROR_AWARD_POINT.." 甶觤, kinh nghi謒"..EMPEROR_AWARD_EXP.." 甶觤.",BT_GetCamp());
	end;
end
--战地之星
function BT_BattleStarAward()
	local IDTab = BT_SortMSPlayerByTaskValue(PTNC_BATTLEPOINT,0);
	local nPlayerCount = getn(IDTab);
	local strName = "";
	local nOldPlayerIndex = PlayerIndex;
	local nStarCount = 0;
	local sMul = "Tha";
	if nPlayerCount > 0 then
		PlayerIndex = IDTab[1];
		local nFirstPoint = BT_GetData(PTNC_BATTLEPOINT);
		for i=1,nPlayerCount do	--因为有可能有多个最高分，所以还是要遍历所有的玩家一次
			PlayerIndex = IDTab[i];
			if BT_GetData(PTNC_BATTLEPOINT) == nFirstPoint then
				if IsPlayerDeath() == 0 then
					ModifyExp(BATTLE_STAR_AWARD_EXP)
					Msg2Player("B筺 nh薾 頲 ph莕 thng Ng玦 sao chi課 a:"..BATTLE_STAR_AWARD_EXP.." 甶觤 kinh nghi謒");
				end;
				BT_AddPersonalPoint(BATTLE_STAR_AWARD_POINT);
				BT_SetData(PT_BATTLE_STAR_COUNT,BT_GetData(PT_BATTLE_STAR_COUNT)+1);
				SetRankPoint(RANK_BATTLE_STAR,BATTLE_OFFSET+PT_BATTLE_STAR_COUNT,0);
				strName = strName..GetName()..",";
				nStarCount = nStarCount + 1;
			else
				break;
			end;
		end;
		strName = strsub(strName,1,strlen(strName)-2);
	end;
	if nStarCount > 1 then
		sMul = "h�";
	end;
	if nPlayerCount > 0 then
		Msg2MSAll(MISSION_ID,tBattleName[BT_GetData(PT_BATTLE_TYPE)].." sau khi k誸 th骳, vinh d� ng玦 sao chi課 trng trao cho: "..strName..", xem nh� bi觰 dng!"..sMul.."Trong chi課 d辌h n祔 ngi c� bi觰 hi謓 ki謙 xu蕋 l�");
	end;
	PlayerIndex = nOldPlayerIndex;
end;
--进入战场时对玩家进行的操作
function BT_SetPlayerState(nCamp)
	local nSignUpInfo = BT_GetData(PT_SIGN_UP);		--获取玩家报名的情况：哪个战场，哪方
	local nBattleType = floor(nSignUpInfo/10);
	BT_SetData(PT_BATTLE_TYPE,nBattleType);	--根据nSignUpInfo也可以得到nBattleType，这里再保存一次会不会多余呢？
	BT_ClearTempData();
	CreateTrigger(3,LOG_ID,LOG_TRIGGER_ID);
	LeaveTeam();	--离开队伍
	SetLogoutRV(1);	--设置登陆点为城市重生点
	SetDeathPunish(0);	--无死亡惩罚
	if FORBIDENT_CREATE_TEAM == 1 then
		SetCreateTeam(1);	--关闭组建队伍(下线后会被清掉)
	end;
	ForbitTrade(1);	--禁止交易
	InteractiveEnable(0);	--关闭交互	必须在NewWorld之后执行才有效
	StallEnable(0);	--禁止摆摊(下线后会被清掉)
	UseScrollEnable(0);	--禁止使用回城符
	SetPKFlag(1,nCamp);
	ForbidChangePK(1);	--禁止改变PK状态
	SetFightState(0);
	KillFollower();	--删除跟班
	if nBattleType ~= RESOURCE_ID then
		SetCampToPlayer(tCampNameP[nCamp]);
	else
		SetCampToPlayer(tCampNameP[ALL_ID]);	--如果是资源战场则宋辽都是中立阵营
	end;
	EnterChannel(tBattleChannel[nBattleType][1]);
	EnterChannel(tCampChannel[(nBattleType-1)*2+nCamp][1]);
	SetTempRevPos(ENTRANCE_POINT[nCamp][1],ENTRANCE_POINT[nCamp][2]*32,ENTRANCE_POINT[nCamp][3]*32);	--设置重生点
	BT_ShowDebugInfor("T� vong:"..DEATH_SCRIPT);
	SetDeathScript(DEATH_SCRIPT);
	BT_ClearCustomData();
end;
--战场结束时所作的处理
function BT_ProcessBattleOver()
	--=============================公共数据
	BT_SetData(PTNC_BATTLEPOINT,0);	--单场积分清空
	BT_ClearBattleActivity();	--活跃系数清空
	BT_SetData(PT_BATTLE_DATE,0);
	--=============================村落战数据
	--=============================资源战数据
	--=============================炮台战数据
	--=============================主战场数据
	BT_SetData(PTNC_SERIES_KILL,0);	--单场连斩清空
	BT_SetData(PTNC_KILL,0);			--单场杀人数清空
	BT_SetData(PTNC_DEATH,0);			--单场死亡数清空
	local tMapping = {
			[VILLAGE_ID] = {PT_ATTEND_VILLAGE,PT_VILLAGE_WIN},
			[RESOURCE_ID] = {PT_ATTEND_RESOURCE,PT_RESOURCE_WIN},
			[EMPLACEMENT_ID] = {PT_ATTEND_EMPLACEMENT,PT_EMPLACEMENT_WIN},
			[MAINBATTLE_ID] = {PT_ATTEND_MAIN,PT_MAIN_WIN},
			}
	local nTaskIDAttend = tMapping[BATTLE_TYPE][1];
	local nTaskIDWin = tMapping[BATTLE_TYPE][2];
	local nCamp = BT_GetCamp();
	BT_SetData(nTaskIDAttend,BT_GetData(nTaskIDAttend)+1);	--参加
	if GetMissionV(MV_WINNER) == nCamp then
		BT_SetData(nTaskIDWin,BT_GetData(nTaskIDWin)+1);	--获胜
	end;
end;
--离开战场时所作的处理
function BT_RestorePlayerState()
	local nBattleType = BT_GetData(PT_BATTLE_TYPE);
	local nCamp = BT_GetCamp();
	if nBattleType > 0 and nBattleType <= 4 then
		if nCamp > 0 and nCamp < 3 then
			LeaveChannel(tBattleChannel[nBattleType][1]);
			LeaveChannel(tCampChannel[(nBattleType-1)*2+nCamp][1]);
		else
			WriteLog("[Chi課 trng b竜 l鏸]: Tr� nCamp trong BT_RestorePlayerState b竜 l鏸, tr� b竜 l鏸:"..nCamp);
		end;
	end;
	--==========================================================================
	RemoveTrigger(GetTrigger(LOG_TRIGGER_ID));
	if nBattleType == MAINBATTLE_ID then
		RemoveTrigger(GetTrigger(FIGHT_TRIGGER_ID));
	end;
	--==========================================================================
	SetLogoutRV(0);	
	SetDeathPunish(1);	
	SetCreateTeam(0);	
	ForbitTrade(0);
	InteractiveEnable(1);	
	StallEnable(1);	
	UseScrollEnable(1);
	ForbidChangePK(0);	--允许改变PK状态
	SetPKFlag(0,0);
	SetFightState(0);
	SetDeathScript("");
	SetTempRevPos(0,0,0);
	SetCampToPlayer("");
	KillFollower();	--删除跟班
	
	BT_ClearTempData();
	BT_ClearCustomData();
	BT_DeleteAllBattleItem();
	BT_SetData(PT_BATTLE_TYPE,0);
end;
--清除所有Mission变量
function BT_ClearMissionData()
	for i=1,10 do
		SetMissionS(i,"");
	end;
	for i=1,100 do
		SetMissionV(i,0);
	end;
end;
--战场结束时公布战争结果及个人得分情况
function BT_ReportFinalResult()
	local nBattleType = BT_GetData(PT_BATTLE_TYPE);
	local nWhoWin = GetMissionV(MV_WINNER);
	local sStrResult = "";
	if nWhoWin == ALL_ID then
		sStrResult = "T筰 <color=yellow>"..tBattleName[nBattleType].."<color> T鑞g-Li猽 hai b猲 b蕋 ph﹏ th緉g b筰.";
	else
		if nWhoWin == SONG_ID then
			sStrResult = "<color=yellow>Phe T鑞g<color> gi祅h 頲 <color=yellow>"..tBattleName[nBattleType].."<color>.";
		else
			sStrResult = "<color=yellow>Phe Li猽<color> gi祅h 頲 <color=yellow>"..tBattleName[nBattleType].."<color>.";
		end;
	end;
	local selTab = {
				--"查看本场战场统计信息/#BTS_ViewBattleStatistic(1)",
				"сng/nothing",
				}
	local nPointAward = BT_GetData(PT_POINT_AWARD);
	local nJunGongAward = BT_GetData(PT_JUNGONG_AWARD);
	local nExpAward = BT_GetData(PT_EXP_AWARD);
	local nGoldenExpAward = BT_GetData(PT_GOLDENEXP_AWARD);
	local nBattlePoint = BT_GetData(PTNC_BATTLEPOINT);
	local sPersonalPoint = "";
	if IB_VERSION == 1 then	--如果是IB版本
		sPersonalPoint = sStrResult.."<enter>Chi課 d辌h l莕 n祔 b筺 nh薾 頲 <color=yellow>"..nBattlePoint.."<color> 甶觤 t輈h l騳 c� nh﹏ v� <color=yellow>"..nPointAward.."<color> 甶觤 t輈h l騳, <color=yellow>"..nJunGongAward.."<color> 甶觤 qu﹏ c玭g, <color=yellow>"..nExpAward.."<color> 甶觤 kinh nghi謒.";
	else
		sPersonalPoint = sStrResult.."<enter>Chi課 d辌h l莕 n祔 b筺 nh薾 頲 <color=yellow>"..nBattlePoint.."<color> 甶觤 t輈h l騳 c� nh﹏ v� <color=yellow>"..nPointAward.."<color> 甶觤 t輈h l騳, <color=yellow>"..nJunGongAward.."<color> 甶觤 qu﹏ c玭g, <color=yellow>"..nExpAward.."<color> 甶觤 kinh nghi謒 v� <color=yellow>"..nGoldenExpAward.."<color> 甶觤 s鴆 kh醗 chuy觧 th祅h kinh nghi謒. M阨 n 甶觤 b竜 danh l穘h thng!";
	end;
	Say(sPersonalPoint,getn(selTab),selTab);
	if nBattlePoint >= 200 and nBattleType == 4 then
		SendScript2VM("\\script\\online_activites\\head\\activity_normal_head.lua", "vaf_award_api('tYMGBattle200')");
	end
	if nBattlePoint >= 100 and nBattleType == 3 then
		SendScript2VM("\\script\\online_activites\\head\\activity_normal_head.lua", "vaf_award_api('tProtectCity100')");
	end
end;
--对Mission中某一阵营玩家进行统一操作
--使用方法：先定义一个执行函数，这个函数的输入参数为一table。
--然后把这个函数作为第一个输入参数给OP_AllMSPlayer函数。
--通过传table的方式可以传多个参数给执行函数。
function BT_OperateAllPlayer(func,tArg,nCamp)
	local OldPlayerIndex = PlayerIndex;
	local IDTab = BT_GetMSPlayerIndex(nCamp);	
	local nPlayerCount = getn(IDTab);
	if nPlayerCount > 0 then
		for i=1,nPlayerCount do
			PlayerIndex = IDTab[i];
			if PlayerIndex > 0 then
				func(tArg);
			else
				Write_Log("Chi課 trng b竜 l鏸","BT_OperateAllPlayer(), hng d蒼 ngi ch琲 trong IDTab nh� h琻 ho芻 b籲g 0");
			end;
		end;
	end;
	PlayerIndex = OldPlayerIndex;
end;
--增加战场活跃系数。战场活跃系数=事件基础活跃系数*门派活跃系数
function BT_AddBattleActivity(nEvenID)
	local nRoute = GetPlayerRoute();
	BT_SetData(PTNC_ACTIVITY,BT_GetData(PTNC_ACTIVITY)+floor(tBAEven[nEvenID]*tBAFactionAdjustment[nEvenID][nRoute]));
	if BT_GetData(PTNC_ACTIVITY) > 100 then	--最大值就是１００
		BT_SetData(PTNC_ACTIVITY,100);
	end;
end;
--清除战场活跃系数
function BT_ClearBattleActivity()
	BT_SetData(PTNC_ACTIVITY,0);
end;

--每当玩家进入新的战场时要清掉的数据
function BT_NewBattleClear2()
	local nDate = tonumber(date("%y%m%d"));
	if BT_GetData(PT_BATTLE_DATE) ~= nDate then	--如果上次报名日期与当前日期不同（即新的一天）
		BT_SetData(PT_BATTLE_DATE,0);
		BT_SetData(PT_SIGN_UP,0);
		BT_ClearPTNC();
	end;
end;
function BT_NewBattleClear()	
	local nDate = tonumber(date("%y%m%d"));
	local nGlobalState = GetGlbValue(GLB_NEW_BATTLESTATE);
	local nSignUpTime = BT_GetData(PT_BATTLE_DATE);	--获取玩家报名的是哪一场次的战场
	if nDate*1000+nGlobalState - nSignUpTime > 1 then	--区分同场次的不同战场的报名阶段与开战阶段，最好先了解报名的实现原理
		BT_SetData(PT_BATTLE_DATE,0);
		BT_SetData(PT_SIGN_UP,0);
		BT_ClearPTNC();
	end;
end;
--清除所有的PTNC变量
function BT_ClearPTNC()
		BT_SetData(PTNC_BATTLEPOINT,0);	--单场积分清空
		BT_SetData(PTNC_ACTIVITY,ACTIVITY_ADJUSTOR);
		BT_SetData(PTNC_USE_HOE_TIMES,0);
		BT_SetData(PTNC_SERIES_KILL,0);
		BT_SetData(PTNC_KILL,0);
		BT_SetData(PTNC_DEATH,0);
		BT_SetData(PTNC_KILL_VILLAGER_POINT,0);
		BT_SetData(PTNC_KILL_SOLDIER_POINT,0);
		BT_SetData(PTNC_GOT_MEDICINE,0);
		BT_SetData(PTNC_HELP_REFUGEE,0);
end;
--得到玩家与某一坐标的距离
function BT_GetDistance(nX,nY)
	local _,nPosX,nPosY = GetWorldPos();
	local nDis = floor(sqrt((nPosX-nX)^2+(nPosY-nY)^2));
	return nDis;
end;
--清除所有临时变量
function BT_ClearTempData()
	for i=PTT_BEGIN,PTT_END do
		BT_SetTempData(i,0);
	end;
end;
--得到战场里面的人数信息
function BT_GetPlayerCount(nBattleType,nCamp)
	if nBattleType == 0 then
		return 0;
	end;
	local nOldSubWorld = SubWorld;
	local nPlayerCount = 0;
	local nMapID = tBTMSInfo[nBattleType][2];
	local nMissionID = tBTMSInfo[nBattleType][1];
	SubWorld = SubWorldID2Idx(nMapID);
	nPlayerCount = GetMSPlayerCount(nMissionID,nCamp)
	SubWorld = nOldSubWorld;
	return nPlayerCount;
end;
--清空所有新战场相关的服务器全局变量
function BT_ClearGlbValue()
	for i=32, 36 do
		SetGlbValue(i,0);
	end;	
end;
--得到某Mission某阵营的所有玩家的索引，存于一个数组作函数的返回值
function BT_GetMSPlayerIndex(nCamp)
	local tIndex = {};
	local nTotalPlayerNum = GetMSPlayerCount(MISSION_ID,nCamp);
	local msidx,sidx = 0,0;
	if nTotalPlayerNum ~= 0 then
		for i=1,nTotalPlayerNum do
			msidx,sidx = GetNextPlayer(MISSION_ID,msidx,nCamp);
			if sidx > 0 then
				tIndex[i] = sidx;
			end
		end
	end;
	if nTotalPlayerNum ~= getn(tIndex) then
		WriteLog("[Chi課 trng b竜 l鏸]: Trong h祄 s� ms_GetMSPlayerIndex nh薾 頲 s� ngi c馻 phe n祇  so v韎 getn(tIndex) kh玭g ng nh蕋. S� ngi:"..nTotalPlayerNum..", getn(tIndex) ch猲h l謈h l�:"..getn(tIndex));
	end;
	return tIndex;
end;
--改变某阵营里面所有玩家的某一个临时变量的值
function BT_SetCampTempValue(nCamp,nTaskID,nValue)
	local IDTab = BT_GetMSPlayerIndex(nCamp);
	local nPlayerCount = getn(IDTab);
	local nOldPlayerIndex = PlayerIndex;
	if nPlayerCount > 0 then
		for i=1,nPlayerCount do
			PlayerIndex = IDTab[i];
			if PlayerIndex > 0 then
				BT_SetTempData(nTaskID,nValue);
			end;
		end;
	end;
	PlayerIndex = nOldPlayerIndex;
end;
--获得某场战役中某一阵营的报名人数
function BT_GetSignUpPlayerCount(nBattleType,nCamp)
	return GetGlbValue(GLB_SIGN_UP_VILL_SONG+(nBattleType-1)*2+nCamp-1);
end;
--报名人数加1
function BT_AddSignUpPlayerCount(nBattleType,nCamp)
	local nCurPlayer = BT_GetSignUpPlayerCount(nBattleType,nCamp)
	SetGlbValue(GLB_SIGN_UP_VILL_SONG+(nBattleType-1)*2+nCamp-1,nCurPlayer+1);
end;
--玩家加入战场
function BT_JoinBattle(nCamp)
	CleanInteractive();	--在NewWorld前解散双人互动动作
	local nCampPlace = nCamp;
	if GetGlbValue(RANDOM_PLACE) == 1 then
		nCampPlace = 3 - nCampPlace;
	end;
	if NewWorld(ENTRANCE_POINT[nCampPlace][1],ENTRANCE_POINT[nCampPlace][2],ENTRANCE_POINT[nCampPlace][3]) == 1 then
		if nCamp == SONG_ID then
			Msg2MSAll(MISSION_ID,GetName().."  gia nh藀 phe T鑞g");
		else
			Msg2MSAll(MISSION_ID,GetName().."  gia nh藀 phe Li猽");
		end;
		BT_SetPlayerState(nCamp);
		local nFaction = GetPlayerFaction();	--统计各门派人数
		local nFactionPlayerCount = BT_GetFactionPlayerCount(nFaction);
		BT_SetFactionPlayerCount(nFaction,nFactionPlayerCount+1);	--门派人数加１
		AddMSPlayer(MISSION_ID,nCamp);
		if GetMissionV(MV_BATTLE_STATE) == MS_STATE_FIGHT then	--如果是在战场开始后加入的
			BT_SetTempData(PTT_DIE_LOOP,GetMissionV(MV_TIMER_LOOP));
		end;
		return 1;
	else
		return 0;
	end;
end;
--玩家离开战场
function BT_LeaveBattle()
	local nCamp = BT_GetCamp();
	if DEBUG_VERSION == 1 then
		nCamp = 0;	--如果是调试版本，则传到泉州那里。如果想测试报名模块的话，那还是传送到汴京那吧
	end;
	BT_RestorePlayerState();
	if NewWorld(EXIT_POINT[nCamp][1],EXIT_POINT[nCamp][2],EXIT_POINT[nCamp][3]) == 1 then
		local nBattleState = GetMissionV(MV_BATTLE_STATE);
		if nBattleState == MS_STATE_READY or nBattleState == MS_STATE_FIGHT then
			if nCamp == SONG_ID then
				Msg2MSAll(MISSION_ID,"T鑞g"..GetName().."  r阨 kh醝 chi課 trng");
			else	
				Msg2MSAll(MISSION_ID,"Li猽"..GetName().."  r阨 kh醝 chi課 trng");
			end;
		end;
		--参加了一次战场，其他奖励汇总
		if nBattleState == MS_STATE_COMPLETE then
			aw_bsBattle_award();
		end
		local nFaction = GetPlayerFaction();	--统计各门派人数
		local nFactionPlayerCount = BT_GetFactionPlayerCount(nFaction);
		BT_SetFactionPlayerCount(nFaction,nFactionPlayerCount-1);	--门派人数减１		
		return 1;
	else
		return 0;
	end;
end;
--针对某个任务变量的值来进行排序。第一个参数是战场的任务变量ID，第二个参数为1表示升序，0表示降序
--第三个参数指定阵营，默认值为0。返回值为一个保存排完序后的玩家索引table
function BT_SortMSPlayerByTaskValue(nTaskID,bAscend,nCamp)
	if nCamp == nil then
		nCamp = ALL_ID;
	end;
	local nOldPlayerIndex = PlayerIndex;
	local tIDTab = BT_GetMSPlayerIndex(nCamp);
	local fCompare = function(nPIndex1,nPIndex2)
		local nValue1,nValue2 = 0,0;
		PlayerIndex = nPIndex1;
		nValue1 = BT_GetData(%nTaskID);
		PlayerIndex = nPIndex2;
		nValue2 = BT_GetData(%nTaskID);
		if %bAscend == 1 then	--升序排列
			nValue1 = -nValue1;
			nValue2 = -nValue2;
		end;
		if nValue1 > nValue2 then
			return 1;
		else
			return nil;
		end;
	end;
	sort(tIDTab,fCompare);
	PlayerIndex = nOldPlayerIndex;
	return tIDTab;
end;
--把在后营停留得太久的玩家强制传送到战场
function BT_DrivePlayerOutOfShelter()
	if DRIVE_PLAYER_OUTOF_SHELTER == 0 then
		return 0;
	end;
	local Func = function(tArg)
		if GetFightState() == 0 then
			local nLeftLoop = BT_GetTempData(PTT_DIE_LOOP) - GetMissionV(MV_TIMER_LOOP);
			if nLeftLoop >= 5 then
				local nBattleType = BT_GetData(PT_BATTLE_TYPE);
				SetFightState(1);
				if nBattleType == VILLAGE_ID then
					DoScriptByName(GetName(),"\\script\\newbattles\\villagebattle\\trap.lua","main");
				elseif nBattleType == RESOURCE_ID then
					DoScriptByName(GetName(),"\\script\\newbattles\\resourcebattle\\trap.lua","main");
				elseif nBattletype == EMPLACEMENT_ID then
					DoScriptByName(GetName(),"\\script\\newbattles\\emplacementbattle\\trap.lua","main");
				else
					DoScriptByName(GetName(),"\\script\\newbattles\\mainbattle\\trap_back.lua","main");
				end;
				Msg2Player("B筺 kh玭g th� l璾 l筰 trong h藆 doanh");
			else
				Msg2Player("Th阨 gian l璾 l筰 trong h藆 doanh c遪:"..Get_Time_String((5-nLeftLoop)*20))
			end;
		end;
	end;
	BT_OperateAllPlayer(Func,{},ALL_ID);
end;
--战场正式开打时要设置的一些状态
function BT_RunBattle()
	StartMissionTimer(MISSION_ID,TIMER_ID,FIGHT_TIME);
	SetMissionV(MV_TIMER_LOOP,FIGHT_TIMER_LOOP);
	SetMissionV(MV_BATTLE_STATE,MS_STATE_FIGHT);
	local Func = function(tArg)
		BT_SetTempData(PTT_DIE_LOOP,FIGHT_TIMER_LOOP);
	end;
	BT_OperateAllPlayer(Func,{},ALL_ID);
end;
--战场初始化时要设置的一些状态
function BT_InitBattle()	
	SetGlbValue(1022,0)
	local BattleID = tonumber(date("%y%m%d%H"));	
	SetMissionV(MV_BATTLE_ID,BattleID*10+BATTLE_TYPE);
	SetMissionV(MV_TIMER_LOOP,READY_TIMER_LOOP);
	StartMissionTimer(MISSION_ID,TIMER_ID,READY_TIME);
	SetMissionV(MV_BATTLE_STATE,MS_STATE_READY);
	WriteLog("[NewBattle]:"..tBattleName[BATTLE_TYPE].."("..GetMissionV(MV_BATTLE_ID)..")start now,battle type:"..BATTLE_TYPE);
end;
--战场结束后要设置的一些状态，要在EndMission的最后执行
function BT_EndBattle()
	local IDTab = BT_SortMSPlayerByTaskValue(PTNC_BATTLEPOINT,0,ALL_ID);
	local nPlayerCount = getn(IDTab);
	local nSongPlayerCount = GetMSPlayerCount(MISSION_ID,SONG_ID);
	local nLiaoPlayerCount = GetMSPlayerCount(MISSION_ID,LIAO_ID);
	local nSongPublicPoint = floor(BT_GetMissionPoint(SONG_ID)/nSongPlayerCount);
	local nLiaoPublicPoint = floor(BT_GetMissionPoint(LIAO_ID)/nLiaoPlayerCount);
	local nCamp = 0;
	local nWhoWin = GetMissionV(MV_WINNER);
	BT_BattleStarAward();	--评选战地之星，在计算公共积分和胜负积分之前
	if STATISTIC_OPEN == 1 then
		DelRelayShareDataCopy(RELAY_DATA_BATTLE,BATTLE_TYPE,2);
		if BATTLE_TYPE == EMPLACEMENT_ID or BATTLE_TYPE == MAINBATTLE_ID then	--加上判断，避免一些不必要的清空操作
			DelRelayShareDataCopy(RELAY_DATA_BATTLE,BATTLE_TYPE,3);
			DelRelayShareDataCopy(RELAY_DATA_BATTLE,BATTLE_TYPE,4);
		end;
		local nSongWin,nLiaoWin,nDraw;
		nSongWin,nLiaoWin,nDraw = GetRelayShareDataByKey(RELAY_DATA_BATTLE,5,BATTLE_TYPE,"history_record");
		if nSongWin == nil then
			nSongWin = 0;
		end;
		if nLiaoWin == nil then
			nLiaoWin = 0;
		end;
		if nDraw == nil then
			nDraw = 0;
		end;
		local tGLB = {GLB_VILLAGE,GLB_RESOURCE,GLB_EMPLACEMENT,GLB_MAINBATTLE};
		if nWhoWin == SONG_ID then
			nSongWin = nSongWin + 1;
		elseif nWhoWin == LIAO_ID then
			nLiaoWin = nLiaoWin + 1;
		else
			nDraw = nDraw + 1;
		end;
		BT_ShowDebugInfor("nSongWin:"..nSongWin..", nLiaoWin:"..nLiaoWin..", nDraw:"..nDraw..", BATTLE_TYPE:"..BATTLE_TYPE);
		AddRelayShareData(RELAY_DATA_BATTLE,5,BATTLE_TYPE,"","",0,"history_record","ddd",nSongWin,nLiaoWin,nDraw)
		DelRelayShareDataCopy(RELAY_DATA_BATTLE,5,BATTLE_TYPE);
		ApplyRelayShareData(RELAY_DATA_BATTLE,5,BATTLE_TYPE,"","");
	end;
	for i=1,nPlayerCount do	--处理每个人的公共积分和胜负积分
		PlayerIndex = IDTab[i];
		if PlayerIndex > 0 then
			nCamp = BT_GetCamp();
			if STATISTIC_OPEN == 1 then
				AddRelayShareData(RELAY_DATA_BATTLE,BATTLE_TYPE,2,"","",0,GetName(),"dddd",BT_GetData(PTNC_BATTLEPOINT),GetPlayerRoute(),GetLevel(),nCamp);
				if BATTLE_TYPE == EMPLACEMENT_ID or BATTLE_TYPE == MAINBATTLE_ID then
					AddRelayShareData(RELAY_DATA_BATTLE,BATTLE_TYPE,3,"","",0,GetName(),"dddd",BT_GetData(PTNC_KILL),GetPlayerRoute(),GetLevel(),nCamp);
					AddRelayShareData(RELAY_DATA_BATTLE,BATTLE_TYPE,4,"","",0,GetName(),"dddd",BT_GetData(PTNC_DEATH),GetPlayerRoute(),GetLevel(),nCamp);
				end;
			end;
			local nActivity = BT_GetData(PTNC_ACTIVITY)/100;
			local nPublicPoint = 0;
			local nX = 0;	--平衡系统
			if nCamp == SONG_ID then
				nPublicPoint = floor(nSongPublicPoint*nActivity);
				nX = (nSongPlayerCount+nLiaoPlayerCount)/(2*nSongPlayerCount);	--总人数除以本方2倍人数
			else
				nPublicPoint = floor(nLiaoPublicPoint*nActivity);
				nX = (nSongPlayerCount+nLiaoPlayerCount)/(2*nLiaoPlayerCount);
			end;
			if nX > 3 then
				nX = 3;
			end;
			nPublicPoint = floor(nPublicPoint*nX);
			BT_SetTempData(PTT_PUBLIC_POINT,nPublicPoint);
			
			local nResultPoint = 0;
			local nLevel = GetLevel();
			local nExpAward = 0;
			local nGoldenExpAward = 0;
			local nExpX = nActivity*nX;	--活跃系数×平衡系数
			local nU = 0;
			if IB_VERSION == 1 then
				nU = 80;
			else
				nU = 75;
			end;
			if nWhoWin == ALL_ID then	--胜负积分
				nResultPoint = floor(DRAW_BONUS*nActivity);
				nExpAward = floor(EXP_AWARD_DRAW*nLevel*nLevel*nExpX/nU);
				nGoldenExpAward = floor(GOLDENEXP_AWARD_DRAW*nExpX);
			elseif nCamp == nWhoWin then
				nResultPoint = floor(WINNER_BONUS*nActivity);
				nExpAward = floor(EXP_AWARD_WIN*nLevel*nLevel*nExpX/nU);
				nGoldenExpAward = floor(GOLDENEXP_AWARD_WIN*nExpX);
			else
				nResultPoint = floor(LOSER_BONUS*nActivity);
				nExpAward = floor(EXP_AWARD_LOSE*nLevel*nLevel*nExpX/nU);
				nGoldenExpAward = floor(GOLDENEXP_AWARD_LOSE*nExpX);
			end;
			local tExpX = {1,1,1.5,2,2,3};	--与军衔对应的经验系数
			local nCurRank = abs(BT_GetData(PT_CURRANK));
			if nCurRank == 0 or nCurRank > getn(tExpX) then	--如果没有军衔或军衔出错
				nCurRank = 1;	--置为1
			end;
			nResultPoint = floor(nResultPoint*nX)
			local nPointAward = nResultPoint + nPublicPoint;
			if nPointAward + BT_GetData(PTNC_BATTLEPOINT) > POINT_LIMITED then
				nPointAward = POINT_LIMITED - BT_GetData(PTNC_BATTLEPOINT);
			end;
			local nJunGongAward = nResultPoint + nPublicPoint;
			nJunGongAward = min(POINT_LIMITED,nJunGongAward);
			--加成系数
			nJunGongAward = 3* nJunGongAward * (1+BATTLE_JUNGONG_EXT_RATE)
			nExpAward = 9* nExpAward * (1+BATTLE_EXP_EXT_RATE)*(1+GetVipCardParam())
			BT_SetTempData(PTT_RESULT_POINT,nResultPoint);
			BT_SetData(PT_EXP_AWARD,floor(nExpAward*tExpX[nCurRank]));	--记录经验奖励数值
			BT_SetData(PT_GOLDENEXP_AWARD,floor(nGoldenExpAward*tExpX[nCurRank]));
			BT_SetData(PT_POINT_AWARD,nPointAward);
			BT_SetData(PT_JUNGONG_AWARD,nJunGongAward);
			BT_SetData(PT_LAST_CAMP,nCamp);
			BT_SetData(PT_LAST_BATTLE,BATTLE_TYPE);
			BT_SetData(PT_LAST_RESULT,nWhoWin);
			--BT_SetData(PT_SPYCLOTH_TIME,0);	--间谍装束效果清除
		end;
	end
	if BATTLE_TYPE == MAINBATTLE_ID then
		BT_ShowBattleRank(10,1);
	else
		BT_ShowBattleRank(10);
	end;	
	for i=1,nPlayerCount do	--善后处理
		PlayerIndex = IDTab[i];
		BT_ReportFinalResult();
		BT_ProcessBattleOver();
		BT_ShowDebugInfor("Trong BT_EndBattle, x鉧 nh﹏ v藅:"..GetName()..", tr� BT_GetData(PT_SIGN_UP):"..BT_GetData(PT_SIGN_UP));
		DelMSPlayer(MISSION_ID,ALL_ID);
		BT_SetData(PT_SIGN_UP,0);		--报名信息清空（单场战场测试阶段用）
	end;
	WriteLog("[Chi課 trng Nh筺 M玭 Quan]:"..tBattleName[BATTLE_TYPE].."("..GetMissionV(MV_BATTLE_ID)..")  k誸 th骳, k誸 qu�:"..GetGlbValue(GLB_VILLAGE-1+BATTLE_TYPE));
	SetMissionV(MV_BATTLE_STATE,MS_STATE_PEACE);	--其实这个在Clear_MissionData中也会被清，这里只是形式而已
	BT_ClearMissionData();
	ClearMapNpc(MAPID);
	ClearMapTrap(MAPID);
end;
--治疗所有和平状态的玩家
function BT_CureAllPlayer()
	if CURE_ALL_PLAYER == 0 then
		return 0;
	end;
	local Func = function(tArg)
		if GetFightState() == 0 then
			BT_RestoreAll();
		end;
	end;
	BT_OperateAllPlayer(Func,{},ALL_ID);
end;
--恢复所有生命和内力
function BT_RestoreAll()
	Restore();
	RestoreNeili();
end;
--主战场结束后所要做的操作
function BT_BattleAllOver()
	SetGlbValue(GLB_NEW_BATTLESTATE,0);	--标记本场次的战场已经全部结束
	for i=GLB_VILLAGE,GLB_MAINBATTLE do
		SetGlbValue(i,0);
	end;
	for i=GLB_SIGN_UP_VILL_SONG,GLB_SIGN_UP_MAIN_LIAO do	--报名人数清空
		SetGlbValue(i,0);
	end;
end;
--获得Mission里面所有符合某一条件的玩家的某一项信息，以table的形式返回
--条件由Func函数定制
--返回的table的元素结构由Func返回的结果决定。
function BT_GetMSPlayerInfo(Func,tArg,nCamp)
	local IDTab = BT_GetMSPlayerIndex(nCamp);
	local tInfo = {};
	local nOldPlayerIndex = PlayerIndex;
	local nCounter = 1;
	local nRetInfo;
	for i=1,getn(IDTab) do
		PlayerIndex = IDTab[i];
		nRetInfo = Func(tArg);
		if nRetInfo ~= nil then
			tInfo[nCounter] = nRetInfo;
			nCounter = nCounter + 1;
		end;
	end;
	PlayerIndex = nOldPlayerIndex;
	return tInfo;
end;
--清除所有需要清除的CustomData
function BT_ClearCustomData()
	for i=1,getn(tCustomDataString) do
		if tCustomDataString[i][1] == 0 then
			CustomDataRemove(tCustomDataString[i][2]);
		end;
	end;
end;
--获得战场里面某个门派的人数数量
function BT_GetFactionPlayerCount(nFaction)
	local nDWOffset = floor(nFaction/4);
	local nByteOffset = mod(nFaction,4)+1;
	local nMVID = MV_FACTION_PLAYER_COUNT1+nDWOffset;
	local nMissionV = GetMissionV(nMVID);
	return GetByte(nMissionV,nByteOffset);
end;
--设置战场里面的某个门派的人数数量
function BT_SetFactionPlayerCount(nFaction,nValue)
	if nValue < 0 then
		BT_ShowDebugInfor("S� ngi m玭 ph竔 b竜 l鏸 nValue"..nValue);
		nValue = 0;
	end;
	local nDWOffset = floor(nFaction/4);
	local nByteOffset = mod(nFaction,4)+1;
	local nMVID = MV_FACTION_PLAYER_COUNT1+nDWOffset;
	local nMissionV = GetMissionV(nMVID);
	SetMissionV(nMVID,SetByte(nMissionV,nByteOffset,nValue));
end;
--删除所有战场相关的物品（不能带出战场外的）
function BT_DeleteAllBattleItem()
	local nItemCount = 0;
	for i=1,getn(tBattleItem) do
		if tBattleItem[i][5] == 1 then
			nItemCount = BigGetItemCount(tBattleItem[i][2],tBattleItem[i][3],tBattleItem[i][4]);
			if nItemCount > 0 then
				BigDelItem(tBattleItem[i][2],tBattleItem[i][3],tBattleItem[i][4],nItemCount)	
			end;
		end;
	end;
	for i=1,getn(tBattleMed) do	--删除战场PK药
		nItemCount = BigGetItemCount(tBattleMed[i][2],tBattleMed[i][3],tBattleMed[i][4]);
		if nItemCount > 0 then
			BigDelItem(tBattleMed[i][2],tBattleMed[i][3],tBattleMed[i][4],nItemCount)	
		end;
	end;
end;
--调试时用指令，nType参数如果不写或为０表示是print输出，否则是Msg2SubWorld输出
function BT_ShowDebugInfor(Arg,nType)
	if DEBUG_VERSION == 1 then
		if nType == nil or nType == 0 then
			print("\n 襲 ch豱h tin t鴆:"..Arg.."\n")
		elseif nType == 1 then
			Msg2SubWorld("Ch豱h tin t鴆:"..Arg);
		end;
	end;
end;
--清除Relay共享数据库的一些信息，主要是排行榜信息
function BT_ClearRelayData()
	ClearRelayShareData(RELAY_DATA_BATTLE,BATTLE_TYPE,2,"","");	--清除服务器端上一场的个人积分排名
	--DelRelayShareDataCopy(RELAY_DATA_BATTLE,BATTLE_TYPE,2);
	if BATTLE_TYPE == EMPLACEMENT_ID or BATTLE_TYPE == MAINBATTLE_ID then	--加上判断，避免一些不必要的清空操作
		ClearRelayShareData(RELAY_DATA_BATTLE,BATTLE_TYPE,3,"","");	--清除服务器端上一场的个人积分排名
	--	DelRelayShareDataCopy(RELAY_DATA_BATTLE,BATTLE_TYPE,3);
		ClearRelayShareData(RELAY_DATA_BATTLE,BATTLE_TYPE,4,"","");	--清除服务器端上一场的个人积分排名
	--	DelRelayShareDataCopy(RELAY_DATA_BATTLE,BATTLE_TYPE,4);
	end;
end;
--显示排名，第二个参数为1时表示向全世界玩家显示排名，否则只是向战场里面的玩家显示
function BT_ShowBattleRank(nPlayerCount,bShowWorld)
	local tbPlayer = mf_SortMSPlayerByTaskValue(MISSION_ID,PTNC_BATTLEPOINT+BATTLE_OFFSET,0);
	local nOldPlayerIdx = PlayerIndex;
	if bShowWorld == 1 then
		Msg2Global(tostring(tBattleName[BATTLE_TYPE]).."T輈h l騳 c� nh﹏: "..nPlayerCount..":");
	else
		Msg2MSAll(MISSION_ID,tostring(tBattleName[BATTLE_TYPE]).."T輈h l騳 c� nh﹏: "..nPlayerCount..":");
	end;
	for i=1,min(getn(tbPlayer),nPlayerCount) do
		PlayerIndex = tbPlayer[i];
		if bShowWorld == 1 then
			Msg2Global("th�"..i..": ("..tCampNameZ[BT_GetCamp()]..")"..GetName().." "..BT_GetData(PTNC_BATTLEPOINT).." Ph髏 ");
		else
			Msg2MSAll(MISSION_ID,"th�"..i..": ("..tCampNameZ[BT_GetCamp()]..")"..GetName().." "..BT_GetData(PTNC_BATTLEPOINT).." Ph髏 ");
		end;
	end;
	PlayerIndex = nOldPlayerIdx;
end;
--把在后营睡觉的玩家踢出去
function BT_KickSleeper()
	if IsSleeping() == 1 and GetFightState() == 0 then	--后营睡眠者踢出战场
		Talk(1,"","<color=yellow>Nguy猲 so竔:<color> Qu﹏ ch trc m苩, c遪 d竚 ng� n鱝 sao! Ngi u! L玦 h緉 甶!");
		DelMSPlayer(MISSION_ID,BT_GetCamp());
		return 1;
	end;
	return 0;
end;
--根据玩家当前的军功正负获取玩家的阵营，军功为0者当宋方处理
function BT_GetCurCamp()
	if BT_GetData(PT_RANKPOINT) >= 0 then
		return SONG_ID;
	else
		return LIAO_ID;
	end;
end;

function BT_GetCurRank()
	local nCurRank = abs(BT_GetData(PT_CURRANK))
	return nCurRank;
end;

function summon_god_of_war()
	local sNpcName = "";
	local nCurCamp = BT_GetCamp()	
	if nCurCamp == SONG_ID then
		sNpcName = sSongGeneral;
	else
		sNpcName = sLiaoGeneral;
	end
	local tSay = 
	{
		"Mau truy襫 l謓h c馻 b鎛 Nguy猲 So竔!/confirm_god_of_war",
		"в ta suy ngh� l筰/nothing",	
	}
	Say("<color=green>"..sNpcName.."<color>: Chi課 Th莕 s� xu蕋 hi謓 gi髉 phe ta t ph� v遪g v﹜ qu﹏ ch trong v遪g 2 ph髏. M鏸 tr薾 chi課 ch� 頲 ph衟 g鋓 Chi課 Th莕 tr� gi髉 t鑙 產 2 l莕. <color=yellow>Nguy猲 So竔<color> ng � ch�?",getn(tSay),tSay)
end

function confirm_god_of_war()
	local sNpcName = "";
	local nBattleType = BT_GetBattleType();
	local nBattleMapID = tBTMSInfo[nBattleType][2];
	local nCurCamp = BT_GetCamp()
	local nStartTime = GetGlbValue(1034)
	local nBit1 = 9
	local nBit2 = 10
	local szCamp = "T鑞g"
	if nCurCamp == SONG_ID then
		sNpcName = sSongGeneral;
		if GetTask(704) < 0 then
			Talk(1,"","<color=green>"..sNpcName.."<color>: Gian t� phe Li猽 d竚 m筼 danh Nguy猲 So竔 �? Ngi u! B総 h緉!")
			return 0
		end	
	else
		sNpcName = sLiaoGeneral;
		local szCamp = "Li猽"
		nBit1 = 11
		nBit2 = 12
		nStartTime = GetGlbValue(1035)
		if GetTask(704) >= 0 then
			Talk(1,"","<color=green>"..sNpcName.."<color>: Gian t� phe T鑞g d竚 m筼 danh Nguy猲 So竔 �? Ngi u! B総 h緉!")
			return 0
		end	
	end;
	if BT_GetCurRank() ~= 6 then
		Talk(1,"","<color=green>"..sNpcName.."<color>: Ti觰 t鑤 nh� ngi m� c騨g i ban l謓h cho ta �? Ngi u! B総 h緉!")
		return 0
	end
	if IsTitleExist(30, 6) <= 0 and IsTitleExist(30, 12) <= 0 then
		Talk(1,"","<color=green>"..sNpcName.."<color>: Ph秈 c� danh hi謚 Nguy猲 So竔 m韎 c� th� ph竧 l謓h t蕁 c玭g! M阨 Nguy猲 So竔 ki觤 tra l筰.")
		return 0
	end
	if GetMissionV(MV_BATTLE_STATE) ~= MS_STATE_FIGHT then
		Talk(1,"","<color=green>"..sNpcName.."<color>: Чi qu﹏ ch璦 xu蕋 ph竧! M阨 Nguy猲 So竔 quay l筰 sau!")
		return 0
	end
	if (GetTime() - nStartTime < (5*60 + 15)) or (GetTrigger(2509) == 1) then
		Talk(1,"","<color=green>"..sNpcName.."<color>: Th阨 gian tri謚 g鋓 2 l莕 li猲 ti誴 l� 5 ph髏. M阨 Nguy猲 So竔 quay l筰 sau.")
		return 0
	end	
	if GetBit(GetGlbValue(1022),nBit1) == 1 and GetBit(GetGlbValue(1022),nBit2) ==1 then
		Talk(1,"","<color=green>"..sNpcName.."<color>: H玬 nay Nguy猲 So竔  s� d鬾g h誸 2 l莕 tri謚 g鋓. M阨 Nguy猲 So竔 quay l筰 sau.")
		return 0
	end
	for i=nBit1,nBit2 do
		if GetBit(GetGlbValue(1022),i) == 0 then
			SetGlbValue(1022,SetBit(GetGlbValue(1022),i,1))
			break
		end
	end
	SetTaskTemp(117,99)
	CreateTrigger(1, 1107, 2509);
    	ContinueTimer(GetTrigger(2509));
    	Msg2MSAll(MISSION_ID,szCamp.." Nguy猲 So竔 ban l謓h tri謚 g鋓 Chi課 Th莕 tr� gi髉. Sau 15 gi﹜ Chi課 Th莕 s� xu蕋 hi謓 � doanh tr筰 phe "..szCamp.."!");	
    	local fTaskTip = function(tArg)
		TaskTip("Chi課 Th莕 phe ch s� xu蕋 hi謓 sau 15 gi﹜.");
	end;
	local nEnemyCamp = 3 - nCurCamp
	BT_OperateAllPlayer(fTaskTip,{},nEnemyCamp);
	Say("<color=green>"..sNpcName.."<color>: Chi課 Th莕 s� xu蕋 hi謓 sau 15 gi﹜!",0)
	WriteLogEx("Tong Lieu","Nguy猲 So竔 tri謚 g鋓")		
end

function battle_charge()
	local nDate = tonumber(date("%y%m%d"))
	local nNation = GetGlbValue(GLB_TSK_SERVER_ID)
	if nNation == 66 and nDate <= 110709 then
		Talk(1,"","Hi謓 t筰 ch鴆 n╪g n祔 產ng ng, kh玭g th� k輈h ho箃!")
		return 0
	end
	
	local nBattleType = BT_GetBattleType();
	local nBattleMapID = tBTMSInfo[nBattleType][2];
	local nCurCamp = BT_GetCamp()
	local nBattleState = mf_GetMissionV(tBTMSInfo[nBattleType][1],MV_BATTLE_STATE,nBattleMapID);
	local sNpcName = "";
	if BT_GetCamp() == SONG_ID then
		sNpcName = sSongGeneral;
	else
		sNpcName = sLiaoGeneral;
	end;
	if nBattleState ~= MS_STATE_READY then
		Talk(1,"","<color=green>"..sNpcName.."<color>: Чi qu﹏  xu蕋 ph竧, kh玭g th� ban l謓h t鎛g t蕁 c玭g!")
		return 0
	end
	if BT_GetCurRank() ~= 6 then
		Talk(1,"","<color=green>"..sNpcName.."<color>: Ti觰 t鑤 nh� ngi m� c騨g i ban l謓h cho ta �? Ngi u! B総 h緉!")
		return 0
	end
	if IsTitleExist(30, 6) <= 0 and IsTitleExist(30, 12) <= 0 then
		Talk(1,"","<color=green>"..sNpcName.."<color>: Ph秈 c� danh hi謚 Nguy猲 So竔 m韎 c� th� ph竧 l謓h t蕁 c玭g! M阨 Nguy猲 So竔 ki觤 tra l筰.")
		return 0
	end
	local tSay = 
	{
		"Mau truy襫 l謓h c馻 b鎛 Nguy猲 So竔!/BT_Charge",
		"в ta suy ngh� l筰/nothing",	
	}
	Say("<color=green>"..sNpcName.."<color>: Tng s� tham gia t鎛g t蕁 c玭g theo l謓h c馻 <color=yellow>Nguy猲 So竔<color> s� 頲 <color=red>nh﹏ i 甶觤 kinh nghi謒<color>. <color=yellow>Nguy猲 So竔<color> ng � ch�?",getn(tSay),tSay)
end

function BT_Charge()
	-- S� d鬾g bi課 global  l璾 tr筺g th竔 c� ph竧 ng t鎛g t蕁 c玭g hay ch璦. 1 - 4 T鑞g,  5 - 8 l� Li猽. Th玭 trang bit 1,5 Th秓 c鑓 bit 2,6 Ph竜 i bit 3,7
	local nBattleVal =  GetGlbValue(1022)
	local nBattleType = BT_GetData(PT_BATTLE_TYPE);
	local nCurCamp = BT_GetCamp()
	local nCurRank = BT_GetCurRank()
	local nCheckCharge = BT_CheckCharge(nCurCamp)
	if nCheckCharge > 4 then
		nCheckCharge = nCheckCharge - 4 -- Tr� 4  show t猲 c馻 chi課 trng
	end
	if nCurCamp == SONG_ID then
		if GetTask(704) < 0 then
			Talk(1,"","<color=green>"..sNpcName.."<color>: Gian t� phe Li猽 d竚 m筼 danh Nguy猲 So竔 �? Ngi u! B総 h緉!")
			return 0
		end
		sNpcName = sSongGeneral;
		nChargeBit = SONG_BIT
	else
		if GetTask(704) >= 0 then
			Talk(1,"","<color=green>"..sNpcName.."<color>: Gian t� phe T鑞g d竚 m筼 danh Nguy猲 So竔 �? Ngi u! B総 h緉!")
			return 0
		end
		sNpcName = sLiaoGeneral;
		nChargeBit = LIAO_BIT
	end;
	if nCurRank ~= 6 then
		Talk(1,"","<color=green>"..sNpcName.."<color>: Ti觰 t鑤 nh� ngi m� c騨g i ban l謓h cho ta �? Ngi u! B総 h緉!")
		return 0
	end
	if IsTitleExist(30, 6) <= 0 and IsTitleExist(30, 12) <= 0 then
		Talk(1,"","<color=green>"..sNpcName.."<color>: Ph秈 c� danh hi謚 Nguy猲 So竔 m韎 c� th� ph竧 l謓h t蕁 c玭g! M阨 Nguy猲 So竔 ki觤 tra l筰.")
		return 0
	end
	if nCheckCharge > 0 then
		Talk(1,"","<color=green>"..sNpcName.."<color>: Nguy猲 So竔  ban l謓h t鎛g t蕁 c玭g <color=yellow>"..tBattleName[nCheckCharge].."<color>. M鏸 t ch� c� th� ban l謓h 1 l莕!")
		return 0
	end
	SetGlbValue(1022,SetBit(GetGlbValue(1022),nChargeBit,1)) -- nChargeBit quy nh ri猲g trong t鮪g file Ch� So竔
	nCheckCharge = BT_CheckCharge(nCurCamp)
	if nCheckCharge > 4 then
		nCheckCharge = nCheckCharge - 4 -- Tr� 4  show t猲 c馻 chi課 trng
	end
	AddGlobalNews(format("<color=yellow>%s Nguy猲 So竔<color><color=green> %s<color> ban l謓h t鎛g t蕁 c玭g <color=red>%s<color>. Tng s� tham gia chi課 trng c飊g phe s� 頲 nh﹏ i kinh nghi謒!",tCampNameZ[nCurCamp],GetName(),tBattleName[nCheckCharge]))
	Msg2Global(format("%s Nguy猲 So竔 %s ban l謓h t鎛g t蕁 c玭g %s. Tng s� tham gia chi課 trng c飊g phe s� 頲 nh﹏ i kinh nghi謒!",tCampNameZ[nCurCamp],GetName(),tBattleName[nCheckCharge]))
end

function BT_CheckCharge(nCamp)
	local n,m = 1,4
	if nCamp == LIAO_ID then
		n,m = 5,8
	end
	for i=n,m do
		if GetBit(GetGlbValue(1022),i) == 1 then
			return i
		end
	end
	return 0
end

--空函数
function nothing()

end;

