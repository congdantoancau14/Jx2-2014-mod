--File name:	uncle_qin.lua
--Describe:		中秋活动秦大叔npc文件
--Create Date:	2008-08-22
--Author:		chenbenqian

Include("\\script\\online\\viet_event\\mooncake_08\\mooncake_head.lua")
Include("\\script\\lib\\globalfunctions.lua")

g_szLogTitle = "Ho箃 ng trung thu : ".."T莕 Чi Th骳"		--此处分为2段只是为了不增加新的翻译
g_szInfoHead = "<color=green>T莕 i th骳<color>: "


g_tbItem = 
{
	--		名称		G1	G2	G3		数量
	[1] = {" чc Phong th輈h",	2,	1,	176,	8	},
	[2] = {" Gi竝 x竎 phi課",	2,	1,	177,	8	},
	[3] = {" Kh� S琻 ch�",2,	1,	98,	8	},
	[4] = {" V� s� y猽 i",	2,	1,	174,	8	},
	[5] = {"  dng k輓h",	2,	1,	294,	8	},
	[6] = {" Nh﹎ M閏 B礽",	2,	1,	83,		8	},
	[7] = {" V� s� 產o",	2,	1,	173,	8	},
	[8] = {" Чi Cang 產o",	2,	1,	295,	6	},
	[9] = {" R╪g Tinh Tinh",	2,	1,	296,	6	},
	[10] = {" V秠 K� L﹏",	2,	1,	106,	6	},
	[11] = {" Ph� 蕁",		2,	1,	302,	6	},
	[12] = {" Thu鑓 n�",	2,	1,	298,	6	},
	[13] = {" H醓 秐h Th莕 產o",	2,	1,	178,	6	},
	[14] = {" G╪g tay",	2,	1,	303,	6	},
	[15] = {" T祅 ki誱",		2,	1,	299,	6	},
	[16] = {" Linh T秐",		2,	1,	185,	6	},
	[17] = {" У La trng",	2,	1,	305,	6	},
	[18] = {" Linh C莔",		2,	1,	186,	6	},
	[19] = {" Ph藅 Kinh",		2,	1,	304,	6	},
	[20] = {" Linh мch",		2,	1,	187,	6	},
}

g_tbOption = {}

function main()
	if is_mooncake_viet_open() == 0 then
		return
	end
	exchange_confirm()
end

function exchange_confirm()
	local selTab = {
				"T筰 h� mu鑞 i v藅 ph萴 thu th藀 l蕐 t骾 nguy猲 li謚/exchange_talk",
				"Ta ch� n xem th�/no",
				}
	Say(g_szInfoHead.."Ngi tr� mu鑞 c� nguy猲 li謚 l祄 b竛h sao?",getn(selTab),selTab);
end

function exchange_talk()
	if GetLevel() < 60 then
		Say(g_szInfoHead.."Ъng c蕄 kh玭g   i nguy猲 li謚.", 0)
		return
	end
	local i = 0
	local nTableSize = getn(g_tbItem)
	for i = 1, nTableSize do
		g_tbOption[i] = g_tbItem[i][5]..g_tbItem[i][1].." = 1 "..format("Bao nguy猲 li謚/#exchange_prize(%d)", i)
	end
	local selTab = {
				g_tbOption[1],
				g_tbOption[2],
				g_tbOption[3],
				g_tbOption[4],
				g_tbOption[5],
				g_tbOption[6],
				"Xem trang sau/exchange_talk_2",
				"K誸 th骳 i tho筰/no",
				}
	Say(g_szInfoHead.."Ngi tr� mu鑞 i nguy猲 li謚 g� n祇?",getn(selTab),selTab);
end

function exchange_talk_2()
	local selTab = {
				g_tbOption[7],
				g_tbOption[8],
				g_tbOption[9],
				g_tbOption[10],
				g_tbOption[11],
				"Xem trang trc/exchange_talk",
				"Xem trang sau/exchange_talk_3",
				"K誸 th骳 i tho筰/no",
				}
	Say(g_szInfoHead.."Ngi tr� mu鑞 i nguy猲 li謚 g� n祇?",getn(selTab),selTab);
end

function exchange_talk_3()
	local selTab = {
				g_tbOption[12],
				g_tbOption[13],
				g_tbOption[14],
				g_tbOption[15],
				g_tbOption[16],
				"Xem trang trc/exchange_talk_2",
				"Xem trang sau/exchange_talk_4",
				"K誸 th骳 i tho筰/no",
				}
	Say(g_szInfoHead.."Ngi tr� mu鑞 i nguy猲 li謚 g� n祇?",getn(selTab),selTab);
end

function exchange_talk_4()
	local selTab = {
				g_tbOption[17],
				g_tbOption[18],
				g_tbOption[19],
				g_tbOption[20],
				"Xem trang trc/exchange_talk_3",
				"K誸 th骳 i tho筰/no",
				}
	Say(g_szInfoHead.."Ngi tr� mu鑞 i nguy猲 li謚 g� n祇?",getn(selTab),selTab);
end

function exchange_prize(nType)
	local nTableSize = getn(g_tbItem)
	if nType >= 1 and nType <= nTableSize then
		if GetItemCount(g_tbItem[nType][2],g_tbItem[nType][3],g_tbItem[nType][4]) < g_tbItem[nType][5] then
			Say(g_szInfoHead.."V藅 ph萴 "..g_tbItem[nType][1].." h譶h nh� kh玭g  ",1,"Th藅 ng筰 qu�,  ta ki觤 tra l筰!/no");
			return
		else
			if gf_Judge_Room_Weight(1, 20) == 0 then
				Talk(1,"",g_szInfoHead.."Ngi tr� 玬 m nhi襲 qu�. Mau thanh l� h祅h trang 甶!");
				return
			end;
			if DelItem(g_tbItem[nType][2],g_tbItem[nType][3],g_tbItem[nType][4],g_tbItem[nType][5]) == 1 then
				add_item_ex("Bao nguy猲 li謚",2,1,30016,1);
			else
				Say(g_szInfoHead.."Th阨 gian s� d鬾g"..g_tbItem[nType][1].."  H譶h nh� kh玭g  ",1,"Th藅 ng筰 qu�,  ta ki觤 tra l筰!/no");
				return
			end
		end
		
	else
		WriteLog("["..g_szLogTitle.."]: [Account: "..GetAccount().."][Role Name:"..GetName().."] function exchange_prize(nType), parameter nType error, nType = "..nType);
	end
end


function add_item_ex(szItemName, genre, detail, particular, nItemNum)
	local nRetCode = 0;
	nRetCode = AddItem(genre, detail, particular, nItemNum);
	if nRetCode == 1 then
		Msg2Player("B筺 nh薾 頲  "..nItemNum.." c竔 "..szItemName);
		WriteLogEx(szLogTrungThuName,"i nguy猲 li謚",nItemNum,szItemName)
	else
		WriteLog("["..g_szLogTitle.."]: [Account: "..GetAccount().."][Role Name:"..GetName().."] Obtain "..nItemNum.." "..szItemName.." Failed, return value = "..nRetCode);
	end
end

function no()
end

