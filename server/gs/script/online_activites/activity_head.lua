Include("\\script\\lib\\define.lua")
Include("\\script\\task_access_code_def.lua")
Include("\\script\\lib\\talktmp.lua")
Include("\\script\\meridian\\meridian_script_api.lua")
Include("\\script\\online\\zgc_public_fun.lua")
Include("\\script\\misc\\taskmanager.lua") 
Include("\\script\\lib\\globalfunctions.lua")

--获得nLv等级的宠物技能书
function ahf_GetPetBook(nLv)
	if not nLv then return 0; end
	local nLevel = tonumber(nLv)
	if nLevel < 1 or nLevel > 4 then return 0; end
	local T_Pet_Book = {
			{1, 6, format("C蕄 %d Ch﹏ Kh� H� Th�", nLevel), {2, 150,	1 +nLevel-1, 1}, 0},
			{1, 6, format("C蕄 %d 輈h Th� Di猲 Dng", nLevel), {2, 150,	5 +nLevel-1, 1}, 0},
			{1, 6, format("C蕄 %d Cng Th﹏ B� Th�", nLevel), {2, 150,	9 +nLevel-1, 1}, 0},
			{1, 6, format("C蕄 %d  Phong Th鵦 C鑤", nLevel), {2, 150,	13+nLevel-1, 1}, 0},
			{1, 6, format("C蕄 %d Huy襫 V� V� Song", nLevel), {2, 150,	17+nLevel-1, 1}, 0},
			{1, 7, format("C蕄 %d Ng� H祅h V� Tng", nLevel), {2, 150,	21+nLevel-1, 1}, 0},
			{1, 7, format(" C蕄 %d Kim Linh Ph� Th�", nLevel), {2, 150,	25+nLevel-1, 1}, 0},
			{1, 7, format("C蕄 %d M閏 Linh Ph� Th�", nLevel), {2, 150,	29+nLevel-1, 1}, 0},
			{1, 7, format("C蕄 %d Th駓 Linh Ph� Th�", nLevel), {2, 150,	33+nLevel-1, 1}, 0},
			{1, 7, format("C蕄 %d H醓 Linh Ph� Th�", nLevel), {2, 150,	37+nLevel-1, 1}, 0},
			{1, 7, format("C蕄 %d Th� Linh Ph� Th�", nLevel), {2, 150,	41+nLevel-1, 1}, 0},
			{1, 7, format("C蕄 %d Ph� Kh玭g Tr秏 秐h", nLevel), {2, 150,	45+nLevel-1, 1}, 0},
			{1, 7, format("C蕄 %d S竧 Thng Gia Th﹎", nLevel), {2, 150,	49+nLevel-1, 1}, 0},
			{1, 7, format("C蕄 %d Khinh Linh T蕁 T藅", nLevel), {2, 150,	53+nLevel-1, 1}, 0},
			{1, 7, format("C蕄 %d V� H譶h Chi C�", nLevel), {2, 150,	57+nLevel-1, 1}, 0}, 
	}
	gf_EventGiveRandAward(T_Pet_Book, gf_SumRandBase(T_Pet_Book), 1, "ACTIVITY_HEAD", format("C蕄 %d S竎h K� N╪g B筺 уng H祅h",nLevel));
end

--给1类随机水果(数量nNum)
function ahf_GetAFruits(nNum)
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
	local nRand = random(getn(tAward));
	if GetFreeItemRoom() > 0 then
		gf_AddItemEx({tAward[nRand][2], tAward[nRand][3], tAward[nRand][4], nNum or 1}, tAward[nRand][1]);
	end
end

--获得n类每类1个水果
function ahf_GetNFruits(nNum)
	if not nNum then return 0; end
	for i = 1, nNum do
		ahf_GetAFruits()
	end
end

--70级高级秘籍
function ahf_Get70GaojiMiji(bIsByRoute, nNum, bIsBand)
	if not nNum or nNum <= 0 then
		return
	end
	bIsBand = bIsBand or 4
	local tBook = {
		[2] =  {0, 107, 166, "Kim Cang B竧 Nh� Kinh"},
		[4] =  {0, 107, 167, "Ti襪 Long T辌h Di謙 Kinh"},
		[3] =  {0, 107, 168, "V� Tr莕 B� б Kinh"},
		[6] =  {0, 107, 169, "Thi猲 La Li猲 Ch﹗ L鬰"},
		[8] =  {0, 107, 170, "Nh� � Kim жnh M藅 T辌h"},
		[9] =  {0, 107, 171, "B輈h H秈 Tuy謙  Ph�"},
		[11] = {0, 107, 172, "H鏽 чn Tr蕁 Nh筩 M藅 T辌h"},
		[12] = {0, 107, 173, "Qu� Thi猲 Du Long M藅 T辌h"},
		[14] = {0, 107, 174, "Huy詎 秐h M� Tung M藅 T辌h"},
		[15] = {0, 107, 175, "Qu﹏ T� Ti謙 Phong M藅 T辌h"},
		[17] = {0, 107, 176, "Tr蕁 Qu﹏ Phi Long Thng Ph�"},
		[18] = {0, 107, 177, "Xuy猲 V﹏ L筩 H錸g M藅 T辌h"},
		[20] = {0, 107, 178, "U Minh Phong Ma L鬰"},
		[21] = {0, 107, 179, "Linh C� Huy詎 T� L鬰"},
		[23] = {0, 107, 198, "C鰑 Thi猲 Phong L玦 Quy誸"},
		[29] = {0, 107, 202, "H錸g Tr莕 T髖 M閚g Ph�"},
		[30] = {0, 107, 203, "Phong Hoa Thi猲 Di謕 Ph�"},
	}
	local nIndex = 0
	if bIsByRoute and bIsByRoute == 1 then
		nIndex = GetPlayerRoute();
	else
		local tRoute = {2,3,4,6,8,9,11,12,14,15,17,18,20,21,23,29,30}
		nIndex = tRoute[random(getn(tRoute))]
	end
	if not tBook[nIndex] then return 0; end
	gf_AddItemEx2({tBook[nIndex][1],tBook[nIndex][2],tBook[nIndex][3], nNum, bIsBand}, tBook[nIndex][4], "ACTIVITY_HEAD", "M藅 Tich 70 Cao C蕄", 0, 1);
end

function ahf_GetFyWeapon()
	local VET_FY_WEAPON = {
		{1, 675, "Ph� Y猲 產o", {0, 3, 6001, 1, 1, -1, -1, -1, -1, -1, -1}},
		{1, 675, "Ph� Y猲 c玭", {0, 5, 6002, 1, 1, -1, -1, -1, -1, -1, -1}},
		{1, 675, "Ph� Y猲 trng", {0, 8, 6003, 1, 1, -1, -1, -1, -1, -1, -1}},
		{1, 675, "H祄 Y猲 th�", {0, 0, 6004, 1, 1, -1, -1, -1, -1, -1, -1}},
		{1, 675, "T祅g Y猲 ch﹎", {0, 1, 6005, 1, 1, -1, -1, -1, -1, -1, -1}},
		{1, 675, "Phi Y猲 ki誱", {0, 2, 6006, 1, 1, -1, -1, -1, -1, -1, -1}},
		{1, 675, "V薾 Y猲 c莔", {0, 10, 6007, 1, 1, -1, -1, -1, -1, -1, -1}},
		{1, 675, "V﹏ Y猲 th�", {0, 0, 6008, 1, 1, -1, -1, -1, -1, -1, -1}},
		{1, 675, "L璾 Y猲 c玭", {0, 5, 6009, 1, 1, -1, -1, -1, -1, -1, -1}},
		{1, 675, "Huy襫 Y猲 ki誱", {0, 2, 6010, 1, 1, -1, -1, -1, -1, -1, -1}},
		{1, 675, "V� Y猲 b髏", {0, 9, 6011, 1, 1, -1, -1, -1, -1, -1, -1}},
		{1, 675, "H� Ti猰 Thng", {0, 6, 6012, 1, 1, -1, -1, -1, -1, -1, -1}},
		{1, 675, "H祅h Y猲 Cung", {0, 4, 6013, 1, 1, -1, -1, -1, -1, -1, -1}},
		{1, 625, "Tr鋍 Y猲 nh蒼", {0, 7, 6014, 1, 1, -1, -1, -1, -1, -1, -1}},
		{1, 600, "Y猽 Y猲 tr秓", {0, 11, 6015, 1, 1, -1, -1, -1, -1, -1, -1}}
	} 
	gf_EventGiveRandAward(VET_FY_WEAPON,10000,1, "ACTIVITY_HEAD")
end

function ahf_GiveShimenCloth9()
	--Faction Cloth 9
	local VET_FACTION_CLOTH_9 = {
		{1, 20, "V� фng La S竧 Tr蕀 Huy誸 Y", {0, 100, 2131, 1, 1, -1, -1, -1, -1, -1, -1}},
		{1, 20, "V� фng La S竧 Tr蕀 Huy誸 Y", {0, 100, 2132, 1, 1, -1, -1, -1, -1, -1, -1}},
		{1, 20, "V� фng La S竧 Tr蕀 Huy誸 Y", {0, 100, 2133, 1, 1, -1, -1, -1, -1, -1, -1}},
		{1, 20, "V� фng La S竧 Tr蕀 Huy誸 Y", {0, 100, 2134, 1, 1, -1, -1, -1, -1, -1, -1}},
		{1, 20, "Thi猲 Long B竧 B� Kh秈 Gi竝", {0, 100, 231, 1, 1, -1, -1, -1, -1, -1, -1}},
		{1, 20, "Thi猲 Long B竧 B� Kh秈 Gi竝", {0, 100, 232, 1, 1, -1, -1, -1, -1, -1, -1}},
		{1, 20, "V� Lng Ph竝 T玭 Thi襫 мnh B祇", {0, 100, 331, 1, 1, -1, -1, -1, -1, -1, -1}},
		{1, 20, "V� Lng Ph竝 T玭 Thi襫 мnh B祇", {0, 100, 332, 1, 1, -1, -1, -1, -1, -1, -1}},
		{1, 20, "B竧 B秓 La H竛 Чi Th鮝 Kh秈 Gi竝 ", {0, 100, 431, 1, 1, -1, -1, -1, -1, -1, -1}},
		{1, 20, "B竧 B秓 La H竛 Чi Th鮝 Kh秈 Gi竝 ", {0, 100, 432, 1, 1, -1, -1, -1, -1, -1, -1}},
		{1, 20, "Thi猲 C� S� Gi� Th莕 Tri謚 C﹏", {0, 100, 631, 1, 1, -1, -1, -1, -1, -1, -1}},
		{1, 20, "Thi猲 C� S� Gi� Th莕 Tri謚 C﹏", {0, 100, 632, 1, 1, -1, -1, -1, -1, -1, -1}},
		{1, 20, "Thi猲 C� S� Gi� Th莕 Tri謚 C﹏", {0, 100, 633, 1, 1, -1, -1, -1, -1, -1, -1}},
		{1, 20, "Thi猲 C� S� Gi� Th莕 Tri謚 C﹏", {0, 100, 634, 1, 1, -1, -1, -1, -1, -1, -1}},
		{1, 20, "B筩h Li猲 Ti猲 T� B秓 萵 Y", {0, 100, 831, 1, 1, -1, -1, -1, -1, -1, -1}},
		{1, 20, "B筩h Li猲 Ti猲 T� B秓 萵 Y", {0, 100, 832, 1, 1, -1, -1, -1, -1, -1, -1}},
		{1, 20, "Ng鋍 V薾 Ti猲 T� Huy襫 H錸 Y", {0, 100, 931, 1, 1, -1, -1, -1, -1, -1, -1}},
		{1, 20, "Ng鋍 V薾 Ti猲 T� Huy襫 H錸 Y", {0, 100, 932, 1, 1, -1, -1, -1, -1, -1, -1}},
		{1, 20, "Long u Th莕 C竔 Щng V﹏ Y", {0, 100, 1131, 1, 1, -1, -1, -1, -1, -1, -1}},
		{1, 20, "Long u Th莕 C竔 Щng V﹏ Y", {0, 100, 1132, 1, 1, -1, -1, -1, -1, -1, -1}},
		{1, 20, "Long u Th莕 C竔 Щng V﹏ Y", {0, 100, 1133, 1, 1, -1, -1, -1, -1, -1, -1}},
		{1, 20, "Long u Th莕 C竔 Щng V﹏ Y", {0, 100, 1134, 1, 1, -1, -1, -1, -1, -1, -1}},
		{1, 20, "Kh蕋 Thi猲 Th莕 C竔 V﹏ Du Y", {0, 100, 1231, 1, 1, -1, -1, -1, -1, -1, -1}},
		{1, 20, "Kh蕋 Thi猲 Th莕 C竔 V﹏ Du Y", {0, 100, 1232, 1, 1, -1, -1, -1, -1, -1, -1}},
		{1, 20, "Kh蕋 Thi猲 Th莕 C竔 V﹏ Du Y", {0, 100, 1233, 1, 1, -1, -1, -1, -1, -1, -1}},
		{1, 20, "Kh蕋 Thi猲 Th莕 C竔 V﹏ Du Y", {0, 100, 1234, 1, 1, -1, -1, -1, -1, -1, -1}},
		{1, 20, "Chng Kinh Thanh Quang B祇", {0, 100, 1431, 1, 1, -1, -1, -1, -1, -1, -1}},
		{1, 20, "Chng Kinh Thanh Quang B祇", {0, 100, 1432, 1, 1, -1, -1, -1, -1, -1, -1}},
		{1, 20, "Chng Kinh Thanh Quang B祇", {0, 100, 1433, 1, 1, -1, -1, -1, -1, -1, -1}},
		{1, 20, "Chng Kinh Thanh Quang B祇", {0, 100, 1434, 1, 1, -1, -1, -1, -1, -1, -1}},
		{1, 20, "Th竔 蕋 T秐 Nh﹏ H筼 Nhi猲 Ph鬰", {0, 100, 1531, 1, 1, -1, -1, -1, -1, -1, -1}},
		{1, 20, "Th竔 蕋 T秐 Nh﹏ H筼 Nhi猲 Ph鬰", {0, 100, 1532, 1, 1, -1, -1, -1, -1, -1, -1}},
		{1, 20, "Th竔 蕋 T秐 Nh﹏ H筼 Nhi猲 Ph鬰", {0, 100, 1533, 1, 1, -1, -1, -1, -1, -1, -1}},
		{1, 20, "Th竔 蕋 T秐 Nh﹏ H筼 Nhi猲 Ph鬰", {0, 100, 1534, 1, 1, -1, -1, -1, -1, -1, -1}},
		{1, 20, "Long Tng Ngao Kh� Chi課 kh秈", {0, 100, 1731, 1, 1, -1, -1, -1, -1, -1, -1}},
		{1, 20, "Long Tng Ngao Kh� Chi課 kh秈", {0, 100, 1732, 1, 1, -1, -1, -1, -1, -1, -1}},
		{1, 20, "Long Tng Ngao Kh� Chi課 kh秈", {0, 100, 1733, 1, 1, -1, -1, -1, -1, -1, -1}},
		{1, 20, "Long Tng Ngao Kh� Chi課 kh秈", {0, 100, 1734, 1, 1, -1, -1, -1, -1, -1, -1}},
		{1, 30, "H� D鵦 M穘h S� Chi課 kh秈", {0, 100, 1831, 1, 1, -1, -1, -1, -1, -1, -1}},
		{1, 30, "H� D鵦 M穘h S� Chi課 kh秈", {0, 100, 1832, 1, 1, -1, -1, -1, -1, -1, -1}},
		{1, 30, "H� D鵦 M穘h S� Chi課 kh秈", {0, 100, 1833, 1, 1, -1, -1, -1, -1, -1, -1}},
		{1, 30, "H� D鵦 M穘h S� Chi課 kh秈", {0, 100, 1834, 1, 1, -1, -1, -1, -1, -1, -1}},
		{1, 30, "U Minh Qu� S竧 Tu La Huy誸 Y", {0, 100, 2031, 1, 1, -1, -1, -1, -1, -1, -1}},
		{1, 30, "U Minh Qu� S竧 Tu La Huy誸 Y", {0, 100, 2032, 1, 1, -1, -1, -1, -1, -1, -1}},
		{1, 30, "U Minh Qu� S竧 Tu La Huy誸 Y", {0, 100, 2033, 1, 1, -1, -1, -1, -1, -1, -1}},
		{1, 30, "U Minh Qu� S竧 Tu La Huy誸 Y", {0, 100, 2034, 1, 1, -1, -1, -1, -1, -1, -1}}
	} 
	gf_EventGiveRandAward(VET_FACTION_CLOTH_9,10000,1, "ACTIVITY_HEAD")
end
function ahf_GiveShimenWeapon9()
	--Faction Weapon 9
	local VET_FACTION_WEAPON_9 = {
		{1, 20, "V� чng La S竧 Tr萴 Huy誸 Tr秓", {0, 11, 2131, 1, 1, -1, -1, -1, -1, -1, -1}},
		{1, 20, "V� чng La S竧 Tr萴 Huy誸 Tr秓", {0, 11, 2132, 1, 1, -1, -1, -1, -1, -1, -1}},
		{1, 20, "V� чng La S竧 Tr萴 Huy誸 Tr秓", {0, 11, 2133, 1, 1, -1, -1, -1, -1, -1, -1}},
		{1, 20, "V� чng La S竧 Tr萴 Huy誸 Tr秓", {0, 11, 2134, 1, 1, -1, -1, -1, -1, -1, -1}},
		{1, 20, "B竧 B� Thi猲 Long Thi猲 Ch髇g o", {0, 3, 231, 1, 1, -1, -1, -1, -1, -1, -1}},
		{1, 20, "B竧 B� Thi猲 Long Thi猲 Ch髇g o", {0, 3, 232, 1, 1, -1, -1, -1, -1, -1, -1}},
		{1, 20, "B竧 B� Thi猲 Long Thi猲 Ch髇g C玭", {0, 5, 231, 1, 1, -1, -1, -1, -1, -1, -1}},
		{1, 20, "B竧 B� Thi猲 Long Thi猲 Ch髇g C玭", {0, 5, 232, 1, 1, -1, -1, -1, -1, -1, -1}},
		{1, 20, "V� Lng Ph竝 T玭 Thi襫 Trng", {0, 8, 331, 1, 1, -1, -1, -1, -1, -1, -1}},
		{1, 20, "V� Lng Ph竝 T玭 Thi襫 Trng", {0, 8, 332, 1, 1, -1, -1, -1, -1, -1, -1}},
		{1, 20, "B竧 B秓 La H竛 Чi Th鮝 Th�", {0, 0, 431, 1, 1, -1, -1, -1, -1, -1, -1}},
		{1, 20, "B竧 B秓 La H竛 Чi Th鮝 Th�", {0, 0, 432, 1, 1, -1, -1, -1, -1, -1, -1}},
		{1, 20, "Thi猲 C� S� Gi� Th莕 Tri謚 Ch﹎", {0, 1, 631, 1, 1, -1, -1, -1, -1, -1, -1}},
		{1, 20, "Thi猲 C� S� Gi� Th莕 Tri謚 Ch﹎", {0, 1, 632, 1, 1, -1, -1, -1, -1, -1, -1}},
		{1, 20, "Thi猲 C� S� Gi� Th莕 Tri謚 Ch﹎", {0, 1, 633, 1, 1, -1, -1, -1, -1, -1, -1}},
		{1, 20, "Thi猲 C� S� Gi� Th莕 Tri謚 Ch﹎", {0, 1, 634, 1, 1, -1, -1, -1, -1, -1, -1}},
		{1, 20, "B筩h Li猲 Ti猲 T� B秓 U萵 Ki誱", {0, 2, 831, 1, 1, -1, -1, -1, -1, -1, -1}},
		{1, 20, "B筩h Li猲 Ti猲 T� B秓 U萵 Ki誱", {0, 2, 832, 1, 1, -1, -1, -1, -1, -1, -1}},
		{1, 20, "Ng鋍 V薾 Ti猲 T� Huy襫 H錸 C莔", {0, 10, 931, 1, 1, -1, -1, -1, -1, -1, -1}},
		{1, 20, "Ng鋍 V薾 Ti猲 T� Huy襫 H錸 C莔", {0, 10, 932, 1, 1, -1, -1, -1, -1, -1, -1}},
		{1, 20, "Long u Th莕 C竔 Щng V﹏ Th�", {0, 0, 1131, 1, 1, -1, -1, -1, -1, -1, -1}},
		{1, 20, "Long u Th莕 C竔 Щng V﹏ Th�", {0, 0, 1132, 1, 1, -1, -1, -1, -1, -1, -1}},
		{1, 20, "Long u Th莕 C竔 Щng V﹏ Th�", {0, 0, 1133, 1, 1, -1, -1, -1, -1, -1, -1}},
		{1, 20, "Long u Th莕 C竔 Щng V﹏ Th�", {0, 0, 1134, 1, 1, -1, -1, -1, -1, -1, -1}},
		{1, 20, "Kh蕋 Thi猲 Th莕 C竔 V﹏ Du C玭", {0, 5, 1231, 1, 1, -1, -1, -1, -1, -1, -1}},
		{1, 20, "Kh蕋 Thi猲 Th莕 C竔 V﹏ Du C玭", {0, 5, 1232, 1, 1, -1, -1, -1, -1, -1, -1}},
		{1, 20, "Kh蕋 Thi猲 Th莕 C竔 V﹏ Du C玭", {0, 5, 1233, 1, 1, -1, -1, -1, -1, -1, -1}},
		{1, 20, "Kh蕋 Thi猲 Th莕 C竔 V﹏ Du C玭", {0, 5, 1234, 1, 1, -1, -1, -1, -1, -1, -1}},
		{1, 20, "Chng Kinh Thanh Quang Ki誱", {0, 2, 1431, 1, 1, -1, -1, -1, -1, -1, -1}},
		{1, 20, "Chng Kinh Thanh Quang Ki誱", {0, 2, 1432, 1, 1, -1, -1, -1, -1, -1, -1}},
		{1, 20, "Chng Kinh Thanh Quang Ki誱", {0, 2, 1433, 1, 1, -1, -1, -1, -1, -1, -1}},
		{1, 20, "Chng Kinh Thanh Quang Ki誱", {0, 2, 1434, 1, 1, -1, -1, -1, -1, -1, -1}},
		{1, 20, "Th竔 蕋 T秐 Nh﹏ H筼 Nhi猲 B髏", {0, 9, 1531, 1, 1, -1, -1, -1, -1, -1, -1}},
		{1, 20, "Th竔 蕋 T秐 Nh﹏ H筼 Nhi猲 B髏", {0, 9, 1532, 1, 1, -1, -1, -1, -1, -1, -1}},
		{1, 20, "Th竔 蕋 T秐 Nh﹏ H筼 Nhi猲 B髏", {0, 9, 1533, 1, 1, -1, -1, -1, -1, -1, -1}},
		{1, 20, "Th竔 蕋 T秐 Nh﹏ H筼 Nhi猲 B髏", {0, 9, 1534, 1, 1, -1, -1, -1, -1, -1, -1}},
		{1, 20, "Long Tng Tng Qu﹏ Thng", {0, 6, 1731, 1, 1, -1, -1, -1, -1, -1, -1}},
		{1, 20, "Long Tng Tng Qu﹏ Thng", {0, 6, 1732, 1, 1, -1, -1, -1, -1, -1, -1}},
		{1, 20, "Long Tng Tng Qu﹏ Thng", {0, 6, 1733, 1, 1, -1, -1, -1, -1, -1, -1}},
		{1, 20, "Long Tng Tng Qu﹏ Thng", {0, 6, 1734, 1, 1, -1, -1, -1, -1, -1, -1}},
		{1, 20, "H� D鵦 Tng Qu﹏ Cung", {0, 4, 1831, 1, 1, -1, -1, -1, -1, -1, -1}},
		{1, 20, "H� D鵦 Tng Qu﹏ Cung", {0, 4, 1832, 1, 1, -1, -1, -1, -1, -1, -1}},
		{1, 20, "H� D鵦 Tng Qu﹏ Cung", {0, 4, 1833, 1, 1, -1, -1, -1, -1, -1, -1}},
		{1, 20, "H� D鵦 Tng Qu﹏ Cung", {0, 4, 1834, 1, 1, -1, -1, -1, -1, -1, -1}},
		{1, 30, "U Minh Qu� S竧 Tu La Nh蒼", {0, 7, 2031, 1, 1, -1, -1, -1, -1, -1, -1}},
		{1, 30, "U Minh Qu� S竧 Tu La Nh蒼", {0, 7, 2032, 1, 1, -1, -1, -1, -1, -1, -1}},
		{1, 30, "U Minh Qu� S竧 Tu La Nh蒼", {0, 7, 2033, 1, 1, -1, -1, -1, -1, -1, -1}},
		{1, 30, "U Minh Qu� S竧 Tu La Nh蒼", {0, 7, 2034, 1, 1, -1, -1, -1, -1, -1, -1}}
	} 
	gf_EventGiveRandAward(VET_FACTION_WEAPON_9,10000,1, "ACTIVITY_HEAD")
end

--高级真卷
function ahf_GetGaojiZhenjuan(bIsByRoute, nNum, bIsBand)
	if not nNum or nNum <= 0 then
		return
	end
	bIsBand = bIsBand or 4
	local tBook = {
		[2] = {0, 107, 204, "Kim Cang B竧 Nh� Ch﹏ Quy觧 "},
		[3] = {0, 107, 206, "V� Tr莕 B� б Ch﹏ Quy觧"},
		[4] = {0, 107, 205, "Ti襪 Long T骳 Di謙 Ch﹏ Quy觧"},
		[6] = {0, 107, 207, "Thi猲 La Li猲 Ch﹗ Ch﹏ Quy觧"},
		[8] = {0, 107, 208, "Nh� � Kim жnh Ch﹏ Quy觧"},
		[9] = {0, 107, 209, "B輈h H秈 Tuy謙  Ch﹏ Quy觧"},
		[11] = {0, 107, 210, "H鏽 чn Tr蕁 Nh筩 Ch﹏ Quy觧"},
		[12] = {0, 107, 211, "Qu� Thi猲 Du Long Ch﹏ Quy觧"},
		[14] = {0, 107, 212, "Huy襫 秐h M� T玭g Ch﹏ Quy觧"},
		[15] = {0, 107, 213, "Qu﹏ T� ыi Phong Ch﹏ Quy觧"},
		[17] = {0, 107, 214, "Tr蕁 Qu﹏ Phi Long Thng Ch﹏ Quy觧"},
		[18] = {0, 107, 215, "Xuy猲 V﹏ L筩 H錸g Ch﹏ Quy觧"},
		[20] = {0, 107, 216, "Huy襫 Minh Phong Ma Ch﹏ Quy觧"},
		[21] = {0, 107, 217, "Linh C� Huy襫 T� Ch﹏ Quy觧"},
		[23] = {0, 107, 218, "C鰑 Thi猲 Phong L玦 Ch﹏ Quy觧"},
		[29] = {0, 107, 222, "H錸g Tr莕 T髖 M閚g Ch﹏ Quy觧"},
		[30] = {0, 107, 223, "Phong Hoa Thi猲 Di謕 Ch﹏ Quy觧"},	
	}
	local nIndex = 0
	if bIsByRoute and bIsByRoute == 1 then
		nIndex = GetPlayerRoute();
	else
		local tRoute = {2,3,4,6,8,9,11,12,14,15,17,18,20,21,23,29,30}
		nIndex = tRoute[random(getn(tRoute))]
	end
	if not tBook[nIndex] then return 0; end
	gf_AddItemEx2({tBook[nIndex][1],tBook[nIndex][2],tBook[nIndex][3], nNum, bIsBand}, tBook[nIndex][4], "ACTIVITY_HEAD", "Ch﹏ khuy觧 cao c蕄 c蕄 70", 0, 1);
end

--耀杨衣
VET_YAOYANG_CLOTH = {
	[2] = {
		[1] = {{0, 100, 3128, 1, 4, -1, -1, -1, -1, -1, -1}, "Di謚 Dng-ч N筺 T玭 Gi� B祇"},
	  [2] = {{0, 100, 3129, 1, 4, -1, -1, -1, -1, -1, -1}, "Di謚 Dng-ч N筺 T玭 Gi� B祇"},
	},
	[3] = {
		[1] = {{0, 100, 3132, 1, 4, -1, -1, -1, -1, -1, -1}, "Di謚 Dng-ч 竎h T玭 Gi� B祇"},
	  [2] = {{0, 100, 3133, 1, 4, -1, -1, -1, -1, -1, -1}, "Di謚 Dng-ч 竎h T玭 Gi� B祇"},
	},
	[4] = {
		[1] = {{0, 100, 3130, 1, 4, -1, -1, -1, -1, -1, -1}, "Di謚 Dng-ч Ki誴 T玭 Gi� B祇"},
	  [2] = {{0, 100, 3131, 1, 4, -1, -1, -1, -1, -1, -1}, "Di謚 Dng-ч Ki誴 T玭 Gi� B祇"},
	},
	[6] = {
		[1] = {{0, 100, 3134, 1, 4, -1, -1, -1, -1, -1, -1}, "Di謚 Dng-V筺 Ki誴 Th竛h Th� Y"},
		[2] = {{0, 100, 3135, 1, 4, -1, -1, -1, -1, -1, -1}, "Di謚 Dng-V筺 Ki誴 Th竛h Th� Y"},
		[3] = {{0, 100, 3136, 1, 4, -1, -1, -1, -1, -1, -1}, "Di謚 Dng-V筺 Ki誴 Th竛h Th� Y"},
		[4] = {{0, 100, 3137, 1, 4, -1, -1, -1, -1, -1, -1}, "Di謚 Dng-V筺 Ki誴 Th竛h Th� Y"},
	},
	[8] = {
		[3] = {{0, 100, 3138, 1, 4, -1, -1, -1, -1, -1, -1}, "Di謚 Dng-Ph藅 V﹏ Th竛h C� Y"},
		[4] = {{0, 100, 3139, 1, 4, -1, -1, -1, -1, -1, -1}, "Di謚 Dng-Ph藅 V﹏ Th竛h C� Y"},
	},
	[9] = {
		[3] = {{0, 100, 3140, 1, 4, -1, -1, -1, -1, -1, -1}, "Di謚 Dng-Ph藅 Tr莕 Th竛h C� Y"},
		[4] = {{0, 100, 3141, 1, 4, -1, -1, -1, -1, -1, -1}, "Di謚 Dng-Ph藅 Tr莕 Th竛h C� Y"},
	},
	[11] = {
		[1] = {{0, 100, 3142, 1, 4, -1, -1, -1, -1, -1, -1}, "Di謚 Dng-Tr鬰 Ph鬾g Thi猲 C竔 Y"},
		[2] = {{0, 100, 3143, 1, 4, -1, -1, -1, -1, -1, -1}, "Di謚 Dng-Tr鬰 Ph鬾g Thi猲 C竔 Y"},
		[3] = {{0, 100, 3144, 1, 4, -1, -1, -1, -1, -1, -1}, "Di謚 Dng-Tr鬰 Ph鬾g Thi猲 C竔 Y"},
		[4] = {{0, 100, 3145, 1, 4, -1, -1, -1, -1, -1, -1}, "Di謚 Dng-Tr鬰 Ph鬾g Thi猲 C竔 Y"},
	},
	[12] = {
		[1] = {{0, 100, 3146, 1, 4, -1, -1, -1, -1, -1, -1}, "Di謚 Dng-Du Long мa Kh蕋 Y"},
		[2] = {{0, 100, 3147, 1, 4, -1, -1, -1, -1, -1, -1}, "Di謚 Dng-Du Long мa Kh蕋 Y"},
		[3] = {{0, 100, 3148, 1, 4, -1, -1, -1, -1, -1, -1}, "Di謚 Dng-Du Long мa Kh蕋 Y"},
		[4] = {{0, 100, 3149, 1, 4, -1, -1, -1, -1, -1, -1}, "Di謚 Dng-Du Long мa Kh蕋 Y"},
	},
	[14] = {
		[1] = {{0, 100, 3150, 1, 4, -1, -1, -1, -1, -1, -1}, "Di謚 Dng-V� C鵦 Thi猲 T玭 B祇"},
		[2] = {{0, 100, 3151, 1, 4, -1, -1, -1, -1, -1, -1}, "Di謚 Dng-V� C鵦 Thi猲 T玭 B祇"},
		[3] = {{0, 100, 3152, 1, 4, -1, -1, -1, -1, -1, -1}, "Di謚 Dng-V� C鵦 Thi猲 T玭 B祇"},
		[4] = {{0, 100, 3153, 1, 4, -1, -1, -1, -1, -1, -1}, "Di謚 Dng-V� C鵦 Thi猲 T玭 B祇"},
	},
	[15] = {
		[1] = {{0, 100, 3154, 1, 4, -1, -1, -1, -1, -1, -1}, "Di謚 Dng-B輈h L筩 Thi猲 T玭 B祇"},
		[2] = {{0, 100, 3155, 1, 4, -1, -1, -1, -1, -1, -1}, "Di謚 Dng-B輈h L筩 Thi猲 T玭 B祇"},
		[3] = {{0, 100, 3156, 1, 4, -1, -1, -1, -1, -1, -1}, "Di謚 Dng-B輈h L筩 Thi猲 T玭 B祇"},
		[4] = {{0, 100, 3157, 1, 4, -1, -1, -1, -1, -1, -1}, "Di謚 Dng-B輈h L筩 Thi猲 T玭 B祇"},
	},
	[17] = {
		[1] = {{0, 100, 3158, 1, 4, -1, -1, -1, -1, -1, -1}, "Di謚 Dng-C秏 Thi猲 u H錸 Gi竝"},
		[2] = {{0, 100, 3159, 1, 4, -1, -1, -1, -1, -1, -1}, "Di謚 Dng-C秏 Thi猲 u H錸 Gi竝"},
		[3] = {{0, 100, 3160, 1, 4, -1, -1, -1, -1, -1, -1}, "Di謚 Dng-C秏 Thi猲 u H錸 Gi竝"},
		[4] = {{0, 100, 3161, 1, 4, -1, -1, -1, -1, -1, -1}, "Di謚 Dng-C秏 Thi猲 u H錸 Gi竝"},
	},
	[18] = {
		[1] = {{0, 100, 3162, 1, 4, -1, -1, -1, -1, -1, -1}, "Di謚 Dng-мnh Thi猲 Th莕 Ngh� Gi竝"},
		[2] = {{0, 100, 3163, 1, 4, -1, -1, -1, -1, -1, -1}, "Di謚 Dng-мnh Thi猲 Th莕 Ngh� Gi竝"},
		[3] = {{0, 100, 3164, 1, 4, -1, -1, -1, -1, -1, -1}, "Di謚 Dng-мnh Thi猲 Th莕 Ngh� Gi竝"},
		[4] = {{0, 100, 3165, 1, 4, -1, -1, -1, -1, -1, -1}, "Di謚 Dng-мnh Thi猲 Th莕 Ngh� Gi竝"},
	},
	[20] = {
		[1] = {{0, 100, 3166, 1, 4, -1, -1, -1, -1, -1, -1}, "Di謚 Dng-Qu� X骳 T� Th莕 Y"},
		[2] = {{0, 100, 3167, 1, 4, -1, -1, -1, -1, -1, -1}, "Di謚 Dng-Qu� X骳 T� Th莕 Y"},
		[3] = {{0, 100, 3168, 1, 4, -1, -1, -1, -1, -1, -1}, "Di謚 Dng-Qu� X骳 T� Th莕 Y"},
		[4] = {{0, 100, 3169, 1, 4, -1, -1, -1, -1, -1, -1}, "Di謚 Dng-Qu� X骳 T� Th莕 Y"},
	},
	[21] = {
		[1] = {{0, 100, 3170, 1, 4, -1, -1, -1, -1, -1, -1}, "Di謚 Dng-Vu C鑤 чc Vng Y"},
		[2] = {{0, 100, 3171, 1, 4, -1, -1, -1, -1, -1, -1}, "Di謚 Dng-Vu C鑤 чc Vng Y"},
		[3] = {{0, 100, 3172, 1, 4, -1, -1, -1, -1, -1, -1}, "Di謚 Dng-Vu C鑤 чc Vng Y"},
		[4] = {{0, 100, 3173, 1, 4, -1, -1, -1, -1, -1, -1}, "Di謚 Dng-Vu C鑤 чc Vng Y"},
	},
	[23] = {
		[1] = {{0, 100, 3174, 1, 4, -1, -1, -1, -1, -1, -1}, "Di謚 Dng-B蕋 чng Ch﹏ Ti猲 B祇"},
		[2] = {{0, 100, 3175, 1, 4, -1, -1, -1, -1, -1, -1}, "Di謚 Dng-B蕋 чng Ch﹏ Ti猲 B祇"},
	},
	[25] = {
		[1] = {{0, 100, 3176, 1, 4, -1, -1, -1, -1, -1, -1}, "Di謚 Dng-Nh鬰 Huy誸 Cu錸g Chi課 Y"},
		[2] = {{0, 100, 3177, 1, 4, -1, -1, -1, -1, -1, -1}, "Di謚 Dng-Nh鬰 Huy誸 Cu錸g Chi課 Y"},
		[3] = {{0, 100, 3178, 1, 4, -1, -1, -1, -1, -1, -1}, "Di謚 Dng-Nh鬰 Huy誸 Cu錸g Chi課 Y"},
		[4] = {{0, 100, 3179, 1, 4, -1, -1, -1, -1, -1, -1}, "Di謚 Dng-Nh鬰 Huy誸 Cu錸g Chi課 Y"},
	},
	[26] = {
		[1] = {{0, 100, 3180, 1, 4, -1, -1, -1, -1, -1, -1}, "Di謚 Dng-C鰑 Thi猲 Qu� Ph� B祇"},
		[2] = {{0, 100, 3181, 1, 4, -1, -1, -1, -1, -1, -1}, "Di謚 Dng-C鰑 Thi猲 Qu� Ph� B祇"},
		[3] = {{0, 100, 3182, 1, 4, -1, -1, -1, -1, -1, -1}, "Di謚 Dng-C鰑 Thi猲 Qu� Ph� B祇"},
		[4] = {{0, 100, 3183, 1, 4, -1, -1, -1, -1, -1, -1}, "Di謚 Dng-C鰑 Thi猲 Qu� Ph� B祇"},
	},
	[27] = {
		[1] = {{0, 100, 3184, 1, 4, -1, -1, -1, -1, -1, -1}, "Di謚 Dng-Ma 秐h Th莕 T玭g B祇"},
		[2] = {{0, 100, 3185, 1, 4, -1, -1, -1, -1, -1, -1}, "Di謚 Dng-Ma 秐h Th莕 T玭g B祇"},
		[3] = {{0, 100, 3186, 1, 4, -1, -1, -1, -1, -1, -1}, "Di謚 Dng-Ma 秐h Th莕 T玭g B祇"},
		[4] = {{0, 100, 3187, 1, 4, -1, -1, -1, -1, -1, -1}, "Di謚 Dng-Ma 秐h Th莕 T玭g B祇"},
	},
	[29] = {
		[3] = {{0, 100, 3188, 1, 4, -1, -1, -1, -1, -1, -1}, "Di謚 Dng-T� V﹏ Ti猲 T� Y"},
		[4] = {{0, 100, 3189, 1, 4, -1, -1, -1, -1, -1, -1}, "Di謚 Dng-T� V﹏ Ti猲 T� Y"},
	},
	[30] = {
		[3] = {{0, 100, 3190, 1, 4, -1, -1, -1, -1, -1, -1}, "Di謚 Dng-Phi H� Ti猲 T� Y"},
		[4] = {{0, 100, 3191, 1, 4, -1, -1, -1, -1, -1, -1}, "Di謚 Dng-Phi H� Ti猲 T� Y"},
	},
}

--耀杨头
VET_YAOYANG_CAP = {
	[2]  = {
		[1] = {{0, 103, 3128, 1, 4, -1, -1, -1, -1, -1, -1}, "Di謚 Dng-ч N筺 T玭 Gi� M穙"},
		[2] = {{0, 103, 3129, 1, 4, -1, -1, -1, -1, -1, -1}, "Di謚 Dng-ч N筺 T玭 Gi� M穙"},
	},
	[3]  = {                                                                            
		[1] = {{0, 103, 3132, 1, 4, -1, -1, -1, -1, -1, -1}, "Di謚 Dng-ч 竎h T玭 Gi� M穙"},         
		[2] = {{0, 103, 3133, 1, 4, -1, -1, -1, -1, -1, -1}, "Di謚 Dng-ч 竎h T玭 Gi� M穙"},
	}, 
	[4]  = {
		[1] = {{0, 103, 3130, 1, 4, -1, -1, -1, -1, -1, -1}, "Di謚 Dng-ч Ki誴 T玭 Gi� M穙"},
		[2] = {{0, 103, 3131, 1, 4, -1, -1, -1, -1, -1, -1}, "Di謚 Dng-ч Ki誴 T玭 Gi� M穙"},
	},	
	[6]  = {
		[1] = {{0, 103, 3134, 1, 4, -1, -1, -1, -1, -1, -1}, "Di謚 Dng-V筺 Ki誴 Th竛h Th� Qu竛"},
		[2] = {{0, 103, 3135, 1, 4, -1, -1, -1, -1, -1, -1}, "Di謚 Dng-V筺 Ki誴 Th竛h Th� Qu竛"},
		[3] = {{0, 103, 3136, 1, 4, -1, -1, -1, -1, -1, -1}, "Di謚 Dng-V筺 Ki誴 Th竛h Th� Qu竛"},
		[4] = {{0, 103, 3137, 1, 4, -1, -1, -1, -1, -1, -1}, "Di謚 Dng-V筺 Ki誴 Th竛h Th� Qu竛"},
	},
	[8]  = {
		[3] = {{0, 103, 3138, 1, 4, -1, -1, -1, -1, -1, -1}, "Di謚 Dng-Ph藅 V﹏ Th竛h C� Tr﹎"},
		[4] = {{0, 103, 3139, 1, 4, -1, -1, -1, -1, -1, -1}, "Di謚 Dng-Ph藅 V﹏ Th竛h C� Tr﹎"},
	},
	[9]  = {
		[3] = {{0, 103, 3140, 1, 4, -1, -1, -1, -1, -1, -1}, "Di謚 Dng-Ph藅 Tr莕 Th竛h C� Tr﹎"},
		[4] = {{0, 103, 3141, 1, 4, -1, -1, -1, -1, -1, -1}, "Di謚 Dng-Ph藅 Tr莕 Th竛h C� Tr﹎"},
	},
	[11] = {
		[1] = {{0, 103, 3142, 1, 4, -1, -1, -1, -1, -1, -1}, "Di謚 Dng-Tr鬰 Ph鬾g Thi猲 C竔 C﹏"},
		[2] = {{0, 103, 3143, 1, 4, -1, -1, -1, -1, -1, -1}, "Di謚 Dng-Tr鬰 Ph鬾g Thi猲 C竔 C﹏"},
		[3] = {{0, 103, 3144, 1, 4, -1, -1, -1, -1, -1, -1}, "Di謚 Dng-Tr鬰 Ph鬾g Thi猲 C竔 C﹏"},
		[4] = {{0, 103, 3145, 1, 4, -1, -1, -1, -1, -1, -1}, "Di謚 Dng-Tr鬰 Ph鬾g Thi猲 C竔 C﹏"},
	},
	[12] = {
		[1] = {{0, 103, 3146, 1, 4, -1, -1, -1, -1, -1, -1}, "Di謚 Dng-Du Long мa Kh蕋 C﹏"},
		[2] = {{0, 103, 3147, 1, 4, -1, -1, -1, -1, -1, -1}, "Di謚 Dng-Du Long мa Kh蕋 C﹏"},
		[3] = {{0, 103, 3148, 1, 4, -1, -1, -1, -1, -1, -1}, "Di謚 Dng-Du Long мa Kh蕋 C﹏"},
		[4] = {{0, 103, 3149, 1, 4, -1, -1, -1, -1, -1, -1}, "Di謚 Dng-Du Long мa Kh蕋 C﹏"},
	},
	[14] = {
		[1] = {{0, 103, 3150, 1, 4, -1, -1, -1, -1, -1, -1}, "Di謚 Dng-V� C鵦 Thi猲 T玭 Qu竛"},
		[2] = {{0, 103, 3151, 1, 4, -1, -1, -1, -1, -1, -1}, "Di謚 Dng-V� C鵦 Thi猲 T玭 Qu竛"},
		[3] = {{0, 103, 3152, 1, 4, -1, -1, -1, -1, -1, -1}, "Di謚 Dng-V� C鵦 Thi猲 T玭 Qu竛"},
		[4] = {{0, 103, 3153, 1, 4, -1, -1, -1, -1, -1, -1}, "Di謚 Dng-V� C鵦 Thi猲 T玭 Qu竛"},
	},
	[15] = {
		[1] = {{0, 103, 3154, 1, 4, -1, -1, -1, -1, -1, -1}, "Di謚 Dng-B輈h L筩 Thi猲 T玭 Qu竛"},
		[2] = {{0, 103, 3155, 1, 4, -1, -1, -1, -1, -1, -1}, "Di謚 Dng-B輈h L筩 Thi猲 T玭 Qu竛"},
		[3] = {{0, 103, 3156, 1, 4, -1, -1, -1, -1, -1, -1}, "Di謚 Dng-B輈h L筩 Thi猲 T玭 Qu竛"},
		[4] = {{0, 103, 3157, 1, 4, -1, -1, -1, -1, -1, -1}, "Di謚 Dng-B輈h L筩 Thi猲 T玭 Qu竛"},
	},
	[17] = {
		[1] = {{0, 103, 3158, 1, 4, -1, -1, -1, -1, -1, -1}, "Di謚 Dng-C秏 Thi猲 u H錸 Kh玦"},
		[2] = {{0, 103, 3159, 1, 4, -1, -1, -1, -1, -1, -1}, "Di謚 Dng-C秏 Thi猲 u H錸 Kh玦"},
		[3] = {{0, 103, 3160, 1, 4, -1, -1, -1, -1, -1, -1}, "Di謚 Dng-C秏 Thi猲 u H錸 Kh玦"},
		[4] = {{0, 103, 3161, 1, 4, -1, -1, -1, -1, -1, -1}, "Di謚 Dng-C秏 Thi猲 u H錸 Kh玦"},
	},
	[18] = {
		[1] = {{0, 103, 3162, 1, 4, -1, -1, -1, -1, -1, -1}, "Di謚 Dng-мnh Thi猲 Th莕 Ngh� Kh玦"},
		[2] = {{0, 103, 3163, 1, 4, -1, -1, -1, -1, -1, -1}, "Di謚 Dng-мnh Thi猲 Th莕 Ngh� Kh玦"},
		[3] = {{0, 103, 3164, 1, 4, -1, -1, -1, -1, -1, -1}, "Di謚 Dng-мnh Thi猲 Th莕 Ngh� Kh玦"},
		[4] = {{0, 103, 3165, 1, 4, -1, -1, -1, -1, -1, -1}, "Di謚 Dng-мnh Thi猲 Th莕 Ngh� Kh玦"},
	},
	[20] = {
		[1] = {{0, 103, 3166, 1, 4, -1, -1, -1, -1, -1, -1}, "Di謚 Dng-Qu� X骳 T� Th莕 C﹏"},
		[2] = {{0, 103, 3167, 1, 4, -1, -1, -1, -1, -1, -1}, "Di謚 Dng-Qu� X骳 T� Th莕 C﹏"},
		[3] = {{0, 103, 3168, 1, 4, -1, -1, -1, -1, -1, -1}, "Di謚 Dng-Qu� X骳 T� Th莕 C﹏"},
		[4] = {{0, 103, 3169, 1, 4, -1, -1, -1, -1, -1, -1}, "Di謚 Dng-Qu� X骳 T� Th莕 C﹏"},
	},
	[21] = {
		[1] = {{0, 103, 3170, 1, 4, -1, -1, -1, -1, -1, -1}, "Di謚 Dng-Vu C鑤 чc Vng C﹏"},
		[2] = {{0, 103, 3171, 1, 4, -1, -1, -1, -1, -1, -1}, "Di謚 Dng-Vu C鑤 чc Vng C﹏"},
		[3] = {{0, 103, 3172, 1, 4, -1, -1, -1, -1, -1, -1}, "Di謚 Dng-Vu C鑤 чc Vng C﹏"},
		[4] = {{0, 103, 3173, 1, 4, -1, -1, -1, -1, -1, -1}, "Di謚 Dng-Vu C鑤 чc Vng C﹏"},
	},
	[23] = {
		[1] = {{0, 103, 3174, 1, 4, -1, -1, -1, -1, -1, -1}, "Di謚 Dng-B蕋 чng Ch﹏ Ti猲 Qu竛"},
		[2] = {{0, 103, 3175, 1, 4, -1, -1, -1, -1, -1, -1}, "Di謚 Dng-B蕋 чng Ch﹏ Ti猲 Qu竛"},
	},
	[25] = {
		[1] = {{0, 103, 3176, 1, 4, -1, -1, -1, -1, -1, -1}, "Di謚 Dng-Nh鬰 Huy誸 Cu錸g Chi課 C﹏"},
		[2] = {{0, 103, 3177, 1, 4, -1, -1, -1, -1, -1, -1}, "Di謚 Dng-Nh鬰 Huy誸 Cu錸g Chi課 C﹏"},
		[3] = {{0, 103, 3178, 1, 4, -1, -1, -1, -1, -1, -1}, "Di謚 Dng-Nh鬰 Huy誸 Cu錸g Chi課 C﹏"},
		[4] = {{0, 103, 3179, 1, 4, -1, -1, -1, -1, -1, -1}, "Di謚 Dng-Nh鬰 Huy誸 Cu錸g Chi課 C﹏"},
	},
	[26] = {
		[1] = {{0, 103, 3180, 1, 4, -1, -1, -1, -1, -1, -1}, "Di謚 Dng-C鰑 Thi猲 Qu� Ph� Qu竛"},
		[2] = {{0, 103, 3181, 1, 4, -1, -1, -1, -1, -1, -1}, "Di謚 Dng-C鰑 Thi猲 Qu� Ph� Qu竛"},
		[3] = {{0, 103, 3182, 1, 4, -1, -1, -1, -1, -1, -1}, "Di謚 Dng-C鰑 Thi猲 Qu� Ph� Qu竛"},
		[4] = {{0, 103, 3183, 1, 4, -1, -1, -1, -1, -1, -1}, "Di謚 Dng-C鰑 Thi猲 Qu� Ph� Qu竛"},
	},
	[27] = {
		[1] = {{0, 103, 3184, 1, 4, -1, -1, -1, -1, -1, -1}, "Di謚 Dng-Ma 秐h Th莕 T玭g Qu竛"},
		[2] = {{0, 103, 3185, 1, 4, -1, -1, -1, -1, -1, -1}, "Di謚 Dng-Ma 秐h Th莕 T玭g Qu竛"},
		[3] = {{0, 103, 3186, 1, 4, -1, -1, -1, -1, -1, -1}, "Di謚 Dng-Ma 秐h Th莕 T玭g Qu竛"},
		[4] = {{0, 103, 3187, 1, 4, -1, -1, -1, -1, -1, -1}, "Di謚 Dng-Ma 秐h Th莕 T玭g Qu竛"},
	},
	[29] = {
		[3] = {{0, 103, 3188, 1, 4, -1, -1, -1, -1, -1, -1}, "Di謚 Dng-T� V﹏ Ti猲 T� Tr﹎"},
		[4] = {{0, 103, 3189, 1, 4, -1, -1, -1, -1, -1, -1}, "Di謚 Dng-T� V﹏ Ti猲 T� Tr﹎"},
	},
	[30] = {
		[3] = {{0, 103, 3190, 1, 4, -1, -1, -1, -1, -1, -1}, "Di謚 Dng-Phi H� Ti猲 T� Tr﹎"},
		[4] = {{0, 103, 3191, 1, 4, -1, -1, -1, -1, -1, -1}, "Di謚 Dng-Phi H� Ti猲 T� Tr﹎"},
	},
}  

--耀杨裤
VET_YAOYANG_SHOE = {
	[2] = {
	  [1] = {{0, 101, 3128, 1, 4, -1, -1, -1, -1, -1, -1}, "Di謚 Dng-ч N筺 T玭 Gi� Trang"},
		[2] = {{0, 101, 3129, 1, 4, -1, -1, -1, -1, -1, -1}, "Di謚 Dng-ч N筺 T玭 Gi� Trang"},
	},
	[4] = {
		[1] = {{0, 101, 3130, 1, 4, -1, -1, -1, -1, -1, -1}, "Di謚 Dng-ч Ki誴 T玭 Gi� Trang"},
		[2] = {{0, 101, 3131, 1, 4, -1, -1, -1, -1, -1, -1}, "Di謚 Dng-ч Ki誴 T玭 Gi� Trang"},
	},
	[3] = {
		[1] = {{0, 101, 3132, 1, 4, -1, -1, -1, -1, -1, -1}, "Di謚 Dng-ч 竎h T玭 Gi� Trang"},
		[2] = {{0, 101, 3133, 1, 4, -1, -1, -1, -1, -1, -1}, "Di謚 Dng-ч 竎h T玭 Gi� Trang"},
	},
	[6] = {
		[1] = {{0, 101, 3134, 1, 4, -1, -1, -1, -1, -1, -1}, "Di謚 Dng-V筺 Ki誴 Th竛h Th� Trang"},
		[2] = {{0, 101, 3135, 1, 4, -1, -1, -1, -1, -1, -1}, "Di謚 Dng-V筺 Ki誴 Th竛h Th� Trang"},
		[3] = {{0, 101, 3136, 1, 4, -1, -1, -1, -1, -1, -1}, "Di謚 Dng-V筺 Ki誴 Th竛h Th� Trang"},
		[4] = {{0, 101, 3137, 1, 4, -1, -1, -1, -1, -1, -1}, "Di謚 Dng-V筺 Ki誴 Th竛h Th� Trang"},
	},
	[8] = {
		[3] = {{0, 101, 3138, 1, 4, -1, -1, -1, -1, -1, -1}, "Di謚 Dng-Ph藅 V﹏ Th竛h C� Qu莕"},
		[4] = {{0, 101, 3139, 1, 4, -1, -1, -1, -1, -1, -1}, "Di謚 Dng-Ph藅 V﹏ Th竛h C� Qu莕"},
	},
	[9] = {
		[3] = {{0, 101, 3140, 1, 4, -1, -1, -1, -1, -1, -1}, "Di謚 Dng-Ph藅 Tr莕 Th竛h C� Qu莕"},
		[4] = {{0, 101, 3141, 1, 4, -1, -1, -1, -1, -1, -1}, "Di謚 Dng-Ph藅 Tr莕 Th竛h C� Qu莕"},
	},
	[11] = {
		[1] = {{0, 101, 3142, 1, 4, -1, -1, -1, -1, -1, -1}, "Di謚 Dng-Tr鬰 Ph鬾g Thi猲 C竔 Trang"},
		[2] = {{0, 101, 3143, 1, 4, -1, -1, -1, -1, -1, -1}, "Di謚 Dng-Tr鬰 Ph鬾g Thi猲 C竔 Trang"},
		[3] = {{0, 101, 3144, 1, 4, -1, -1, -1, -1, -1, -1}, "Di謚 Dng-Tr鬰 Ph鬾g Thi猲 C竔 Trang"},
		[4] = {{0, 101, 3145, 1, 4, -1, -1, -1, -1, -1, -1}, "Di謚 Dng-Tr鬰 Ph鬾g Thi猲 C竔 Trang"},
	},
	[12] = {
		[1] = {{0, 101, 3146, 1, 4, -1, -1, -1, -1, -1, -1}, "Di謚 Dng-Du Long мa Kh蕋 Trang"},
		[2] = {{0, 101, 3147, 1, 4, -1, -1, -1, -1, -1, -1}, "Di謚 Dng-Du Long мa Kh蕋 Trang"},
		[3] = {{0, 101, 3148, 1, 4, -1, -1, -1, -1, -1, -1}, "Di謚 Dng-Du Long мa Kh蕋 Trang"},
		[4] = {{0, 101, 3149, 1, 4, -1, -1, -1, -1, -1, -1}, "Di謚 Dng-Du Long мa Kh蕋 Trang"},
	},
	[14] = {
		[1] = {{0, 101, 3150, 1, 4, -1, -1, -1, -1, -1, -1}, "Di謚 Dng-V� C鵦 Thi猲 T玭 Trang"},
		[2] = {{0, 101, 3151, 1, 4, -1, -1, -1, -1, -1, -1}, "Di謚 Dng-V� C鵦 Thi猲 T玭 Trang"},
		[3] = {{0, 101, 3152, 1, 4, -1, -1, -1, -1, -1, -1}, "Di謚 Dng-V� C鵦 Thi猲 T玭 Trang"},
		[4] = {{0, 101, 3153, 1, 4, -1, -1, -1, -1, -1, -1}, "Di謚 Dng-V� C鵦 Thi猲 T玭 Trang"},
	},
	[15] = {
		[1] = {{0, 101, 3154, 1, 4, -1, -1, -1, -1, -1, -1}, "Di謚 Dng-B輈h L筩 Thi猲 T玭 Trang"},
		[2] = {{0, 101, 3155, 1, 4, -1, -1, -1, -1, -1, -1}, "Di謚 Dng-B輈h L筩 Thi猲 T玭 Trang"},
		[3] = {{0, 101, 3156, 1, 4, -1, -1, -1, -1, -1, -1}, "Di謚 Dng-B輈h L筩 Thi猲 T玭 Trang"},
		[4] = {{0, 101, 3157, 1, 4, -1, -1, -1, -1, -1, -1}, "Di謚 Dng-B輈h L筩 Thi猲 T玭 Trang"},
	},
	[17] = {
		[1] = {{0, 101, 3158, 1, 4, -1, -1, -1, -1, -1, -1}, "Di謚 Dng-C秏 Thi猲 u H錸 Trang"},
		[2] = {{0, 101, 3159, 1, 4, -1, -1, -1, -1, -1, -1}, "Di謚 Dng-C秏 Thi猲 u H錸 Trang"},
		[3] = {{0, 101, 3160, 1, 4, -1, -1, -1, -1, -1, -1}, "Di謚 Dng-C秏 Thi猲 u H錸 Trang"},
		[4] = {{0, 101, 3161, 1, 4, -1, -1, -1, -1, -1, -1}, "Di謚 Dng-C秏 Thi猲 u H錸 Trang"},
	},
	[18] = {
		[1] = {{0, 101, 3162, 1, 4, -1, -1, -1, -1, -1, -1}, "Di謚 Dng-мnh Thi猲 Th莕 Ngh� Trang"},
		[2] = {{0, 101, 3163, 1, 4, -1, -1, -1, -1, -1, -1}, "Di謚 Dng-мnh Thi猲 Th莕 Ngh� Trang"},
		[3] = {{0, 101, 3164, 1, 4, -1, -1, -1, -1, -1, -1}, "Di謚 Dng-мnh Thi猲 Th莕 Ngh� Trang"},
		[4] = {{0, 101, 3165, 1, 4, -1, -1, -1, -1, -1, -1}, "Di謚 Dng-мnh Thi猲 Th莕 Ngh� Trang"},
	},
	[20] = {
		[1] = {{0, 101, 3166, 1, 4, -1, -1, -1, -1, -1, -1}, "Di謚 Dng-Qu� X骳 T� Th莕 Trang"},
		[2] = {{0, 101, 3167, 1, 4, -1, -1, -1, -1, -1, -1}, "Di謚 Dng-Qu� X骳 T� Th莕 Trang"},
		[3] = {{0, 101, 3168, 1, 4, -1, -1, -1, -1, -1, -1}, "Di謚 Dng-Qu� X骳 T� Th莕 Trang"},
		[4] = {{0, 101, 3169, 1, 4, -1, -1, -1, -1, -1, -1}, "Di謚 Dng-Qu� X骳 T� Th莕 Trang"},
	},
	[21] = {
		[1] = {{0, 101, 3170, 1, 4, -1, -1, -1, -1, -1, -1}, "Di謚 Dng-Vu C鑤 чc Vng Trang"},
		[2] = {{0, 101, 3171, 1, 4, -1, -1, -1, -1, -1, -1}, "Di謚 Dng-Vu C鑤 чc Vng Trang"},
		[3] = {{0, 101, 3172, 1, 4, -1, -1, -1, -1, -1, -1}, "Di謚 Dng-Vu C鑤 чc Vng Trang"},
		[4] = {{0, 101, 3173, 1, 4, -1, -1, -1, -1, -1, -1}, "Di謚 Dng-Vu C鑤 чc Vng Trang"},
	},
	[23] = {
		[1] = {{0, 101, 3174, 1, 4, -1, -1, -1, -1, -1, -1}, "Di謚 Dng-B蕋 чng Ch﹏ Ti猲 Trang"},
		[2] = {{0, 101, 3175, 1, 4, -1, -1, -1, -1, -1, -1}, "Di謚 Dng-B蕋 чng Ch﹏ Ti猲 Trang"},
	},
	[25] = {
		[1] = {{0, 101, 3176, 1, 4, -1, -1, -1, -1, -1, -1}, "Di謚 Dng-Nh鬰 Huy誸 Cu錸g Chi課 Trang"},
		[2] = {{0, 101, 3177, 1, 4, -1, -1, -1, -1, -1, -1}, "Di謚 Dng-Nh鬰 Huy誸 Cu錸g Chi課 Trang"},
		[3] = {{0, 101, 3178, 1, 4, -1, -1, -1, -1, -1, -1}, "Di謚 Dng-Nh鬰 Huy誸 Cu錸g Chi課 Trang"},
		[4] = {{0, 101, 3179, 1, 4, -1, -1, -1, -1, -1, -1}, "Di謚 Dng-Nh鬰 Huy誸 Cu錸g Chi課 Trang"},
	},
	[26] = {
		[1] = {{0, 101, 3180, 1, 4, -1, -1, -1, -1, -1, -1}, "Di謚 Dng-C鰑 Thi猲 Qu� Ph� Trang"},
		[2] = {{0, 101, 3181, 1, 4, -1, -1, -1, -1, -1, -1}, "Di謚 Dng-C鰑 Thi猲 Qu� Ph� Trang"},
		[3] = {{0, 101, 3182, 1, 4, -1, -1, -1, -1, -1, -1}, "Di謚 Dng-C鰑 Thi猲 Qu� Ph� Trang"},
		[4] = {{0, 101, 3183, 1, 4, -1, -1, -1, -1, -1, -1}, "Di謚 Dng-C鰑 Thi猲 Qu� Ph� Trang"},
	},
	[27] = {
		[1] = {{0, 101, 3184, 1, 4, -1, -1, -1, -1, -1, -1}, "Di謚 Dng-Ma 秐h Th莕 T玭g Trang"},
		[2] = {{0, 101, 3185, 1, 4, -1, -1, -1, -1, -1, -1}, "Di謚 Dng-Ma 秐h Th莕 T玭g Trang"},
		[3] = {{0, 101, 3186, 1, 4, -1, -1, -1, -1, -1, -1}, "Di謚 Dng-Ma 秐h Th莕 T玭g Trang"},
		[4] = {{0, 101, 3187, 1, 4, -1, -1, -1, -1, -1, -1}, "Di謚 Dng-Ma 秐h Th莕 T玭g Trang"},
	},
	[29] = {
		[3] = {{0, 101, 3188, 1, 4, -1, -1, -1, -1, -1, -1}, "Di謚 Dng-T� V﹏ Ti猲 T� Qu莕"},
		[4] = {{0, 101, 3189, 1, 4, -1, -1, -1, -1, -1, -1}, "Di謚 Dng-T� V﹏ Ti猲 T� Qu莕"},
	},
	[30] = {
		[3] = {{0, 101, 3190, 1, 4, -1, -1, -1, -1, -1, -1}, "Di謚 Dng-Phi H� Ti猲 T�"},
		[4] = {{0, 101, 3191, 1, 4, -1, -1, -1, -1, -1, -1}, "Di謚 Dng-Phi H� Ti猲 T�"},
	},
}
--耀杨武器
VET_YAOYANG_WEAPON = {
		[2] = {{0, 3,	8992, 1, 4, -1, -1, -1, -1, -1, -1}, "Di謚 Dng-ч N筺 T玭 Gi� Ph藅 o"},														
		[3] = {{0, 8,	8994, 1, 4, -1, -1, -1, -1, -1, -1}, "Di謚 Dng-ч 竎h T玭 Gi� Ph藅 Trng"},	
		[4] = {{0, 0,	8993, 1, 4, -1, -1, -1, -1, -1, -1}, "Di謚 Dng-ч Ki誴 T玭 Gi� Ph藅 Th�"},																
		[6] = {{0, 1,	8995, 1, 4, -1, -1, -1, -1, -1, -1}, "Di謚 Dng-V筺 Ki誴 Th竛h Th� Tr﹎"},																	
		[8] = {{0, 2,	8996, 1, 4, -1, -1, -1, -1, -1, -1}, "Di謚 Dng-Ph藅 V﹏ Th竛h C� Li猲 Ki誱"},																	
		[9] = {{0, 10,	8997, 1, 4, -1, -1, -1, -1, -1, -1}, "Di謚 Dng-Ph藅 Tr莕 Th竛h C� C莔"},																	
		[11] = {{0, 0,	8998, 1, 4, -1, -1, -1, -1, -1, -1}, "Di謚 Dng-Tr鬰 Ph鬾g Thi猲 C竔 Th�"},																	
		[12] = {{0, 5,	8999, 1, 4, -1, -1, -1, -1, -1, -1}, "Di謚 Dng-Du Long мa Kh蕋 C玭"},																	
		[14] = {{0, 2,	9000, 1, 4, -1, -1, -1, -1, -1, -1}, "Di謚 Dng-V� C鵦 Thi猲 T玭 T骳 Ki誱"},																	
		[15] = {{0, 9,	9001, 1, 4, -1, -1, -1, -1, -1, -1}, "Di謚 Dng-B輈h L筩 Thi猲 T玭 B髏"},																	
		[17] = {{0, 6,	9002, 1, 4, -1, -1, -1, -1, -1, -1}, "Di謚 Dng-C秏 Thi猲 u H錸 Thng"},																	
		[18] = {{0, 4,	9003, 1, 4, -1, -1, -1, -1, -1, -1}, "Di謚 Dng-мnh Thi猲 Th莕 Ngh� Cung"},																	
		[20] = {{0, 7,	9004, 1, 4, -1, -1, -1, -1, -1, -1}, "Di謚 Dng-Qu� X骳 T� Th莕 o"},																	
		[21] = {{0, 11,	9005, 1, 4, -1, -1, -1, -1, -1, -1}, "Di謚 Dng-Vu C鑤 чc Vng Tr秓"},																	
		[23] = {{0, 2,	9006, 1, 4, -1, -1, -1, -1, -1, -1}, "Di謚 Dng-B蕋 чng Ch﹏ Ti猲 Ki誱"},																	
		[25] = {{0, 3,	9007, 1, 4, -1, -1, -1, -1, -1, -1}, "Di謚 Dng-Nh鬰 Huy誸 Cu錸g Chi課 o"},																	
		[26] = {{0, 9,	9008, 1, 4, -1, -1, -1, -1, -1, -1}, "Di謚 Dng-C鰑 Thi猲 Qu� Ph� B髏"},																	
		[27] = {{0, 11,	9009, 1, 4, -1, -1, -1, -1, -1, -1}, "Di謚 Dng-Ma 秐h Th莕 T玭g Tr秓"},																	
		[29] = {{0, 13,	9010, 1, 4, -1, -1, -1, -1, -1, -1}, "Di謚 Dng-T� V﹏ Ti猲 T� Phi課"},
		[30] = {{0, 12,	9011, 1, 4, -1, -1, -1, -1, -1, -1}, "Di謚 Dng-Phi H� Ti猲 T�  Lan Ti猽"},
}

--随机给耀杨
function ahf_GetYaoYangRand(nIndex)
	local tAward = {
		VET_YAOYANG_CLOTH,
		VET_YAOYANG_CAP,
		VET_YAOYANG_SHOE,
	}
	nIndex = nIndex or random(getn(tAward))
	if nIndex < 1 or nIndex > getn(tAward) then
		print("UDERROR:ahf_GetYaoYangRand nIndex < 1 or nIndex > getn(tAward)")
		return
	end
	local tSubAward = tAward[nIndex];
	if not tSubAward then 
		WriteLog("[exec] ahf_GetYaoYangRand() failed! not tSubAward")
		return 
	end	
	local tRoute = {2,3,4,6,8,9,11,12,14,15,17,18,20,21,23,25,26,27,29,30}
	local tSub2Award = tSubAward[tRoute[random(getn(tRoute))]];
	if not tSub2Award then 
		WriteLog("[exec] ahf_GetYaoYangRand() failed! not tSub2Award")
		return 
	end
	local tBody = {}
	for k, _ in tSub2Award do
		tinsert(tBody, k)
	end
	if getn(tBody) <= 0 then
		WriteLog("[exec] ahf_GetYaoYangRand() failed! getn(tBody) <= 0")
		return 
	end
	local tRet = tSub2Award[tBody[random(getn(tBody))]];
	if not tRet or getn(tRet) ~= 2 then 
		WriteLog("[exec] ahf_GetYaoYangRand() failed! not tRet or getn(tRet) ~= 2")
		return 
	end
	gf_AddItemEx2(tRet[1], tRet[2], "ACTIVITY_HEAD", "trang b� Di謚 Dng ng蓇 nhi猲", 0, 1);
end

--给耀杨武器
function ahf_GetYaoYangWeaponRand(IsByRoute)
	local nIndex = 1
	local tRoute = {2,3,4,6,8,9,11,12,14,15,17,18,20,21,23,25,26,27,29,30}
	if IsByRoute and IsByRoute == 1 then
		nIndex = GetPlayerRoute()
	else
		nIndex = tRoute[random(getn(tRoute))]
	end
	if not VET_YAOYANG_WEAPON[nIndex] then
		return
	end
	gf_AddItemEx2(VET_YAOYANG_WEAPON[nIndex][1], VET_YAOYANG_WEAPON[nIndex][2], "ACTIVITY_HEAD", "V� kh� Di謚 Dng ng蓇 nhi猲", 0, 1)
end

--按流派体型给耀阳
function ahf_GetYaoYangByRouteBody(tAward)
	if not tAward then return 0; end
	local nRoute = GetPlayerRoute();
	local tRouteList = tAward[nRoute];
	if not tRouteList then
		Talk(1,"","M玭 ph竔 nh﹏ v藅 b蕋 thng, kh玭g th� nh薾 thng!")
		return 0;
	end
	local nBody = GetBody();
	local tBodyList = tRouteList[nBody];
	if not tBodyList or getn(tBodyList) < 2 then
		Talk(1,"","H譶h th� nh﹏ v藅 b蕋 thng, kh玭g th� nh薾 thng!")
		return 0;
	end
	gf_AddItemEx2(tBodyList[1], tBodyList[2], "ACTIVITY_HEAD", "Theo h� ph竔 t苙g trang b� Di謚 Dng", 0, 1);
end

--随机3星金蛇装备
function ahf_GetLevel3JSEquip()
	local tAward = {
		{1, 7, "竜 Cho祅g H醓 V﹏", {0, 152, 3, 1}, 0},
		{1, 5, "竜 Cho祅g Ng� H祅h Kim Ch�", {0, 152, 4, 1}, 0},
		{1, 5, "竜 Cho祅g Ng� H祅h M閏 Ch�", {0, 152, 5, 1}, 0},
		{1, 5, "竜 Cho祅g Ng� H祅h Th駓 Ch�", {0, 152, 6, 1}, 0},
		{1, 5, "竜 Cho祅g Ng� H祅h H醓 Ch�", {0, 152, 7, 1}, 0},
		{1, 5, "竜 Cho祅g Ng� H祅h Th� Ch�", {0, 152, 8, 1}, 0},
		{1, 1, "竜 Cho祅g Ng� H祅h  Ch�", {0, 152, 9, 1}, 0},
		{1, 7, "Huy Chng Ng鋍 Ch�", {0, 153, 3, 1}, 0},
		{1, 5, "Huy Chng Kim Ch� ng� h祅h", {0, 153, 4, 1}, 0},
		{1, 5, "Huy Chng M閏 Ch� ng� h祅h", {0, 153, 5, 1}, 0},
		{1, 5, "Huy Chng Th駓 Ch� ng� h祅h", {0, 153, 6, 1}, 0},
		{1, 5, "Huy Chng H醓 Ch� ng� h祅h", {0, 153, 7, 1}, 0},
		{1, 5, "Huy Chng Th� Ch� ng� h祅h", {0, 153, 8, 1}, 0},
		{1, 1, "Huy Chng  Ch� ng� h祅h", {0, 153, 9, 1}, 0},
		{1, 7, "B� Ch� Cao уng Ngoa", {0, 154, 3, 1}, 0},
		{1, 5, "Chi課 H礽 Kim Ch� ng� h祅h", {0, 154, 4, 1}, 0},
		{1, 5, "Chi課 H礽 M閏 Ch� ng� h祅h", {0, 154, 5, 1}, 0},
		{1, 5, "Chi課 H礽 Th駓 Ch� ng� h祅h", {0, 154, 6, 1}, 0},
		{1, 5, "Chi課 H礽 H醓 Ch� ng� h祅h", {0, 154, 7, 1}, 0},
		{1, 5, "Chi課 H礽 Th� Ch� ng� h祅h", {0, 154, 8, 1}, 0},
		{1, 1, "Chi課 H礽  Ch� ng� h祅h", {0, 154, 9, 1}, 0},
	}
	gf_EventGiveRandAward(tAward, gf_SumRandBase(tAward), 1, "ACTIVITY_HEAD", "Trang b� Kim X� 3 sao")
end

function ahf_GetPet(nLevel)
	local VNG_TASKID = 2539
	local nTaskvalue = floor(mod(GetTask(VNG_TASKID), 10^(2))/(10^(2-1)))
	if nTaskvalue < 1 then
		Msg2Player(1,"","Ch璦 ho祅 th祅h nhi謒 v� Ph鬰 sinh th� c璶g kh玭g th� nh薾 ph莕 thng");
		return
	end
	local nL = tonumber(nLevel);
	local tPet = {
		[1] = {24, 25, 26},
		[2] = {1, 2, 3},
		[3] = {4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15},
		[4] = {16, 17, 18, 19, 12, 21, 22, 23},
	}
	if not tPet[nL] then
		return
	end
	local nIndex = random(getn(tPet[nL]));
	local bRet = AddPet(tPet[nL][nIndex]);
	if bRet and bRet ~= -1 then
		Msg2Player(format("Nh薾 頲 1 th� c璶g c蕄 %d", nL));
	end
end

--战狂衣
VET_ZHANKUANG_CLOTH = {
	[2] = {
		[1] = {{0, 100, 30143, 1, 4, -1, -1, -1, -1, -1, -1}, "Chi課 Cu錸g Thi猲 мa B祇"},
	  [2] = {{0, 100, 30144, 1, 4, -1, -1, -1, -1, -1, -1}, "Chi課 Cu錸g Thi猲 мa B祇"},
	},
	[3] = {
		[1] = {{0, 100, 30147, 1, 4, -1, -1, -1, -1, -1, -1}, "Chi課 Cu錸g Ph� T� B祇"},
	  [2] = {{0, 100, 30148, 1, 4, -1, -1, -1, -1, -1, -1}, "Chi課 Cu錸g Ph� T� B祇"},
	},
	[4] = {
		[1] = {{0, 100, 30145, 1, 4, -1, -1, -1, -1, -1, -1}, "Chi課 Cu錸g Thi猲 T玭 B祇"},
	  [2] = {{0, 100, 30146, 1, 4, -1, -1, -1, -1, -1, -1}, "Chi課 Cu錸g Thi猲 T玭 B祇"},
	},
	[6] = {
		[1] = {{0, 100, 30149, 1, 4, -1, -1, -1, -1, -1, -1}, "Chi課 Cu錸g Tuy謙 M謓h Y"},
		[2] = {{0, 100, 30150, 1, 4, -1, -1, -1, -1, -1, -1}, "Chi課 Cu錸g Tuy謙 M謓h Y"},
		[3] = {{0, 100, 30151, 1, 4, -1, -1, -1, -1, -1, -1}, "Chi課 Cu錸g Tuy謙 M謓h Y"},
		[4] = {{0, 100, 30152, 1, 4, -1, -1, -1, -1, -1, -1}, "Chi課 Cu錸g Tuy謙 M謓h Y"},
	},
	[8] = {
		[3] = {{0, 100, 30153, 1, 4, -1, -1, -1, -1, -1, -1}, "Chi課 Cu錸g B� T竧 Y"},
		[4] = {{0, 100, 30154, 1, 4, -1, -1, -1, -1, -1, -1}, "Chi課 Cu錸g B� T竧 Y"},
	},
	[9] = {
		[3] = {{0, 100, 30155, 1, 4, -1, -1, -1, -1, -1, -1}, "Chi課 Cu錸g L璾 Th駓Y"},
		[4] = {{0, 100, 30156, 1, 4, -1, -1, -1, -1, -1, -1}, "Chi課 Cu錸g L璾 Th駓Y"},
	},
	[11] = {
		[1] = {{0, 100, 30157, 1, 4, -1, -1, -1, -1, -1, -1}, "Chi課 Cu錸g Th莕 Du Y"},
		[2] = {{0, 100, 30158, 1, 4, -1, -1, -1, -1, -1, -1}, "Chi課 Cu錸g Th莕 Du Y"},
		[3] = {{0, 100, 30159, 1, 4, -1, -1, -1, -1, -1, -1}, "Chi課 Cu錸g Th莕 Du Y"},
		[4] = {{0, 100, 30160, 1, 4, -1, -1, -1, -1, -1, -1}, "Chi課 Cu錸g Th莕 Du Y"},
	},
	[12] = {
		[1] = {{0, 100, 30161, 1, 4, -1, -1, -1, -1, -1, -1}, "Chi課 Cu錸g Ti猽 Dao Y"},
		[2] = {{0, 100, 30162, 1, 4, -1, -1, -1, -1, -1, -1}, "Chi課 Cu錸g Ti猽 Dao Y"},
		[3] = {{0, 100, 30163, 1, 4, -1, -1, -1, -1, -1, -1}, "Chi課 Cu錸g Ti猽 Dao Y"},
		[4] = {{0, 100, 30164, 1, 4, -1, -1, -1, -1, -1, -1}, "Chi課 Cu錸g Ti猽 Dao Y"},
	},
	[14] = {
		[1] = {{0, 100, 30165, 1, 4, -1, -1, -1, -1, -1, -1}, "Chi課 Cu錸g V� Vi B祇"},
		[2] = {{0, 100, 30166, 1, 4, -1, -1, -1, -1, -1, -1}, "Chi課 Cu錸g V� Vi B祇"},
		[3] = {{0, 100, 30167, 1, 4, -1, -1, -1, -1, -1, -1}, "Chi課 Cu錸g V� Vi B祇"},
		[4] = {{0, 100, 30168, 1, 4, -1, -1, -1, -1, -1, -1}, "Chi課 Cu錸g V� Vi B祇"},
	},
	[15] = {
		[1] = {{0, 100, 30169, 1, 4, -1, -1, -1, -1, -1, -1}, "Chi課 Cu錸g C祅 Kh玭 B祇"},
		[2] = {{0, 100, 30170, 1, 4, -1, -1, -1, -1, -1, -1}, "Chi課 Cu錸g C祅 Kh玭 B祇"},
		[3] = {{0, 100, 30171, 1, 4, -1, -1, -1, -1, -1, -1}, "Chi課 Cu錸g C祅 Kh玭 B祇"},
		[4] = {{0, 100, 30172, 1, 4, -1, -1, -1, -1, -1, -1}, "Chi課 Cu錸g C祅 Kh玭 B祇"},
	},
	[17] = {
		[1] = {{0, 100, 30173, 1, 4, -1, -1, -1, -1, -1, -1}, "Chi課 Cu錸g Thi猲 Tinh  Gi竝"},
		[2] = {{0, 100, 30174, 1, 4, -1, -1, -1, -1, -1, -1}, "Chi課 Cu錸g Thi猲 Tinh  Gi竝"},
		[3] = {{0, 100, 30175, 1, 4, -1, -1, -1, -1, -1, -1}, "Chi課 Cu錸g Thi猲 Tinh  Gi竝"},
		[4] = {{0, 100, 30176, 1, 4, -1, -1, -1, -1, -1, -1}, "Chi課 Cu錸g Thi猲 Tinh  Gi竝"},
	},
	[18] = {
		[1] = {{0, 100, 30177, 1, 4, -1, -1, -1, -1, -1, -1}, "Chi課 Cu錸g Xuy猲 V﹏ Gi竝"},
		[2] = {{0, 100, 30178, 1, 4, -1, -1, -1, -1, -1, -1}, "Chi課 Cu錸g Xuy猲 V﹏ Gi竝"},
		[3] = {{0, 100, 30179, 1, 4, -1, -1, -1, -1, -1, -1}, "Chi課 Cu錸g Xuy猲 V﹏ Gi竝"},
		[4] = {{0, 100, 30180, 1, 4, -1, -1, -1, -1, -1, -1}, "Chi課 Cu錸g Xuy猲 V﹏ Gi竝"},
	},
	[20] = {
		[1] = {{0, 100, 30181, 1, 4, -1, -1, -1, -1, -1, -1}, "Chi課 Cu錸g Minh T玭 Y"},
		[2] = {{0, 100, 30182, 1, 4, -1, -1, -1, -1, -1, -1}, "Chi課 Cu錸g Minh T玭 Y"},
		[3] = {{0, 100, 30183, 1, 4, -1, -1, -1, -1, -1, -1}, "Chi課 Cu錸g Minh T玭 Y"},
		[4] = {{0, 100, 30184, 1, 4, -1, -1, -1, -1, -1, -1}, "Chi課 Cu錸g Minh T玭 Y"},
	},
	[21] = {
		[1] = {{0, 100, 30185, 1, 4, -1, -1, -1, -1, -1, -1}, "Chi課 Cu錸g C� T﹎ Y"},
		[2] = {{0, 100, 30186, 1, 4, -1, -1, -1, -1, -1, -1}, "Chi課 Cu錸g C� T﹎ Y"},
		[3] = {{0, 100, 30187, 1, 4, -1, -1, -1, -1, -1, -1}, "Chi課 Cu錸g C� T﹎ Y"},
		[4] = {{0, 100, 30188, 1, 4, -1, -1, -1, -1, -1, -1}, "Chi課 Cu錸g C� T﹎ Y"},
	},
	[23] = {
		[1] = {{0, 100, 30189, 1, 4, -1, -1, -1, -1, -1, -1}, "Chi課 Cu錸g Phong L玦 B祇"},
		[2] = {{0, 100, 30190, 1, 4, -1, -1, -1, -1, -1, -1}, "Chi課 Cu錸g Phong L玦 B祇"},
	},
	[25] = {
		[1] = {{0, 100, 30191, 1, 4, -1, -1, -1, -1, -1, -1}, "Chi課 Cu錸g Чi мa Y"},
		[2] = {{0, 100, 30192, 1, 4, -1, -1, -1, -1, -1, -1}, "Chi課 Cu錸g Чi мa Y"},
		[3] = {{0, 100, 30193, 1, 4, -1, -1, -1, -1, -1, -1}, "Chi課 Cu錸g Чi мa Y"},
		[4] = {{0, 100, 30194, 1, 4, -1, -1, -1, -1, -1, -1}, "Chi課 Cu錸g Чi мa Y"},
	},
	[26] = {
		[1] = {{0, 100, 30195, 1, 4, -1, -1, -1, -1, -1, -1}, "Chi課 Cu錸g T髖 M閚g B祇"},
		[2] = {{0, 100, 30196, 1, 4, -1, -1, -1, -1, -1, -1}, "Chi課 Cu錸g T髖 M閚g B祇"},
		[3] = {{0, 100, 30197, 1, 4, -1, -1, -1, -1, -1, -1}, "Chi課 Cu錸g T髖 M閚g B祇"},
		[4] = {{0, 100, 30198, 1, 4, -1, -1, -1, -1, -1, -1}, "Chi課 Cu錸g T髖 M閚g B祇"},
	},
	[27] = {
		[1] = {{0, 100, 30199, 1, 4, -1, -1, -1, -1, -1, -1}, "Chi課 Cu錸g Ma V鵦  B祇"},
		[2] = {{0, 100, 30200, 1, 4, -1, -1, -1, -1, -1, -1}, "Chi課 Cu錸g Ma V鵦  B祇"},
		[3] = {{0, 100, 30201, 1, 4, -1, -1, -1, -1, -1, -1}, "Chi課 Cu錸g Ma V鵦  B祇"},
		[4] = {{0, 100, 30202, 1, 4, -1, -1, -1, -1, -1, -1}, "Chi課 Cu錸g Ma V鵦  B祇"},
	},
	[29] = {
		[3] = {{0, 100, 30203, 1, 4, -1, -1, -1, -1, -1, -1}, "Chi課 Cu錸g Th竛h N�  Y"},
		[4] = {{0, 100, 30204, 1, 4, -1, -1, -1, -1, -1, -1}, "Chi課 Cu錸g Th竛h N�  Y"},
	},
	[30] = {
		[3] = {{0, 100, 30205, 1, 4, -1, -1, -1, -1, -1, -1}, "Chi課 Cu錸g Th竛h Linh Y"},
		[4] = {{0, 100, 30206, 1, 4, -1, -1, -1, -1, -1, -1}, "Chi課 Cu錸g Th竛h Linh Y"},
	},
}

--战狂头
VET_ZHANKUANG_CAP = {
	[2]  = {
		[1] = {{0, 103, 30143, 1, 4, -1, -1, -1, -1, -1, -1}, "Chi課 Cu錸g Thi猲 мa M筼"},
		[2] = {{0, 103, 30144, 1, 4, -1, -1, -1, -1, -1, -1}, "Chi課 Cu錸g Thi猲 мa M筼"},
	},
	[3]  = {                                                                            
		[1] = {{0, 103, 30147, 1, 4, -1, -1, -1, -1, -1, -1}, "Chi課 Cu錸g Ph� T� M筼"},         
		[2] = {{0, 103, 30148, 1, 4, -1, -1, -1, -1, -1, -1}, "Chi課 Cu錸g Ph� T� M筼"},
	}, 
	[4]  = {
		[1] = {{0, 103, 30145, 1, 4, -1, -1, -1, -1, -1, -1}, "Chi課 Cu錸g Thi猲 T玭 M筼"},
		[2] = {{0, 103, 30146, 1, 4, -1, -1, -1, -1, -1, -1}, "Chi課 Cu錸g Thi猲 T玭 M筼"},
	},	
	[6]  = {
		[1] = {{0, 103, 30149, 1, 4, -1, -1, -1, -1, -1, -1}, "Chi課 Cu錸g Tuy謙 M謓h Qu竛"},
		[2] = {{0, 103, 30150, 1, 4, -1, -1, -1, -1, -1, -1}, "Chi課 Cu錸g Tuy謙 M謓h Qu竛"},
		[3] = {{0, 103, 30151, 1, 4, -1, -1, -1, -1, -1, -1}, "Chi課 Cu錸g Tuy謙 M謓h Qu竛"},
		[4] = {{0, 103, 30152, 1, 4, -1, -1, -1, -1, -1, -1}, "Chi課 Cu錸g Tuy謙 M謓h Qu竛"},
	},
	[8]  = {
		[3] = {{0, 103, 30153, 1, 4, -1, -1, -1, -1, -1, -1}, "Chi課 Cu錸g B� T竧 Tr﹎"},
		[4] = {{0, 103, 30154, 1, 4, -1, -1, -1, -1, -1, -1}, "Chi課 Cu錸g B� T竧 Tr﹎"},
	},
	[9]  = {
		[3] = {{0, 103, 30155, 1, 4, -1, -1, -1, -1, -1, -1}, "Chi課 Cu錸g L璾 Th駓 Tr﹎"},
		[4] = {{0, 103, 30156, 1, 4, -1, -1, -1, -1, -1, -1}, "Chi課 Cu錸g L璾 Th駓 Tr﹎"},
	},
	[11] = {
		[1] = {{0, 103, 30157, 1, 4, -1, -1, -1, -1, -1, -1}, "Chi課 Cu錸g Th莕 Du C﹏"},
		[2] = {{0, 103, 30158, 1, 4, -1, -1, -1, -1, -1, -1}, "Chi課 Cu錸g Th莕 Du C﹏"},
		[3] = {{0, 103, 30159, 1, 4, -1, -1, -1, -1, -1, -1}, "Chi課 Cu錸g Th莕 Du C﹏"},
		[4] = {{0, 103, 30160, 1, 4, -1, -1, -1, -1, -1, -1}, "Chi課 Cu錸g Th莕 Du C﹏"},
	},
	[12] = {
		[1] = {{0, 103, 30161, 1, 4, -1, -1, -1, -1, -1, -1}, "Chi課 Cu錸g Ti猽 Dao C﹏"},
		[2] = {{0, 103, 30162, 1, 4, -1, -1, -1, -1, -1, -1}, "Chi課 Cu錸g Ti猽 Dao C﹏"},
		[3] = {{0, 103, 30163, 1, 4, -1, -1, -1, -1, -1, -1}, "Chi課 Cu錸g Ti猽 Dao C﹏"},
		[4] = {{0, 103, 30164, 1, 4, -1, -1, -1, -1, -1, -1}, "Chi課 Cu錸g Ti猽 Dao C﹏"},
	},
	[14] = {
		[1] = {{0, 103, 30165, 1, 4, -1, -1, -1, -1, -1, -1}, "Chi課 Cu錸g V� Vi Qu竛"},
		[2] = {{0, 103, 30166, 1, 4, -1, -1, -1, -1, -1, -1}, "Chi課 Cu錸g V� Vi Qu竛"},
		[3] = {{0, 103, 30167, 1, 4, -1, -1, -1, -1, -1, -1}, "Chi課 Cu錸g V� Vi Qu竛"},
		[4] = {{0, 103, 30168, 1, 4, -1, -1, -1, -1, -1, -1}, "Chi課 Cu錸g V� Vi Qu竛"},
	},
	[15] = {
		[1] = {{0, 103, 30169, 1, 4, -1, -1, -1, -1, -1, -1}, "Chi課 Cu錸g C祅 Kh玭 Qu竛"},
		[2] = {{0, 103, 30170, 1, 4, -1, -1, -1, -1, -1, -1}, "Chi課 Cu錸g C祅 Kh玭 Qu竛"},
		[3] = {{0, 103, 30171, 1, 4, -1, -1, -1, -1, -1, -1}, "Chi課 Cu錸g C祅 Kh玭 Qu竛"},
		[4] = {{0, 103, 30172, 1, 4, -1, -1, -1, -1, -1, -1}, "Chi課 Cu錸g C祅 Kh玭 Qu竛"},
	},
	[17] = {
		[1] = {{0, 103, 30173, 1, 4, -1, -1, -1, -1, -1, -1}, "Chi課 Cu錸g Thi猲 Tinh  Kh玦"},
		[2] = {{0, 103, 30174, 1, 4, -1, -1, -1, -1, -1, -1}, "Chi課 Cu錸g Thi猲 Tinh  Kh玦"},
		[3] = {{0, 103, 30175, 1, 4, -1, -1, -1, -1, -1, -1}, "Chi課 Cu錸g Thi猲 Tinh  Kh玦"},
		[4] = {{0, 103, 30176, 1, 4, -1, -1, -1, -1, -1, -1}, "Chi課 Cu錸g Thi猲 Tinh  Kh玦"},
	},
	[18] = {
		[1] = {{0, 103, 30177, 1, 4, -1, -1, -1, -1, -1, -1}, "Chi課 Cu錸g Xuy猲 V﹏ Kh玦"},
		[2] = {{0, 103, 30178, 1, 4, -1, -1, -1, -1, -1, -1}, "Chi課 Cu錸g Xuy猲 V﹏ Kh玦"},
		[3] = {{0, 103, 30179, 1, 4, -1, -1, -1, -1, -1, -1}, "Chi課 Cu錸g Xuy猲 V﹏ Kh玦"},
		[4] = {{0, 103, 30180, 1, 4, -1, -1, -1, -1, -1, -1}, "Chi課 Cu錸g Xuy猲 V﹏ Kh玦"},
	},
	[20] = {
		[1] = {{0, 103, 30181, 1, 4, -1, -1, -1, -1, -1, -1}, "Chi課 Cu錸g Minh T玭 C﹏"},
		[2] = {{0, 103, 30182, 1, 4, -1, -1, -1, -1, -1, -1}, "Chi課 Cu錸g Minh T玭 C﹏"},
		[3] = {{0, 103, 30183, 1, 4, -1, -1, -1, -1, -1, -1}, "Chi課 Cu錸g Minh T玭 C﹏"},
		[4] = {{0, 103, 30184, 1, 4, -1, -1, -1, -1, -1, -1}, "Chi課 Cu錸g Minh T玭 C﹏"},
	},
	[21] = {
		[1] = {{0, 103, 30185, 1, 4, -1, -1, -1, -1, -1, -1}, "Chi課 Cu錸g C� T﹎ C﹏"},
		[2] = {{0, 103, 30186, 1, 4, -1, -1, -1, -1, -1, -1}, "Chi課 Cu錸g C� T﹎ C﹏"},
		[3] = {{0, 103, 30187, 1, 4, -1, -1, -1, -1, -1, -1}, "Chi課 Cu錸g C� T﹎ C﹏"},
		[4] = {{0, 103, 30188, 1, 4, -1, -1, -1, -1, -1, -1}, "Chi課 Cu錸g C� T﹎ C﹏"},
	},
	[23] = {
		[1] = {{0, 103, 30189, 1, 4, -1, -1, -1, -1, -1, -1}, "Chi課 Cu錸g Phong L玦 Qu竛"},
		[2] = {{0, 103, 30190, 1, 4, -1, -1, -1, -1, -1, -1}, "Chi課 Cu錸g Phong L玦 Qu竛"},
	},
	[25] = {
		[1] = {{0, 103, 30191, 1, 4, -1, -1, -1, -1, -1, -1}, "Chi課 Cu錸g Чi мa C﹏"},
		[2] = {{0, 103, 30192, 1, 4, -1, -1, -1, -1, -1, -1}, "Chi課 Cu錸g Чi мa C﹏"},
		[3] = {{0, 103, 30193, 1, 4, -1, -1, -1, -1, -1, -1}, "Chi課 Cu錸g Чi мa C﹏"},
		[4] = {{0, 103, 30194, 1, 4, -1, -1, -1, -1, -1, -1}, "Chi課 Cu錸g Чi мa C﹏"},
	},
	[26] = {
		[1] = {{0, 103, 30195, 1, 4, -1, -1, -1, -1, -1, -1}, "Chi課 Cu錸g T髖 M閚g Qu竛"},
		[2] = {{0, 103, 30196, 1, 4, -1, -1, -1, -1, -1, -1}, "Chi課 Cu錸g T髖 M閚g Qu竛"},
		[3] = {{0, 103, 30197, 1, 4, -1, -1, -1, -1, -1, -1}, "Chi課 Cu錸g T髖 M閚g Qu竛"},
		[4] = {{0, 103, 30198, 1, 4, -1, -1, -1, -1, -1, -1}, "Chi課 Cu錸g T髖 M閚g Qu竛"},
	},
	[27] = {
		[1] = {{0, 103, 30199, 1, 4, -1, -1, -1, -1, -1, -1}, "Chi課 Cu錸g Ma V鵦  Qu竛"},
		[2] = {{0, 103, 30200, 1, 4, -1, -1, -1, -1, -1, -1}, "Chi課 Cu錸g Ma V鵦  Qu竛"},
		[3] = {{0, 103, 30201, 1, 4, -1, -1, -1, -1, -1, -1}, "Chi課 Cu錸g Ma V鵦  Qu竛"},
		[4] = {{0, 103, 30202, 1, 4, -1, -1, -1, -1, -1, -1}, "Chi課 Cu錸g Ma V鵦  Qu竛"},
	},
	[29] = {
		[3] = {{0, 103, 30203, 1, 4, -1, -1, -1, -1, -1, -1}, "Chi課 Cu錸g Th竛h N�  Tr﹎"},
		[4] = {{0, 103, 30204, 1, 4, -1, -1, -1, -1, -1, -1}, "Chi課 Cu錸g Th竛h N�  Tr﹎"},
	},
	[30] = {
		[3] = {{0, 103, 30205, 1, 4, -1, -1, -1, -1, -1, -1}, "Chi課 Cu錸g Th竛h Linh Tr﹎"},
		[4] = {{0, 103, 30206, 1, 4, -1, -1, -1, -1, -1, -1}, "Chi課 Cu錸g Th竛h Linh Tr﹎"},
	},
}  

--战狂裤
VET_ZHANKUANG_SHOE = {
	[2] = {
	  [1] = {{0, 101, 30143, 1, 4, -1, -1, -1, -1, -1, -1}, "Chi課 Cu錸g Thi猲 мa Trang"},
		[2] = {{0, 101, 30144, 1, 4, -1, -1, -1, -1, -1, -1}, "Chi課 Cu錸g Thi猲 мa Trang"},
	},
	[3] = {
		[1] = {{0, 101, 30147, 1, 4, -1, -1, -1, -1, -1, -1}, "Chi課 Cu錸g Ph� T� Trang"},
		[2] = {{0, 101, 30148, 1, 4, -1, -1, -1, -1, -1, -1}, "Chi課 Cu錸g Ph� T� Trang"},
	},
	[4] = {
		[1] = {{0, 101, 30145, 1, 4, -1, -1, -1, -1, -1, -1}, "Chi課 Cu錸g Thi猲 T玭 Trang"},
		[2] = {{0, 101, 30146, 1, 4, -1, -1, -1, -1, -1, -1}, "Chi課 Cu錸g Thi猲 T玭 Trang"},
	},
	[6] = {
		[1] = {{0, 101, 30149, 1, 4, -1, -1, -1, -1, -1, -1}, "Chi課 Cu錸g Tuy謙 M謓h Trang"},
		[2] = {{0, 101, 30150, 1, 4, -1, -1, -1, -1, -1, -1}, "Chi課 Cu錸g Tuy謙 M謓h Trang"},
		[3] = {{0, 101, 30151, 1, 4, -1, -1, -1, -1, -1, -1}, "Chi課 Cu錸g Tuy謙 M謓h Trang"},
		[4] = {{0, 101, 30152, 1, 4, -1, -1, -1, -1, -1, -1}, "Chi課 Cu錸g Tuy謙 M謓h Trang"},
	},
	[8] = {
		[3] = {{0, 101, 30153, 1, 4, -1, -1, -1, -1, -1, -1}, "Chi課 Cu錸g B� T竧 Kh�"},
		[4] = {{0, 101, 30154, 1, 4, -1, -1, -1, -1, -1, -1}, "Chi課 Cu錸g B� T竧 Kh�"},
	},
	[9] = {
		[3] = {{0, 101, 30155, 1, 4, -1, -1, -1, -1, -1, -1}, "Chi課 Cu錸g L璾 Th駓Kh�"},
		[4] = {{0, 101, 30156, 1, 4, -1, -1, -1, -1, -1, -1}, "Chi課 Cu錸g L璾 Th駓Kh�"},
	},
	[11] = {
		[1] = {{0, 101, 30157, 1, 4, -1, -1, -1, -1, -1, -1}, "Chi課 Cu錸g Th莕 Du Trang"},
		[2] = {{0, 101, 30158, 1, 4, -1, -1, -1, -1, -1, -1}, "Chi課 Cu錸g Th莕 Du Trang"},
		[3] = {{0, 101, 30159, 1, 4, -1, -1, -1, -1, -1, -1}, "Chi課 Cu錸g Th莕 Du Trang"},
		[4] = {{0, 101, 30160, 1, 4, -1, -1, -1, -1, -1, -1}, "Chi課 Cu錸g Th莕 Du Trang"},
	},
	[12] = {
		[1] = {{0, 101, 30161, 1, 4, -1, -1, -1, -1, -1, -1}, "Chi課 Cu錸g Ti猽 Dao Trang"},
		[2] = {{0, 101, 30162, 1, 4, -1, -1, -1, -1, -1, -1}, "Chi課 Cu錸g Ti猽 Dao Trang"},
		[3] = {{0, 101, 30163, 1, 4, -1, -1, -1, -1, -1, -1}, "Chi課 Cu錸g Ti猽 Dao Trang"},
		[4] = {{0, 101, 30164, 1, 4, -1, -1, -1, -1, -1, -1}, "Chi課 Cu錸g Ti猽 Dao Trang"},
	},
	[14] = {
		[1] = {{0, 101, 30165, 1, 4, -1, -1, -1, -1, -1, -1}, "Chi課 Cu錸g V� Vi Trang"},
		[2] = {{0, 101, 30166, 1, 4, -1, -1, -1, -1, -1, -1}, "Chi課 Cu錸g V� Vi Trang"},
		[3] = {{0, 101, 30167, 1, 4, -1, -1, -1, -1, -1, -1}, "Chi課 Cu錸g V� Vi Trang"},
		[4] = {{0, 101, 30168, 1, 4, -1, -1, -1, -1, -1, -1}, "Chi課 Cu錸g V� Vi Trang"},
	},
	[15] = {
		[1] = {{0, 101, 30169, 1, 4, -1, -1, -1, -1, -1, -1}, "Chi課 Cu錸g C祅 Kh玭 Trang"},
		[2] = {{0, 101, 30170, 1, 4, -1, -1, -1, -1, -1, -1}, "Chi課 Cu錸g C祅 Kh玭 Trang"},
		[3] = {{0, 101, 30171, 1, 4, -1, -1, -1, -1, -1, -1}, "Chi課 Cu錸g C祅 Kh玭 Trang"},
		[4] = {{0, 101, 30172, 1, 4, -1, -1, -1, -1, -1, -1}, "Chi課 Cu錸g C祅 Kh玭 Trang"},
	},
	[17] = {
		[1] = {{0, 101, 30173, 1, 4, -1, -1, -1, -1, -1, -1}, "Chi課 Cu錸g Thi猲 Tinh  Trang"},
		[2] = {{0, 101, 30174, 1, 4, -1, -1, -1, -1, -1, -1}, "Chi課 Cu錸g Thi猲 Tinh  Trang"},
		[3] = {{0, 101, 30175, 1, 4, -1, -1, -1, -1, -1, -1}, "Chi課 Cu錸g Thi猲 Tinh  Trang"},
		[4] = {{0, 101, 30176, 1, 4, -1, -1, -1, -1, -1, -1}, "Chi課 Cu錸g Thi猲 Tinh  Trang"},
	},
	[18] = {
		[1] = {{0, 101, 30177, 1, 4, -1, -1, -1, -1, -1, -1}, "Chi課 Cu錸g Xuy猲 V﹏ Trang"},
		[2] = {{0, 101, 30178, 1, 4, -1, -1, -1, -1, -1, -1}, "Chi課 Cu錸g Xuy猲 V﹏ Trang"},
		[3] = {{0, 101, 30179, 1, 4, -1, -1, -1, -1, -1, -1}, "Chi課 Cu錸g Xuy猲 V﹏ Trang"},
		[4] = {{0, 101, 30180, 1, 4, -1, -1, -1, -1, -1, -1}, "Chi課 Cu錸g Xuy猲 V﹏ Trang"},
	},
	[20] = {
		[1] = {{0, 101, 30181, 1, 4, -1, -1, -1, -1, -1, -1}, "Chi課 Cu錸g Minh T玭 Trang"},
		[2] = {{0, 101, 30182, 1, 4, -1, -1, -1, -1, -1, -1}, "Chi課 Cu錸g Minh T玭 Trang"},
		[3] = {{0, 101, 30183, 1, 4, -1, -1, -1, -1, -1, -1}, "Chi課 Cu錸g Minh T玭 Trang"},
		[4] = {{0, 101, 30184, 1, 4, -1, -1, -1, -1, -1, -1}, "Chi課 Cu錸g Minh T玭 Trang"},
	},
	[21] = {
		[1] = {{0, 101, 30185, 1, 4, -1, -1, -1, -1, -1, -1}, "Chi課 Cu錸g C� T﹎ Trang"},
		[2] = {{0, 101, 30186, 1, 4, -1, -1, -1, -1, -1, -1}, "Chi課 Cu錸g C� T﹎ Trang"},
		[3] = {{0, 101, 30187, 1, 4, -1, -1, -1, -1, -1, -1}, "Chi課 Cu錸g C� T﹎ Trang"},
		[4] = {{0, 101, 30188, 1, 4, -1, -1, -1, -1, -1, -1}, "Chi課 Cu錸g C� T﹎ Trang"},
	},
	[23] = {
		[1] = {{0, 101, 30189, 1, 4, -1, -1, -1, -1, -1, -1}, "Chi課 Cu錸g Phong L玦 Trang"},
		[2] = {{0, 101, 30190, 1, 4, -1, -1, -1, -1, -1, -1}, "Chi課 Cu錸g Phong L玦 Trang"},
	},
	[25] = {
		[1] = {{0, 101, 30191, 1, 4, -1, -1, -1, -1, -1, -1}, "Chi課 Cu錸g Чi мa Trang"},
		[2] = {{0, 101, 30192, 1, 4, -1, -1, -1, -1, -1, -1}, "Chi課 Cu錸g Чi мa Trang"},
		[3] = {{0, 101, 30193, 1, 4, -1, -1, -1, -1, -1, -1}, "Chi課 Cu錸g Чi мa Trang"},
		[4] = {{0, 101, 30194, 1, 4, -1, -1, -1, -1, -1, -1}, "Chi課 Cu錸g Чi мa Trang"},
	},
	[26] = {
		[1] = {{0, 101, 30195, 1, 4, -1, -1, -1, -1, -1, -1}, "Chi課 Cu錸g T髖 M閚g Trang"},
		[2] = {{0, 101, 30196, 1, 4, -1, -1, -1, -1, -1, -1}, "Chi課 Cu錸g T髖 M閚g Trang"},
		[3] = {{0, 101, 30197, 1, 4, -1, -1, -1, -1, -1, -1}, "Chi課 Cu錸g T髖 M閚g Trang"},
		[4] = {{0, 101, 30198, 1, 4, -1, -1, -1, -1, -1, -1}, "Chi課 Cu錸g T髖 M閚g Trang"},
	},
	[27] = {
		[1] = {{0, 101, 30199, 1, 4, -1, -1, -1, -1, -1, -1}, "Chi課 Cu錸g Ma V鵦  Trang"},
		[2] = {{0, 101, 30200, 1, 4, -1, -1, -1, -1, -1, -1}, "Chi課 Cu錸g Ma V鵦  Trang"},
		[3] = {{0, 101, 30201, 1, 4, -1, -1, -1, -1, -1, -1}, "Chi課 Cu錸g Ma V鵦  Trang"},
		[4] = {{0, 101, 30202, 1, 4, -1, -1, -1, -1, -1, -1}, "Chi課 Cu錸g Ma V鵦  Trang"},
	},
	[29] = {
		[3] = {{0, 101, 30203, 1, 4, -1, -1, -1, -1, -1, -1}, "Chi課 Cu錸g Th竛h N�  Kh�"},
		[4] = {{0, 101, 30204, 1, 4, -1, -1, -1, -1, -1, -1}, "Chi課 Cu錸g Th竛h N�  Kh�"},
	},
	[30] = {
		[3] = {{0, 101, 30205, 1, 4, -1, -1, -1, -1, -1, -1}, "Chi課 Cu錸g Th竛h Linh Kh�"},
		[4] = {{0, 101, 30206, 1, 4, -1, -1, -1, -1, -1, -1}, "Chi課 Cu錸g Th竛h Linh Kh�"},
	},
}

--战狂裤
VET_ZHANKUANG_WEAPON = {
	[2] = {
        [1]={{0,3,30143,1,4,-1,-1,-1,-1,-1,-1}, "Chi課 Cu錸g B╪g Thi猲 o",1,2},
        [2]={{0,3,30144,1,4,-1,-1,-1,-1,-1,-1}, "Chi課 Cu錸g B╪g Thi猲 o",2,2},
    },
	[3] = {
        [1]={{0,8,30147,1,4,-1,-1,-1,-1,-1,-1}, "Chi課 Cu錸g Thi襫 мnh Trng",1,3},
        [2]={{0,8,30148,1,4,-1,-1,-1,-1,-1,-1}, "Chi課 Cu錸g Thi襫 мnh Trng",2,3},
    },
	[4] = {
        [1]={{0,0,30145,1,4,-1,-1,-1,-1,-1,-1}, "Chi課 Cu錸g Th竛h Chi課 Th�",1,4},
        [2]={{0,0,30146,1,4,-1,-1,-1,-1,-1,-1}, "Chi課 Cu錸g Th竛h Chi課 Th�",2,4},
     },
	[6] = {
        [1]={{0,1,30149,1,4,-1,-1,-1,-1,-1,-1}, "Chi課 Cu錸g 箃 H錸 Ch﹎",1,6},
        [2]={{0,1,30150,1,4,-1,-1,-1,-1,-1,-1}, "Chi課 Cu錸g 箃 H錸 Ch﹎",2,6},
        [3]={{0,1,30151,1,4,-1,-1,-1,-1,-1,-1}, "Chi課 Cu錸g 箃 H錸 Ch﹎",3,6},
        [4]={{0,1,30152,1,4,-1,-1,-1,-1,-1,-1}, "Chi課 Cu錸g 箃 H錸 Ch﹎",4,6},
    },
	[8] = {
        [3]={{0,2,30153,1,4,-1,-1,-1,-1,-1,-1}, "Chi課 Cu錸g Ph藅 Quang Ki誱",3,8},
        [4]={{0,2,30154,1,4,-1,-1,-1,-1,-1,-1}, "Chi課 Cu錸g Ph藅 Quang Ki誱",4,8},
    },
	[9] = {
        [3]={{0,10,30155,1,4,-1,-1,-1,-1,-1,-1}, "Chi課 Cu錸g H� Bang C莔",3,9},
        [4]={{0,10,30156,1,4,-1,-1,-1,-1,-1,-1}, "Chi課 Cu錸g H� Bang C莔",4,9},
    },
	[11] = {
        [1]={{0,0,30157,1,4,-1,-1,-1,-1,-1,-1}, "Chi課 Cu錸g Tr鮪g 竎 Th�",1,11},
        [2]={{0,0,30158,1,4,-1,-1,-1,-1,-1,-1}, "Chi課 Cu錸g Tr鮪g 竎 Th�",2,11},
        [3]={{0,0,30159,1,4,-1,-1,-1,-1,-1,-1}, "Chi課 Cu錸g Tr鮪g 竎 Th�",3,11},
        [4]={{0,0,30160,1,4,-1,-1,-1,-1,-1,-1}, "Chi課 Cu錸g Tr鮪g 竎 Th�",4,11},
    },
	[12] = {
        [1]={{0,5,30161,1,4,-1,-1,-1,-1,-1,-1}, "Chi課 Cu錸g V� C鵦 C玭",1,12},
        [2]={{0,5,30162,1,4,-1,-1,-1,-1,-1,-1}, "Chi課 Cu錸g V� C鵦 C玭",2,12},
        [3]={{0,5,30163,1,4,-1,-1,-1,-1,-1,-1}, "Chi課 Cu錸g V� C鵦 C玭",3,12},
        [4]={{0,5,30164,1,4,-1,-1,-1,-1,-1,-1}, "Chi課 Cu錸g V� C鵦 C玭",4,12},
    },
	[14] = {
        [1]={{0,2,30165,1,4,-1,-1,-1,-1,-1,-1}, "Chi課 Cu錸g Khu Ma Ki誱",1,14},
        [2]={{0,2,30166,1,4,-1,-1,-1,-1,-1,-1}, "Chi課 Cu錸g Khu Ma Ki誱",2,14},
        [3]={{0,2,30167,1,4,-1,-1,-1,-1,-1,-1}, "Chi課 Cu錸g Khu Ma Ki誱",3,14},
        [4]={{0,2,30168,1,4,-1,-1,-1,-1,-1,-1}, "Chi課 Cu錸g Khu Ma Ki誱",4,14},
    },
	[15] = {
        [1]={{0,9,30169,1,4,-1,-1,-1,-1,-1,-1}, "Chi課 Cu錸g Thng Khung B髏",1,15},
        [2]={{0,9,30170,1,4,-1,-1,-1,-1,-1,-1}, "Chi課 Cu錸g Thng Khung B髏",2,15},
        [3]={{0,9,30171,1,4,-1,-1,-1,-1,-1,-1}, "Chi課 Cu錸g Thng Khung B髏",3,15},
        [4]={{0,9,30172,1,4,-1,-1,-1,-1,-1,-1}, "Chi課 Cu錸g Thng Khung B髏",4,15},
    },
	[17] = {
        [1]={{0,6,30173,1,4,-1,-1,-1,-1,-1,-1}, "Chi課 Cu錸g Th莕 K輈h Thng",1,17},
        [2]={{0,6,30174,1,4,-1,-1,-1,-1,-1,-1}, "Chi課 Cu錸g Th莕 K輈h Thng",2,17},
        [3]={{0,6,30175,1,4,-1,-1,-1,-1,-1,-1}, "Chi課 Cu錸g Th莕 K輈h Thng",3,17},
        [4]={{0,6,30176,1,4,-1,-1,-1,-1,-1,-1}, "Chi課 Cu錸g Th莕 K輈h Thng",4,17},
    },
	[18] = {
        [1]={{0,4,30177,1,4,-1,-1,-1,-1,-1,-1}, "Chi課 Cu錸g Xung Thi猲 Cung",1,18},
        [2]={{0,4,30178,1,4,-1,-1,-1,-1,-1,-1}, "Chi課 Cu錸g Xung Thi猲 Cung",2,18},
        [3]={{0,4,30179,1,4,-1,-1,-1,-1,-1,-1}, "Chi課 Cu錸g Xung Thi猲 Cung",3,18},
        [4]={{0,4,30180,1,4,-1,-1,-1,-1,-1,-1}, "Chi課 Cu錸g Xung Thi猲 Cung",4,18},
    },
	[20] = {
        [1]={{0,7,30181,1,4,-1,-1,-1,-1,-1,-1}, "Chi課 Cu錸g Luy謓 Ng鬰 o",1,20},
        [2]={{0,7,30182,1,4,-1,-1,-1,-1,-1,-1}, "Chi課 Cu錸g Luy謓 Ng鬰 o",2,20},
        [3]={{0,7,30183,1,4,-1,-1,-1,-1,-1,-1}, "Chi課 Cu錸g Luy謓 Ng鬰 o",3,20},
        [4]={{0,7,30184,1,4,-1,-1,-1,-1,-1,-1}, "Chi課 Cu錸g Luy謓 Ng鬰 o",4,20},
    },
	[21] = {
        [1]={{0,11,30185,1,4,-1,-1,-1,-1,-1,-1}, "Chi課 Cu錸g Nhi誴 H錸 Tr秓",1,21},
        [2]={{0,11,30186,1,4,-1,-1,-1,-1,-1,-1}, "Chi課 Cu錸g Nhi誴 H錸 Tr秓",2,21},
        [3]={{0,11,30187,1,4,-1,-1,-1,-1,-1,-1}, "Chi課 Cu錸g Nhi誴 H錸 Tr秓",3,21},
        [4]={{0,11,30188,1,4,-1,-1,-1,-1,-1,-1}, "Chi課 Cu錸g Nhi誴 H錸 Tr秓",4,21},
    },
	[23] = {
        [1]={{0,2,30189,1,4,-1,-1,-1,-1,-1,-1}, "Chi課 Cu錸g Thi猲 Ph箃 Ki誱",1,23},
        [2]={{0,2,30190,1,4,-1,-1,-1,-1,-1,-1}, "Chi課 Cu錸g Thi猲 Ph箃 Ki誱",2,23},
    },
	[25] = {
        [1]={{0,3,30191,1,4,-1,-1,-1,-1,-1,-1}, "Chi課 Cu錸g Ch骳 Dung o",1,25},
        [2]={{0,3,30192,1,4,-1,-1,-1,-1,-1,-1}, "Chi課 Cu錸g Ch骳 Dung o",2,25},
        [3]={{0,3,30193,1,4,-1,-1,-1,-1,-1,-1}, "Chi課 Cu錸g Ch骳 Dung o",3,25},
        [4]={{0,3,30194,1,4,-1,-1,-1,-1,-1,-1}, "Chi課 Cu錸g Ch骳 Dung o",4,25},
    },
	[26] = {
        [1]={{0,9,30195,1,4,-1,-1,-1,-1,-1,-1}, "Chi課 Cu錸g T� M謓h B髏",1,26},
        [2]={{0,9,30196,1,4,-1,-1,-1,-1,-1,-1}, "Chi課 Cu錸g T� M謓h B髏",2,26},
        [3]={{0,9,30197,1,4,-1,-1,-1,-1,-1,-1}, "Chi課 Cu錸g T� M謓h B髏",3,26},
        [4]={{0,9,30198,1,4,-1,-1,-1,-1,-1,-1}, "Chi課 Cu錸g T� M謓h B髏",4,26},
    },
	[27] = {
        [1]={{0,11,30199,1,4,-1,-1,-1,-1,-1,-1}, "Chi課 Cu錸g Truy H錸 Tr秓",1,27},
        [2]={{0,11,30200,1,4,-1,-1,-1,-1,-1,-1}, "Chi課 Cu錸g Truy H錸 Tr秓",2,27},
        [3]={{0,11,30201,1,4,-1,-1,-1,-1,-1,-1}, "Chi課 Cu錸g Truy H錸 Tr秓",3,27},
        [4]={{0,11,30202,1,4,-1,-1,-1,-1,-1,-1}, "Chi課 Cu錸g Truy H錸 Tr秓",4,27},
    },
	[29] = {
        [3]={{0,13,30203,1,4,-1,-1,-1,-1,-1,-1}, "Chi課 Cu錸g Phong Linh Phi課",3,29},
        [4]={{0,13,30204,1,4,-1,-1,-1,-1,-1,-1}, "Chi課 Cu錸g Phong Linh Phi課",4,29},
    },
	[30] = {
        [3]={{0,12,30205,1,4,-1,-1,-1,-1,-1,-1}, "Chi課 Cu錸g Kh玭g Minh мch",3,30},
        [4]={{0,12,30206,1,4,-1,-1,-1,-1,-1,-1}, "Chi課 Cu錸g Kh玭g Minh мch",4,30},
    },
}

--按流派体型给装备
function ahf_GetEquipByRouteBody(tAward)
	if not tAward then return 0; end
	local nRoute = GetPlayerRoute();
	local tRouteList = tAward[nRoute];
	if not tRouteList then
		Talk(1,"","M玭 ph竔 nh﹏ v藅 b蕋 thng, kh玭g th� nh薾 thng!")
		return 0;
	end
	local nBody = GetBody();
	local tBodyList = tRouteList[nBody];
	if not tBodyList or getn(tBodyList) < 2 then
		Talk(1,"","H譶h th� nh﹏ v藅 b蕋 thng, kh玭g th� nh薾 thng!")
		return 0;
	end
	gf_AddItemEx2(tBodyList[1], tBodyList[2], "ACTIVITY_HEAD", "ACTIVITY_HEAD", 0, 1);
end
