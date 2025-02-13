--File name:	xmas_fireworks.lua
--Describe:		烟火脚本
--Item ID:		2,1,30039
--Create Date:	2008-11-18
--Author:		chenbenqian


Include("\\script\\lib\\globalfunctions.lua");
Include("\\script\\online\\viet_event\\xmas_08\\xmas_head.lua");

TYPE_NULL 	= 0;	--没有奖励
TYPE_ITEM 	= 1;	--普通物品
TYPE_EQUIP 	= 2;	--带属性装备类物品
TYPE_CMD 	= 3;	--命令

BYTE_FIREWORKS_NUM_08_USED = 1
BYTE_FIREWORKS_NUM_08_COUNT = 2
--=========================================================================================
g_szLogTitle = "Hoat dong thang 6 nam 2010"		--此处分为2段只是为了不增加新的翻译
g_nVietUseBoxEnd = 2049010500					--烟火的使用截止日期
g_nNeedRoom = 1
g_nNeedWeight = 20
g_nExpNum = 200000
g_nMaxUse = 100
g_nDayUse = 10								--使用一个烟火获得的经验值

YANHUO_TABLE = {
--	{"X輈h M筩 H醓 Di謒", 801, 10, 2, 1, 191},
--	{"Tranh M筩 H醓 Di謒", 802, 10, 2, 1, 193},
--	{"Lam M筩 H醓 Di謒", 805, 10, 2, 1, 192},
	{"Tranh S綾 Y猲 Hoa", 820, 3, 2, 1, 189},
	{"Lam S綾 Y猲 Hoa", 823, 3, 2, 1, 190},
	{""		   , 808, 5, 2, 1, 194},	--神秘烟花
	{""		   , 811, 5, 2, 1, 194},
--	{""		   , 813, 10, 2, 1, 194},
--	{""		   , 814, 10, 2, 1, 194},
--	{""		   , 817, 10, 2, 1, 194},
	{""		   , 832, 3, 2, 1, 194},
	{""		   , 835, 3, 2, 1, 194},
	{""		   , 838, 1, 2, 1, 194},
	{""        , 841, 1, 2, 1, 194}
};

t_Firework_Exp = {
	{2, 80, 200000},
	{2, 5, 400000},
	{2, 5, 600000},
	{2, 5, 800000},
	{2, 5, 1000000},
}


--=========================================================================================
function OnUse(nItemIdx)
	local nDate = tonumber(date("%Y%m%d"))
	
	-- if nDate < 20100708 or nDate > 20100711 then
		-- return
	-- end
	
	if GetTask(FIREWORKS_DATE_08_XMAS_VIET) ~= nDate then
		SetTask(FIREWORKS_DATE_08_XMAS_VIET, nDate)
		gf_SetTaskByte(FIREWORKS_NUM_08_XMAS_VIET, BYTE_FIREWORKS_NUM_08_COUNT, 0)
		SetTask(FIREWORKS_TIME_08_XMAS_VIET, 0)
	end

	if GetLevel() < 73 then
		Say("Nh﹏ v藅 c� ng c蕄 73 tr� l猲 m韎 c� th� s� d鬾g ph竜 hoa",1,"K誸 th骳 i tho筰/no_talk")
		return
	end

	--if gf_GetTaskByte(FIREWORKS_NUM_08_XMAS_VIET, BYTE_FIREWORKS_NUM_08_USED) >= 100 then
	--	Msg2Player("Ch� c� th� s� d鬾g t鑙 產 100 ph竜 hoa.")
	--	return
	--end

	if gf_GetTaskByte(FIREWORKS_NUM_08_XMAS_VIET, BYTE_FIREWORKS_NUM_08_COUNT) >= g_nDayUse then
		Msg2Player("Ng祔 h玬 nay ch� c� th� s� d鬾g 10 ph竜 hoa.")
		return
	end

	if (GetTime() - GetTask(FIREWORKS_TIME_08_XMAS_VIET)) < 60 then
		local nRemainTime = 60 - (GetTime() - GetTask(FIREWORKS_TIME_08_XMAS_VIET))
		Msg2Player("C遪 "..nRemainTime.." gi﹜ n鱝 m韎 c� th� t ph竜 hoa ti誴.")
		return
	end

	if DelItemByIndex(nItemIdx,1) == 1 then
		gf_EventGiveRandAward(t_Firework_Exp,100,1,g_szLogTitle,"s� d鬾g ph竜 hoa")
		gf_SetTaskByte(FIREWORKS_NUM_08_XMAS_VIET, BYTE_FIREWORKS_NUM_08_COUNT, gf_GetTaskByte(FIREWORKS_NUM_08_XMAS_VIET, BYTE_FIREWORKS_NUM_08_COUNT) + 1)
		--gf_SetTaskByte(FIREWORKS_NUM_08_XMAS_VIET, BYTE_FIREWORKS_NUM_08_USED, gf_GetTaskByte(FIREWORKS_NUM_08_XMAS_VIET, BYTE_FIREWORKS_NUM_08_USED) + 1)
		SetTask(FIREWORKS_TIME_08_XMAS_VIET, GetTime())		
		nIndex = random(1, getn(YANHUO_TABLE));
		DoFireworks(YANHUO_TABLE[nIndex][2], YANHUO_TABLE[nIndex][3]);
	end
end

function no_talk()
end