--=============================================
--create by baiyun 2009.11.13
--describe:越南版12月份活动冰冷巫师初始化脚本
--============================================
Include("\\script\\lib\\globalfunctions.lua");
t_wushi_sets = {
	{"T﹜ Th祅h Й", {308, 1437, 3139}},
	{"B綾 Th祅h Й", {301, 1553, 3083}},
};
function main()
	local nDate = tonumber(date("%y%m%d"));
	local nDay = tonumber(date("%w"));
	if nDate >= 100117 or nDate < 091218 then
		return 0;
	end
	local nRandSet = random(1, 2);
	local nNpcIndex = CreateNpc("Ph� th駓 b╪g gi�", "Ph� th駓 b╪g gi�", gf_UnPack(t_wushi_sets[nRandSet][2]));
	SetNpcLifeTime(nNpcIndex, 115 * 60);
	SetNpcDeathScript(nNpcIndex, "\\script\\online\\viet_event\\200912\\3\\death_binglengwushi.lua");
	--AddUnitStates(nNpcIndex, 6, GetTime());--记录NPC创建的时间
	AddGlobalNews(format("Ph� Th駓 B╪g Gi�  xu蕋 hi謓 t筰  %s. V� l﹎ l筰 s緋 c� m閠 t b╪g gi�. C竎 h� h穣 mau mau 甶 thu ph鬰 �  tr竛h m閠 t b穙 tuy誸 c� th� s� x秠 ra!", t_wushi_sets[nRandSet][1]));
end

