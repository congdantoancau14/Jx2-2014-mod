--File name:	feiyan_npc.lua
--Describe:		春节活动飞燕仙子npc文件
--Create Date:	2008-12-24
--Author:		chenbenqian

Include("\\script\\online\\viet_event\\new_year_09\\new_year_func.lua")
Include("\\script\\lib\\globalfunctions.lua")

TYPE_ITEM 	= 1;	--普通物品
TYPE_EQUIP 	= 2;	--带属性装备类物品
TYPE_CMD 	= 3;	--命令

g_szLogTitle = "Hoat dong Tet 2009"		--此处分为2段只是为了不增加新的翻译
g_szInfoHead = "<color=green>".."Phi Y課 Ti猲 T�".."<color>: "

g_szThisFile = "\\script\\online\\viet_event\\new_year_09\\npc\\feiyan_npc.lua"


g_tbItem = 
{
	--		类型	   期限	数量 名字					ID1	ID2		ID3		
	[1] = {TYPE_ITEM,	-1,	1,	"Ng� H祅h M藅 t辌h",				0,	107,	155,	},
	[2] = {TYPE_ITEM,	-1,	1,	"Thi猲 H� M藅 t辌h",				0,	107,	64,	},
	[3] = {TYPE_ITEM,	-1,	1,	"T� H� M藅 t辌h",				0,	107,	65,	},
	[4] = {TYPE_ITEM,	-1,	1,	"Chi猰 Y Ph�",				0,	107,	66,	},
	[5] = {TYPE_ITEM,	7,	1,	"S� tay s鑞g",				2,	19,		1,	},
	[6] = {TYPE_ITEM,	7,	1,	"T葃 T駓 n",				2,	0,		136,	},
	[7] = {TYPE_ITEM,	7,	1,	"T葃 T駓 linh n",				2,	0,		137,	},
	[8] = {TYPE_ITEM,	7,	1,	"B竧 B秓 T葃 T駓 Ti猲 Кn",			2,	0,		138,	},
	[9] = {TYPE_ITEM,	7,	1,	"Ti猽 Ki誴 t竛",				2,	0,		141,	},
	[10] = {TYPE_ITEM,	7,	1,	"Чi Nh﹏ s﹎",				2,	0,		553,	},
	[11] = {TYPE_ITEM,	7,	1,	"Tinh luy謓 B╪g Th筩h",				2,	1,		533,	},
	[12] = {TYPE_ITEM,	7,	1,	"Phong l謓h-trung c蕄",		2,	1,		1054,	},
	[13] = {TYPE_ITEM,	7,	1,	"Phong l謓h-cao c蕄",		2,	1,		1018,	},
	[14] = {TYPE_ITEM,	7,	1,	"Phong l謓h-t鑙 cao",		2,	1,		1055,	},
	[15] = {TYPE_ITEM,	7,	1,	"V� L﹎ Cao Th�",	2,	1,		1040,	},
	[16] = {TYPE_ITEM,	7,	1,	"Nh蕋 Чi Чi Hi謕",	2,	1,		1041,	},

	--		类型	    数值	提示字符串 		命令字符串
	[17] = {TYPE_CMD,	800000,	" 甶觤 kinh nghi謒",		"ModifyExp(%d)"},
	[18] = {TYPE_CMD,	800000,	" 甶觤 kinh nghi謒",		"ModifyExp(%d)"},
	[19] = {TYPE_CMD,	800000,	" 甶觤 kinh nghi謒",		"ModifyExp(%d)"},
	[20] = {TYPE_CMD,	800000,	" 甶觤 kinh nghi謒",		"ModifyExp(%d)"},
	[21] = {TYPE_CMD,	800000,	" 甶觤 kinh nghi謒",		"ModifyExp(%d)"},
	[22] = {TYPE_CMD,	400000,	" 甶觤 kinh nghi謒",		"ModifyExp(%d)"},
	[23] = {TYPE_CMD,	400000,	" 甶觤 kinh nghi謒",		"ModifyExp(%d)"},
	[24] = {TYPE_CMD,	400000,	" 甶觤 kinh nghi謒",		"ModifyExp(%d)"},
	[25] = {TYPE_CMD,	400000,	" 甶觤 kinh nghi謒",		"ModifyExp(%d)"},
	[26] = {TYPE_CMD,	400000,	" 甶觤 kinh nghi謒",		"ModifyExp(%d)"},
	[27] = {TYPE_CMD,	400000,	" 甶觤 kinh nghi謒",		"ModifyExp(%d)"},
	[28] = {TYPE_CMD,	400000,	" 甶觤 kinh nghi謒",		"ModifyExp(%d)"},
	[29] = {TYPE_CMD,	400000,	" 甶觤 kinh nghi謒",		"ModifyExp(%d)"},
	[30] = {TYPE_CMD,	400000,	" 甶觤 kinh nghi謒",		"ModifyExp(%d)"},
	[31] = {TYPE_CMD,	400000,	" 甶觤 kinh nghi謒",		"ModifyExp(%d)"},
	[32] = {TYPE_CMD,	200000,	" 甶觤 kinh nghi謒",		"ModifyExp(%d)"},
	[33] = {TYPE_CMD,	200000,	" 甶觤 kinh nghi謒",		"ModifyExp(%d)"},
	[34] = {TYPE_CMD,	200000,	" 甶觤 kinh nghi謒",		"ModifyExp(%d)"},
	[35] = {TYPE_CMD,	200000,	" 甶觤 kinh nghi謒",		"ModifyExp(%d)"},
	[36] = {TYPE_CMD,	200000,	" 甶觤 kinh nghi謒",		"ModifyExp(%d)"},
	[37] = {TYPE_CMD,	200000,	" 甶觤 kinh nghi謒",		"ModifyExp(%d)"},
	[38] = {TYPE_CMD,	200000,	" 甶觤 kinh nghi謒",		"ModifyExp(%d)"},
	[39] = {TYPE_CMD,	200000,	" 甶觤 kinh nghi謒",		"ModifyExp(%d)"},
	[40] = {TYPE_CMD,	200000,	" 甶觤 kinh nghi謒",		"ModifyExp(%d)"},
	[41] = {TYPE_CMD,	200000,	" 甶觤 kinh nghi謒",		"ModifyExp(%d)"},
	[42] = {TYPE_CMD,	200000,	" 甶觤 kinh nghi謒",		"ModifyExp(%d)"},
	[43] = {TYPE_CMD,	200000,	" 甶觤 kinh nghi謒",		"ModifyExp(%d)"},
	[44] = {TYPE_CMD,	200000,	" 甶觤 kinh nghi謒",		"ModifyExp(%d)"},
	[45] = {TYPE_CMD,	200000,	" 甶觤 kinh nghi謒",		"ModifyExp(%d)"},
	[46] = {TYPE_CMD,	200000,	" 甶觤 kinh nghi謒",		"ModifyExp(%d)"},
	[47] = {TYPE_CMD,	200000,	" 甶觤 kinh nghi謒",		"ModifyExp(%d)"},
	[48] = {TYPE_CMD,	200000,	" 甶觤 kinh nghi謒",		"ModifyExp(%d)"},
	[49] = {TYPE_CMD,	200000,	" 甶觤 kinh nghi謒",		"ModifyExp(%d)"},
	[50] = {TYPE_CMD,	200000,	" 甶觤 kinh nghi謒",		"ModifyExp(%d)"},
	[51] = {TYPE_CMD,	200000,	" 甶觤 kinh nghi謒",		"ModifyExp(%d)"},
}


function main()
	if is_new_year_09_viet_open() == 0 then
		Talk(1,"",g_szInfoHead.."Ho箃 ng t誸  k誸 th骳.");
		return
	end
	local nTime = tonumber(date("%H%M"))
	if nTime >= 0005 and nTime < 1900 then
		exchange_confirm()
	elseif nTime >= 1905 and nTime < 2400 then
		give_prize()
	else
		Say("Quay l筰 sau!",0)
	end
end

function exchange_confirm()
	if GetLevel() < 10 then
		Talk(1,"",g_szInfoHead.."Ngi ch琲 ph秈 t� c蕄 10 ho芻 c蕄 10 tr� l猲 m韎 c� th� tham gia.");
		return
	end
	if GetPlayerRoute() == 0 then
		Talk(1,"",g_szInfoHead.."Ho箃 ng n祔 y猽 c莡 ngi ch琲 ph秈 gia nh藀 v祇 m玭 ph竔.");
		return
	end
	local selTab = {
				"T筰 h� mu鑞 t苙g 4 hoa mai/give_plum",
				"Ta s� quay l筰 sau.!/no",
				}
	Say(g_szInfoHead.."Trung thu n╩ nay tr莕 gian v蒼 n竜 nhi謙 nh� x璦!",getn(selTab),selTab);
end

function give_plum()
	local nDate = tonumber(date("%Y%m%d"))
	if GetTask(GIVE_PLUM_DATE_09_NEWYEAR_VIET) >= nDate then
		Say(g_szInfoHead.."H玬 nay i hi謕  t苙g 4 hoa Mai r錳, xin h穣 i ng祔 mai ti誴 t鬰 tham gia ho箃 ng!", 0)
		return
	end
	local nExp = 200000

	if GetItemCount(2,1,30053) < 4 then
		Say(g_szInfoHead.."Чi hi謕 kh玭g mang theo  s� Hoa Mai trong h祅h trang c馻 m譶h.",1,"Th藅 ng筰 qu�,  ta ki觤 tra l筰!/no")
		return
	end
	if DelItem(2,1,30053,4) == 1 then
		ModifyExp(nExp)
		Msg2Player("B筺 nh薾 頲  "..nExp.."  甶觤 kinh nghi謒")
		WriteLogEx(g_szLogTitle, "Phi Y課", nExp, "甶觤 kinh nghi謒", format("ModifyExp(%d)", nExp), GetTongName() )
		SetTask(GIVE_PLUM_DATE_09_NEWYEAR_VIET, nDate)


		local nWishType = 0
		local nPrizeType = 0
		local nPrizeFlag = 0
		local nDateFlag = tonumber(GetTime())

		AddRelayShareData(RELAY_DB_09_NEWYEAR_VIET, 0, 0, "", "", 0, GetName(), "dddd", nWishType, nPrizeType, nPrizeFlag, nDateFlag)
	else
		Say(g_szInfoHead.."Чi hi謕 kh玭g mang theo  s� Hoa Mai trong h祅h trang c馻 m譶h.",1,"Th藅 ng筰 qu�,  ta ki觤 tra l筰!/no")
		return
	end
end

function give_prize()
	local selTab = {
				"T筰 h� n  nh薾 ph莕 thng/obtain_prize",
				"Ta s� quay l筰 sau.!/no",
				}
	Say(g_szInfoHead.."Trung thu n╩ nay tr莕 gian v蒼 n竜 nhi謙 nh� x璦!",getn(selTab),selTab);
end

function obtain_prize()
	local nDate = tonumber(date("%Y%m%d"))
	if GetTask(GIVE_PLUM_DATE_09_NEWYEAR_VIET) < nDate then
		Say("Чi hi謕 v蒼 ch璦  甶襲 ki謓  nh薾 thng l莕 n祔.",0)
		return
	end

	if GetTask(AWARD_PLUM_09_NEWYEAR_VIET) >= nDate then
		Say("H玬 nay ngi  nh薾 ph莕 thng r錳, ng祔 mai h穣 n nh�!",0)
		return
	end

	if gf_Judge_Room_Weight(1,20) == 0 then
		Talk(1,"","Kho秐g tr鑞g h祅h trang ho芻 s鴆 l鵦 kh玭g , xin ki觤 tra l筰!")
		return
	end

	ApplyRelayShareData(RELAY_DB_09_NEWYEAR_VIET,0,0,g_szThisFile,"obtain_prize_cb")
end

function obtain_prize_cb(szKey, nKey1, nKey2, nCount)
	if nCount == 0 then
		Say("Чi hi謕 v蒼 ch璦  甶襲 ki謓  nh薾 thng l莕 n祔.",0)
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

	if nPrizeFlag == 1 then
		Say("H玬 nay ngi  nh薾 ph莕 thng r錳, ng祔 mai h穣 n nh�!",0)
		return
	end

	if nDateNow - nDateFlag > 86400  then
		Say("B筺 v蒼 ch璦 nh薾 頲 ph莕 thng t� Phi Y課 Ti猲 T�.",0)
		return
	end

	local nRetCode = 0
	if nPrizeType == 0 then
		local nExp = 100000
		ModifyExp(nExp)
		Msg2Player("B筺 nh薾 頲  "..nExp.."  甶觤 kinh nghi謒")
		WriteLogEx(g_szLogTitle, "Phi Y課", nExp, "甶觤 kinh nghi謒", format("ModifyExp(%d)", nExp), GetTongName() )
		nRetCode = 1	--默认命令成功执行
	elseif nPrizeType >= 1 and nPrizeType <= 51 then
		local nType = g_tbItem[nPrizeType][1]
		if nType == TYPE_ITEM then
			nRetCode = add_item_ex(g_tbItem[nPrizeType])
		elseif nType == TYPE_CMD then
			local nItemNum = g_tbItem[nPrizeType][2]
			local szItemName = g_tbItem[nPrizeType][3]
			local szCMDString = format(g_tbItem[nPrizeType][4], nItemNum)
			dostring(szCMDString)
			Msg2Player("B筺 nh薾 頲  "..nItemNum.." "..szItemName)
			WriteLogEx(g_szLogTitle, "Phi Y課", nItemNum, szItemName, szCMDString, GetTongName() )
			nRetCode = 1	--默认命令成功执行
		end
	else
		return
	end

	if nRetCode == 1 or nRetCode == 2 then
		nPrizeFlag = 1
		AddRelayShareData(RELAY_DB_09_NEWYEAR_VIET, 0, 0, "", "", 0, GetName(), "dddd", nWishType, nPrizeType, nPrizeFlag, nDateFlag)
		SetTask(AWARD_PLUM_09_NEWYEAR_VIET, tonumber(date("%Y%m%d")))
	end
end

function add_item_ex(tItem)
	local szItemName = tItem[4]
	local G, D, P = tItem[5], tItem[6], tItem[7]
	local nItemNum = tItem[3]
	local nRetCode, nItemIdx = 0, 0

	nRetCode,nItemIdx = AddItem(G, D, P, nItemNum)
	if nRetCode == 1 then
		if tItem[2] > 0 then
			SetItemExpireTime(nItemIdx, tItem[2]*24*3600)
		end
		Msg2Player("B筺 nh薾 頲  "..nItemNum.." c竔 "..szItemName);
		if G == 0 and D == 107 and P == 155 then
			Msg2Global("Ch骳 m鮪g "..GetName().." Th玭g qua Phi Y課 Ti猲 T� thu 頲 1 Ng� H祅h M藅 T辌h")
		end
		WriteLogEx(g_szLogTitle, "Phi Y課", nItemNum, szItemName, format("(%d,%d,%d)", G, D, P), GetTongName() )
	else
		WriteLogEx(g_szLogTitle, "Phi Y課", "", "", format("(%d,%d,%d)", G, D, P), GetTongName(), "Thu 頲 th蕋 b筰, ".."AddItem return value = "..nRetCode)
	end
	return nRetCode
end

function no()
end

