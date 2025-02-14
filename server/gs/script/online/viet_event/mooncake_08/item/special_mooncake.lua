--File name:	special_mooncake.lua
--Describe:		特别月饼脚本
--Item ID:		2,1,30026
--Create Date:	2008-08-20
--Author:		chenbenqian


Include("\\script\\lib\\globalfunctions.lua")
Include("\\script\\online\\viet_event\\mooncake_08\\mooncake_head.lua")

TYPE_NULL = 0;	--没有奖励
TYPE_ITEM = 1;	--普通物品
TYPE_EQUIP = 2;	--带属性装备类物品
TYPE_CMD = 3;	--命令

--=========================================================================================
g_szLogTitle = "Ho箃 ng trung thu : ".."B竛h Trung thu c bi謙"		--此处分为2段只是为了不增加新的翻译
g_nVietUseMoonCakeEnd = 2048101300				--月饼的使用截止日期
g_nNeedRoom = 1;
g_nNeedWeight = 20;	
g_nDenominator = 1000000						--分母，表示概率的单位是x分之1
g_nExpNum = 50000								--使用一个月饼获得的经验值

g_szFileName = "special_mooncake.lua"			--文件名

g_tbItem = 
{
	--		类型	   概率		数量 名字			ID1,ID2,ID3
	[1] = {TYPE_ITEM,	1,		1,	"Kim Cang Ph鬰 Ma kinh",	0,	107,	1},
	[2] = {TYPE_ITEM,	1,		1,	"Ti襪 Long M藅 t辌h",		0,	107,	3},
	[3] = {TYPE_ITEM,	1,		1,	"V� Tr莕 M藅 t辌h",		0,	107,	5},
	[4] = {TYPE_ITEM,	1,		1,	"Thi猲 La M藅 T辌h",		0,	107,	7},
	[5] = {TYPE_ITEM,	1,		1,	"Nh� � M藅 T辌h",		0,	107,	9},
	[6] = {TYPE_ITEM,	1,		1,	"B輈h H秈 Ph�",		0,	107,	11},
	[7] = {TYPE_ITEM,	1,		1,	"H鏽 чn M藅 t辌h",		0,	107,	13},
	[8] = {TYPE_ITEM,	1,		1,	"Qu� Thi猲 M藅 t辌h",		0,	107,	15},
	[9] = {TYPE_ITEM,	1,		1,	"Huy襫 秐h M藅 t辌h",		0,	107,	17},
	[10] = {TYPE_ITEM,	1,		1,	"Qu﹏ T� M藅 t辌h",		0,	107,	19},
	[11] = {TYPE_ITEM,	1,		1,	"Tr蕁 Qu﹏ M藅 t辌h",		0,	107,	21},
	[12] = {TYPE_ITEM,	1,		1,	"Xuy猲 V﹏ M藅 t辌h",		0,	107,	23},
	[13] = {TYPE_ITEM,	1,		1,	"U Minh Qu� L鬰",		0,	107,	25},
	[14] = {TYPE_ITEM,	1,		1,	"Linh C� M藅 t辌h",		0,	107,	27},
	[15] = {TYPE_ITEM,	5,		1,	"B竧 B秓 T葃 T駓 Ti猲 Кn",	2,	0,		138},
	[16] = {TYPE_ITEM,	10,		1,	"T葃 T駓 linh n",		2,	0,		137},
	[17] = {TYPE_ITEM,	3000,	1,	"Ti觰 Nh� �",		2,	1,		30030},
	[18] = {TYPE_ITEM,	70,		1,	"Chi猰 Y Ph�",		0,	107,	66},
	[19] = {TYPE_ITEM,	100,	1,	"T� H� M藅 t辌h",		0,	107,	65},
	[20] = {TYPE_ITEM,	150,	1,	"Thi猲 H� M藅 t辌h",		0,	107,	64},
	[21] = {TYPE_ITEM,	2000,	1,	"M秐h Thi猲 th筩h",		2,	2,		7},
	[22] = {TYPE_ITEM,	5000,	1,	"Thi猲 th筩h",			2,	2,		8},
	[23] = {TYPE_ITEM,	5000,	1,	"M秐h B╪g th筩h",		2,	1,		148},
	[24] = {TYPE_ITEM,	5000,	1,	"B╪g th筩h",			2,	1,		149},
	[25] = {TYPE_ITEM,	10000,	1,	"C﹜ B竧 Nh�",		2,	0,		398},
	[26] = {TYPE_ITEM,	20000,	1,	"C﹜ B竧 Nh� nh�",	2,	0,		504},
	[27] = {TYPE_ITEM,	140000,	1,	"L� th駓",			2,	0,		351},
	[28] = {TYPE_ITEM,	10000,	1,	"B錸g Lai Ti猲 Th駓",		2,	1,		1012},
	--		类型	   概率 数值	提示字符串 		命令字符串
	[29] = {TYPE_CMD,	50000,	1,	"甶觤 danh v鋘g",	"ModifyReputation(%d,0)"},
	[30] = {TYPE_CMD,	150000,	2,	"甶觤 danh v鋘g","ModifyReputation(%d,0)"},
	[31] = {TYPE_CMD,	150000,	3,	"甶觤 danh v鋘g","ModifyReputation(%d,0)"},
	[32] = {TYPE_CMD,	200000,	20,	"甶觤 tu luy謓",		"ModifyPopur(%d)"},
	[33] = {TYPE_CMD,	150000,	1,	"甶觤 c鑞g hi課 s� m玭",	"SetTask(336, GetTask(336)+%d)"},
	[34] = {TYPE_CMD,	99651,	100,"甶觤 T祅g ki誱",	"SetTask(1801, GetTask(1801)+%d)"},
}

--=========================================================================================
function OnUse(nItemIdx)
	local nDate = tonumber(date("%Y%m%d%H"))
	if nDate >= g_nVietUseMoonCakeEnd then
		return
	end
	if GetLevel() < 20 then
		Talk(1,"","Ch� c� ngi ch琲 t ng c蕄 t� 20 tr� l猲 m韎 c� th� s� d鬾g v藅 ph萴 n祔.")
		return
	end
	if gf_JudgeRoomWeight(g_nNeedRoom,g_nNeedWeight) == 0 then
		Talk(1,"","Kho秐g tr鑞g h祅h trang ho芻 s鴆 l鵦 kh玭g , xin ki觤 tra l筰!")
		return
	end;
	if DelItemByIndex(nItemIdx,1) == 1 then
		use_it()
	end
end

function use_it()
	--经验奖励部分
	local nExp = g_nExpNum
	local nExpTotal = GetTask(TOTALEXP_08_MOONCAKE_VIET)
	if nExpTotal >= g_nExpTotal_MoonCakeViet then
		Msg2Player("B筺  t gi韎 h筺 甶觤 kinh nghi謒 c� th� nh薾 頲 trong ho箃 ng Trung thu l莕 n祔. "..g_nExpTotal_MoonCakeViet.." , Hi謓 t筰 s� d鬾g B竛h trung thu s� kh玭g nh薾 頲 甶觤 kinh nghi謒 nh璶g s� c� c� h閕 nh薾 頲 ph莕 thng kh竎.");
		nExp = 0;
	elseif nExpTotal + g_nExpNum > g_nExpTotal_MoonCakeViet then
		nExp = g_nExpTotal_MoonCakeViet - nExpTotal;
	end
	if nExp ~= 0 then
		ModifyExp(nExp);
		SetTask( TOTALEXP_08_MOONCAKE_VIET, (nExpTotal+nExp) )
		Msg2Player("B筺 nh薾 頲  "..nExp.."  甶觤 kinh nghi謒");		
		WriteLogEx(szLogTrungThuName,"nh薾",nExp,"甶觤 kinh nghi謒")
	end
	--物品奖励部分
	local nRandIdx = get_random_item(g_tbItem)
	if nRandIdx == 0 then
		return
	end
	local nType = g_tbItem[nRandIdx][1]
	local szItemName = g_tbItem[nRandIdx][4]
	local nItemNum = g_tbItem[nRandIdx][3]
	local szMsgText = ""
	if szItemName ~= "甶觤 danh v鋘g" then
		szMsgText = "B筺 nh薾 頲  "..nItemNum.." c竔 "..szItemName
	end
	local nRetCode = 0
	if nType == TYPE_NULL then
		return
	elseif nType == TYPE_ITEM then
		nRetCode = AddItem(g_tbItem[nRandIdx][5],g_tbItem[nRandIdx][6],g_tbItem[nRandIdx][7],g_tbItem[nRandIdx][3])
	elseif nType == TYPE_EQUIP then
		nRetCode = AddItem(g_tbItem[nRandIdx][5],g_tbItem[nRandIdx][6],g_tbItem[nRandIdx][7],g_tbItem[nRandIdx][3],1,-1,-1,-1,-1,-1,-1)
	elseif nType == TYPE_CMD then
		dostring(format(g_tbItem[nRandIdx][5],g_tbItem[nRandIdx][3]))
		nRetCode = 1	--默认命令成功执行
		if szItemName ~= "甶觤 danh v鋘g" then
			szMsgText = "B筺 nh薾 頲  "..nItemNum.." "..szItemName
		end
	end;
	if nRetCode == 1 then
		if g_tbItem[nRandIdx][4] ~= "甶觤 danh v鋘g"  then
			Msg2Player(szMsgText)
		end
		WriteLogEx(szLogTrungThuName,"B竛h trung thu c bi謙",nItemNum,szItemName)			
	else
		WriteLog("["..g_szLogTitle.."]: [Account: "..GetAccount().."][Role Name: "..GetName().."] "..szMsgText.." Failed, return value = "..nRetCode)
	end
end

--按照概率获得g_tbItem里面的一项内容
function get_random_item(nTab)
	local nRandom = random(1,g_nDenominator)
	local nBase = 0
	if check_item_tab(nTab) == 1 then
		for i=1,getn(nTab) do
			if nRandom <= nTab[i][2]+nBase then
				return i
			else
				nBase = nBase + nTab[i][2]
			end
		end
	else
		return 0
	end
end

--检查输入的table是否正确
function check_item_tab(tTab)
	local nTotalProbability= 0
	for i=1,getn(tTab) do
		nTotalProbability = nTotalProbability + tTab[i][2]
	end
	if nTotalProbability == g_nDenominator then
		return 1
	else
		print("\n error item table in "..g_szFileName.." \n")
		return 0
	end
end

function nothing()

end
