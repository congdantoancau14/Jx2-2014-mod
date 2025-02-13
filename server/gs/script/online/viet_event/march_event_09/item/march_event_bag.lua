--File name:	march_event_bag.lua
--Describe:		原料包脚本
--Item ID:		2,1,30061
--Create Date:	2009-02-17
--Author:		chenbenqian


Include("\\script\\lib\\globalfunctions.lua")
Include("\\script\\online\\viet_event\\march_event_09\\march_event_func.lua")

TYPE_NULL 	= 0;	--没有奖励
TYPE_ITEM 	= 1;	--普通物品
TYPE_EQUIP 	= 2;	--带属性装备类物品
TYPE_CMD 	= 3;	--命令

--=========================================================================================
g_szLogTitle = "Event th竛g 3"			--此处分为2段只是为了不增加新的翻译
g_nVietUseBoxEnd = 2049040600					--使用截止日期
g_nNeedRoom = 1
g_nNeedWeight = 20
g_nDenominator = 100							--分母，表示概率的单位是x分之1

g_szFileName = "march_event_bag.lua"			--文件名

g_tbItem = 
{
	--		类型	   概率	数量 名字	ID1,ID2,ID3
	[1] = {TYPE_ITEM,	50,	1,	"Л阯g C竧",	2,	1,	30062,	},
	[2] = {TYPE_ITEM,	25,	1,	"H閜 S鱝",		2,	1,	30063,	},
	[3] = {TYPE_ITEM,	25,	1,	"L� Hng",	2,	1,	30064,	},
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
	--物品奖励部分
	local nRandIdx = get_random_item(g_tbItem)
	if nRandIdx == 0 then
		return
	end

	local szItemName = g_tbItem[nRandIdx][4]
	local nItemNum = g_tbItem[nRandIdx][3]
	local szInfoDescribe = format("(%d,%d,%d)", g_tbItem[nRandIdx][5], g_tbItem[nRandIdx][6], g_tbItem[nRandIdx][7])

	local nRetCode = 0
	nRetCode = AddItem(g_tbItem[nRandIdx][5],g_tbItem[nRandIdx][6],g_tbItem[nRandIdx][7],g_tbItem[nRandIdx][3])

	if nRetCode == 1 then
		Msg2Player("B筺 nh薾 頲  "..nItemNum.." "..szItemName)
		WriteLogEx(g_szLogTitle, "Nh薾 頲", nItemNum, szItemName, szInfoDescribe, GetTongName() )
	else
		WriteLogEx(g_szLogTitle, "", nItemNum, szItemName, szInfoDescribe, GetTongName(), "Thu 頲 th蕋 b筰, ".."AddItem return value = "..nRetCode)
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

