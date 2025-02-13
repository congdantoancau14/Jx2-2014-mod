--脚本功能：师门相关信息整理
--功能开发：村长
--开发时间：2011-4-2
--修改记录：
Include("\\script\\lib\\globalfunctions.lua")
--门派ID
NFACTIONID_SL = 1
NFACTIONID_WD = 2
NFACTIONID_EM = 3
NFACTIONID_GB = 4
NFACTIONID_TM = 5
NFACTIONID_YM = 6
NFACTIONID_WDU = 7
NFACTIONID_KL = 8
NFACTIONID_MJ = 9
NFACTIONID_CY = 10
--流派ID
NROUTEID_SL = 1
NROUTEID_SLSJ = 2
NROUTEID_SLCS = 3
NROUTEID_SLWS = 4
NROUTEID_TM = 5
NROUTEID_TMRL = 6
NROUTEID_EM = 7
NROUTEID_EMFJ = 8
NROUTEID_EMSJ = 9
NROUTEID_GB = 10
NROUTEID_GBJY = 11
NROUTEID_GBWY = 12
NROUTEID_WD = 13
NROUTEID_WDDJ = 14
NROUTEID_WDSJ = 15
NROUTEID_YM = 16
NROUTEID_YMQQ = 17
NROUTEID_YMGQ = 18
NROUTEID_WDU = 19
NROUTEID_WDUXX = 20
NROUTEID_WDUGS = 21
NROUTEID_KL = 22
NROUTEID_KLTS = 23
NROUTEID_MJ = 24
NROUTEID_MJSZ = 25
NROUTEID_MJZB = 26
NROUTEID_MJXR = 27
NROUTEID_CY = 28
NROUTEID_CYWX = 29
NROUTEID_CYLN = 30
--New
NROUTEID_KLKT = 31
NROUTEID_TMRX = 32
--性别对应称呼
TPLAYER_SEX_NAME = {"Huynh ","C� nng"}

--门派信息总表
TFACTION_INFO = {
	[NFACTIONID_SL] = {
		--门派名称
		sFactionName = "Thi誹 L﹎",
		--商店信息
		tShopId = {44,66,67,68},
	},
	[NFACTIONID_WD] = {
		--门派名称
		sFactionName = "V� ng",
		--商店信息
		tShopId = {46,78,79,80},
	},
	[NFACTIONID_EM] = {
		--门派名称
		sFactionName = "Nga My",
		--商店信息
		tShopId = {45,72,73,74},
	},
	[NFACTIONID_GB] = {
		--门派名称
		sFactionName = "C竔 Bang",
		--商店信息
		tShopId = {47,75,76,77},
	},
	[NFACTIONID_TM] = {
		--门派名称
		sFactionName = "Л阯g M玭",
		--商店信息
		tShopId = {48,69,70,71},
	},
	[NFACTIONID_YM] = {
		--门派名称
		sFactionName = "Dng M玭",
		--商店信息
		tShopId = {51,81,82,83},
	},
	[NFACTIONID_WDU] = {
		--门派名称
		sFactionName = "Ng� чc",
		--商店信息
		tShopId = {55,84,85,86},
	},
	--一下暂未开放
	[NFACTIONID_CY] = {
		--门派名称
		sFactionName = "Th髖 Y猲",
		--商店信息
		tShopId = {120,121,122,123},
	},
	[NFACTIONID_KL] = {
		--门派名称
		sFactionName = "C玭 L玭",
		--商店信息
		tShopId = {112,113,114,115},
	},
	[NFACTIONID_MJ] = {
		--门派名称
		sFactionName = "Minh gi竜",
		--商店信息
		tShopId = {116,117,118,119},
	}
}
--入门派未入流派对应流派
TFACTION_ROUTE = {
	[NFACTIONID_SL]= NROUTEID_SL,
	[NFACTIONID_WD]= NROUTEID_WD,
	[NFACTIONID_EM]= NROUTEID_EM,
	[NFACTIONID_GB]= NROUTEID_GB,
	[NFACTIONID_TM]= NROUTEID_TM,
	[NFACTIONID_YM]= NROUTEID_YM,
	[NFACTIONID_WDU]= NROUTEID_WDU,
	[NFACTIONID_KL]= NROUTEID_KL,
	[NFACTIONID_MJ]= NROUTEID_MJ,
	[NFACTIONID_CY]= NROUTEID_CY,
}
--==========师门装备相关
TFACTION_EQUIP_INFO = {
	--师门第一套
	[40] = {
		--少林
		[NROUTEID_SL] = {},
		--少林俗家
		[NROUTEID_SLSJ] = {
			{
				{"H祅h Gi� m穙",0,103,201},
				{"H祅h Gi� ph鬰",0,100,201},
				{"H祅h Gi� trang",0,101,201},
				{"H祅h Gi� Gi韎 產o",0,3,201},
				{"H祅h Gi� Gi韎 c玭",0,5,201},
			},
			{
				{"H祅h Gi� m穙",0,103,202},
				{"H祅h Gi� ph鬰",0,100,202},
				{"H祅h Gi� trang",0,101,202},
				{"H祅h Gi� Gi韎 產o",0,3,202},
				{"H祅h Gi� Gi韎 c玭",0,5,202},
			},
		},
		--少林禅僧
		[NROUTEID_SLCS] = {
			{
				{"Kh� H祅h m穙",0,103,301},
				{"Kh� H祅h b祇",0,100,301},
				{"Kh� H祅h ph鬰",0,101,301},
				{"Kh� H祅h Trng",0,8,301},
			},
			{
				{"Kh� H祅h m穙",0,103,302},
				{"Kh� H祅h b祇",0,100,302},
				{"Kh� H祅h ph鬰",0,101,302},
				{"Kh� H祅h Trng",0,8,302},
			},
		},
		--少林武僧
		[NROUTEID_SLWS] = {
			{
				{"Sa Di m穙",0,103,401},
				{"Sa Di Ph鬰",0,100,401},
				{"Sa Di ph鬰",0,101,401},
				{"Sa Di H� Uy觧",0,0,401},
			},
			{
				{"Sa Di m穙",0,103,402},
				{"Sa Di Ph鬰",0,100,402},
				{"Sa Di ph鬰",0,101,402},
				{"Sa Di H� Uy觧",0,0,402},
			},
		},
		--唐门
		[NROUTEID_TM] = {},
		--唐门
		[NROUTEID_TMRL] = {
			{
				{"Trang Kh竎h m穙",0,103,601},
				{"Trang kh竎h ph鬰",0,100,601},
				{"Trang Kh竎h ph鬰",0,101,601},
				{"Trang Kh竎h Phi o",0,1,601},
			},
			{
				{"Trang Kh竎h m穙",0,103,602},
				{"Trang kh竎h ph鬰",0,100,602},
				{"Trang Kh竎h ph鬰",0,101,602},
				{"Trang Kh竎h Phi o",0,1,602},
			},
			{
				{"Trang Kh竎h m穙",0,103,603},
				{"Trang kh竎h ph鬰",0,100,603},
				{"Trang Kh竎h ph鬰",0,101,603},
				{"Trang Kh竎h Phi o",0,1,603},
			},
			{
				{"Trang Kh竎h m穙",0,103,604},
				{"Trang kh竎h ph鬰",0,100,604},
				{"Trang Kh竎h ph鬰",0,101,604},
				{"Trang Kh竎h Phi o",0,1,604},
			},
		},
		[NROUTEID_TMRX] = {
			
		},
		---峨嵋
		[NROUTEID_EM] = {},
		--峨嵋佛家
		[NROUTEID_EMFJ] = {	{},{},
			{
				{"Thanh T﹎",0,103,801},
				{"Thanh T﹎ t� y",0,100,801},
				{"Thanh T﹎ t� trang",0,101,801},
				{"Thanh T﹎ T� Ki誱",0,2,801},
			},
			{
				{"Thanh T﹎",0,103,802},
				{"Thanh T﹎ t� y",0,100,802},
				{"Thanh T﹎ t� trang",0,101,802},
				{"Thanh T﹎ T� Ki誱",0,2,802},
			},
		},
		--峨嵋俗家
		[NROUTEID_EMSJ] = {	{},{},
			{
				{"T� Kh骳",0,103,901},
				{"T� Kh骳 t� y",0,100,901},
				{"T� Kh骳 ph鬰",0,101,901},
				{"T� Kh骳 T� C莔",0,10,901},
			},
			{
				{"T� Kh骳",0,103,902},
				{"T� Kh骳 t� y",0,100,902},
				{"T� Kh骳 ph鬰",0,101,902},
				{"T� Kh骳 T� C莔",0,10,902},
			},
		},
		--丐帮
		[NROUTEID_GB] = {},
		--丐帮净衣
		[NROUTEID_GBJY] = {
			{
				{"Ch蕄 B竧 c﹏",0,103,1101},
				{"Ch蕄 B竧 Thng",0,100,1101},
				{"Ch蕄 B竧 ph鬰",0,101,1101},
				{"B竧 s�",0,0,1101},
			},
			{
				{"Ch蕄 B竧 c﹏",0,103,1102},
				{"Ch蕄 B竧 Thng",0,100,1102},
				{"Ch蕄 B竧 ph鬰",0,101,1102},
				{"B竧 s�",0,0,1102},
			},
			{
				{"Ch蕄 B竧 c﹏",0,103,1103},
				{"Ch蕄 B竧 Thng",0,100,1103},
				{"Ch蕄 B竧 ph鬰",0,101,1103},
				{"B竧 s�",0,0,1103},
			},
			{
				{"Ch蕄 B竧 c﹏",0,103,1104},
				{"Ch蕄 B竧 Thng",0,100,1104},
				{"Ch蕄 B竧 ph鬰",0,101,1104},
				{"B竧 s�",0,0,1104},
			},
		},
		--丐帮污衣
		[NROUTEID_GBWY] = {
			{
				{"Khi誹 Hoa c﹏",0,103,1201},
				{"Khi誹 Hoa y",0,100,1201},
				{"Khi誹 Hoa Kh�",0,101,1201},
				{"Khi誹 Hoa B鎛g",0,5,1201},
			},
			{
				{"Khi誹 Hoa c﹏",0,103,1202},
				{"Khi誹 Hoa y",0,100,1202},
				{"Khi誹 Hoa Kh�",0,101,1202},
				{"Khi誹 Hoa B鎛g",0,5,1202},
			},
			{
				{"Khi誹 Hoa c﹏",0,103,1203},
				{"Khi誹 Hoa y",0,100,1203},
				{"Khi誹 Hoa Kh�",0,101,1203},
				{"Khi誹 Hoa B鎛g",0,5,1203},
			},
			{
				{"Khi誹 Hoa c﹏",0,103,1204},
				{"Khi誹 Hoa y",0,100,1204},
				{"Khi誹 Hoa Kh�",0,101,1204},
				{"Khi誹 Hoa B鎛g",0,5,1204},
			},
		},
		--武当
		[NROUTEID_WD] = {},
		--武当道家
		[NROUTEID_WDDJ] = {
			{
				{"Thanh Tu c﹏",0,103,1401},
				{"Thanh Tu b祇",0,100,1401},
				{"Thanh Tu ph鬰",0,101,1401},
				{"Thanh Tu Ki誱",0,2,1401},
			},
			{
				{"Thanh Tu c﹏",0,103,1402},
				{"Thanh Tu b祇",0,100,1402},
				{"Thanh Tu ph鬰",0,101,1402},
				{"Thanh Tu Ki誱",0,2,1402},
			},
			{
				{"Thanh Tu c﹏",0,103,1403},
				{"Thanh Tu b祇",0,100,1403},
				{"Thanh Tu ph鬰",0,101,1403},
				{"Thanh Tu Ki誱",0,2,1403},
			},
			{
				{"Thanh Tu c﹏",0,103,1404},
				{"Thanh Tu b祇",0,100,1404},
				{"Thanh Tu ph鬰",0,101,1404},
				{"Thanh Tu Ki誱",0,2,1404},
			},
		},
		--武当俗家
		[NROUTEID_WDSJ] = {
			{
				{"Thanh Phong c﹏",0,103,1501},
				{"Thanh Phong b祇",0,100,1501},
				{"Thanh Phong ph鬰",0,101,1501},
				{"Thanh Phong Th輈h",0,9,1501},
			},
			{
				{"Thanh Phong c﹏",0,103,1502},
				{"Thanh Phong b祇",0,100,1502},
				{"Thanh Phong ph鬰",0,101,1502},
				{"Thanh Phong Th輈h",0,9,1502},
			},
			{
				{"Thanh Phong c﹏",0,103,1503},
				{"Thanh Phong b祇",0,100,1503},
				{"Thanh Phong ph鬰",0,101,1503},
				{"Thanh Phong Th輈h",0,9,1503},
			},
			{
				{"Thanh Phong c﹏",0,103,1504},
				{"Thanh Phong b祇",0,100,1504},
				{"Thanh Phong ph鬰",0,101,1504},
				{"Thanh Phong Th輈h",0,9,1504},
			},
		},
		--杨门
		[NROUTEID_YM] = {},
		--杨门枪骑
		[NROUTEID_YMQQ] = {
			{
				{"Khinh K� kh玦",0,103,1701},
				{"Khinh K� gi竝",0,100,1701},
				{"Khinh K� ph鬰",0,101,1701},
				{"Khinh K� Thng",0,6,1701},
			},
			{
				{"Khinh K� kh玦",0,103,1702},
				{"Khinh K� gi竝",0,100,1702},
				{"Khinh K� ph鬰",0,101,1702},
				{"Khinh K� Thng",0,6,1702},
			},
			{
				{"Khinh K� kh玦",0,103,1703},
				{"Khinh K� gi竝",0,100,1703},
				{"Khinh K� ph鬰",0,101,1703},
				{"Khinh K� Thng",0,6,1703},
			},
			{
				{"Khinh K� kh玦",0,103,1704},
				{"Khinh K� gi竝",0,100,1704},
				{"Khinh K� ph鬰",0,101,1704},
				{"Khinh K� Thng",0,6,1704},
			},
		},
		--杨门弓骑
		[NROUTEID_YMGQ] = {
			{
				{"N� Th� kh玦",0,103,1801},
				{"N� th� gi竝",0,100,1801},
				{"N� Th� ph鬰",0,101,1801},
				{"N� Th� Cung",0,4,1801},
			},
			{
				{"N� Th� kh玦",0,103,1802},
				{"N� th� gi竝",0,100,1802},
				{"N� Th� ph鬰",0,101,1802},
				{"N� Th� Cung",0,4,1802},
			},
			{
				{"N� Th� kh玦",0,103,1803},
				{"N� th� gi竝",0,100,1803},
				{"N� Th� ph鬰",0,101,1803},
				{"N� Th� Cung",0,4,1803},
			},
			{
				{"N� Th� kh玦",0,103,1804},
				{"N� th� gi竝",0,100,1804},
				{"N� Th� ph鬰",0,101,1804},
				{"N� Th� Cung",0,4,1804},
			},
		},
		--五毒
		[NROUTEID_WDU] = {},
		--五毒邪侠
		[NROUTEID_WDUXX] = {
			{
				{"箃 Ph竎h di謓",0,103,2001},
				{"箃 Ph竎h y",0,100,2001},
				{"箃 Ph竎h ph鬰",0,101,2001},
				{"箃 Ph竎h 產o",0,7,2001},
			},
			{
				{"箃 Ph竎h di謓",0,103,2002},
				{"箃 Ph竎h y",0,100,2002},
				{"箃 Ph竎h ph鬰",0,101,2002},
				{"箃 Ph竎h 產o",0,7,2002},
			},
			{
				{"箃 Ph竎h di謓",0,103,2003},
				{"箃 Ph竎h y",0,100,2003},
				{"箃 Ph竎h ph鬰",0,101,2003},
				{"箃 Ph竎h 產o",0,7,2003},
			},
			{
				{"箃 Ph竎h di謓",0,103,2004},
				{"箃 Ph竎h y",0,100,2004},
				{"箃 Ph竎h ph鬰",0,101,2004},
				{"箃 Ph竎h 產o",0,7,2004},
			},
		},
		--五毒蛊师
		[NROUTEID_WDUGS] = {
			{
				{"чc T祄 di謓",0,103,2101},
				{"чc T祄 Y",0,100,2101},
				{"чc T祄 ph鬰",0,101,2101},
				{"чc T祄 Tr秓",0,11,2101},
			},
			{
				{"чc T祄 di謓",0,103,2102},
				{"чc T祄 Y",0,100,2102},
				{"чc T祄 ph鬰",0,101,2102},
				{"чc T祄 Tr秓",0,11,2102},
			},
			{
				{"чc T祄 di謓",0,103,2103},
				{"чc T祄 Y",0,100,2103},
				{"чc T祄 ph鬰",0,101,2103},
				{"чc T祄 Tr秓",0,11,2103},
			},
			{
				{"чc T祄 di謓",0,103,2104},
				{"чc T祄 Y",0,100,2104},
				{"чc T祄 ph鬰",0,101,2104},
				{"чc T祄 Tr秓",0,11,2104},
			},
		}
	},
	--师门第二套暂时未整理
	--师门第三套暂时未整理

}
--师门装备增加
--备注：1、player_way：玩家路线;2、palyer_body：玩家体型;3、att_num：给装备的数量：（40-45为40级）40为给师门全套，41为头，42为衣服，43为鞋子，44为武器
--(60-65为60级)60为给师门全套，61为头，62为衣服，63为鞋子，64为武器，65为首饰;4、knife_rung：少林俗家给刀还是棍子：0为全给，4为刀，5为棍子
function Add_Faction_Equipment(player_way,palyer_body,att_num,knife_rung)
	knife_rung = knife_rung or 0
	local att_level = (floor(att_num/10)) * 10
	local att_seq = att_num - att_level
	local add_flag = 0						--增加标志
	if att_seq == 0 then					--加全套的处理
		if player_way ~= 2 or (player_way == 2 and knife_rung == 0) then		--非俗少或俗少加全套
			for i = 1, getn(TFACTION_EQUIP_INFO[att_level][player_way][palyer_body]) do
				add_flag = add_flag * AddItem(TFACTION_EQUIP_INFO[att_level][player_way][palyer_body][i][2],TFACTION_EQUIP_INFO[att_level][player_way][palyer_body][i][3],TFACTION_EQUIP_INFO[att_level][player_way][palyer_body][i][4],1,1,-1,-1,-1,-1,-1,-1)
			end
		elseif player_way == 2 and knife_rung == 4 then						--加刀
			for i = 1, (getn(TFACTION_EQUIP_INFO[att_level][player_way][palyer_body])-1) do
				add_flag = add_flag * AddItem(TFACTION_EQUIP_INFO[att_level][player_way][palyer_body][i][2],TFACTION_EQUIP_INFO[att_level][player_way][palyer_body][i][3],TFACTION_EQUIP_INFO[att_level][player_way][palyer_body][i][4],1,1,-1,-1,-1,-1,-1,-1)
			end
		elseif player_way == 2 and knife_rung == 5 then						--加棍
			for i = 1, (getn(TFACTION_EQUIP_INFO[att_level][player_way][palyer_body])-2) do
				add_flag = add_flag * AddItem(TFACTION_EQUIP_INFO[att_level][player_way][palyer_body][i][2],TFACTION_EQUIP_INFO[att_level][player_way][palyer_body][i][3],TFACTION_EQUIP_INFO[att_level][player_way][palyer_body][i][4],1,1,-1,-1,-1,-1,-1,-1)
			end
			add_flag = add_flag * AddItem(TFACTION_EQUIP_INFO[att_level][player_way][palyer_body][5][2],TFACTION_EQUIP_INFO[att_level][player_way][palyer_body][5][3],TFACTION_EQUIP_INFO[att_level][player_way][palyer_body][5][4],1,1,-1,-1,-1,-1,-1,-1)
		end
	else
		if player_way == 2 and att_seq == 4 then
			att_seq = knife_rung
		end
		add_flag = add_flag * AddItem(TFACTION_EQUIP_INFO[att_level][player_way][palyer_body][att_seq][2],TFACTION_EQUIP_INFO[att_level][player_way][palyer_body][att_seq][3],TFACTION_EQUIP_INFO[att_level][player_way][palyer_body][att_seq][4],1,1,-1,-1,-1,-1,-1,-1)
	end
	return add_flag
end
--==========师门对话相关
TFACTION_NPC_STRING = {}
TROUTE_MASTER_STRING = {
	[NROUTEID_SLSJ] = {
		MainDia = "",
	},
}
TROUTE_OTHER_STRING = {
	SkillLearn = {
		[1] = "",
		[2] = "",
		[3] = "",
		[4] = "",
		[5] = "",
		[6] = "",
	},
	MainDiaSel = {
		[1] = "",
		[2] = "",
		[3] = "",
		[4] = "",
	},
}
