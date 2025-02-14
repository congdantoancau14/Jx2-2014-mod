Include("\\script\\online_activites\\task_values.lua")
Include("\\script\\missions\\liangshan\\string_liangshan.lua")
Include("\\script\\lib\\globalfunctions.lua");
--2011008中秋活动
Include("\\script\\online_activites\\award.lua")

--201207奥运活动
Include("\\script\\online\\olympic\\oly_head.lua")

--追回字帖大作战
Include("\\script\\online\\dazitie\\dzt_head.lua")

Include("\\script\\missions\\liangshan\\runtime_data_stat.lua")
Include("\\script\\missions\\liangshan\\npc\\box_jingli.lua")

Include("\\script\\ks2vng\\missions\\mission_award_add_rate_cfg.lua")

--=================

LS_EXP_ADD_RATE = min(VNG_CFG_LS_EXP_EXT_ADD_RATE or 0, 2) --经验加成系数
T_ROUTE_CNT_EXP_ADD_RATE = {
	0,0,0,0,0.2,0.4,0.6,1
}
function getRouteCount()
	local tRoute = {}
	local nRouteCnt = 0
	local OldPlayerIndex = PlayerIndex;
	for i = 1, GetTeamSize() do
		PlayerIndex = GetTeamMember(i);
		if PlayerIndex > 0 then
			local nRoute = GetPlayerRoute();
			if not tRoute[nRoute] then
				tRoute[nRoute] = 1
				nRouteCnt = nRouteCnt + 1
			end
		end
	end
	PlayerIndex = OldPlayerIndex
	return nRouteCnt
end
--每关经验奖励
T_LS_AWARD_EXP_STAGE = {
	[1] = 2000000,
	[2] = 2500000,
	[3] = 3000000,
	[4] = 3500000,
	[5] = 4000000,
	[6] = 4000000,
	[7] = 4000000,
	[8] = 4500000,
}

--===村长：2011-2-18增加配置文件相关操作
Include("\\script\\class\\ktabfile.lua")
LUONGSON_LOG_TITLE = "Vuot ai Luong Son Bac"
--配置文件信息
SZ_INI_FILE_WAY = "\\settings\\missions\\liangshan\\liangshan.ini"
g_objLSRule = ff_GetIniFileObj(SZ_INI_FILE_WAY)
if g_objLSRule:Open() ~= 1 then
	gf_WriteLog("SystemError","load ini file error! file path:"..SZ_INI_FILE_WAY)
end
--关键字信息
IniPosKey="pos_info"				--取坐标配置的关键字
IniLoginQuanliKey="login_quanli"	--闯关条件关键字
IniItemKey="item_info"				--物品信息
IniMissionKey="mission_info"		--关卡关键字信息
IniStage1Key="stage1_rule"			--关卡规则关键字
IniPrizeChgKey="prize_change"		--奖励兑换规则
--数据整理信息
NTeamMemberMin = g_objLSRule:GetNum(IniLoginQuanliKey,"TeamMemberMin")
NPlayerLevelMin = g_objLSRule:GetNum(IniLoginQuanliKey,"PlayerLevelMin")
TTGLInfo = g_objLSRule:GetMixTable(IniItemKey,"TianGangLing")
TJYLInfo = g_objLSRule:GetMixTable(IniItemKey,"JuYiLing")
LSTaskBag1 = g_objLSRule:GetMixTable(IniItemKey,"LsPrizeBag1")
LSTaskBag2 = g_objLSRule:GetMixTable(IniItemKey,"LsPrizeBag2")
LSTaskBag3 = g_objLSRule:GetMixTable(IniItemKey,"LsPrizeBag3")
TStageBaseInfo =g_objLSRule:GetNumTable(IniPosKey,"StageBasePos")
	--五行玄石物品信息
LsPrizeWXXS = g_objLSRule:GetMixTable(IniItemKey,"LsPrizeWXXS")
	--物品兑换信息
TJiuzhouChgInfo = g_objLSRule:GetMixTable(IniPrizeChgKey,"JiuzhouSets")
TXuanyuanChgInfo = g_objLSRule:GetMixTable(IniPrizeChgKey,"XuanyuanSets")
TOthersChgInfo = {
	g_objLSRule:GetMixTable(IniPrizeChgKey,"OtherItems1"),
	g_objLSRule:GetMixTable(IniPrizeChgKey,"OtherItems2"),
}
nWXXSGetEveryDayMax = g_objLSRule:GetNum(IniPrizeChgKey,"WXXSGetEveryDayMax")
--===end
g_RealMapId = 6007;		--原地图id
MISSION_ID	= 55;		--MISSION_ID需要更改
TIMER_ID	= 85;		--触发器ID
ALL_CAMP	= 0;
DAY_SECOND_NUM = 24*3600

--登陆关卡坐标
entryPos = g_objLSRule:GetNumTable(IniPosKey,"EnterMsPos")
--离开关卡坐标
local LeavePos = g_objLSRule:GetNumTable(IniPosKey,"LeaveMsPos")
returnPos = {
	[LeavePos[1][1]] = {LeavePos[1][2], LeavePos[1][3]},
	[LeavePos[2][1]] = {LeavePos[2][2], LeavePos[2][3]},
	[LeavePos[3][1]] = {LeavePos[3][2], LeavePos[3][3]},
}
--九州装备
TJiuzhouHead = {
	{
		{"Long Щng T� H秈 Qu竛",0,103,3056,0},{"Long Щng T� H秈 Qu竛",0,103,3057,0},{"Long Щng T� H秈 Qu竛",0,103,3058,0},{"Long Щng T� H秈 Qu竛",0,103,3059,0}
	},{
		{"Ph鬾g V� C鰑 Thi猲 Qu竛",0,103,3060,0},{"Ph鬾g V� C鰑 Thi猲 Qu竛",0,103,3061,0},{"Ph鬾g V� C鰑 Thi猲 Qu竛",0,103,3062,0},{"Ph鬾g V� C鰑 Thi猲 Qu竛",0,103,3063,0}
	}
}
TJiuzhouCloth = {
	{
		{"Long Щng T� H秈 Y",0,100,3056,0},{"Long Щng T� H秈 Y",0,100,3057,0},{"Long Щng T� H秈 Y",0,100,3058,0},{"Long Щng T� H秈 Y",0,100,3059,0}
	},{
		{"Ph鬾g V� C鰑 Thi猲 Y",0,100,3060,0},{"Ph鬾g V� C鰑 Thi猲 Y",0,100,3061,0},{"Ph鬾g V� C鰑 Thi猲 Y",0,100,3062,0},{"Ph鬾g V� C鰑 Thi猲 Y",0,100,3063,0}
	}
}
TJiuzhouShoes = {
	{
		{"Long Щng T� H秈 Trang",0,101,3056,0},{"Long Щng T� H秈 Trang",0,101,3057,0},{"Long Щng T� H秈 Trang",0,101,3058,0},{"Long Щng T� H秈 Trang",0,101,3059,0}
	},{
		{"Ph鬾g V� C鰑 Thi猲 Trang",0,101,3060,0},{"Ph鬾g V� C鰑 Thi猲 Trang",0,101,3061,0},{"Ph鬾g V� C鰑 Thi猲 Trang",0,101,3062,0},{"Ph鬾g V� C鰑 Thi猲 Trang",0,101,3063,0}
	}
}

THaoNguyet_need = 
{
	[1] = {2, "1 N鉵 Tinh Kh綾, 1 N鉵 Thi猲 Ngh躠", {{0,103,3033,1},{0,103,3039,1},{0,103,3045,1},{0,103,3051,1},{0,103,3036,1},{0,103,3042,1},{0,103,3048,1},{0,103,3054,1}},{{0,103,3034,1},{0,103,3040,1},{0,103,3046,1},{0,103,3052,1},{0,103,3037,1},{0,103,3043,1},{0,103,3049,1},{0,103,3055,1}}},
	[2] = {2, "1 竜 Tinh Kh綾, 1 竜 Thi猲 Ngh躠", {{0,100,3033,1},{0,100,3039,1},{0,100,3045,1},{0,100,3051,1},{0,100,3036,1},{0,100,3042,1},{0,100,3048,1},{0,100,3054,1}},{{0,100,3034,1},{0,100,3040,1},{0,100,3046,1},{0,100,3052,1},{0,100,3037,1},{0,100,3043,1},{0,100,3049,1},{0,100,3055,1}}},
	[3] = {2, "1 Qu莕 Tinh Kh綾, 1 Qu莕 Thi猲 Ngh躠", {{0,101,3033,1},{0,101,3039,1},{0,101,3045,1},{0,101,3051,1},{0,101,3036,1},{0,101,3042,1},{0,101,3048,1},{0,101,3054,1}},{{0,101,3034,1},{0,101,3040,1},{0,101,3046,1},{0,101,3052,1},{0,101,3037,1},{0,101,3043,1},{0,101,3049,1},{0,101,3055,1}}},
	[4] = {2, "1Trang S鴆 Tinh Kh綾, 1 Trang S鴆 Thi猲 Ngh躠", {{0,102,3121,1},{0,102,3124,1},{0,102,3127,1},{0,102,3130,1},{0,102,3133,1},{0,102,3122,1},{0,102,3125,1},{0,102,3128,1},{0,102,3131,1},{0,102,3134,1}}, {}},
	[5] = {2, "1 V� Kh� Tinh Kh綾, 1 V� Kh� Thi猲 Ngh躠", {{0,0,8874,1},{0,0,8875,1},{0,1,8879,1},{0,2,8884,1},{0,2,8885,1},{0,3,8892,1},{0,4,8897,1},{0,5,8900,1},{0,6,8903,1},{0,7,8906,1},{0,8,8909,1},{0,9,8913,1},{0,10,8918,1},{0,11,8922,1},{0,0,8876,1},{0,0,8877,1},{0,1,8880,1},{0,2,8887,1},{0,2,8888,1},{0,3,8894,1},{0,4,8898,1},{0,5,8901,1},{0,6,8904,1},{0,7,8907,1},{0,8,8910,1},{0,9,8915,1},{0,10,8919,1},{0,11,8924,1},{0,2,8886,1},{0,13,8930,1},{0,12,8927,1},{0,2,8889,1},{0,13,8931,1},{0,12,8928,1}}, {}},
}

THaoNguyet_suc = 
{
	[1] = 
			{	
				[2] = {"H筼 Nguy謙 - N鉵 Thi誹 L﹎ T鬰", {{0,103,3064, 1,1,-1,-1,-1,-1,-1,-1,-1,0}, {0,103,3065, 1,1,-1,-1,-1,-1,-1,-1,-1,0}}},
				[3] = {"H筼 Nguy謙 - N鉵 Thi誹 L﹎ Thi襫", {{0,103,3068, 1,1,-1,-1,-1,-1,-1,-1,-1,0}, {0,103,3069, 1,1,-1,-1,-1,-1,-1,-1,-1,0}}},
				[4] = {"H筼 Nguy謙 - N鉵 Thi誹 L﹎ V�", {{0,103,3066, 1,1,-1,-1,-1,-1,-1,-1,-1,0}, {0,103,3067, 1,1,-1,-1,-1,-1,-1,-1,-1,0}}},
				[6] = {"H筼 Nguy謙 - N鉵 Л阯g M玭", {{0,103,3070, 1,1,-1,-1,-1,-1,-1,-1,-1,0}, {0,103,3071, 1,1,-1,-1,-1,-1,-1,-1,-1,0}, {0,103,3072, 1,1,-1,-1,-1,-1,-1,-1,-1,0}, {0,103,3073, 1,1,-1,-1,-1,-1,-1,-1,-1,0}}},
				[8] = {"H筼 Nguy謙 - N鉵 Nga My Ph藅", {" ", " ", {0,103,3074, 1,1,-1,-1,-1,-1,-1,-1,-1,0}, {0,103,3075, 1,1,-1,-1,-1,-1,-1,-1,-1,0}}},
				[9] = {"H筼 Nguy謙 - N鉵 Nga My T鬰", {" ", " ", {0,103,3076, 1,1,-1,-1,-1,-1,-1,-1,-1,0}, {0,103,3077, 1,1,-1,-1,-1,-1,-1,-1,-1,0}}},
				[11] = {"H筼 Nguy謙 - N鉵 C竔 Bang T辬h", {{0,103,3078, 1,1,-1,-1,-1,-1,-1,-1,-1,0}, {0,103,3079, 1,1,-1,-1,-1,-1,-1,-1,-1,0}, {0,103,3080, 1,1,-1,-1,-1,-1,-1,-1,-1,0}, {0,103,3081, 1,1,-1,-1,-1,-1,-1,-1,-1,0}}},
				[12] = {"H筼 Nguy謙 - N鉵 C竔 Bang �", {{0,103,3082, 1,1,-1,-1,-1,-1,-1,-1,-1,0}, {0,103,3083, 1,1,-1,-1,-1,-1,-1,-1,-1,0}, {0,103,3084, 1,1,-1,-1,-1,-1,-1,-1,-1,0}, {0,103,3085, 1,1,-1,-1,-1,-1,-1,-1,-1,0}}},
				[14] = {"H筼 Nguy謙 - N鉵 V� ng Чo", {{0,103,3086, 1,1,-1,-1,-1,-1,-1,-1,-1,0}, {0,103,3087, 1,1,-1,-1,-1,-1,-1,-1,-1,0}, {0,103,3088, 1,1,-1,-1,-1,-1,-1,-1,-1,0}, {0,103,3089, 1,1,-1,-1,-1,-1,-1,-1,-1,0}}},
				[15] = {"H筼 Nguy謙 - N鉵 V� ng T鬰", {{0,103,3090, 1,1,-1,-1,-1,-1,-1,-1,-1,0}, {0,103,3091, 1,1,-1,-1,-1,-1,-1,-1,-1,0}, {0,103,3092, 1,1,-1,-1,-1,-1,-1,-1,-1,0}, {0,103,3093, 1,1,-1,-1,-1,-1,-1,-1,-1,0}}},
				[17] = {"H筼 Nguy謙 - N鉵 Dng M玭 Thng", {{0,103,3094, 1,1,-1,-1,-1,-1,-1,-1,-1,0}, {0,103,3095, 1,1,-1,-1,-1,-1,-1,-1,-1,0}, {0,103,3096, 1,1,-1,-1,-1,-1,-1,-1,-1,0}, {0,103,3097, 1,1,-1,-1,-1,-1,-1,-1,-1,0}}},
				[18] = {"H筼 Nguy謙 - N鉵 Dng M玭 Cung", {{0,103,3098, 1,1,-1,-1,-1,-1,-1,-1,-1,0}, {0,103,3099, 1,1,-1,-1,-1,-1,-1,-1,-1,0}, {0,103,3100, 1,1,-1,-1,-1,-1,-1,-1,-1,0}, {0,103,3101, 1,1,-1,-1,-1,-1,-1,-1,-1,0}}},
				[20] = {"H筼 Nguy謙 - N鉵 Hi謕 чc", {{0,103,3102, 1,1,-1,-1,-1,-1,-1,-1,-1,0}, {0,103,3103, 1,1,-1,-1,-1,-1,-1,-1,-1,0}, {0,103,3104, 1,1,-1,-1,-1,-1,-1,-1,-1,0}, {0,103,3105, 1,1,-1,-1,-1,-1,-1,-1,-1,0}}},
				[21] = {"H筼 Nguy謙 - N鉵 T� чc", {{0,103,3106, 1,1,-1,-1,-1,-1,-1,-1,-1,0}, {0,103,3107, 1,1,-1,-1,-1,-1,-1,-1,-1,0}, {0,103,3108, 1,1,-1,-1,-1,-1,-1,-1,-1,0}, {0,103,3109, 1,1,-1,-1,-1,-1,-1,-1,-1,0}}},
				[23] = {"H筼 Nguy謙 - N鉵 C玭 L玭", {{0,103,3110, 1,1,-1,-1,-1,-1,-1,-1,-1,0}, {0,103,3111, 1,1,-1,-1,-1,-1,-1,-1,-1,0}}},
				[29] = {"H筼 Nguy謙 - N鉵 Th髖 Y猲 V� Ti猲", {" ", " ", {0,103,3124, 1,1,-1,-1,-1,-1,-1,-1,-1,0}, {0,103,3125, 1,1,-1,-1,-1,-1,-1,-1,-1,0}}},
				[30] = {"H筼 Nguy謙 - N鉵 Th髖 Y猲 Linh N�", {" ", " ", {0,103,3126, 1,1,-1,-1,-1,-1,-1,-1,-1,0}, {0,103,3127, 1,1,-1,-1,-1,-1,-1,-1,-1,0}}},
			},
	[2] = 
			{	
				[2] = {"H筼 Nguy謙 - Thi誹 L﹎ T鬰", {{0,100,3064, 1,1,-1,-1,-1,-1,-1,-1,-1,0}, {0,100,3065, 1,1,-1,-1,-1,-1,-1,-1,-1,0}}},
				[3] = {"H筼 Nguy謙 - Thi誹 L﹎ Thi襫", {{0,100,3068, 1,1,-1,-1,-1,-1,-1,-1,-1,0}, {0,100,3069, 1,1,-1,-1,-1,-1,-1,-1,-1,0}}},
				[4] = {"H筼 Nguy謙 - Thi誹 L﹎ V�", {{0,100,3066, 1,1,-1,-1,-1,-1,-1,-1,-1,0}, {0,100,3067, 1,1,-1,-1,-1,-1,-1,-1,-1,0}}},
				[6] = {"H筼 Nguy謙 - Л阯g M玭", {{0,100,3070, 1,1,-1,-1,-1,-1,-1,-1,-1,0}, {0,100,3071, 1,1,-1,-1,-1,-1,-1,-1,-1,0}, {0,100,3072, 1,1,-1,-1,-1,-1,-1,-1,-1,0}, {0,100,3073, 1,1,-1,-1,-1,-1,-1,-1,-1,0}}},
				[8] = {"H筼 Nguy謙 - Nga My Ph藅", {" ", " ", {0,100,3074, 1,1,-1,-1,-1,-1,-1,-1,-1,0}, {0,100,3075, 1,1,-1,-1,-1,-1,-1,-1,-1,0}}},
				[9] = {"H筼 Nguy謙 - Nga My T鬰", {" ", " ", {0,100,3076, 1,1,-1,-1,-1,-1,-1,-1,-1,0}, {0,100,3077, 1,1,-1,-1,-1,-1,-1,-1,-1,0}}},
				[11] = {"H筼 Nguy謙 - C竔 Bang T辬h", {{0,100,3078, 1,1,-1,-1,-1,-1,-1,-1,-1,0}, {0,100,3079, 1,1,-1,-1,-1,-1,-1,-1,-1,0}, {0,100,3080, 1,1,-1,-1,-1,-1,-1,-1,-1,0}, {0,100,3081, 1,1,-1,-1,-1,-1,-1,-1,-1,0}}},
				[12] = {"H筼 Nguy謙 - C竔 Bang �", {{0,100,3082, 1,1,-1,-1,-1,-1,-1,-1,-1,0}, {0,100,3083, 1,1,-1,-1,-1,-1,-1,-1,-1,0}, {0,100,3084, 1,1,-1,-1,-1,-1,-1,-1,-1,0}, {0,100,3085, 1,1,-1,-1,-1,-1,-1,-1,-1,0}}},
				[14] = {"H筼 Nguy謙 - V� ng Чo", {{0,100,3086, 1,1,-1,-1,-1,-1,-1,-1,-1,0}, {0,100,3087, 1,1,-1,-1,-1,-1,-1,-1,-1,0}, {0,100,3088, 1,1,-1,-1,-1,-1,-1,-1,-1,0}, {0,100,3089, 1,1,-1,-1,-1,-1,-1,-1,-1,0}}},
				[15] = {"H筼 Nguy謙 - V� ng T鬰", {{0,100,3090, 1,1,-1,-1,-1,-1,-1,-1,-1,0}, {0,100,3091, 1,1,-1,-1,-1,-1,-1,-1,-1,0}, {0,100,3092, 1,1,-1,-1,-1,-1,-1,-1,-1,0}, {0,100,3093, 1,1,-1,-1,-1,-1,-1,-1,-1,0}}},
				[17] = {"H筼 Nguy謙 - Dng M玭 Thng", {{0,100,3094, 1,1,-1,-1,-1,-1,-1,-1,-1,0}, {0,100,3095, 1,1,-1,-1,-1,-1,-1,-1,-1,0}, {0,100,3096, 1,1,-1,-1,-1,-1,-1,-1,-1,0}, {0,100,3097, 1,1,-1,-1,-1,-1,-1,-1,-1,0}}},
				[18] = {"H筼 Nguy謙 - Dng M玭 Cung", {{0,100,3098, 1,1,-1,-1,-1,-1,-1,-1,-1,0}, {0,100,3099, 1,1,-1,-1,-1,-1,-1,-1,-1,0}, {0,100,3100, 1,1,-1,-1,-1,-1,-1,-1,-1,0}, {0,100,3101, 1,1,-1,-1,-1,-1,-1,-1,-1,0}}},
				[20] = {"H筼 Nguy謙 - Hi謕 чc", {{0,100,3102, 1,1,-1,-1,-1,-1,-1,-1,-1,0}, {0,100,3103, 1,1,-1,-1,-1,-1,-1,-1,-1,0}, {0,100,3104, 1,1,-1,-1,-1,-1,-1,-1,-1,0}, {0,100,3105, 1,1,-1,-1,-1,-1,-1,-1,-1,0}}},
				[21] = {"H筼 Nguy謙 - T� чc", {{0,100,3106, 1,1,-1,-1,-1,-1,-1,-1,-1,0}, {0,100,3107, 1,1,-1,-1,-1,-1,-1,-1,-1,0}, {0,100,3108, 1,1,-1,-1,-1,-1,-1,-1,-1,0}, {0,100,3109, 1,1,-1,-1,-1,-1,-1,-1,-1,0}}},
				[23] = {"H筼 Nguy謙 - C玭 L玭", {{0,100,3110, 1,1,-1,-1,-1,-1,-1,-1,-1,0}, {0,100,3111, 1,1,-1,-1,-1,-1,-1,-1,-1,0}}},
				[29] = {"H筼 Nguy謙 - Th髖 Y猲 V� Ti猲", {" ", " ", {0,100,3124, 1,1,-1,-1,-1,-1,-1,-1,-1,0}, {0,100,3125, 1,1,-1,-1,-1,-1,-1,-1,-1,0}}},
				[30] = {"H筼 Nguy謙 - Th髖 Y猲 Linh N�", {" ", " ", {0,100,3126, 1,1,-1,-1,-1,-1,-1,-1,-1,0}, {0,100,3127, 1,1,-1,-1,-1,-1,-1,-1,-1,0}}},
			},
	[3] = 
			{	
				[2] = {"H筼 Nguy謙 - Trang Thi誹 L﹎ T鬰", {{0,101,3064, 1,1,-1,-1,-1,-1,-1,-1,-1,0}, {0,101,3065, 1,1,-1,-1,-1,-1,-1,-1,-1,0}}},
				[3] = {"H筼 Nguy謙 - Trang Thi誹 L﹎ Thi襫", {{0,101,3068, 1,1,-1,-1,-1,-1,-1,-1,-1,0}, {0,101,3069, 1,1,-1,-1,-1,-1,-1,-1,-1,0}}},
				[4] = {"H筼 Nguy謙 - Trang Thi誹 L﹎ V�", {{0,101,3066, 1,1,-1,-1,-1,-1,-1,-1,-1,0}, {0,101,3067, 1,1,-1,-1,-1,-1,-1,-1,-1,0}}},
				[6] = {"H筼 Nguy謙 - Trang Л阯g M玭", {{0,101,3070, 1,1,-1,-1,-1,-1,-1,-1,-1,0}, {0,101,3071, 1,1,-1,-1,-1,-1,-1,-1,-1,0}, {0,101,3072, 1,1,-1,-1,-1,-1,-1,-1,-1,0}, {0,101,3073, 1,1,-1,-1,-1,-1,-1,-1,-1,0}}},
				[8] = {"H筼 Nguy謙 - Trang Nga My Ph藅", {" ", " ", {0,101,3074, 1,1,-1,-1,-1,-1,-1,-1,-1,0}, {0,101,3075, 1,1,-1,-1,-1,-1,-1,-1,-1,0}}},
				[9] = {"H筼 Nguy謙 - Trang Nga My T鬰", {" ", " ", {0,101,3076, 1,1,-1,-1,-1,-1,-1,-1,-1,0}, {0,101,3077, 1,1,-1,-1,-1,-1,-1,-1,-1,0}}},
				[11] = {"H筼 Nguy謙 - Trang C竔 Bang T辬h", {{0,101,3078, 1,1,-1,-1,-1,-1,-1,-1,-1,0}, {0,101,3079, 1,1,-1,-1,-1,-1,-1,-1,-1,0}, {0,101,3080, 1,1,-1,-1,-1,-1,-1,-1,-1,0}, {0,101,3081, 1,1,-1,-1,-1,-1,-1,-1,-1,0}}},
				[12] = {"H筼 Nguy謙 - Trang C竔 Bang �", {{0,101,3082, 1,1,-1,-1,-1,-1,-1,-1,-1,0}, {0,101,3083, 1,1,-1,-1,-1,-1,-1,-1,-1,0}, {0,101,3084, 1,1,-1,-1,-1,-1,-1,-1,-1,0}, {0,101,3085, 1,1,-1,-1,-1,-1,-1,-1,-1,0}}},
				[14] = {"H筼 Nguy謙 - Trang V� ng Чo", {{0,101,3086, 1,1,-1,-1,-1,-1,-1,-1,-1,0}, {0,101,3087, 1,1,-1,-1,-1,-1,-1,-1,-1,0}, {0,101,3088, 1,1,-1,-1,-1,-1,-1,-1,-1,0}, {0,101,3089, 1,1,-1,-1,-1,-1,-1,-1,-1,0}}},
				[15] = {"H筼 Nguy謙 - Trang V� ng T鬰", {{0,101,3090, 1,1,-1,-1,-1,-1,-1,-1,-1,0}, {0,101,3091, 1,1,-1,-1,-1,-1,-1,-1,-1,0}, {0,101,3092, 1,1,-1,-1,-1,-1,-1,-1,-1,0}, {0,101,3093, 1,1,-1,-1,-1,-1,-1,-1,-1,0}}},
				[17] = {"H筼 Nguy謙 - Trang Dng M玭 Thng", {{0,101,3094, 1,1,-1,-1,-1,-1,-1,-1,-1,0}, {0,101,3095, 1,1,-1,-1,-1,-1,-1,-1,-1,0}, {0,101,3096, 1,1,-1,-1,-1,-1,-1,-1,-1,0}, {0,101,3097, 1,1,-1,-1,-1,-1,-1,-1,-1,0}}},
				[18] = {"H筼 Nguy謙 - Trang Dng M玭 Cung", {{0,101,3098, 1,1,-1,-1,-1,-1,-1,-1,-1,0}, {0,101,3099, 1,1,-1,-1,-1,-1,-1,-1,-1,0}, {0,101,3100, 1,1,-1,-1,-1,-1,-1,-1,-1,0}, {0,101,3101, 1,1,-1,-1,-1,-1,-1,-1,-1,0}}},
				[20] = {"H筼 Nguy謙 - Trang Hi謕 чc", {{0,101,3102, 1,1,-1,-1,-1,-1,-1,-1,-1,0}, {0,101,3103, 1,1,-1,-1,-1,-1,-1,-1,-1,0}, {0,101,3104, 1,1,-1,-1,-1,-1,-1,-1,-1,0}, {0,101,3105, 1,1,-1,-1,-1,-1,-1,-1,-1,0}}},
				[21] = {"H筼 Nguy謙 - Trang T� чc", {{0,101,3106, 1,1,-1,-1,-1,-1,-1,-1,-1,0}, {0,101,3107, 1,1,-1,-1,-1,-1,-1,-1,-1,0}, {0,101,3108, 1,1,-1,-1,-1,-1,-1,-1,-1,0}, {0,101,3109, 1,1,-1,-1,-1,-1,-1,-1,-1,0}}},	
				[23] = {"H筼 Nguy謙 - Trang C玭 L玭", {{0,101,3110, 1,1,-1,-1,-1,-1,-1,-1,-1,0}, {0,101,3111, 1,1,-1,-1,-1,-1,-1,-1,-1,0}}},
				[29] = {"H筼 Nguy謙 - Trang Th髖 Y猲 V� Ti猲", {" ", " ", {0,101,3124, 1,1,-1,-1,-1,-1,-1,-1,-1,0}, {0,101,3125, 1,1,-1,-1,-1,-1,-1,-1,-1,0}}},
				[30] = {"H筼 Nguy謙 - Trang Th髖 Y猲 Linh N�", {" ", " ", {0,101,3126, 1,1,-1,-1,-1,-1,-1,-1,-1,0}, {0,101,3127, 1,1,-1,-1,-1,-1,-1,-1,-1,0}}},
			},
	[4] = 
	     		{
				[1] = {"TS H筼 Nguy謙 - X輈h Tc", {0, 102, 3181, 1,1,-1,-1,-1,-1,-1,-1,-1,0}},
				[2] = {"TS H筼 Nguy謙 - T� Giao", {0, 102, 3177, 1,1,-1,-1,-1,-1,-1,-1,-1,0}},
				[3] = {"TS H筼 Nguy謙 - V﹏ H�", {0, 102, 3179, 1,1,-1,-1,-1,-1,-1,-1,-1,0}},
				[4] = {"TS H筼 Nguy謙 - � L﹏", {0, 102, 3175, 1,1,-1,-1,-1,-1,-1,-1,-1,0}},
				[5] = {"TS H筼 Nguy謙 - B輈h Quy", {0, 102, 3183, 1,1,-1,-1,-1,-1,-1,-1,-1,0}},
			},
	[5] = 
			{	
				[2] = {"H筼 Nguy謙 - VK Thi誹 L﹎ T鬰", {0, 3, 8972, 1,1,-1,-1,-1,-1,-1,-1,-1,0}},
				[3] = {"H筼 Nguy謙 - VK Thi誹 L﹎ Thi襫", {0, 8, 8974, 1,1,-1,-1,-1,-1,-1,-1,-1,0}},
				[4] = {"H筼 Nguy謙 - VK Thi誹 L﹎ V�", {0, 0, 8973, 1,1,-1,-1,-1,-1,-1,-1,-1,0}},
				[6] = {"H筼 Nguy謙 - VK Л阯g M玭", {0, 1, 8975, 1,1,-1,-1,-1,-1,-1,-1,-1,0}},
				[8] = {"H筼 Nguy謙 - VK Nga My Ph藅", {0, 2, 8976, 1,1,-1,-1,-1,-1,-1,-1,-1,0}},
				[9] = {"H筼 Nguy謙 - VK  Nga My T鬰", {0, 10, 8977, 1,1,-1,-1,-1,-1,-1,-1,-1,0}},
				[11] = {"H筼 Nguy謙 - VK C竔 Bang T辬h", {0, 0, 8978, 1,1,-1,-1,-1,-1,-1,-1,-1,0}},
				[12] = {"H筼 Nguy謙 - VK C竔 Bang �", {0, 5, 8979, 1,1,-1,-1,-1,-1,-1,-1,-1,0}},
				[14] = {"H筼 Nguy謙 - VK V� ng Чo", {0, 2, 8980, 1,1,-1,-1,-1,-1,-1,-1,-1,0}},
				[15] = {"H筼 Nguy謙 - VK V� ng T鬰", {0, 9, 8981, 1,1,-1,-1,-1,-1,-1,-1,-1,0}},
				[17] = {"H筼 Nguy謙 - VK Dng M玭 Thng", {0, 6, 8982, 1,1,-1,-1,-1,-1,-1,-1,-1,0}},
				[18] = {"H筼 Nguy謙 - VK Dng M玭 Cung", {0, 4, 8983, 1,1,-1,-1,-1,-1,-1,-1,-1,0}},
				[20] = {"H筼 Nguy謙 - VK Hi謕 чc", {0, 7, 8984, 1,1,-1,-1,-1,-1,-1,-1,-1,0}},
				[21] = {"H筼 Nguy謙 - VKT� чc", {0, 11, 8985, 1,1,-1,-1,-1,-1,-1,-1,-1,0}},
				[23] = {"H筼 Nguy謙 - VKC玭 L玭", {0, 2, 8986, 1,1,-1,-1,-1,-1,-1,-1,-1,0}},
				[29] = {"H筼 Nguy謙 - VKV� Ti猲", {0, 13, 8990, 1,1,-1,-1,-1,-1,-1,-1,-1,0}},
				[30] = {"H筼 Nguy謙 - VKLinh N�", {0, 12, 8991, 1,1,-1,-1,-1,-1,-1,-1,-1,0}},
			},
}


tItem_need = 
{
	[1] = {30000000, 500, 250},
	[2] = {30000000, 500, 250},
	[3] = {30000000, 500, 250},
	[4] = {50000000, 700, 350},
	[5] = {40000000, 600, 300},
}

TJiuzhouWeapon = {
	[2]={"C鰑 Ch﹗-L璾 Ly Gi韎 o",0,3,8932,0,670,1},
	[3]={"C鰑 Ch﹗-Kinh L玦 Thi襫 Trng",0,8,8934,0,672,1},
	[4]={"C鰑 Ch﹗-L玦  Nang Th�",0,0,8933,0,672,1},
	[6]={"C鰑 Ch﹗- Dng Xuy猲 秐h",0,1,8935,0,671,1},
	[8]={"C鰑 Ch﹗-T� H祅  Ki誱",0,2,8936,0,672,1},
	[9]={"C鰑 Ch﹗-C鰑 Ho祅 B鑙 C莔",0,10,8937,0,672,1},
	[11]={"C鰑 Ch﹗-Quy L﹏ H� Th�",0,0,8938,0,670,1},
	[12]={"C鰑 Ch﹗-Tr蕁 Ng筼 C玭",0,5,8939,0,671,1},
	[14]={"C鰑 Ch﹗-Thu莕 Phong Ki誱",0,2,8940,0,672,1},
	[15]={"C鰑 Ch﹗-Tinh u Chuy觧 B髏",0,9,8941,0,673,1},
	[17]={"C鰑 Ch﹗-Ph� Qu﹏ Tr薾 Thng",0,6,8942,0,670,1},
	[18]={"C鰑 Ch﹗-Truy M謓h Cung",0,4,8943,0,671,1},
	[20]={"C鰑 Ch﹗-Thi謕 C鑤 Huy誸 o",0,7,8944,0,671,1},
	[21]={"C鰑 Ch﹗-Luy謓 H錸 Huy誸 Tr秓",0,11,8945,0,673,1},
	[23]={"C鰑 Ch﹗-Ng� Thi猲 Phong Ki誱",0,2,8946,0,672,1},
	[25]={"C鰑 Ch﹗-Th莕 Di謒 Thi猲 o",0,3,8947,0,670,1,1},
	[26]={"C鰑 Ch﹗-Th莕 Phong Ph竛 B髏",0,9,8948,0,673,1},
	[27]={"C鰑 Ch﹗-Th莕 Linh Ch� Tr秓",0,11,8949,0,671,1},
	[29]={"C鰑 Ch﹗-Linh Lung Chi",0,13,8950,0,671,1},
	[30]={"C鰑 Ch﹗-C鰑 Ti猽 S竜",0,12,8951,0,673,1},
}
TJiuzhouRing = {
	{
		[2] = {"C鰑 Ch﹗-Ng璶g Ng鋍 Th� Ho祅",0,102,3135,},
		[3] = {"C鰑 Ch﹗-Ng璶g Ng鋍 Th� Ho祅",0,102,3137,},
		[4] = {"C鰑 Ch﹗-Nguy謙 Hoa Th駓 B閕",0,102,3139,},
		[6] = {"C鰑 Ch﹗-Ph� Th髖 M閏 ыi",0,102,3141,},
		[8] = {"C鰑 Ch﹗-Ng璶g Ng鋍 Th� Ho祅",0,102,3143,},
		[9] = {"C鰑 Ch﹗-Ph� Th髖 M閏 ыi",0,102,3145,},
		[11] = {"C鰑 Ch﹗-Ng璶g Ng鋍 Th� Ho祅",0,102,3147,},
		[12] = {"C鰑 Ch﹗-Ph� Th髖 M閏 ыi",0,102,3149,},
		[14] = {"C鰑 Ch﹗-Nguy謙 Hoa Th駓 B閕",0,102,3151,},
		[15] = {"C鰑 Ch﹗-C鰑  H醓 Gi韎",0,102,3153,},
		[17] = {"C鰑 Ch﹗-Ng璶g Ng鋍 Th� Ho祅",0,102,3155,},
		[18] = {"C鰑 Ch﹗-Ph� Th髖 M閏 ыi",0,102,3157,},
		[20] = {"C鰑 Ch﹗-Ph� Th髖 M閏 ыi",0,102,3159,},
		[21] = {"C鰑 Ch﹗-C鰑  H醓 Gi韎",0,102,3161,},
		[23] = {"C鰑 Ch﹗-Nguy謙 Hoa Th駓 B閕",0,102,3163,},
		[25] = {"C鰑 Ch﹗-C鰑  H醓 Gi韎",0,102,3165,},
		[26] = {"C鰑 Ch﹗-C鰑  H醓 Gi韎",0,102,3167,},
		[27] = {"C鰑 Ch﹗-Ng璶g Ng鋍 Th� Ho祅",0,102,3169,},
		[29] = {"C鰑 Ch﹗-Ph� Th髖 M閏 ыi",0,102,3171,},
		[30] = {"C鰑 Ch﹗-Ng璶g Ng鋍 Th� Ho祅",0,102,3173,},
	},
	{
		[2] = {"C鰑 Ch﹗-Huy襫 Th筩h Kim Ng鋍",0,102,3136,},
		[3] = {"C鰑 Ch﹗-Nguy謙 Hoa Th駓 B閕",0,102,3138,},
		[4] = {"C鰑 Ch﹗-Ph� Th髖 M閏 ыi",0,102,3140,},
		[6] = {"C鰑 Ch﹗-Huy襫 Th筩h Kim Ng鋍",0,102,3142,},
		[8] = {"C鰑 Ch﹗-Nguy謙 Hoa Th駓 B閕",0,102,3144,},
		[9] = {"C鰑 Ch﹗-Nguy謙 Hoa Th駓 B閕",0,102,3146,},
		[11] = {"C鰑 Ch﹗-Huy襫 Th筩h Kim Ng鋍",0,102,3148,},
		[12] = {"C鰑 Ch﹗-C鰑  H醓 Gi韎",0,102,3150,},
		[14] = {"C鰑 Ch﹗-C鰑  H醓 Gi韎",0,102,3152,},
		[15] = {"C鰑 Ch﹗-Ph� Th髖 M閏 ыi",0,102,3154,},
		[17] = {"C鰑 Ch﹗-Huy襫 Th筩h Kim Ng鋍",0,102,3156,},
		[18] = {"C鰑 Ch﹗-Huy襫 Th筩h Kim Ng鋍",0,102,3158,},
		[20] = {"C鰑 Ch﹗-Nguy謙 Hoa Th駓 B閕",0,102,3160,},
		[21] = {"C鰑 Ch﹗-Nguy謙 Hoa Th駓 B閕",0,102,3162,},
		[23] = {"C鰑 Ch﹗-C鰑  H醓 Gi韎",0,102,3164,},
		[25] = {"C鰑 Ch﹗-Huy襫 Th筩h Kim Ng鋍",0,102,3166,},
		[26] = {"C鰑 Ch﹗-Ph� Th髖 M閏 ыi",0,102,3168,},
		[27] = {"C鰑 Ch﹗-Ph� Th髖 M閏 ыi",0,102,3170,},
		[29] = {"C鰑 Ch﹗-Huy襫 Th筩h Kim Ng鋍",0,102,3172,},
		[30] = {"C鰑 Ch﹗-C鰑  H醓 Gi韎",0,102,3174,},
	}
}
TJiuzhouEquip = {
	TJiuzhouHead,TJiuzhouCloth,TJiuzhouShoes,TJiuzhouRing,TJiuzhouWeapon
}
--轩辕装备
	--轩辕武器
TXuanyuanWeapon = {
	[2] = {{"Hi猲 Vi猲 To竔 V� o",0,3,8801},{"Hi猲 Vi猲 To竔 V� C玭",0,5,8802}},
	[3] = {"Hi猲 Vi猲 C鰑 Nh� Trng",0,8,8803},
	[4] = {"Hi猲 Vi猲 H筼 Nhi猲 Th�",0,0,8804},
	[6] = {"Hi猲 Vi猲 Gi韎 T� Kim",0,1,8805},
	[8] = {"Hi猲 Vi猲 T� Tinh Ki誱",0,2,8806},
	[9] = {"Hi猲 Vi猲 Ph鬾g Ho祅g C莔",0,10,8807},
	[11] = {"Hi猲 Vi猲 Ng� Nh筩 Th�",0,0,8808},
	[12] = {"Hi猲 Vi猲 Ph� Thi猲 C玭",0,5,8809},
	[14] = {"Hi猲 Vi猲 H錸g Qu﹏ Ki誱",0,2,8810},
	[15] = {"Hi猲 Vi猲 Sinh T� B髏",0,9,8811},
	[17] = {"Hi猲 Vi猲 Ph� Qu﹏ Thng",0,6,8812},
	[18] = {"Hi猲 Vi猲 Khai Thi猲 Cung",0,4,8813},
	[20] = {"Hi猲 Vi猲  Dng Nh蒼",0,7,8814},
	[21] = {"Hi猲 Vi猲 U Minh Tr秓",0,11,8815},
	[23] = {"Hi猲 Vi猲 L玦 Minh Ki誱",0,2,8816,},
	[25] = {"Hi猲 Vi猲 Tr秏 Vi猰 o",0,3,8817,},
	[26] = {"Hi猲 Vi猲 Quang Minh B髏",0,9,8818,},
	[27] = {"Hi猲 Vi猲 Ch�  蕁 Tr秓",0,11,8819,},
	[29] = {"Hi猲 Vi猲 L╪g Ti猽 Phi課",0,13,8820,},
	[30] = {"Hi猲 Vi猲 Ph錸 Hoa мch",0,12,8821,},
}
	--轩辕战
TXuanyuanZhan = {
	[2] = {"Hi猲 Vi猲 Chi課",0,102,8801},
	[3] = {"Hi猲 Vi猲 Chi課",0,102,8803},
	[4] = {"Hi猲 Vi猲 Chi課",0,102,8805},
	[6] = {"Hi猲 Vi猲 Chi課",0,102,8807},
	[8] = {"Hi猲 Vi猲 Chi課",0,102,8809},
	[9] = {"Hi猲 Vi猲 Chi課",0,102,8811},
	[11] = {"Hi猲 Vi猲 Chi課",0,102,8813},
	[12] = {"Hi猲 Vi猲 Chi課",0,102,8815},
	[14] = {"Hi猲 Vi猲 Chi課",0,102,8817},
	[15] = {"Hi猲 Vi猲 Chi課",0,102,8819},
	[17] = {"Hi猲 Vi猲 Chi課",0,102,8821},
	[18] = {"Hi猲 Vi猲 Chi課",0,102,8823},
	[20] = {"Hi猲 Vi猲 Chi課",0,102,8825},
	[21] = {"Hi猲 Vi猲 Chi課",0,102,8827},
	[23] = {"Hi猲 Vi猲 Chi課",0,102,8829},
	[25] = {"Hi猲 Vi猲 Chi課",0,102,8831},
	[26] = {"Hi猲 Vi猲 Chi課",0,102,8833},
	[27] = {"Hi猲 Vi猲 Chi課",0,102,8835},
	[29] = {"Hi猲 Vi猲 Chi課",0,102,8837},
	[30] = {"Hi猲 Vi猲 Chi課",0,102,8839},
}
	--轩辕斗
TXuanyuangDou = {
	[2] = {"Hi猲 Vi猲 u",0,102,8802},
	[3] = {"Hi猲 Vi猲 u",0,102,8804},
	[4] = {"Hi猲 Vi猲 u",0,102,8806},
	[6] = {"Hi猲 Vi猲 u",0,102,8808},
	[8] = {"Hi猲 Vi猲 u",0,102,8810},
	[9] = {"Hi猲 Vi猲 u",0,102,8812},
	[11] = {"Hi猲 Vi猲 u",0,102,8814},
	[12] = {"Hi猲 Vi猲 u",0,102,8816},
	[14] = {"Hi猲 Vi猲 u",0,102,8818},
	[15] = {"Hi猲 Vi猲 u",0,102,8820},
	[17] = {"Hi猲 Vi猲 u",0,102,8822},
	[18] = {"Hi猲 Vi猲 u",0,102,8824},
	[20] = {"Hi猲 Vi猲 u",0,102,8826},
	[21] = {"Hi猲 Vi猲 u",0,102,8828},
	[23] = {"Hi猲 Vi猲 u",0,102,8830},
	[25] = {"Hi猲 Vi猲 u",0,102,8832},
	[26] = {"Hi猲 Vi猲 u",0,102,8834},
	[27] = {"Hi猲 Vi猲 u",0,102,8836},
	[29] = {"Hi猲 Vi猲 u",0,102,8838},
	[30] = {"Hi猲 Vi猲 u",0,102,8848},
}
TXuanyuanEquip = {
	TXuanyuanZhan,TXuanyuangDou,TXuanyuanWeapon
}


SS_WAITING		= 0;
SS_FIGHTING 	= 1;
SS_PASSING		= 2;
SS_FISH			= 3;
SS_WAITING_2	= 4;

frame_per_second 	= 18;
WAITING_TIME		= 15 * frame_per_second;
FIGHT_TIME			= 30 * frame_per_second;
FIGHT_TIME_2		= 15 * frame_per_second;
PASS_TIME			= 15 * frame_per_second;

MV_TIME_LOOP		= 1;
MV_MAPID			= 2;
MV_STAGE_STATE		= 3;	-- 关卡状态
MV_STAGE_LEVEL		= 4;	-- 第n关
MV_MAP_INDEX		= 5;	-- 地图idx
MV_STAGE_LEVEL_OLD	= 6;	-- 真正的关卡
MV_BOSSDEATH_FLAG	= 7;	-- BOSS死亡标志
MV_CUR_BOSS_ID		= 8;
MV_BOSS_COUNT		= 9;	-- boss关杀boss数
MV_FISH_COUNT		= 10;	-- 玩家fish数
MV_FISH_COUNT_2		= 11;	-- 张清花荣fish数
MV_FISH_TIME		= 12;	-- 玩家fish的时间
MV_ROBOT_TYPE		= 13;	-- 当前开启的机关类型
MV_LOOP				= 14;	-- 当前timer循环次数
MV_CREATE_MYFISH_TIME	= 15;	-- 上次援助时间
MV_RETURN_MAP_ID	= 16;	-- 返回地图id
MV_STAGE_START_TIME	= 17;
MV_BOSS_CREATE_TIME	= 18;
MV_SHOW_WELCOME		= 19;	-- 欢迎词 1 已show 0 未show
MV_MATCH_COUNT		= 20;	-- 隐藏2
MV_MATCH_WIN		= 21;	-- 隐藏2
MV_MATCH_AWARD		= 22;	-- 隐藏2
MV_DAYE				= 23;	-- ib关花钱人playerindex
MV_LAO_ER			= 24;	-- 箱子拾取人playerindex
MV_LOOT_ID			= 25;	--
MV_DAYE_2			= 26;	-- 花钱开箱子人playerindex
MV_LAO_ER_2			= 27;	-- 箱子拾取人playerindex
MV_LOOT_ID_2		= 28;	--
MV_CUR_BOSS_ID_2	= 29;	-- 箱子的BOSS
MV_LS_OPEN_JINGLI_BOX_FLAG = 30 --开过精力宝箱标志
MV_LS_ROUTE_COUNT = 31 --流派个数
MV_GAME_OVER_TAG = 32 -- 通关标记
MV_END				= 32;	-- 变量结束

CampPlaye = "camp_player"; --武林联盟阵营类型，包括npc
CampEnemy = "camp_enemy";  --武林叛徒阵营类型，包括npc
CampNeutral = "camp_evil";		--中立npc阵营类型

POS_1				= 1;
POS_2				= 2;
POS_3				= 3;
POS_4				= 4;
POS_5				= 5;
POS_6				= 6;
POS_7				= 7;
POS_8				= 8;
POS_9				= 9;
POS_BOSS			= 10;
POS_WAIT_1			= 11;
POS_WAIT_2			= 12;
POS_PASS			= 13;

-----------------------------------------------------------------------
HIDEMISSION_BEGIN = 20;
HIDEMISSION_END = 21;
OPEN_HIDE_STAGE = 1;

_nextstage = {
	[1] = 2,
	[2] = 3,
	[3] = 4,
	[4] = 6,
	[5] = 6,
	[6] = 0,
	[7] = 5,
	[8] = 9,
	[9] = 0,
}

resetPos = {
	[3]		= {
		[SS_WAITING_2]	= POS_BOSS,
	},
	[5]		= {
		[SS_WAITING]	= {1650, 3130},
	},
}

function getStage()
	local lv = GetMissionV(MV_STAGE_LEVEL);
	local s = _stage[lv];
	assert(s, format("lv=%d, s=%s", lv, tostring(s)));
	return s;
end

function nextStage()
	if GetMissionV(MV_DAYE) ~= 0 or GetMissionV(MV_DAYE_2) ~= 0 then
		Talk(1,"",LSSysTalk[1]);
		return
	end
	
	remove_jingli_box()--移除精力宝箱
	remove_tong_box()
	remove_yin_box()
	remove_gold_box()

	local nMapId = gf_GetCurMapID();
	ClearMapNpc(nMapId);
	local lv = GetMissionV(MV_STAGE_LEVEL);
	if lv >= HIDEMISSION_BEGIN then	-- 隐藏关卡的下一关
		lv = GetMissionV(MV_STAGE_LEVEL_OLD);
	end
	
	if lv == 4 then
		_stat_when_first_4_stage_pass()
	end
	
	local n = _nextstage[lv];
	if n == 0 then
		Msg2MSAll(MISSION_ID, LSMsgToTeam[1]);
		CloseMission(MISSION_ID);
		return
	end
	SetMissionV(MV_STAGE_LEVEL_OLD, n);
	if (n >= 1 and n <= 4) and random(100) < 10 and OPEN_HIDE_STAGE == 1 then
		n = random(HIDEMISSION_BEGIN,HIDEMISSION_END);
	end
	SetMissionV(MV_STAGE_LEVEL, n);
	Msg2MSAll(MISSION_ID,LSMsgToTeam[2]);
	getStage():init();
end

function resetMissionV()
	for i = 1, MV_END do
		SetMissionV(i, 0);
	end
end

function getResetPosition()
	local m, x, y = nil, nil, nil;
	local nState		= GetMissionV(MV_STAGE_STATE);
	local nOldStage	= GetMissionV(MV_STAGE_LEVEL_OLD);
	if resetPos and resetPos[nOldStage] and resetPos[nOldStage][nState] then
		local tPos = resetPos[nOldStage][nState];
		if type(tPos) == 'table' then
			m = gf_GetCurMapID();
			x = tPos[1];
			y = tPos[2];
		else
			m, x, y = tStageBase:getMapPos(tPos);
		end
	elseif nState ~= SS_PASSING and nState ~= SS_WAITING and nState ~= SS_WAITING_2 then
		m, x, y = tStageBase:getMapPos(POS_BOSS);
	end

	return m, x, y;
end

function resetPosition()
	local m, x, y = getResetPosition();

	if m and x and y then
		local f_resetPos = function()
			NewWorld(%m, %x, %y);
		end;
		mf_OperateAllPlayer(MISSION_ID, f_resetPos, nil, 1);
	end
end
-----------------------------------------------------------------------
function gf_GetCurMapID()
	return SubWorldIdx2ID(SubWorld);
end;

function LM_StartTimeGuage(szInfo, nDuration, bRepeat, nCustomID, tbPlayer)
	if tbPlayer == nil then --默认是所有玩家
		tbPlayer = mf_GetMSPlayerIndex(MISSION_ID, ALL_CAMP);
	end;
	local funTimeGuage = function(tbArg)
		StartTimeGuage(%szInfo,%nDuration,%bRepeat,%nCustomID);
	end;
	gf_OperatePlayers(tbPlayer,funTimeGuage,{});
end

function LM_StopTimeGuage(nCustomID, tbPlayer)
	if tbPlayer == nil then --默认是所有玩家
		tbPlayer = mf_GetMSPlayerIndex(MISSION_ID,ALL_CAMP);
	end;
	local funTimeGuage = function(tbArg)
		StopTimeGuage(%nCustomID);
	end;
	gf_OperatePlayers(tbPlayer,funTimeGuage,{});
end;

function LM_Talk(SentenceNum, CallBack_Fun, SentenceTab, tbPlayer)
	if tbPlayer == nil then --默认是所有玩家
		tbPlayer = mf_GetMSPlayerIndex(MISSION_ID,ALL_CAMP);
	end;
	local funTalk = function(tbArg)
		Talk(%SentenceNum, %CallBack_Fun, %SentenceTab);
	end;
	gf_OperatePlayers(tbPlayer,funTalk,{});
end;

function LM_Say(szCaption, nArg, tArg, tbPlayer)
	if tbPlayer == nil then --默认是所有玩家
		tbPlayer = mf_GetMSPlayerIndex(MISSION_ID,ALL_CAMP);
	end;
	local funSay = function(tbArg)
		Say(%szCaption, %nArg, %tArg);
	end;
	gf_OperatePlayers(tbPlayer,funSay,{});
end;

------------------------------------------------------
-- MU_Msg2Team from cangjian
function MU_Msg2Team(msg, msgtype)
    local num = GetTeamSize()
    msg = tostring(msg)
    if (num < 1) then
    	if msgtype == 2 then
    		Talk(1, "", msg)
        elseif msgtype == 1 then
        	Say(msg, 0)
        else
        	Msg2Player(msg)
        end
        return
    end
    OldPlayer = PlayerIndex
    for i=1, num do
        PlayerIndex = GetTeamMember(i)
    	if msgtype == 2 then
    		Talk(1, "", msg)
        elseif msgtype == 1 then
        	Say(msg, 0)
        else
        	Msg2Player(msg)
        end
    end
    PlayerIndex = OldPlayer
end
--============talk公共处理
function temp_Talk(self, nPage)
	if type(self) == "string" then
		self = GetTable(self);
	end
	if not self then return end
	if self.check and self.check(self) == nil then return end

	nPage = nPage or 0;
	local commonSel = self.commonSel or 0;
	local nLinePerPage = self.nLinePerPage or gLinePerPage or 10;
	local tSel = {}
	local nMin = 1 + nPage * nLinePerPage;
	local nMax = min( nMin + nLinePerPage - 1, getn(self.sel) - commonSel);
	for i=nMin, nMax do
		local callback = getcallback(self.sel[i][2], self);
		if callback then
			if self.makeSure
				and ((commonSel == 0 and i < getn(self.sel) - commonSel)
					or (commonSel > 0 and i <= getn(self.sel) - commonSel)) then
				callback = format('#makeSure("%s", %d, "%s")', HashTable(self), i, callback);
			end
			tinsert(tSel, format("%s/%s", self.sel[i][1], callback));
		end
	end
	local bReturn = 0;
	if nPage > 0 then
		tinsert(tSel, format("Trang trc".."/#temp_Talk('%s', %d)", HashTable(self), nPage - 1));
	end
	if nMax < getn(self.sel) - commonSel then
		tinsert(tSel, format("Trang k�".."/#temp_Talk('%s', %d)", HashTable(self), nPage + 1));
	end
	for i = getn(self.sel) - commonSel + 1,  getn(self.sel) do
		tinsert(tSel, format("%s/%s", self.sel[i][1], getcallback(self.sel[i][2], self)));
	end
	suSay( self.msg, getn(tSel), tSel);
end
function getcallback(cb, t)
	local tp = type(cb);
	if tp == "string" then return cb end
	if tp == "table" then return format("#temp_Talk('%s')",HashTable(cb)) end
	if tp == "function" then return cb(t) end
end
function HashTable(t)
	g_TableHash = g_TableHash or {};
	local s = strsub(tostring(t), 8);
	g_TableHash[s] = t;
	return s;
end
function GetTable(s)
	return g_TableHash and g_TableHash[s];
end
-- suSay: 自动分页say, 前面页只有上/下选项,最后页有自定选项
--	参数与Say一样
PAGE_SIZE = 450;
function suSay(szMsg, n, ...)
	if strlen(szMsg) < PAGE_SIZE then
		Say(szMsg, n, gf_UnPack(arg))
		return
	end
	tTalkMsg = {}
	nTalkMsg = 1;

	szMsg = gsub(szMsg, "\\p", "\n\\p");
	gsub(szMsg, "(%C+)", procTalk);

	if type(arg[1]) == "table" then
		arg = arg[1];
	end
	g_PlayerTalkTmp[GetName()] = {
		msg = tTalkMsg,
		sel = arg,
	}
	suSayCB();
end

function suSayCB(nPage)
	nPage = nPage or 1;
	tMsg = g_PlayerTalkTmp[GetName()];
	if not tMsg then
		gf_warning("[WARNING] [suSayCB] [date error] [role:"..GetName().."]");
		return
	end
	local tArg = new(tMsg.sel);
	if getn(tMsg.msg) > nPage then
		tArg = { format("Trang k�/#suSayCB(%d)", nPage+1)};
	end
	if nPage > 1 then
		tinsert(tArg, 1, format("Trang trc/#suSayCB(%d)", nPage-1));
	end

	Say(tMsg.msg[nPage], getn(tArg), tArg);
end

function nothing()
end
--==========================================================