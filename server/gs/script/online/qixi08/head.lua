
DEBUG_VERSION = 0;	--1表示调试版本，0表示外网发布版本
IB_VERSION = 1		--1表示是免费区，0表示收费区
--============================================================================
g_szInfoHead = "<color=green>c s� Чi H閕 V� l﹎<color>:"
--============================================================================
GAME_ID_GUESS = 1;	--游戏ID
GAME_ID_BOX = 2;
GAME_ID_LIGHT = 3;
--============================================================================
g_tbGameName = 
{
	[GAME_ID_GUESS] = "Thi猲 C� Th莕 To竛",
	[GAME_ID_BOX] = "箃 B秓 K� Binh",
	[GAME_ID_LIGHT] = "觤 Жng H閕",
}
--============================================================================
g_tbGameSchedule =
{
	[0] = {"觤 Жng H閕",GAME_ID_LIGHT},
	[1] = {"Thi猲 C� Th莕 To竛",GAME_ID_GUESS},
	[2] = {"箃 B秓 K� Binh",GAME_ID_BOX},
	[3] = {"Thi猲 C� Th莕 To竛",GAME_ID_GUESS},
	[4] = {"箃 B秓 K� Binh",GAME_ID_BOX},
	[5] = {"Thi猲 C� Th莕 To竛",GAME_ID_GUESS},
	[6] = {"箃 B秓 K� Binh",GAME_ID_BOX},
}
--============================================================================
g_nGameBeginDate = 20081113;	--三大游戏开始时间
g_nGameEndDate = 20490107;		--三大游戏结束时间
g_nAwardEndDate = 20490114;		--积分换奖励结束时间
g_nQiXiBeginDate = 20080807;	--七夕活动开始时间
g_nQiXiEndDate = 20480809;		--七夕活动结束时间
g_nEquipPoint = 20;				--25积分换一件装备
g_nJifenMax = 200;        --最多累积200积分
g_nExpNum = 21;				--每周换取的经验次数
g_nBoxNum = 100;      --宝箱经验只能获得这个次数

g_nYearsBeginDate = 20081118;  --二十周年庆称号领取开始时间
g_nYearsEndDate = 20481124;    --称号领取结束时间
g_nYearsDays = 7;              --经验持续时间：天
g_nYearsExpNums = 60;          --每天起效经验次数：次

--============================================================================
g_tbAward = 	--奖励信息
{--奖励级别   收费    	免费
--		健康经验,经验 	经验 单位：万  宝石包裹数量 积分
	[1] = {{400,200},	{500},			6,			5},
	[2] = {{400,100},	{420},			5,			4},
	[3] = {{350,100},	{380},			4,			3},
	[4] = {{300,100},	{350},			3,			2},
	[5] = {{250,100},	{300},			2,			1},
}
g_tbTitleName = 
{
	[GAME_ID_GUESS] = "Thi猲 C� Th莕 To竛",
	[GAME_ID_BOX] = "箃 B秓 K� Binh",
	[GAME_ID_LIGHT] = "Hoa ng vng",
};
--任务变量1986-1987=====================================================================
TSK_WEAPON_TYPE = 1987;					--给万恶的少林俗家用了。记录选择的是刀还是棍
TSK_AOYUN_GET_TICKET_DATE = 1989;		--记录领取免费门票的日期
TSK_AOYUN_POINT = 1351;					--记录活动积分
TSK_AOYUN_AWARD_WEEK = 1361;      --记录周的序数
TSK_AOYUN_EXP_NUM = 1353;         --换取经验的次数 每周一清
TSK_AOYUN_BOX_NUM = 1354;         --宝箱开启经验次数
TSK_AOYUN_YI_EXP = 1355;          --1亿经验每周只能1次
TSK_YEARS_BEGIN_DATE = 1357;      --二十周年庆称号领取开始时间 
TSK_YEARS_END_DATE = 1358;        --二十周年庆称号领取结束时间
TSK_YEARS_EXP_DATE = 1359;        --当天是否领满了经验
TSK_YEARS_EXP_NUM = 1360;         --当天给了多少次经验

tJifenAward = {
	[10] = {"Rng k� ni謒 20 n╩",2,0,1085,1,2000000},
	[50] = {"Rng k� ni謒 20 n╩",2,0,1085,8,5000000},
	[200] = {"Rng k� ni謒 20 n╩",2,0,1085,35,10000000}
};

tMijiName = {
		{"T� Linh Chi課 � Ph�",0,107,159},
		{"T� Linh Thi猲 � Ph�",0,107,160},
		{"T� Linh T� � Ph�",0,107,161}
};

tGaojiMiji = {
	[0] = {{"Kim Cang B竧 Nh� Kinh",0,107,166},{"V� Tr莕 B� б Kinh",0,107,168},{"Ti襪 Long T辌h Di謙 Kinh",0,107,167},{"Thi猲 La Li猲 Ch﹗ L鬰",0,107,169},{"Nh� � Kim жnh M藅 T辌h",0,107,170},{"B輈h H秈 Tuy謙  Ph�",0,107,171},{"H鏽 чn Tr蕁 Nh筩 M藅 T辌h",0,107,172},{"Qu� Thi猲 Du Long M藅 T辌h",0,107,173},{"Huy詎 秐h M� Tung M藅 T辌h",0,107,174},{"Qu﹏ T� Ti謙 Phong M藅 T辌h",0,107,175},{"Tr蕁 Qu﹏ Phi Long Thng Ph�",0,107,176},{"Xuy猲 V﹏ L筩 H錸g M藅 T辌h",0,107,177},{"U Minh Phong Ma L鬰",0,107,178},{"Linh C� Huy詎 T� L鬰",0,107,179}},
	[1] = {{"Kim Cang B竧 Nh� Kinh",0,107,166},{"V� Tr莕 B� б Kinh",0,107,168},{"Ti襪 Long T辌h Di謙 Kinh",0,107,167}},
	[2] = {{"Kim Cang B竧 Nh� Kinh",0,107,166}},
	[3] = {{"V� Tr莕 B� б Kinh",0,107,168}},
	[4] = {{"Ti襪 Long T辌h Di謙 Kinh",0,107,167}},
	[5] = {{"Thi猲 La Li猲 Ch﹗ L鬰",0,107,169}},
	[6] = {{"Thi猲 La Li猲 Ch﹗ L鬰",0,107,169}},
	[7] = {{"Nh� � Kim жnh M藅 T辌h",0,107,170},{"B輈h H秈 Tuy謙  Ph�",0,107,171}},
	[8] = {{"Nh� � Kim жnh M藅 T辌h",0,107,170}},
	[9] = {{"B輈h H秈 Tuy謙  Ph�",0,107,171}},
	[10] = {{"H鏽 чn Tr蕁 Nh筩 M藅 T辌h",0,107,172},{"Qu� Thi猲 Du Long M藅 T辌h",0,107,173}},
	[11] = {{"H鏽 чn Tr蕁 Nh筩 M藅 T辌h",0,107,172}},
	[12] = {{"Qu� Thi猲 Du Long M藅 T辌h",0,107,173}},
	[13] = {{"Huy詎 秐h M� Tung M藅 T辌h",0,107,174},{"Qu﹏ T� Ti謙 Phong M藅 T辌h",0,107,175}},
	[14] = {{"Huy詎 秐h M� Tung M藅 T辌h",0,107,174}},
	[15] = {{"Qu﹏ T� Ti謙 Phong M藅 T辌h",0,107,175}},
	[16] = {{"Tr蕁 Qu﹏ Phi Long Thng Ph�",0,107,176},{"Xuy猲 V﹏ L筩 H錸g M藅 T辌h",0,107,177}},
	[17] = {{"Tr蕁 Qu﹏ Phi Long Thng Ph�",0,107,176}},
	[18] = {{"Xuy猲 V﹏ L筩 H錸g M藅 T辌h",0,107,177}},
	[19] = {{"U Minh Phong Ma L鬰",0,107,178},{"Linh C� Huy詎 T� L鬰",0,107,179}},
	[20] = {{"U Minh Phong Ma L鬰",0,107,178}},
	[21] = {{"Linh C� Huy詎 T� L鬰",0,107,179}},
	[23] = {{"C鰑 Thi猲 Phong L玦 Quy誸",0,107,198}},	
	[29] = {{"H錸g Tr莕 T髖 M閚g Ph�",0,107,202}},
	[30] = {{"Phong Hoa Thi猲 Di謕 Ph�",0,107,203}},	
};

tItemName = {
	{"B筩h Ngh躠",0,105,49},
	{"Hi謕 D鵦",0,105,50},
	{"Chi課 M� Nguy猲 So竔 cao c蕄 (tr緉g)",0,105,51},
	{"Chi課 M� Nguy猲 So竔 cao c蕄 (甧n)",0,105,52},
	{"Thi猲 Qu竔 Th筩h",2,0,1084},
	{"Rng k� ni謒 20 n╩",2,0,1085},
	{"Ch譨 kh鉧 ng k� ni謒",2,0,1086},
	{"Ch譨 kh鉧 b筩 k� ni謒",2,0,1087},
	{"Ch譨 kh鉧 v祅g k� ni謒",2,0,1088},
	{"T輈h l騳 b礽",2,0,1089},
	{"Hng d蒼 ho箃 ng k� ni謒 20 n╩",2,0,1090},
	{"мnh H錸 Thi猲 Th筩h Th莕 Th筩h",2,1,1067},
	{"Thi猲 Th筩h linh th筩h",2,1,1068},
	{"M秐h Thi猲 th筩h",2,2,7},
	{"Thi猲 th筩h",2,2,8},
	{"Huy Ho祅g Chi Th駓",0,102,8840},
	{"Vinh D� Chi Th駓",0,102,8841}
};

tAwardGailvIB = { --免费
	{12,120,30,12,30,6},
	{60,600,150,60,150,30},
	{1200,10000,3000,1200,3000,600}
};

tAwardGailv = { --收费
	{12,120,30,12,60,6},
	{60,600,150,60,300,30},
	{1200,10000,3000,1200,6000,600}
};

tYearsExp = {--每次给予的最多经验，传入IB_VERSION为索引
	[0] = {1420226},
	[1] = {676188}
};
