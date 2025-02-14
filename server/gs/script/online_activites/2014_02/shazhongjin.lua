--2014年2月副活动2
Include("\\script\\lib\\globalfunctions.lua") --公共函数文件
Include("\\script\\misc\\taskmanager.lua")
Include("\\script\\online\\zgc_public_fun.lua")

VET_201402_ACTIVITYID = 114;

VET_201402_MAIN = "Sa Trung Kim /Vet_201402_main";

VET_201402_TASK = TaskManager:Create(6, 13)
VET_201402_TASK.DaySeq = 1;
VET_201402_TASK.TASK = 2;
VET_201402_TASK.AWARD = 3;
VET_201402_TASK.KILL1 = 4;
VET_201402_TASK.KILL2 = 5;
VET_201402_TASK.KILL3 = 6;


function Vet_201402_main()
	if VET_201402_TASK:GetTask(VET_201402_TASK.DaySeq) ~= zgc_pub_day_turn() then
		VET_201402_TASK:SetTask(VET_201402_TASK.DaySeq,zgc_pub_day_turn());
		VET_201402_TASK:SetTask(VET_201402_TASK.TASK,0);
		VET_201402_TASK:SetTask(VET_201402_TASK.AWARD,0);
		VET_201402_TASK:SetTask(VET_201402_TASK.KILL1,0);
		VET_201402_TASK:SetTask(VET_201402_TASK.KILL2,0);
		VET_201402_TASK:SetTask(VET_201402_TASK.KILL3,0);
	end
	local tSay = {
		"nh薾 nhi謒 v� 'Sa Trung Kim'/Vet_201402_AcceptTask",
		"Nh薾 ph莕 thng nhi謒 v� 'Sa Trung Kim'(ti猽 hao 199 v祅g v� 99 Ti猽 Dao Ng鋍 )/Vet_201402_Award",
		"T筰 h� ch� xem qua th玦/nothing",
	}
	Say("<color=green>L鬰 Tr骳 g: <color>阯g ph� h玬 nay th藅 n竜 nhi謙.", getn(tSay), tSay);
end

function Vet_201402_AcceptTask()
	local nStep = VET_201402_TASK:GetTask(VET_201402_TASK.TASK);
	if nStep ~= 0 then
		Talk(1,"","B筺  nh薾 nhi謒 v� 'Sa Trung Kim'");
		if nStep == 1 then
			Msg2Player("дn Quang Minh жnh t譵  Minh");
		elseif nStep == 2 then
			Msg2Player("дn m� cung sa m筩 t譵 B筩h Ti猲 Th祅h");
		elseif nStep == 3 then
			Msg2Player("ti猽 di謙 333 Sa M筩 H祅h Nh﹏, ti猽 di謙 555 T莔 B秓 Nh﹏");
		elseif nStep == 4 then
			Msg2Player("дn Dc Vng чng t譵 Dc Th蕋 Th� V�");
		elseif nStep == 5 then
			Msg2Player("Ti猽 di謙 99 ngi c﹜");
		elseif nStep == 6 then
			Msg2Player("B筺  ho祅 th祅h nhi謒 v� 'Sa Trung Kim'");
		end
		return 0;
	end
	VET_201402_TASK:SetTask(VET_201402_TASK.TASK, 1);
	Msg2Player("дn Quang Minh жnh t譵  Minh".."Th豱h gi竜 gi� kim m藅 thu藅");
	TaskTip("дn Quang Minh жnh t譵  Minh".."Th豱h gi竜 gi� kim m藅 thu藅");
end

function Vet_201402_Award()
	if VET_201402_TASK:GetTask(VET_201402_TASK.AWARD) ~= 0 then
		Talk(1,"","B筺  s� d鬾g ph莕 thng 'Sa Trung Kim'");
		return 0;
	end
	if VET_201402_TASK:GetTask(VET_201402_TASK.TASK) ~= 6 then
		Talk(1,"","B筺 ch璦 ho祅 th祅h xong nhi謒 v� 'Sa Trung Kim', kh玭g th� s� d鬾g ph莕 thng ");
		return 0;
	end
	if gf_Judge_Room_Weight(21, 100, " ") ~= 1 then
		return 0;
	end
	if GetCash() < 199*10000 then
		Talk(1,"",format("Ng﹏ lng kh玭g  %d v祅g", 199));
		return 0;
	end
	if GetItemCount(2,1,30603) < 99 then
		Talk(1,"",format("S� lng Ti猽 Dao Ng鋍 trong t骾 kh玭g  %d ", 99));
		return 0;
	end
	if Pay(199*10000) ~= 1 or DelItem(2,1,30603,99) ~= 1 then
		return 0;
	end
	VET_201402_TASK:SetTask(VET_201402_TASK.AWARD, 1);
	gf_ModifyExp(1234567890);
	local tFruitAward = {
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
	for i = 1, getn(tFruitAward) do
		gf_AddItemEx2({tFruitAward[i][2],tFruitAward[i][3],tFruitAward[i][4], 12}, tFruitAward[i][1], "Event phu 2 thang 2 nam 2014", "Nhi謒 v� 'Sa Trung Kim'", 0, 1);
	end
	local tAward = {
		{31, 40000, "Vet_201402_70Book()", 1},
		{1, 15550, "Ch譨 Kh鉧 V祅g", {2, 1, 30133, 1}, 0},
		{32, 4000, 6789, 1},
		{1, 15000, "Ma Tinh", {2, 1, 30497, 50}, 0},
		{1, 1, "Thi猲 Th筩h Tinh Th筩h", {2, 1, 1009, 1}, 0},
		{1, 1, "T骾 Thi猲 Th筩h Tinh Th筩h", {2, 1, 3356, 1}, 7 * 24 * 3600},
		{1, 15998, "Qu﹏ C玭g Chng", {2, 1, 9999, 1}, 7 * 24 * 3600},
		{1, 7250, "Qu﹏ C玭g Чi", {2, 1, 9998, 1}, 7 * 24 * 3600},
		{1, 2200, "Qu﹏ C玭g Huy Ho祅g", {2, 1, 9977, 1}, 7 * 24 * 3600},
		--{1, 100, "14级强化卷", {2, 1, 30426, 1}, 7 * 24 * 3600},
		--{1, 500, "15级强化卷", {2, 1, 30427, 1}, 7 * 24 * 3600},
	}
	gf_EventGiveRandAward(tAward, gf_SumRandBase(tAward), 1, "Event phu 2 thang 2 nam 2014", "Nhi謒 v� 'Sa Trung Kim'");
end

function Vet_201402_70Book()
	local tBook = {
		[2] =  {0, 107, 204, "Kim Cang B竧 Ch﹏ Quy觧"},
		[4] =  {0, 107, 205, "Ti襪 Long T辌h Di謙 Ch﹏ Quy觧"},
		[3] =  {0, 107, 206, "V� Tr莕 B� б Ch﹏ Quy觧"},
		[6] =  {0, 107, 207, "Thi猲 La Li猲 Ch﹗ Ch﹏ Quy觧"},
		[8] =  {0, 107, 208, "Nh� � Kim жnh M藅 Ch﹏ Quy觧"},
		[9] =  {0, 107, 209, "B輈h H秈 Tuy謙  Ch﹏ Quy觧"},
		[11] = {0, 107, 210, "H鏽 чn Tr蕁 Nh筩 Ch﹏ Quy觧"},
		[12] = {0, 107, 211, "Qu� Thi猲 Du Long Ch﹏ Quy觧"},
		[14] = {0, 107, 212, "Huy詎 秐h M� Tung Ch﹏ Quy觧"},
		[15] = {0, 107, 213, "Qu﹏ T� Ti謙 Phong Ch﹏ Quy觧"},
		[17] = {0, 107, 214, "Tr蕁 Qu﹏ Phi Long Thng Ch﹏ Quy觧"},
		[18] = {0, 107, 215, "Xuy猲 V﹏ L筩 H錸g Ch﹏ Quy觧"},
		[20] = {0, 107, 216, "Huy襫 Minh Phong Ma Ch﹏ Quy觧"},
		[21] = {0, 107, 217, "Linh C� Huy詎 T� Ch﹏ Quy觧"},
		[23] = {0, 107, 218, "C鰑 Thi猲 Phong L玦 Ch﹏ Quy觧"},
		[29] = {0, 107, 222, "H錸g Tr莕 T髖 M閚g Ch﹏ Quy觧"},
		[30] = {0, 107, 223, "Phong Hoa Thi猲 Di謕 Ch﹏ Quy觧"},
	}
	local nRoute = GetPlayerRoute();
	if not tBook[nRoute] then return 0; end
	gf_AddItemEx2({tBook[nRoute][1],tBook[nRoute][2],tBook[nRoute][3], 1}, tBook[nRoute][4], "Event phu 2 thang 2 nam 2014", "Nhi謒 v� 'Sa Trung Kim'", 0, 1);
end

function Vet_201402_KillNpc1(szName)
	if gf_CheckEventDateEx(VET_201402_ACTIVITYID) ~= 1 then
		return 0;
	end
	if VET_201402_TASK:GetTask(VET_201402_TASK.TASK) ~= 3 then
		return 0;
	end
	if szName == "Sa M筩 H祅h Nh﹏" and VET_201402_TASK:GetTask(VET_201402_TASK.KILL1) < 333 then
		VET_201402_TASK:SetTask(VET_201402_TASK.KILL1, VET_201402_TASK:GetTask(VET_201402_TASK.KILL1) + 1);
		Msg2Player(format("Ti猽 di謙 Sa M筩 H祅h Nh﹏ %d/333", VET_201402_TASK:GetTask(VET_201402_TASK.KILL1)));
	elseif szName == "T莔 B秓 Nh﹏" and VET_201402_TASK:GetTask(VET_201402_TASK.KILL2) < 555 then
		VET_201402_TASK:SetTask(VET_201402_TASK.KILL2, VET_201402_TASK:GetTask(VET_201402_TASK.KILL2) + 1);
		Msg2Player(format("Ti猽 di謙 T莔 B秓 Nh﹏ %d/555", VET_201402_TASK:GetTask(VET_201402_TASK.KILL2)));
	end
	if VET_201402_TASK:GetTask(VET_201402_TASK.KILL1) >= 333 and VET_201402_TASK:GetTask(VET_201402_TASK.KILL2) >= 555 then
		Talk(1,"","дn Dc Vng чng t譵 Dc Th蕋 Th� V�, th豱h gi竜 m藅 thu藅 (196/178)");
		TaskTip("дn Dc Vng чng t譵 Dc Th蕋 Th� V�, th豱h gi竜 m藅 thu藅 (196/178)");
		VET_201402_TASK:SetTask(VET_201402_TASK.TASK, 4);
	end
end

function Vet_201402_KillNpc2(szName)
	if gf_CheckEventDateEx(VET_201402_ACTIVITYID) ~= 1 then
		return 0;
	end
	if VET_201402_TASK:GetTask(VET_201402_TASK.TASK) ~= 5 then
		return 0;
	end
	if szName == "Ngi c﹜" and VET_201402_TASK:GetTask(VET_201402_TASK.KILL3) < 99 then
		VET_201402_TASK:SetTask(VET_201402_TASK.KILL3, VET_201402_TASK:GetTask(VET_201402_TASK.KILL3) + 1);
		Msg2Player(format("Ti猽 di謙 ngi c﹜ %d/99", VET_201402_TASK:GetTask(VET_201402_TASK.KILL3)));
	end
	if VET_201402_TASK:GetTask(VET_201402_TASK.KILL3) >= 99 then
		Talk(1,"","Ho祅 th祅h nhi謒 v�, Thao Xuy課 Kim-trang s鴆 v祅g-gi� kim thu藅 t苙g ngi, quay v� t譵 L璾 Tr骳 玭g  nh薾 thng.");
		Msg2Player("Ho祅 th祅h nhi謒 v�, Thao Xuy課 Kim-trang s鴆 v祅g-gi� kim thu藅 t苙g ngi, quay v� t譵 L璾 Tr骳 玭g  nh薾 thng.");
		VET_201402_TASK:SetTask(VET_201402_TASK.TASK, 6);
	end
end