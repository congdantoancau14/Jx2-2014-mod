--春节副活动3
Include("\\script\\lib\\globalfunctions.lua") --公共函数文件
Include("\\script\\misc\\taskmanager.lua")
Include("\\script\\online\\zgc_public_fun.lua")

VET_201401_VALENTINE_ACTIVITYID = 110;

VET_201401_VALENTINE_MAIN = "L� T譶h Nh﹏ 2014/Vet_201401_Valentine_Main";

VET_201401_VALENTINE_TASK = TaskManager:Create(1, 22)
VET_201401_VALENTINE_TASK.DaySeq = 1
VET_201401_VALENTINE_TASK.HuiTuZi = 2
VET_201401_VALENTINE_TASK.BaiTuZi = 3
VET_201401_VALENTINE_TASK.Task = 4
VET_201401_VALENTINE_TASK.Present = 5
VET_201401_VALENTINE_TASK.Award = 6
VET_201401_VALENTINE_TASK.MaleTimes = 7

function Vet_201401_Valentine_Main()
	if gf_GetPlayerRebornCount() < 1 then
		Talk(1,"","Nh﹏ v藅 chuy觧 sinh 1 tr� l猲 m韎 tham gia 頲 ho箃 ng");
		return 0;
	end
	if VET_201401_VALENTINE_TASK:GetTask(VET_201401_VALENTINE_TASK.DaySeq) ~= zgc_pub_day_turn() then
		VET_201401_VALENTINE_TASK:SetTask(VET_201401_VALENTINE_TASK.DaySeq, zgc_pub_day_turn());
		VET_201401_VALENTINE_TASK:SetTask(VET_201401_VALENTINE_TASK.Present, 0);
		VET_201401_VALENTINE_TASK:SetTask(VET_201401_VALENTINE_TASK.Award, 0);
		VET_201401_VALENTINE_TASK:SetTask(VET_201401_VALENTINE_TASK.MaleTimes, 0);
	end
	local tSay = {
		"Nh薾 nhi謒 v� L� T譶h Nh﹏/Vet_201401_Valentine_Task",
		"Nh薾 thng L� T譶h Nh﹏/Vet_201401_Valentine_Award",
		"T筰 h� ch� xem qua th玦/nothing",
	}
	Say("Nguy謓 cho th� gian h鱱 t譶h nh﹏ duy猲!", getn(tSay), tSay);
end

function Vet_201401_Valentine_Task(bAccept)
	if GetSex() ~= 2 then
		Talk(1,"","Ch� c� n� nh﹏ v藅 m韎 c� th� nh薾 nhi謒 v�");
		return 0;
	end
	if bAccept and tonumber(bAccept) == 1 then
		VET_201401_VALENTINE_TASK:SetTask(VET_201401_VALENTINE_TASK.Task, 1);
		Msg2Player("Чi hi謕 nhanh ch鉵g 甶 t譵 Th� X竚 v� Th� Tr緉g  ti猽 di謙 n�!");
		return 1;
	end
	local nHuituzi = VET_201401_VALENTINE_TASK:GetTask(VET_201401_VALENTINE_TASK.HuiTuZi);
	local nBaituzi = VET_201401_VALENTINE_TASK:GetTask(VET_201401_VALENTINE_TASK.BaiTuZi);
	local msg = format("1: Цnh b筰 %d Th� X竚 <color=yellow>(%d/%d)<color>\n2: Цnh b筰 %d Th� Tr緉g <color=yellow>(%d/%d)<color>",
		 1402, nHuituzi, 1402, 1402, nBaituzi, 1402);
	local tSay = {};
	if nBaituzi >= 1402 and nHuituzi >=1402 then
		tinsert(tSay, "Х ho祅 th祅h nhi謒 v� n祔/nothing");
	else
		if VET_201401_VALENTINE_TASK:GetTask(VET_201401_VALENTINE_TASK.Task) == 0 then
			tinsert(tSay, "Nh薾 nhi謒 v� L� T譶h Nh﹏/#Vet_201401_Valentine_Task(1)");
			tinsert(tSay, "T筰 h� ch� xem qua th玦/nothing");
		else
			tinsert(tSay, "Nhi謒 v� ch璦 ho祅 th祅h/nothing");
		end
	end
	Say(msg, getn(tSay), tSay);
end

function Vet_201401_Valentine_Trigger(sName)
	if gf_CheckEventDateEx(VET_201401_VALENTINE_ACTIVITYID) ~= 1 then
		return 0;
	end
	if VET_201401_VALENTINE_TASK:GetTask(VET_201401_VALENTINE_TASK.Task) ~= 1 then
		return 0;
	end
	local nHuituzi = VET_201401_VALENTINE_TASK:GetTask(VET_201401_VALENTINE_TASK.HuiTuZi);
	local nBaituzi = VET_201401_VALENTINE_TASK:GetTask(VET_201401_VALENTINE_TASK.BaiTuZi);
	if nHuituzi >= 1402 and nBaituzi >= 1402 then
		return 0;
	end
	if sName == "Th� x竚" and nHuituzi < 1402 then
		VET_201401_VALENTINE_TASK:SetTask(VET_201401_VALENTINE_TASK.HuiTuZi, nHuituzi + 1);
		Msg2Player(format("Nhi謒 v� L� T譶h Nh﹏: nh b筰 %s%d/%d", sName, nHuituzi + 1, 1402));
	end
	if sName == "Th� r鮪g" and nBaituzi < 1402 then
		VET_201401_VALENTINE_TASK:SetTask(VET_201401_VALENTINE_TASK.BaiTuZi, nBaituzi + 1);
		Msg2Player(format("Nhi謒 v� L� T譶h Nh﹏: nh b筰 %s%d/%d", sName, nBaituzi + 1, 1402));
	end
end

function Vet_201401_Valentine_Award()
	if GetSex() ~= 2 then
		Talk(1,"","Ph莕 thng n祔 ch� c� nh﹏ v藅 n� s� d鬾g");
		return 0;
	end
	local nHuituzi = VET_201401_VALENTINE_TASK:GetTask(VET_201401_VALENTINE_TASK.HuiTuZi);
	local nBaituzi = VET_201401_VALENTINE_TASK:GetTask(VET_201401_VALENTINE_TASK.BaiTuZi);
	if nHuituzi < 1402 or nBaituzi < 1402 then
		Talk(1,"","Ngi ch璦 ho祅 th祅h nhi謒 v� L� T譶h Nh﹏");
		return 0;
	end
	local nUseTime = VET_201401_VALENTINE_TASK:GetTask(VET_201401_VALENTINE_TASK.Present);
	local tSay = {
		format("Ti猽 hao 1402 Ti猽 Dao Ng鋍 + 999 T祅g H錸g Hoa  nh﹏ v藅 nam trong t� i nh薾 thng (%d/%d)/#Vet_201401_Valentine_Present(%d)", nUseTime, 3, nUseTime),
		"Ta mu鑞 nh薾 ph莕 thng L� T譶h Nh﹏ 2014/Vet_201401_Valentine_Award_deal",
		"T筰 h� ch� xem qua th玦/nothing"
	}
	Say("Nguy謓 cho th� gian h鱱 t譶h nh﹏ duy猲!", getn(tSay), tSay);
end

function Vet_201401_Valentine_Present(nUseTime)
	if tonumber(nUseTime) >= 3 then
		Talk(1,"",format("M鏸 ng祔 m鏸 nh﹏ v藅 nhi襲 nh蕋 ch� c� th� s� d鬾g ph莕 thng %d l莕", 3));
		return 0;
	end
	if GetCaptainName() ~= GetName() then
		Talk(1,"","Ngi kh玭g ph秈 i trng, kh玭g th� s� d鬾g t輓h n╪g n祔!");
		return 0;
	end
	local oldPlayerIdx = PlayerIndex;
	local malePlayerIdx = nil
	local maleName = nil
	local maleCount = 0;
	for i = 1, GetTeamSize() do 
		PlayerIndex = GetTeamMember(i);
		if GetSex() == 1 then
			maleCount = maleCount + 1;
			malePlayerIdx = PlayerIndex;
			maleName = GetName();
		end
	end
	PlayerIndex = oldPlayerIdx;
	if maleCount == 0 then
		Talk(1,"","T� i kh玭g c� nh﹏ v藅 nam");
		return 0;
	end
	if maleCount > 1 then
		Talk(1,"",format("Trong t� i s� lng nh﹏ v藅 nam vt qu� %d ngi", 1));
		return 0;
	end
	if GetItemCount(2, 1, 30603) < 1402 then
		Talk(1,"",format("Trong h祅h trang %s s� lng kh玭g  %d", "Ti猽 Dao Ng鋍", 1402));
		return 0;
	end
	if GetItemCount(1, 2, 1) < 999 then
		Talk(1,"",format("Trong h祅h trang %s s� lng kh玭g  %d", "T祅g H錸g Hoa", 999));
		return 0;
	end
	--------------------------
	PlayerIndex = malePlayerIdx;
	if VET_201401_VALENTINE_TASK:GetTask(VET_201401_VALENTINE_TASK.DaySeq) ~= zgc_pub_day_turn() then
		VET_201401_VALENTINE_TASK:SetTask(VET_201401_VALENTINE_TASK.DaySeq, zgc_pub_day_turn());
		VET_201401_VALENTINE_TASK:SetTask(VET_201401_VALENTINE_TASK.Present, 0);
		VET_201401_VALENTINE_TASK:SetTask(VET_201401_VALENTINE_TASK.Award, 0);
		VET_201401_VALENTINE_TASK:SetTask(VET_201401_VALENTINE_TASK.MaleTimes, 0);
	end
	local nMaleTimes = VET_201401_VALENTINE_TASK:GetTask(VET_201401_VALENTINE_TASK.MaleTimes);
	PlayerIndex = oldPlayerIdx;
	if nMaleTimes ~= 0 then
		Talk(1,"","Nh﹏ v藅 nam n祔  nh薾 l� v藅 L� T譶h Nh﹏ r錳");
		return 0;
	end
	---------------------------
	if DelItem(2, 1, 30603, 1402) ~= 1 or DelItem(1, 2, 1, 999) ~= 1 then
		return 0;
	end
	VET_201401_VALENTINE_TASK:SetTask(VET_201401_VALENTINE_TASK.Present, tonumber(nUseTime) + 1);
	----------------------------------------------
	PlayerIndex = malePlayerIdx;
	VET_201401_VALENTINE_TASK:SetTask(VET_201401_VALENTINE_TASK.MaleTimes, 1);
	gf_ModifyExp(520520520);
	gf_EventGiveCustomAward(4, 520, 1, "Event ph� 3 th竛g 1");
  gf_EventGiveCustomAward(3, 520, 1, "Event ph� 3 th竛g 1");
  gf_EventGiveCustomAward(31, 520, 1, "Event ph� 3 th竛g 1");
  AwardGenuineQi(520);
  PlayerIndex = oldPlayerIdx;
  ----------------------------------------------
  local msg = format("[%s] hng v� [%s] d﹏g t苙g l� v藅 t譶h nh﹏, nguy謓 cho th� gian h鱱 t譶h nh﹏ duy猲!", GetName(), maleName);
  Msg2Global(msg);
end

function Vet_201401_Valentine_Award_deal()
	if VET_201401_VALENTINE_TASK:GetTask(VET_201401_VALENTINE_TASK.Award) ~= 0 then
		Talk(1,"","Х nh薾 thng L� T譶h Nh﹏");
		return 0;
	end 
	local nUseTime = VET_201401_VALENTINE_TASK:GetTask(VET_201401_VALENTINE_TASK.Present);
	if nUseTime < 3 then
		Talk(1,"",format("S� l莕 d﹏g t苙g qu� L� T譶h Nh﹏ cho nam s� kh玭g  %d", 3));
		return 0;
	end
	if gf_Judge_Room_Weight(5, 100, "") ~= 1 then
		return 0;
	end
	VET_201401_VALENTINE_TASK:SetTask(VET_201401_VALENTINE_TASK.Award, 1);
	gf_ModifyExp(25251325);
	AwardGenuineQi(1402);
	local tAward = {
		{"Nh穘", 2,	1,	30164},
		{"Ch玬 Ch玬", 2,	1,	30165},
		{"Cam", 2,	1,	30166},
		{"D鮝", 2,	1,	30167},
		{"M╪g c魌", 2,	1,	30168},
		{"Bi", 2,	1,	30169},
		{"D﹗", 2,	1,	30170},
		{"Chu鑙", 2,	1,	30171},
		{"Xo礽", 2,	1,	30172},
		{"Уo", 2,	1,	30173},
		{"M薾", 2,	1,	30174},
		{"V秈", 2,	1,	30175},
		{"T竜", 2,	1,	30176},
		{"B�", 2,	1,	30177},
		{" я", 2,	1,	30178},
		{"M穘g C莡", 2,	1,	30179},
		{"Kh鉳", 2,	1,	30180},
		{"L�", 2,	1,	30181},
		{"B遪 Bon", 2,	1,	30182},
		{"Kh�", 2,	1,	30183},		
	}
--	for i = 1, 87 do
--		local nRand = random(getn(tAward));
--		AddItem(tAward[nRand][2], tAward[nRand][3], tAward[nRand][4], 16);
--	end
		local nRandom = mod(random(1,10000),20)
		AddItem(2,1,(30164 + nRandom), 1402)
end