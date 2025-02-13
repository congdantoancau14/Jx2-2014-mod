--File name:	feiyan.lua
--Describe:		中秋活动飞燕仙子npc文件
--Create Date:	2008-08-26
--Author:		chenbenqian

Include("\\script\\online\\viet_event\\mooncake_08\\mooncake_head.lua")
Include("\\script\\lib\\globalfunctions.lua")

g_szLogTitle = "Ho箃 ng trung thu : ".."Phi Y課 Ti猲 T�"		--此处分为2段只是为了不增加新的翻译
g_szInfoHead = "<color=green>Phi Y課 Ti猲 T�<color>: "

g_szThisFile = "\\script\\online\\viet_event\\mooncake_08\\npc\\feiyan.lua"


g_tbItem = 
{
	--		名称		G1	G2	G3		数量 类型
	[1] = {"Ti觰 Nh� �",	2,	1,	30030,	20,	1},
	[2] = {"Chi猰 Y Ph�",	0,	107,66,		1,	2},
	[3] = {"T� H� M藅 t辌h",	0,	107,65,		1,	3},
	[4] = {"T� H� M藅 t辌h",	0,	107,65,		1,	3},
	[5] = {"Thi猲 H� M藅 t辌h",	0,	107,64,		1,	4},
	[6] = {"Thi猲 H� M藅 t辌h",	0,	107,64,		1,	4},
	[7] = {"Thi猲 H� M藅 t辌h",	0,	107,64,		1,	4},
	[8] = {"Thi猲 H� M藅 t辌h",	0,	107,64,		1,	4},
}


function main()
	if is_mooncake_viet_open() == 0 then
		return
	end
	if GetLevel() < 20 then
		Say(g_szInfoHead.."Ta ch� t苙g thng cho ngi ng c蕄 20 tr� l猲. Ngi r蘮 luy謓 th猰 nh�!",0)
		return
	end
	local nTime = tonumber(date("%H"))
	if nTime == 19 or nTime == 6 then
		Say("Quay l筰 sau!",0)
	elseif nTime > 6 and nTime < 19 then
		exchange_confirm()
	else
		give_prize()
	end
end

function exchange_confirm()
	local selTab = {
				"Ta mu鑞 d﹏g t苙g 4 b竛h trung thu thng./#give_mooncake(1)",
				"Ta mu鑞 d﹏g t苙g 4 b竛h trung thu c bi謙./#give_mooncake(2)",
				"Ta s� quay l筰 sau.!/no",
				}
	Say(g_szInfoHead.."Trung thu n╩ nay tr莕 gian v蒼 n竜 nhi謙 nh� x璦!",getn(selTab),selTab);
end

function give_mooncake(nType)
	local nDate = tonumber(date("%Y%m%d"))

	if GetTask(CAKE_DATE_08_MOONCAKE_VIET) >= nDate then
		Say(g_szInfoHead.."H玬 nay ngi  t苙g b竛h Trung thu r錳, m鏸 ngi ch� 頲 t苙g 1 l莕 trong ng祔. Ng祔 mai h穣 ti誴 t鬰 nh�!", 0)
		return
	end
	local nExp = 0
	if nType == 1 then
		if GetItemCount(2,1,30025) < 4 then
			Say(g_szInfoHead.."Ch璦  s� B竛h Trung Thu c莕 thi誸 th� ta kh玭g th� cho c竎 h� 甶襲 c.!",1,"Th藅 ng筰 qu�,  ta ki觤 tra l筰!/no")
			return
		end
		if DelItem(2,1,30025,4) == 1 then
			nExp = 150000
			ModifyExp(nExp)
			Msg2Player("B筺 nh薾 頲  "..nExp.."  甶觤 kinh nghi謒")
			SetTask(CAKE_DATE_08_MOONCAKE_VIET, nDate)
			WriteLogEx(szLogTrungThuName,"nh薾",nExp,"甶觤 kinh nghi謒")
		else
			Say(g_szInfoHead.."Ch璦  s� B竛h Trung Thu c莕 thi誸 th� ta kh玭g th� cho c竎 h� 甶襲 c.!",1,"Th藅 ng筰 qu�,  ta ki觤 tra l筰!/no")
			return
		end
	elseif nType == 2 then
		if GetItemCount(2,1,30026) < 4 then
			Say(g_szInfoHead.."Ch璦  s� B竛h Trung Thu c莕 thi誸 th� ta kh玭g th� cho c竎 h� 甶襲 c.!",1,"Th藅 ng筰 qu�,  ta ki觤 tra l筰!/no")
			return
		end
		if DelItem(2,1,30026,4) == 1 then
			nExp = 400000
			ModifyExp(nExp)
			Msg2Player("B筺 nh薾 頲  "..nExp.."  甶觤 kinh nghi謒")
			SetTask(CAKE_DATE_08_MOONCAKE_VIET, nDate)
			WriteLogEx(szLogTrungThuName,"nh薾",nExp,"甶觤 kinh nghi謒")
			local selTab = {
						"Ta c 頲 20 Ti觰 Nh� �./#make_wish(1)",
						"Ta c 頲 1 Chi猰 Y Ph�./#make_wish(2)",
						"Ta c 頲 1 T� H� M藅 T辌h./#make_wish(3)",
						"Ta c 頲 1 Thi猲 H� M藅 T辌h./#make_wish(4)",
						"Ta c 頲 t蕋 c� nh鱪g m鉵 tr猲./#make_wish(5)",
						}
			Say(g_szInfoHead.." t�, ta  nh薾  s� lng b竛h trung thu, ta s� cho ngi m閠 甶襲 c, ngi c 甶襲 g�?",getn(selTab),selTab);
		else
			Say(g_szInfoHead.."Ch璦  s� B竛h Trung Thu c莕 thi誸 th� ta kh玭g th� cho c竎 h� 甶襲 c.!",1,"Th藅 ng筰 qu�,  ta ki觤 tra l筰!/no")
			return
		end
	end
end

function make_wish(nType)
	local nWishType = 0
	local nPrizeType = 0
	local nPrizeFlag = 0
	local nDateFlag = tonumber(GetTime())
	nWishType = tonumber(nType)
	AddRelayShareData(RELAY_DB_08_MOONCAKE_VIET, 0, 0, "", "", 0, GetName(), "dddd", nWishType, nPrizeType, nPrizeFlag, nDateFlag)
end

function give_prize()
	local selTab = {
				"Ta n y  nh薾 ph莕 thng c馻 m譶h./obtain_prize",
				"Ta s� quay l筰 sau.!/no",
				}
	Say(g_szInfoHead.."Ch� c� ngi ch琲 t苙g b竛h cho ta m韎 頲 nh薾 ph莕 thng.",getn(selTab),selTab);
end

function obtain_prize()
	ApplyRelayShareData(RELAY_DB_08_MOONCAKE_VIET,0,0,g_szThisFile,"obtain_prize_cb")
end

function obtain_prize_cb(szKey, nKey1, nKey2, nCount)
	if nCount == 0 then
		Say("B筺 v蒼 ch璦 nh薾 頲 ph莕 thng t� Phi Y課 Ti猲 T�.",0)
		return
	end

	local szPlayerName = ""
	local nWishType = 0
	local nPrizeType = 0
	local nPrizeFlag = 0
	local nDateFlag = 0
	local nDateNow = tonumber(GetTime())
	szPlayerName = GetName()

	nWishType, nPrizeType, nPrizeFlag, nDateFlag = GetRelayShareDataByKey(szKey, nKey1, nKey2, szPlayerName)
	DelRelayShareDataCopy(szKey,nKey1,nKey2)
	if nWishType == 0 or nWishType == nil then
		Say("B筺 v蒼 ch璦 nh薾 頲 ph莕 thng t� Phi Y課 Ti猲 T�.",0)
		return
	else
		if nDateNow - nDateFlag > 82800  then
			Say("B筺 v蒼 ch璦 nh薾 頲 ph莕 thng t� Phi Y課 Ti猲 T�.",0)
			return
		end
		if nPrizeType == 0 then
			Say("B筺 v蒼 ch璦 nh薾 頲 ph莕 thng t� Phi Y課 Ti猲 T�.",0)
			return
		end
		if nPrizeFlag == 1 then
			Say("H玬 nay ngi  nh薾 ph莕 thng r錳, ng祔 mai h穣 n nh�!",0)
			return
		end
		
		add_item_ex(g_tbItem[nPrizeType][1], g_tbItem[nPrizeType][2], g_tbItem[nPrizeType][3],g_tbItem[nPrizeType][4],g_tbItem[nPrizeType][5])
		nPrizeFlag = 1
		AddRelayShareData(RELAY_DB_08_MOONCAKE_VIET, 0, 0, "", "", 0, GetName(), "dddd", nWishType, nPrizeType, nPrizeFlag, nDateFlag)
		
		Say(g_szInfoHead.."Ch骳 m鮪g i hi謕! "..g_tbItem[nPrizeType][1].."   thu閏 v� i hi謕.",1," t� Phi Y課 Ti猲 T�!/no");
	end

end

function add_item_ex(szItemName, genre, detail, particular, nItemNum)
	local nRetCode = 0;
	nRetCode = AddItem(genre, detail, particular, nItemNum);
	if nRetCode == 1 then
		Msg2Player("B筺 nh薾 頲  "..nItemNum.." c竔 "..szItemName);
		WriteLogEx(szLogTrungThuName,"Phi Y課 t� t�",nItemNum,szItemName)
	else
		WriteLog("["..g_szLogTitle.."]: [Account: "..GetAccount().."][Role Name:"..GetName().."] Obtain "..nItemNum.." "..szItemName.." Failed, return value = "..nRetCode);
	end
end

function no()
end

