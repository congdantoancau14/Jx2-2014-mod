--File name:	pearl.lua
--Describe:		珍珠脚本
--Item ID:		2,1,30067
--Create Date:	2009-02-18
--Author:		chenbenqian


Include("\\script\\lib\\globalfunctions.lua")
Include("\\script\\online\\viet_event\\march_event_09\\march_event_func.lua")

TYPE_NULL 	= 0;	--没有奖励
TYPE_ITEM 	= 1;	--普通物品
TYPE_EQUIP 	= 2;	--带属性装备类物品
TYPE_CMD 	= 3;	--命令

--=========================================================================================
g_szLogTitle = "Event th竛g 3"			--此处分为2段只是为了不增加新的翻译
g_nVietUseBoxEnd = 2049041300					--使用截止日期
g_nExpNum = 500000								--使用一个珍珠获得的经验值

g_szFileName = "pearl.lua"						--文件名

--=========================================================================================
function OnUse(nItemIdx)
	local nDate = tonumber(date("%Y%m%d%H"))
	if nDate >= g_nVietUseBoxEnd then
		Msg2Player("V藅 ph萴 n祔  qu� h筺, kh玭g th� s� d鬾g th猰 n鱝.")
		return
	end

	local nExp = g_nExpNum
	local nExpTotal = GetTask(PEARL_TOTALEXP_09_MARCH_VIET)
	if nExpTotal >= PEARL_EXP_LIMIT_09_MARCH_VIET then
		Msg2Player("C竎 h�  thu 頲 kinh nghi謒 cao nh蕋 t� v藅 ph萴 Ng鋍 Trai "..PEARL_EXP_LIMIT_09_MARCH_VIET.." , C竎 h� hi謓 nay kh玭g th� thu 頲 ph莕 thng kinh nghi謒.");
		nExp = 0;
		return
	elseif nExpTotal + g_nExpNum > PEARL_EXP_LIMIT_09_MARCH_VIET then
		nExp = PEARL_EXP_LIMIT_09_MARCH_VIET - nExpTotal;
	end

	if nExp ~= 0 and nExp ~= nil then
		if DelItemByIndex(nItemIdx,1) == 1 then
			ModifyExp(nExp);
			SetTask( PEARL_TOTALEXP_09_MARCH_VIET, (nExpTotal+nExp) )
			Msg2Player("B筺 nh薾 頲  "..nExp.."  甶觤 kinh nghi謒");

			local szItemName = "甶觤 kinh nghi謒"
			local nItemNum = nExp
			local szInfoDescribe = format("ModifyExp(%d)", nItemNum)
			WriteLogEx(g_szLogTitle, "Ng鋍 Trai", nItemNum, szItemName, szInfoDescribe, GetTongName() )
		end
	end
end

