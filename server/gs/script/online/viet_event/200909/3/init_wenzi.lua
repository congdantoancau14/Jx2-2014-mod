--=============================================
--create by baiyun 2009.8.26
--describe:越南版9月份中秋活动创建蚊子脚本
--=============================================
Include("\\script\\lib\\globalfunctions.lua");
--刷新蚊子的坐标
t_wenzi_sets = {
	[0] = {"T﹜ Bi謓 Kinh", {203, 1522, 3053}},--星期日
	[1] = {"B綾 Ph鬾g Tng", {504, 1363, 3081}},--星期一
	[4] = {"B綾 Tuy襫 Ch﹗", {108, 1459, 3141}},--星期四
	[5] = {"T﹜ Th祅h Й", {301, 1492, 2986}},--星期五
	[6] = {"V﹏ M閚g Tr筩h", {151, 1545, 3011}},--星期六
};

function main()
	local nDate = tonumber(date("%y%m%d"));
	if nDate < 091108 or nDate > 490918 then
		return 0;
	end
	local nDay = tonumber(date("%w"));
	local nNpcLifeTime = 120 * 60;
	local nNpcIndex = 0;
	if t_wenzi_sets[nDay] ~= nil then
		nNpcIndex = CreateNpc("V╪ T� Vng", "Чi v╪ t�", gf_UnPack(t_wenzi_sets[nDay][2]));
		SetNpcDeathScript(nNpcIndex, "\\script\\online\\viet_event\\200909\\3\\death_wenzi.lua");
		SetNpcLifeTime(nNpcIndex, nNpcLifeTime);
		nNpcIndex = CreateNpc("V╪ T� Vng", "Nh� v╪ t�", gf_UnPack(t_wenzi_sets[nDay][2]));
		SetNpcDeathScript(nNpcIndex, "\\script\\online\\viet_event\\200909\\3\\death_wenzi.lua");
		SetNpcLifeTime(nNpcIndex, nNpcLifeTime);
		nNpcIndex = CreateNpc("V╪ T� Vng", "Tam v╪ t�", gf_UnPack(t_wenzi_sets[nDay][2]));
		SetNpcDeathScript(nNpcIndex, "\\script\\online\\viet_event\\200909\\3\\death_wenzi.lua");
		SetNpcLifeTime(nNpcIndex, nNpcLifeTime);
		Msg2Global("C� ngi th蕐 n Mu鏸 Tr﹗ xu蕋 hi謓 t筰 "..t_wenzi_sets[nDay][1]..". C竎 h� h穣 mau mau 甶 thu ph鬰 ch髇g.");
		AddGlobalNews("C� ngi th蕐 n Mu鏸 Tr﹗ xu蕋 hi謓 t筰 "..t_wenzi_sets[nDay][1]..". C竎 h� h穣 mau mau 甶 thu ph鬰 ch髇g.");
	end
end