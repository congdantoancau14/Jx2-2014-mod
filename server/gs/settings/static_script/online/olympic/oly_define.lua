--数据定义

--szLogTitle = "奥运活动";
--szLogTitle = "重燃圣火活动";
szLogTitle = "Ho箃 ng Th竛h H醓 Уn"

Flame_Table = {
	{2,1,30750,1,"H錸g S綾 Th竛h H醓 Th筩h"},
	{2,1,30751,1,"L鬰 S綾 Th竛h H醓 Th筩h"},
	{2,1,30749,1,"Ho祅g S綾 Th竛h H醓 Th筩h"},
	{2,1,30752,1,"Lam S綾 Th竛h H醓 Th筩h"},
	{2,1,30748,1,"H綾 S綾 Th竛h H醓 Th筩h"},
}

WuCai_Shenshi = {2,1,30403,1,"Ng� Th竔 Th莕 Th筩h"};
WuCai_ShenHuoZhong = {2,1,30753,1,"Ng� S綾 Th竛h H醓 Th筩h"}

Compose_ShengHuo_Num_1 = 5; --1个圣火石
Compose_ShenShi_Num_1 = 1; --1个五彩神石

Compose_ShengHuo_Num_2 = 9; --9个圣火石
Compose_Coin_Num_2 = 50; --金

OLY_IB_FIRE_MAX_NUM = 30;--最大点火次数

Guess_Flag = 99; --猜对数字标识值
OLY_MAX_RAND = 100; --random最大值
OLY_MAX_GUESS = 5; --最大猜数字次数
OLY_MAX_AWARD_NUM = 3; --奖励次数

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
OLY_SHARE_STRING = "aok"
OLY_SHARE_ITEM = "ok"
OLY_SHARE_KEY1 = "key1_201412"
OLY_SHARE_KEY2 = "key2_201412"
OLY_SHARE_KEY3 = "key3_201412"

--记录发出的天罡令数目
Oly_Record = {
	szKey = OLY_SHARE_STRING..OLY_SHARE_KEY1,
	nKey1 = 0,
	nKey2 = 0,
	nSortType = 0,
	itemkey = OLY_SHARE_ITEM..OLY_SHARE_KEY1,
}
--Relay生成随机幸运数字
Oly_Record2 = {
	szKey = OLY_SHARE_STRING..OLY_SHARE_KEY2,
	nKey1 = 0,
	nKey2 = 0,
	nSortType = 0,
	itemkey = OLY_SHARE_ITEM..OLY_SHARE_KEY2,
}
--记录幸运数字中奖人数
Oly_Record3 = {
	szKey = OLY_SHARE_STRING..OLY_SHARE_KEY3,
	nKey1 = 0,
	nKey2 = 0,
	nSortType = 0,
	itemkey = OLY_SHARE_ITEM..OLY_SHARE_KEY3,
}

--最大登记数目
MAX_WIN_NUM = 10;

--天罡碎片兑换天罡令
OLY_EXCHANGE_BASE = 1000;

--
OLY_EXP_2 = 666000;
OLY_EXP_3 = 999000;


