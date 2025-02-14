--天阴精力箱
--消耗20点精力打开，打开后不消失，每人每关可以开启一次
Include("\\script\\lib\\globalfunctions.lua")
Include("\\script\\missions\\dixuangong\\mission_head.lua")
Include("\\settings\\static_script\\vip_feedback_system\\yinjuan_api.lua")

-- S� ki謓
Include("\\settings\\static_script\\cheat\\event_init.lua");

function main()
	Say("Ngi x竎 nh ti猽 hao 20 甶觤 Tinh L鵦  m� B秓 Rng Thi猲  Tinh L鵦 kh玭g?", 2, "X竎 nh m�/ensure_openBox", "T筰 h� ch� xem qua th玦/do_nothing");
end

tJingLiAward = {
	{1, 600, "M秐h Thi猲 M玭", {2, 1, 30410, 1, 4}, 0},
	--{1, 200, "天门碎片", {2, 1, 30410, 2, 4}, 0},
	--{1, 100, "天门碎片", {2, 1, 30410, 4, 4}, 0},
	{31, 1000, "rand_start_equip()", 1},
	{1, 600, "Thi誸 Tinh c蕄 2", {2, 1, 30534, 1, 4}, 0},
	{1, 200, "Thi誸 Tinh c蕄 3", {2, 1, 30535, 1, 4}, 0},
	{1, 100, "B� Ng﹏ To秐", {2, 1, 30538, 1, 4}, 0},
	{1, 100, "B� Ng﹏ Ch飝", {2, 1, 30539, 1, 4}, 0},
	{1, 500, "B╪g Tinh Th筩h", {2, 1, 30554, 1, 4}, 0},
	{1, 250, "M秐h Thi猲 th筩h", {2, 2, 7, 1, 4}, 0},
	{1, 525, "Thi猲 th筩h", {2, 2, 8, 1, 4}, 0},
	{1, 25, "Thi猲 Th筩h Tinh Th筩h", {2, 1, 1009, 1, 4}, 0, 0, 0, 1},
	{1, 300, "Linh Th筩h Nguy猲 Th筩h c蕄 4", {2, 1, 30416, 1, 4}, 0},
	{1, 200, "Linh Th筩h Nguy猲 Th筩h c蕄 5", {2, 1, 30417, 1, 4}, 0},
	{1, 100, "Linh Th筩h Nguy猲 Th筩h c蕄 6", {2, 1, 30418, 1, 4}, 0, 0, 0, 1},
	{31, 800, "api_daily_limit_award_yinquan(10,0)", 1},
	{31, 200, "api_daily_limit_award_yinquan(20,0)", 1},
	{31, 100, "api_daily_limit_award_yinquan(100,0)", 1},
	{1, 500, "C蕄 2 T葃 T﹎ Th筩h", {2, 1, 30522, 1, 4}, 0},
	{1, 500, "C蕄 2 Luy謓 L� Thi誸", {2, 1, 30528, 1, 4}, 0},
	{1, 100, "C蕄 3 T葃 T﹎ Th筩h", {2, 1, 30523, 1, 4}, 0, 0, 0, 1},
	{1, 100, "C蕄 3 Luy謓 L� Thi誸", {2, 1, 30529, 1, 4}, 0, 0, 0, 1},
	{1, 200, "Ng� Hoa T� Nguy猲 T竛 (s鴆 m筺h)", {1, 0, 261, 1, 1}, 0},
	{1, 200, "Ng� Hoa T� Nguy猲 T竛 (n閕 c玭g)", {1, 0, 262, 1, 1}, 0},
	{1, 200, "Ng� Hoa T� Nguy猲 T竛 (g﹏ c鑤)", {1, 0, 263, 1, 1}, 0},
	{1, 200, "Ng� Hoa T� Nguy猲 T竛 (th﹏ ph竝)", {1, 0, 264, 1, 1}, 0},
	{1, 200, "Ng� Hoa T� Nguy猲 T竛 (nhanh nh裯)", {1, 0, 265, 1, 1}, 0},
	{1, 600, "H綾 Ng鋍 筺 T鬰 Cao", {1, 0, 6, 1, 4}, 0},
	{1, 600, "Sinh Sinh H鉧 T竛", {1, 0, 16, 1, 4}, 0},
	{1, 600, "V筺 V藅 Quy Nguy猲 Кn", {1, 0, 11, 1, 4}, 0},
	{1, 400, "C鰑 chuy觧 h錳 h錸 n", {1, 0, 32, 1, 4}, 0},
}
function ensure_openBox()
	local nTeamIndex = MV_IS_OPENED_BOX_BEGIN + getIndexAtTeam();
	if GetMissionV(nTeamIndex) ~= 0 then
		Say("Ngi  m� B秓 Rng Thi猲  Tinh L鵦 r錳, kh玭g th� m� l筰", 0);
		return 0;
	end
	if GetFreeItemRoom() < 1 then
		Talk(1,"","Kh玭g gian h祅h trang kh玭g ");
		return 0
	end
	local nRet1, nRet2 = ModifyEnergy(-20, 1);
	if -1 ~= nRet1 then
		local nRandIndex = gf_EventGiveRandAward(tJingLiAward, gf_SumRandBase(tJingLiAward), 1, "мa Huy襫 Cung", "M� Rng мa Huy襫 Cung Thi猲  Tinh L鵦");
		SetMissionV(nTeamIndex, 1);
		--精力宝箱开启次数统计
		AddRuntimeStat(1,10,0,1);
		--统计道具
		if tJingLiAward[nRandIndex] then
			if tJingLiAward[nRandIndex][3] == "C蕄 3 Luy謓 L� Thi誸" then
				AddRuntimeStat(1,16,0,tJingLiAward[nRandIndex][4][4]);
			elseif tJingLiAward[nRandIndex][3] == "C蕄 3 T葃 T﹎ Th筩h" then
				AddRuntimeStat(1,17,0,tJingLiAward[nRandIndex][4][4]);
			elseif tJingLiAward[nRandIndex][3] == "B� Ng﹏ To秐" then
				AddRuntimeStat(1,18,0,tJingLiAward[nRandIndex][4][4]);
			elseif tJingLiAward[nRandIndex][3] == "B� Ng﹏ Ch飝" then
				AddRuntimeStat(1,19,0,tJingLiAward[nRandIndex][4][4]);
			end
		end
		EventAddPhoBan(50);
	else
		Say("Tinh L鵦 kh玭g , kh玭g th� m� Rng Thi猲  Tinh L鵦.",0);	
	end
end

function do_nothing()
--do nothing
end

function getIndexAtTeam()
	for i = 1, GetTeamSize() do
		if PlayerIndex == GetTeamMember(i) then
			return i - 1;
		end
	end	
end

function rand_start_equip()
	local tAward = {
		{1, 7000, "竜 Cho祅g T筼 B�", {0, 152, 1, 1, 4}, 0},
		{1, 2500, "竜 Cho祅g C萴 筺", {0, 152, 2, 1, 4}, 0},
		{1, 380, "竜 Cho祅g H醓 V﹏", {0, 152, 3, 1, 4}, 0},
		{1, 20, "竜 Cho祅g Ng� H祅h Kim Ch�", {0, 152, 4, 1, 4}, 0, 0, 0, 1},
		{1, 20, "竜 Cho祅g Ng� H祅h M閏 Ch�", {0, 152, 5, 1, 4}, 0, 0, 0, 1},
		{1, 20, "竜 Cho祅g Ng� H祅h Th駓 Ch�", {0, 152, 6, 1, 4}, 0, 0, 0, 1},
		{1, 20, "竜 Cho祅g Ng� H祅h H醓 Ch�", {0, 152, 7, 1, 4}, 0, 0, 0, 1},
		{1, 20, "竜 Cho祅g Ng� H祅h Th� Ch�", {0, 152, 8, 1, 4}, 0, 0, 0, 1},
		{1, 20, "竜 Cho祅g Ng� H祅h  Ch�", {0, 152, 9, 1, 4}, 0, 0, 0, 1},
	}
	gf_EventGiveRandAward(tAward, gf_SumRandBase(tAward), 1, "мa Huy襫 Cung", "M� Rng мa Huy襫 Cung Thi猲  Tinh L鵦");
end