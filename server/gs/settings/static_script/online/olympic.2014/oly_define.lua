--数据定义

--szLogTitle = "奥运活动";
szLogTitle = "Ho箃 ng Th竛h H醓";

Flame_Table = {
	{2,1,30397,1,"H錸g S綾 Th竛h H醓"},
	{2,1,30398,1,"L鬰 S綾 Th竛h H醓"},
	{2,1,30399,1,"Ho祅g S綾 Th竛h H醓"},
	{2,1,30400,1,"Lam S綾 Th竛h H醓"},
	{2,1,30401,1,"H綾 S綾 Th竛h H醓"},
}

WuCai_Shenshi = {2,1,30403,1,"Ng� Th竔 Th莕 Th筩h"};

Compose_ShengHuo_Num_1 = 1; --1个圣火
Compose_ShenShi_Num_1 = 1; --1个五彩神石

Compose_ShengHuo_Num_2 = 9; --9个圣火
Compose_Coin_Num_2 = 30; --30金

OLY_IB_FIRE_MAX_NUM = 200;--最大点火次数

Guess_Flag = 99; --猜对数字标识值
OLY_MAX_RAND = 100; --random最大值
OLY_MAX_GUESS = 5; --最大猜数字次数
OLY_MAX_AWARD_NUM = 3; --奖励次数

--Relay共享数据结构
--记录发出的天罡令数目
--Oly_Record = {
--	szKey = "activity_oly",
--	nKey1 = 0,
--	nKey2 = 0,
--	nSortType = 0,
--	itemkey = "oly_key",
--}
Oly_Record = {
	szKey = "activity_oly_2013",
	nKey1 = 0,
	nKey2 = 0,
	nSortType = 0,
	itemkey = "oly_key_2013",
}

--记录天罡里数目
Glb_Oly_TGL_NUM = 2016;

--幸运数字时间段s
OLY_TIME_START = 21 * 3600;
OLY_TIME_MID = OLY_TIME_START + 1800;
OLY_TIME_END = OLY_TIME_START + 3600;
OLY_MAX_LUCK_NUM = 9999; --最大输入幸运数

--记录当天21点relay生成的幸运数
Glb_Oly_Luck_NUM = 2017;

--Relay共享数据结构
--Relay生成随机幸运数字
Oly_Record2 = {
	szKey = "activity_oly2",
	nKey1 = 0,
	nKey2 = 0,
	nSortType = 0,
	itemkey = "oly_key2",
}

--记录幸运数字中奖人数
Oly_Record3 = {
	szKey = "activity_oly3",
	nKey1 = 0,
	nKey2 = 0,
	nSortType = 0,
	itemkey = "oly_key3",
}

--最大登记数目
MAX_WIN_NUM = 10;

--天罡碎片兑换天罡令
OLY_EXCHANGE_BASE = 1000;

--
OLY_EXP_2 = 300000;
OLY_EXP_3 = 500000;


