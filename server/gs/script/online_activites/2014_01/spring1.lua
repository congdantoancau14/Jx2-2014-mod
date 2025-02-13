--春节副活动2
Include("\\script\\lib\\globalfunctions.lua") --公共函数文件
Include("\\script\\misc\\taskmanager.lua")
Include("\\script\\online\\zgc_public_fun.lua")

VET_201401_SPRING1_ACTIVITYID = 109;

VET_201401_SPRING1_MAIN = "T誸 C� Truy襫/Vet_201401_sprint1_main";

VET_201401_SPRING1_TASK = TaskManager:Create(10, 13)
VET_201401_SPRING1_TASK.DaySeq = 1;
VET_201401_SPRING1_TASK.ACCEPT = 2;
VET_201401_SPRING1_TASK.AWARD = 3;
VET_201401_SPRING1_TASK.TEAM = 4;
VET_201401_SPRING1_TASK.KILLWILDPIG = 5;
VET_201401_SPRING1_TASK.TRIGGER = 6;
VET_201401_SPRING1_TASK.TeamCode = 7;

function Vet_201401_sprint1_main()
--	if gf_CheckBaseCondition(88, 1) ~= 1 and gf_GetPlayerRebornCount() <= 0 then
--		Talk(1,"","C蕄 88 tr� l猲 h鋍 h誸 k� n╪g 55 ho芻  chuy觧 sinh m韎 c� th� tham gia ho箃 ng");
--		return 0;
--	end
	if VET_201401_SPRING1_TASK:GetTask(VET_201401_SPRING1_TASK.DaySeq) ~= zgc_pub_day_turn() then
		VET_201401_SPRING1_TASK:SetTask(VET_201401_SPRING1_TASK.DaySeq,zgc_pub_day_turn());
		VET_201401_SPRING1_TASK:SetTask(VET_201401_SPRING1_TASK.ACCEPT,0);
		VET_201401_SPRING1_TASK:SetTask(VET_201401_SPRING1_TASK.AWARD,0);
		VET_201401_SPRING1_TASK:SetTask(VET_201401_SPRING1_TASK.TEAM,0);
		VET_201401_SPRING1_TASK:SetTask(VET_201401_SPRING1_TASK.TRIGGER,0);
	end
	local tSay = {
		"Nh薾 nhi謒 v� T誸 C� Truy襫/Vet_201401_AcceptSprintTask",
		"Nh薾 ph莕 thng nhi謒 v� T誸 C� Truy襫/Vet_201401_GetAward",
		"Ph莕 thng t� i/Vet_201401_OpenTeamAward",
		"T筰 h� ch� xem qua th玦/nothing",
	}
	Say("B筼 tr骳 thanh trung nh蕋 tu� tr�, xu﹏ phong t鑞g no穘 nh藀  t�!", getn(tSay), tSay);
end

function Vet_201401_AcceptSprintTask(bTag)
	local nKillWildPig = VET_201401_SPRING1_TASK:GetTask(VET_201401_SPRING1_TASK.KILLWILDPIG);
	if not bTag then
		Say(format("1: Ti猽 hao 100 L� Dong + 100 u Xanh Th辴 Heo + 10 V祅g\n2: Цnh b筰 100 con Heo R鮪g (%d/%d)", nKillWildPig, 100),
			 2, "уng �/#Vet_201401_AcceptSprintTask(1)", "tr� l筰/Vet_201401_sprint1_main");
		return 0;
	end
	if VET_201401_SPRING1_TASK:GetTask(VET_201401_SPRING1_TASK.ACCEPT) ~= 0 then
		Talk(1,"","Nhi謒 v� T誸 C� Truy襫 m鏸 ng祔 ch� c� th� nh薾 v� ho祅 th祅h 1 l莕");
		return 0;
	end
	if GetItemCount(2, 1, 30619) < 100 then
		Talk(1,"",format("H祅h trang kh玭g gian %s kh玭g  %d", "L� Dong", 100));
		return 0;
	end
	if GetItemCount(2, 1, 30620) < 100 then
		Talk(1,"",format("H祅h trang kh玭g gian %s kh玭g  %d", "u Xanh Th辴 Heo", 100));
		return 0;
	end
	if GetCash() < 10*10000 then
		Talk(1,"",format("H祅h trang kh玭g gian %s kh玭g  %d", "V祅g", 10).." Kim ");
		return 0;
	end
	if DelItem(2, 1, 30619, 100) ~= 1 or DelItem(2, 1, 30620, 100) ~= 1 or Pay(10*10000) ~= 1 then
		return 0;
	end
	VET_201401_SPRING1_TASK:SetTask(VET_201401_SPRING1_TASK.ACCEPT, 1);
	Msg2Player(format("Ti猽 hao %s*%d", "L� Dong", 100));
	Msg2Player(format("Ti猽 hao %s*%d", "u Xanh Th辴 Heo", 100));
	if nKillWildPig < 100 then
		Msg2Player("Чi hi謕 nhanh ch鉵g 甶 t譵 Heo R鮪g v� ti猽 di謙 n�!");
	else
		Msg2Player("Nhanh nh薾 ph莕 thng 甶!");
	end
end

function Vet_201401_Kill_WildPig(sName)
	if gf_CheckEventDateEx(VET_201401_SPRING1_ACTIVITYID) ~= 1 then
		return 0;
	end
	if VET_201401_SPRING1_TASK:GetTask(VET_201401_SPRING1_TASK.ACCEPT) ~= 1 then
		return 0;
	end
	local nCount = VET_201401_SPRING1_TASK:GetTask(VET_201401_SPRING1_TASK.KILLWILDPIG);
	if nCount >= 100 then
		return 0;
	end
	if sName == "Heo r鮪g" then
		VET_201401_SPRING1_TASK:SetTask(VET_201401_SPRING1_TASK.KILLWILDPIG, nCount + 1);
		Msg2Player(format("Nhi謒 v� T誸 C� Truy襫: nh b筰 %s%d/%d", sName, min(nCount + 1, 100), 100));
	end
end

function Vet_201401_GetAward()
	if VET_201401_SPRING1_TASK:GetTask(VET_201401_SPRING1_TASK.AWARD) ~= 0 then
		Talk(1,"","Ngi  nh薾 ph莕 thng nhi謒 v� T誸 C� Truy襫 r錳")
		return 0;
	end
	if VET_201401_SPRING1_TASK:GetTask(VET_201401_SPRING1_TASK.ACCEPT) ~= 1 then
		Talk(1,"","Ngi v蒼 ch璦 nh薾 nhi謒 v� T誸 C� Truy襫");
		return 0;
	end
	if VET_201401_SPRING1_TASK:GetTask(VET_201401_SPRING1_TASK.KILLWILDPIG) < 100 then
		Talk(1,"","Ngi ch璦 ho祅 th祅h nhi謒 v� nh b筰 100 con Heo R鮪g");
		return 0;
	end
	if gf_Judge_Room_Weight(3, 10, " ") ~= 1 then
		return 0;
	end
	VET_201401_SPRING1_TASK:SetTask(VET_201401_SPRING1_TASK.AWARD, 1);
	gf_Modify("Exp", 20142014);
  gf_AddItemEx2({2,95,208,1,4}, "T� Ngh躠 L謓h", "Event ph� 2 th竛g 1", "", 0, 1);
  gf_AddItemEx2({2,1,30409,1,4}, "Th玭g Thi猲 L謓h", "Event ph� 2 th竛g 1", "", 0, 1);
  gf_AddItemEx2({2,1,30623,1,4}, "Bao L� X� n╩ 2014", "Event ph� 2 th竛g 1", "", 24*3600, 1);
end

function Vet_201401_OpenTeamAward()
	if GetTeamSize() ~= 8 then
		Talk(1,"",format("Nh﹏ s� t� i kh玭g  %d ngi", 8));
		return 0;
	end
	if GetCaptainName() ~= GetName() then
		Talk(1,"","Ngi kh玭g ph秈 i trng");
		return 0;
	end
	local oldPlayerIdx = PlayerIndex;
	local bIsShow = nil;
	local msg = "Th祅h vi猲  s� d鬾g ph莕 thng t� i: \n"
	for i = 1, GetTeamSize() do
		PlayerIndex = GetTeamMember(i);
		if VET_201401_SPRING1_TASK:GetTask(VET_201401_SPRING1_TASK.TEAM) ~= 0 or GetTrigger(1535*2) > 0 then
			msg = msg.."<color=red>"..GetName().."<color>\n";
			bIsShow = 1;
		end
	end
	PlayerIndex = oldPlayerIdx;
	if bIsShow then
		Talk(1,"",msg);
		return 0;
	end
	local msg1 = "Th祅h vi猲 kh玭g  nguy猲 li謚: \n"
	for i = 1, GetTeamSize() do
		PlayerIndex = GetTeamMember(i);
		if GetItemCount(2,1,30623) < 1 or GetCash() < 2*10000 then
			msg1 = msg1.."<color=red>"..GetName().."<color>\n";
			bIsShow = 1;
		end
	end
	PlayerIndex = oldPlayerIdx;
	if bIsShow then
		Talk(1,"",msg1);
		return 0;
	end
	for i = 1, GetTeamSize() do
		PlayerIndex = GetTeamMember(i);
		if DelItem(2,1,30623,1) ~= 1 or Pay(2*10000) ~= 1 then
			PlayerIndex = oldPlayerIdx;
			return 0;
		end
	end
	PlayerIndex = oldPlayerIdx;
	SetCreateTeam(1);
	local nTeamCode = 0;
	for i = 1, GetTeamSize() do
		PlayerIndex = GetTeamMember(i);
		VET_201401_SPRING1_TASK:SetTask(VET_201401_SPRING1_TASK.TEAM, 1);
		nTeamCode = nTeamCode + tonumber(PlayerIndex);
	end
	PlayerIndex = oldPlayerIdx;
	local nTrigger = CreateTrigger(1, 1535, 1535*2);
	if nTrigger > 0 then
		VET_201401_SPRING1_TASK:SetTask(VET_201401_SPRING1_TASK.TRIGGER, 0);
		VET_201401_SPRING1_TASK:SetTask(VET_201401_SPRING1_TASK.TeamCode, nTeamCode);
		ContinueTimer(nTrigger);
		gf_Msg2Team("M� th祅h c玭g ph莕 thng t� i, kh玭g c莕 ti課 h祅h thao t竎 kh竎 v� ng r阨 m筺g");
	end
end

function Vet_201401_OnTimer()
	local oldPlayerIdx = PlayerIndex;
	local nTeamCode = 0;
	for i = 1, GetTeamSize() do
		PlayerIndex = GetTeamMember(i);
		nTeamCode = nTeamCode + tonumber(PlayerIndex);
	end
	PlayerIndex = oldPlayerIdx;
	if GetCaptainName() ~= GetName() or GetTeamSize() ~= 8 
		or VET_201401_SPRING1_TASK:GetTask(VET_201401_SPRING1_TASK.TeamCode) ~= nTeamCode then
		RemoveTrigger(GetTrigger(1535*2));
		gf_Msg2Team("Ph莕 thng t� i k誸 th骳!");
		SetCreateTeam(0);
		return 0;
	end
	local nTimes = VET_201401_SPRING1_TASK:GetTask(VET_201401_SPRING1_TASK.TRIGGER);
	if nTimes > 40 then
		RemoveTrigger(GetTrigger(1535*2));
		gf_Msg2Team("Ph莕 thng t� i k誸 th骳!");
		SetCreateTeam(0);
		return 0;
	end
	gf_TeamOperateEX(function ()
		if gf_CheckBaseCondition(88, 1) == 1 or gf_GetPlayerRebornCount() > 0 then
			gf_ModifyExp(250000);
		end
	end)
	VET_201401_SPRING1_TASK:SetTask(VET_201401_SPRING1_TASK.TRIGGER, nTimes + 1);
end