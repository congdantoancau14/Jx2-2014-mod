Include("\\script\\online_activites\\201505\\head.lua")
Include("\\script\\online_activites\\201505\\kill_npc_daily.lua")

--由于原来的activity_kill_npc机制不支持配置多个任务领取，指定日期领取，领取条件的问题，故为了短时间内解决问题。故强插之
tbKillNpcWeekly = {}

tbKillNpcWeekly.nActivityID = 157
--tbKillNpcWeekly.tbOpenDate = {2015032300, 2015050100}，在\script\online_activites\online_activites.txt有配置
tbKillNpcWeekly.tbTaskGroupId = {1, 22}
tbKillNpcWeekly.nAcceptTaskTaskIndex = 6 --是否领取任务
tbKillNpcWeekly.nGetPrizeTaskIndex = 7 --是否领取奖励
tbKillNpcWeekly.nRetsetTaskTaskIndex = 8 --重置任务变量
tbKillNpcWeekly.nTaskInfoTaskIndex = 9 --任务信息，杀怪情况

tbKillNpcWeekly.tbLogInfo = {"Ho箃 ng 05/2015", "Ho箃 ng 05/2015"}
tbKillNpcWeekly.tbAward = 
{
	tbFreeRoom = {1,1},
	tbCost = 
	{
		{2, 1, 30603, 299, "Ti猽 Dao Ng鋍"},
		{2, 1, 30825, 2000, "D﹗"},
		{2, 1, 30826, 2000, "L� Tr� Xanh"},
	},
	tbPrize = 
	{
		{"Exp", 150000000},
		{2, 1, 30785, 19, "V� T� Kinh Th�"},
		{2, 1, 30830, 99, "Siro Tr竔 C﹜ "},
	}
}

tbKillNpcWeekly.tbOpenWeek = {1,2,3,4,5,6,0}--星期六和星期天开放
tbKillNpcWeekly.tbTaskGroup = nil--server启动的时候，根据tbTaskGroupId产生
tbKillNpcWeekly.nTargetKillNpcNum = 1

tbKillNpcWeekly.tbLang = 
{
	szTaskName = "Thu th藀 Siro Tr竔 C﹜ (Cu鑙 tu莕)",
	szOpenDateTimeError = "Hi謓 t筰 kh玭g ph秈 th阨 gian m� t輓h n╪g, xin vui l遪g i.",
	szOpenWeekTimeError = "T輓h n╪g n祔 ch� m� v祇 %s, xin vui l遪g i.",
	szAcceptTask = "\nNh薾 nhi謒 v� %s/KillNpcWeekGetTask",
	szGetTaskPrize = "Nh薾 ph莕 thng nhi謒 v�/KillNpcWeekGetAward",
	szHaveAcceptTask = "B筺  nh薾 nhi謒 v� n祔 r錳, h穣 ti猽 di謙 m閠 trong nh鱪g BOSS sau <color=gold><enter>Уo Hoa Фo Ch� Ho祅g Long: Phong Linh Ch﹗,<enter>T﹜ V鵦 Thng Lang B� Vng: H醓 Linh Ch﹗,<enter>Ng鋍 S琻 Chi Linh Thi猲 C鰑: L玦 Linh Ch﹗,<enter>U Tr筩h Chi 秐h Minh V�: 謓 Linh Ch﹗<color><enter> l� c� th� ho祅 th祅h nhi謒 v�!<enter>N誹 b筺  ho祅 th祅h r錳 th� nh� nh薾 ph莕 thng nh�!",
	szAcceptTaskSuccess = "Ch骳 m鮪g, b筺  nh薾 nhi謒 v�, h穣 ti猽 di謙 m閠 trong nh鱪g con BOSS Уo Hoa Фo Ch� Ho祅g Long, T﹜ V鵦 Thng Lang B� Vng, Ng鋍 S琻 Chi Linh Thi猲 C鰑, U Tr筩h Chi 秐h Minh V� s� c� th� ho祅 th祅h nhi謒 v�!",
	szNotFinishTask = "R蕋 ti誧, b筺 v蒼 ch璦 ho祅 th祅h nhi謒 v�, h穣 ti謚 di謙 m閠 trong nh鱪g con BOSS <color=gold><enter>Уo Hoa Фo Ch� Ho祅g Long: Phong Linh Ch﹗,<enter>T﹜ V鵦 Thng Lang B� Vng: H醓 Linh Ch﹗,<enter>Ng鋍 S琻 Chi Linh Thi猲 C鰑: L玦 Linh Ch﹗,<enter>U Tr筩h Chi 秐h Minh V�: 謓 Linh Ch﹗<color><enter> s� c� th� ho祅 th祅h nhi謒 v�!",
	szHaveGetPrize = "B筺  nh薾 ph莕 thng nhi謒 v� n祔 r錳, l莕 sau h穣 quay l筰.",
	szHaveGetOtherPrize = "B筺  nh薾 ph莕 thng c馻 %s, kh玭g th� nh薾 ph莕 thng nhi謒 v� n祔, l莕 sau h穣 quay l筰!",
	szCashNotEngouh = "Ng﹏ lng kh玭g  %d v祅g",
	szItemNotEngouh = "v藅 ph萴 trong t骾  %s s� lng kh玭g  %d c竔",
	szNpcSelection = "Ho祅 th祅h nhi謒 v� nh BOSS (Ti猽 hao 2000 D﹗ T﹜ + 2000 L� Tr� Xanh + 299 Ti猽 Dao Ng鋍)",
	szNpcNothing = "\nT玦 ch� xem xem th玦/nothing",
	szNpcGetAwardTittle = "<color=green>%s:<color> %s mu鑞 nh薾 ph莕 thng g�?<enter><color=red>Ch� �: Sau khi nh薾 ph莕 thng n祔 s� kh玭g th� nh薾 ph莕 thng c馻 <color=gold>%s<color><color>",
	szKillNpcTip = "ti猽 di謙%s %d/%d",
	szKillNpcFinishTip = "Ti猽 di謙 %s %d/%d (Ho祅 th祅h)",
	szConfirmSelection = "ng, ta  suy ngh� k� r錳.",
	szConfirmTittle = "<enter><color=red>Ch� �: Sau khi nh薾 ph莕 thng n祔 th� sau n祔 kh玭g th� nh薾 ph莕 thng c馻 <color=gold>%s<color>,<color> ng � nh薾 kh玭g?",
}

function tbKillNpcWeekly:InitTaskGroup()
	local objTaskGroup = TaskManager:Create(self.tbTaskGroupId[1], self.tbTaskGroupId[2]);
	tbKillNpcWeekly.tbTaskGroup = objTaskGroup
end

function tbKillNpcWeekly:TryResetTaskVariant()
	local taskGroup = self:GetTaskGroup()
	if not taskGroup then
		return
	end

	local nDaySeq = taskGroup:GetTask(self.nRetsetTaskTaskIndex)
	local nCurDaySeq = zgc_pub_day_turn()		
	if nCurDaySeq ~= nDaySeq then
		taskGroup:SetTask(self.nRetsetTaskTaskIndex, nCurDaySeq)
		taskGroup:SetTask(self.nAcceptTaskTaskIndex, 0)
		taskGroup:SetTask(self.nGetPrizeTaskIndex, 0)
		taskGroup:SetTask(self.nTaskInfoTaskIndex, 0)
	end
end

function tbKillNpcWeekly:CheckCondition()
	local nRetCode,szError = self:CheckDateTime()
	if nRetCode == 0 then
		return nRetCode,szError
	end
	
	nRetCode, szError = self:CheckWeek()
	if nRetCode == 0 then
		return nRetCode,szError
	end
	
	nRetCode = 1
	szError = ""
	return nRetCode,szError
end

function tbKillNpcWeekly:CheckDateTime()
	local nRetCode = gf_CheckEventDateEx(self.nActivityID)
	local szError = ""
	if nRetCode ~= 1 then
		szError = self.tbLang.szOpenDateTimeError
	end
	return nRetCode, szError
end
 
function tbKillNpcWeekly:CheckWeek()
	local szString = ""
	local nRetCode = 0
	local tbOpenWeekDesc = {}
	local nCurWeek = tonumber(date("%w"))
	for nIndex, nOpenWeek in self.tbOpenWeek do
		if nCurWeek == nOpenWeek then
			nRetCode = 1
		end
		tinsert(tbOpenWeekDesc, WEEK_DESC[nOpenWeek])
	end	
	if nRetCode == 0 then
		local szNotOpenWeek = join(tbOpenWeekDesc, ",")
		szString = format(self.tbLang.szOpenWeekTimeError, szNotOpenWeek)
	end
	return nRetCode, szString
end

function tbKillNpcWeekly:GetTaskGroup()
	self:InitTaskGroup()
	return self.tbTaskGroup
end

function tbKillNpcWeekly:AcceptKillNpcTask()
	local nRetCode, szError = self:CheckCondition()
	if nRetCode == 0 then
		Talk(1, "", szError)
		print(szError)
		return
	end
	
	local taskGroup = self:GetTaskGroup()
	if not taskGroup then
		return
	end
	
	local nIsGetTask = taskGroup:GetTask(self.nAcceptTaskTaskIndex)
	if nIsGetTask ~= 0 then
		local szString = self.tbLang.szHaveAcceptTask
		Talk(1, "", szString)
		return 
	end
	taskGroup:SetTask(self.nAcceptTaskTaskIndex, 1)
	TaskTip(self.tbLang.szAcceptTaskSuccess)
end

function tbKillNpcWeekly:OnFinishKillNpcTaskCallBack()
	local taskGroup = self:GetTaskGroup()
	if not taskGroup then
		return
	end
	
	local nIsGetTask = taskGroup:GetTask(self.nAcceptTaskTaskIndex)
	if nIsGetTask == 0 then
		return
	end
	
	taskGroup:SetTask(self.nAcceptTaskTaskIndex, 1)
	
	local nPlayerIndexBak = PlayerIndex
	--队员也要完成
	local nTeamSize = GetTeamSize()
	for nIndex=1, nTeamSize do
		PlayerIndex = GetTeamMember(nIndex)
		local nMemberIsGetTask = taskGroup:GetTask(self.nAcceptTaskTaskIndex)
		if nMemberIsGetTask ~= 0 then
			taskGroup:SetTask(self.nAcceptTaskTaskIndex, 1)
		end
	end
	PlayerIndex = nPlayerIndexBak
end

function tbKillNpcWeekly:CheckGetKillNpcPrize()
	local tbAward = self.tbAward
	local tbFreeRoom = tbAward.tbFreeRoom
	local tbCost = tbAward.tbCost
	local nRetCode = 0
	
	local taskGroup = self:GetTaskGroup()
	if not taskGroup then
		return nRetCode
	end
	
	local nGetPrize = taskGroup:GetTask(self.nGetPrizeTaskIndex)
	if nGetPrize ~= 0 then
		local szString = self.tbLang.szHaveGetPrize
		Talk(1,"",szString)
		return nRetCode
	end
	
	local dailyTaskGroup = tbKillNpcDaily:GetTaskGroup()
	if not dailyTaskGroup then
		return nRetCode
	end
	
	local nHaveGetDailyPrize = dailyTaskGroup:GetTask(tbKillNpcDaily.nGetPrizeTaskIndex)
	if nHaveGetDailyPrize ~= 0 then
		local szString = format(self.tbLang.szHaveGetOtherPrize, tbKillNpcDaily.tbLang.szTaskName)
		Talk(1,"",szString)
		return nRetCode
	end
	
	local nCurCount = taskGroup:GetTask(self.nTaskInfoTaskIndex)
	local nTargetCount = self.nTargetKillNpcNum
	if nCurCount < nTargetCount then
		local szString = self.tbLang.szNotFinishTask
		Talk(1,"",szString)
		return nRetCode
	end
	
	if gf_Judge_Room_Weight(tbFreeRoom[1], tbFreeRoom[2], " ") ~= 1 then
		return nRetCode
	end	
	
	for k, v in tbCost do
		if getn(v) == 1 then
			if GetCash() < v[1] then
				Talk(1,"",format(self.tbLang.szCashNotEngouh, ceil(v[1] / 10000)))
				return nRetCode
			end
		end
		if getn(v) == 5 then
			if GetItemCount(v[1], v[2], v[3]) < v[4] then
				Talk(1,"",format(self.tbLang.szItemNotEngouh, v[5], v[4]))
				return nRetCode
			end
		end
	end

	nRetCode = 1
	return nRetCode
end

function tbKillNpcWeekly:CostKillNpcNeed()
	local tbAward = self.tbAward
	local tbFreeRoom = tbAward.tbFreeRoom
	local tbCost = tbAward.tbCost
	local nRetCode = 1

	for k, v in tbCost do
		if getn(v) == 1 then
			if Pay(v[1]) ~= 1 then
				nRetCode = 0
				break
			end
		end
		if getn(v) == 5 then
			if DelItem(v[1], v[2], v[3], v[4]) ~= 1 then
				nRetCode = 0
				break
			end
		end
	end
	
	return nRetCode
end

function tbKillNpcWeekly:GivePrize()
	local tbPrize = self.tbAward.tbPrize
	for nIndex, tbAwardDetail in tbPrize do
		local nParamCount = getn(tbAwardDetail)
		if nParamCount == 2 then
			local szAwardKey = tbAwardDetail[1]
			local nAwardValue = tbAwardDetail[2]
			if szAwardKey == "Exp" then
				gf_Modify("Exp", nAwardValue);
			end
		elseif nParamCount == 5 then
			gf_AddItemEx2({tbAwardDetail[1], tbAwardDetail[2], tbAwardDetail[3], tbAwardDetail[4]},tbAwardDetail[5], self.tbLogInfo[1], self.tbLogInfo[2], 0, 1)
		end
	end
end

function tbKillNpcWeekly:GetKillNpcPrize()
	local nRetCode, szError = self:CheckCondition()
	if nRetCode == 0 then
		Msg2Player(szError)
		return
	end
	
	nRetCode = self:CheckGetKillNpcPrize()--提示在内部
	if nRetCode == 0 then
		return
	end
	
	nRetCode = self:CostKillNpcNeed()--这里就不提示了
	if nRetCode == 0 then
		return
	end
	
	local taskGroup = self:GetTaskGroup()
	if not taskGroup then
		return
	end
	
	local nIsGetPrize = taskGroup:GetTask(self.nGetPrizeTaskIndex)
	if nIsGetPrize ~= 0 then
		local szString = self.tbLang.szHaveGetPrize
		Msg2Player(szString)
		return 
	end
	
	taskGroup:SetTask(self.nGetPrizeTaskIndex, 1)
	self:GivePrize()
end

function tbKillNpcWeekly:NpcShowMainDialog(tbSay)
	if gf_CheckEventDateEx(self.nActivityID) ~= 1 then
		return
	end
	
	tinsert(tbSay, format(self.tbLang.szAcceptTask, self.tbLang.szTaskName))
	tinsert(tbSay, self.tbLang.szGetTaskPrize)
	self:TryResetTaskVariant()
end

function tbKillNpcWeekly:TriggerKillNpc(szNpcName)
	self:TryResetTaskVariant()
	local taskGroup = self:GetTaskGroup()
	if not taskGroup then
		return 
	end
	
	local nAcceptTask = taskGroup:GetTask(self.nAcceptTaskTaskIndex)
	if nAcceptTask == 0 then
		return
	end
	
	local nCurMapID, nCurMapX, nCurMapY = GetWorldPos()
	--不要对队伍操作 触发器本来就是对每个人触发的
	local nSelfMapID, nSelfMapX, nSelfMapY = GetWorldPos()
	if nCurMapID ~= nSelfMapID then
		return
	end	
	--不判断NPC的名字了。触发的可能性少
	local nTargetNpcNum = tbKillNpcWeekly.nTargetKillNpcNum
	local nCurCount = taskGroup:GetTask(tbKillNpcWeekly.nTaskInfoTaskIndex)
	local nNewCount = nCurCount + 1
	taskGroup:SetTask(tbKillNpcWeekly.nTaskInfoTaskIndex, nNewCount)
	local szString = ""
	if nNewCount >= nTargetNpcNum then
		szString = format(tbKillNpcWeekly.tbLang.szKillNpcFinishTip, szNpcName, nNewCount, nTargetNpcNum)
	else
		szString = format(tbKillNpcWeekly.tbLang.szKillNpcTip, szNpcName, nNewCount, nTargetNpcNum)
	end
	Msg2Player(szString)
--	gf_TeamOperateEX(function()
--	end)
end
-----------------------------------------------------
function KillNpcWeeklyServerStartUp()
	tbKillNpcWeekly:InitTaskGroup()
end

function KillNpcWeeklyPlayerLogin()
	tbKillNpcWeekly:TryResetTaskVariant()
end

function KillNpcWeekGetTask()
	tbKillNpcWeekly:AcceptKillNpcTask()	
end

function KillNpcWeekGetAward()
	local nRetCode = tbKillNpcWeekly:CheckGetKillNpcPrize()
	if nRetCode == 0 then
		return
	end
	local tbSay = {}
	tinsert(tbSay, format("%s/SureGetWeeklyAward", tbKillNpcWeekly.tbLang.szNpcSelection))
	tinsert(tbSay, tbKillNpcWeekly.tbLang.szNpcNothing)
	Say(format(tbKillNpcWeekly.tbLang.szNpcGetAwardTittle ,GetNpcName(GetTargetNpc()), gf_GetPlayerSexName(), tbKillNpcDaily.tbLang.szTaskName), getn(tbSay), tbSay)
end
	
function SureGetWeeklyAward(nSelectType)
	local tbSay = {}
	tinsert(tbSay,format("%s/ConfirmSureGetWeeklyAward", tbKillNpcWeekly.tbLang.szConfirmSelection))
	tinsert(tbSay, tbKillNpcDaily.tbLang.szNpcNothing)
	Say(format(tbKillNpcDaily.tbLang.szConfirmTittle ,tbKillNpcDaily.tbLang.szTaskName), getn(tbSay), tbSay)
end

function ConfirmSureGetWeeklyAward()
	tbKillNpcWeekly:GetKillNpcPrize()
end