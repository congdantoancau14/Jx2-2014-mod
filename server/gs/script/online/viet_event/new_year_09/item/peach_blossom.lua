--File name:	peach_blossom.lua
--Describe:		桃花脚本
--Item ID:		2,1,30052
--Create Date:	2008-12-24
--Author:		chenbenqian


Include("\\script\\lib\\globalfunctions.lua")
Include("\\script\\online\\viet_event\\new_year_09\\new_year_func.lua")

TYPE_NULL 	= 0;	--没有奖励
TYPE_ITEM 	= 1;	--普通物品
TYPE_EQUIP 	= 2;	--带属性装备类物品
TYPE_CMD 	= 3;	--命令

--=========================================================================================
g_szLogTitle = "Hoat dong Tet 2009"			--此处分为2段只是为了不增加新的翻译
g_nVietUseBoxEnd = 2049022300					--使用截止日期
g_nNeedRoom = 1
g_nNeedWeight = 20
g_nDenominator = 1000000						--分母，表示概率的单位是x分之1
g_nExpNum = 50000								--使用一个桃花获得的经验值

g_szFileName = "peach_blossom.lua"				--文件名


g_tbItem = 
{
	--		类型	   概率		数量 名字		ID1,ID2,ID3
	[1] = {TYPE_NULL,	464800,	},
	[2] = {TYPE_ITEM,	500,	1,	"Thi猲 H� M藅 t辌h",	0,	107,	64,	},
	[3] = {TYPE_ITEM,	200,	1,	"T� H� M藅 t辌h",	0,	107,	65,	},
	[4] = {TYPE_ITEM,	100,	1,	"Chi猰 Y Ph�",	0,	107,	66,	},
	[5] = {TYPE_ITEM,	1000,	1,	"Ng� Qu� M藅 t辌h",	0,	107,	63,	},
	[6] = {TYPE_ITEM,	800,	1,	"B� Kim M藅 t辌h",	0,	107,	61,	},
	[7] = {TYPE_ITEM,	600,	1,	"B� Th筩h M藅 t辌h",	0,	107,	62,	},
	[8] = {TYPE_ITEM,	10000,	1,	"M秐h Thi猲 th筩h",	2,	2,	7,	},
	[9] = {TYPE_ITEM,	2000,	1,	"Thi猲 th筩h",	2,	2,	8,	},
	[10] = {TYPE_ITEM,	2000,	1,	"M秐h B╪g th筩h",	2,	1,	148,	},
	[11] = {TYPE_ITEM,	3000,	1,	"B╪g th筩h",	2,	1,	149,	},
	[12] = {TYPE_ITEM,	20000,	1,	"B錸g Lai L� Th駓",	2,	1,	1052,	},
	[13] = {TYPE_ITEM,	10000,	1,	"B錸g Lai Ti猲 Th駓",	2,	1,	1012,	},
	[14] = {TYPE_ITEM,	10000,	1,	"Th莕 Gi竝 Кn (chi課 trng)",	1,	0,	209,	},
	[15] = {TYPE_ITEM,	20000,	1,	"Th莕 Tr竜 Кn (chi課 trng)",	1,	0,	210,	},
	[16] = {TYPE_ITEM,	15000,	1,	"Th玭g C﹏ T竛 (chi課 trng)",	1,	0,	211,	},
	[17] = {TYPE_ITEM,	8000,	1,	"V� C鵦 Ti猲 Кn (chi課 trng)",	1,	0,	224,	},
	[18] = {TYPE_ITEM,	10000,	1,	"Th蕋 Khi誹 Nguy猲 B秓 Кn (chi課 trng)",	1,	0,	225,	},
	[19] = {TYPE_ITEM,	12000,	1,	"Th玭g Thi猲 V� C鵦 Кn (chi課 trng)",	1,	0,	227,	},
	[20] = {TYPE_ITEM,	30000,	10,	"Dc th秓 qu﹏ d鬾g",	2,	0,	312,	},
	[21] = {TYPE_ITEM,	30000,	10,	"L骯 m筩h qu﹏ d鬾g",	2,	0,	309,	},
	[22] = {TYPE_ITEM,	30000,	10,	"Kho竛g th筩h qu﹏ d鬾g",	2,	0,	307,	},
	[23] = {TYPE_ITEM,	30000,	10,	"Linh huy誸 qu﹏ d鬾g",	2,	0,	313,	},
	[24] = {TYPE_ITEM,	30000,	10,	"T� t籱 qu﹏ d鬾g",	2,	0,	311,	},
	[25] = {TYPE_ITEM,	30000,	10,	"G� qu﹏ d鬾g",	2,	0,	308,	},
	[26] = {TYPE_ITEM,	30000,	10,	"Thu閏 da qu﹏ d鬾g",	2,	0,	310,	},
	--		类型	   概率 数值	提示字符串 	命令字符串
	[27] = {TYPE_CMD,	200000,	2,	{"甶觤 danh v鋘g"},	"ModifyReputation(%d,0)"},
}

--=========================================================================================
function OnUse(nItemIdx)
	local nDate = tonumber(date("%Y%m%d%H"))
	if nDate >= g_nVietUseBoxEnd then
		Msg2Player("V藅 ph萴 n祔  qu� h筺, kh玭g th� s� d鬾g th猰 n鱝.")
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
	local nExpTotal = GetTask(PLUM_TOTALEXP_09_NEWYEAR_VIET)
	if nExpTotal >= PLUM_EXP_LIMIT_09_NEWYEAR_VIET then
		Msg2Player("Чi hi謕  thu 頲 kinh nghi謒 t� ho箃 ng Mai Уo Ch骳 T誸 vt qu� gi韎 h筺. "..PLUM_EXP_LIMIT_09_NEWYEAR_VIET.." , Hi謓 t筰 kh玭g th� nh薾 th猰 kinh nghi謒 t� ho箃 ng n祔, nh璶g c� th� s� c� c� h閕 nh薾 ph莕 thng kh竎.");
		nExp = 0;
	elseif nExpTotal + g_nExpNum > PLUM_EXP_LIMIT_09_NEWYEAR_VIET then
		nExp = PLUM_EXP_LIMIT_09_NEWYEAR_VIET - nExpTotal;
	end
	if nExp ~= 0 then
		ModifyExp(nExp);
		SetTask( PLUM_TOTALEXP_09_NEWYEAR_VIET, (nExpTotal+nExp) )
		Msg2Player("B筺 nh薾 頲  "..nExp.."  甶觤 kinh nghi謒");

		local szItemName = "甶觤 kinh nghi謒"
		local nItemNum = nExp
		local szInfoDescribe = format("ModifyExp(%d)", nItemNum)
		WriteLogEx(g_szLogTitle, "Hoa Уo", nItemNum, szItemName, szInfoDescribe, GetTongName() )
	end
	--物品奖励部分
	local nRandIdx = get_random_item(g_tbItem)
	if nRandIdx == 0 then
		return
	end
	local nType = g_tbItem[nRandIdx][1]
	local szItemName = g_tbItem[nRandIdx][4]
	local nItemNum = g_tbItem[nRandIdx][3]
	local szInfoDescribe = ""

	local nRetCode = 0
	if nType == TYPE_NULL then
		return
	elseif nType == TYPE_ITEM then
		nRetCode = AddItem(g_tbItem[nRandIdx][5],g_tbItem[nRandIdx][6],g_tbItem[nRandIdx][7],g_tbItem[nRandIdx][3])
		szInfoDescribe = format("(%d,%d,%d)", g_tbItem[nRandIdx][5], g_tbItem[nRandIdx][6], g_tbItem[nRandIdx][7])
	elseif nType == TYPE_EQUIP then
		nRetCode = AddItem(g_tbItem[nRandIdx][5],g_tbItem[nRandIdx][6],g_tbItem[nRandIdx][7],g_tbItem[nRandIdx][3],1,-1,-1,-1,-1,-1,-1)
		szInfoDescribe = format("(%d,%d,%d)", g_tbItem[nRandIdx][5], g_tbItem[nRandIdx][6], g_tbItem[nRandIdx][7])
	elseif nType == TYPE_CMD then
		szInfoDescribe = format(g_tbItem[nRandIdx][5],g_tbItem[nRandIdx][3])
		dostring(szInfoDescribe)
		nRetCode = 1	--默认命令成功执行
	end;

	if nRetCode == 1 then
		if type(szItemName) == "table" then
			szItemName = szItemName[1]
		else
			Msg2Player("B筺 nh薾 頲  "..nItemNum.." "..szItemName)
		end
		WriteLogEx(g_szLogTitle, "Hoa Уo", nItemNum, szItemName, szInfoDescribe, GetTongName() )
	else
		WriteLogEx(g_szLogTitle, "Hoa Уo", "", "", szInfoDescribe, GetTongName(), "Thu 頲 th蕋 b筰, ".."AddItem return value = "..nRetCode)
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

