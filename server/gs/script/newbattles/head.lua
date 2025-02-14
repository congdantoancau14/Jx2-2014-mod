Include("\\script\\newbattles\\battleactivity_head.lua");
Include("\\script\\newbattles\\battlepoint_head.lua");
Include("\\script\\ks2vng\\missions\\mission_award_add_rate_cfg.lua")

DEBUG_VERSION = 0;	--调试版本？
IB_VERSION = 1;		--IB版本？

BATTLE_JUNGONG_EXT_RATE = min(VNG_CFG_NB_JUNGONG_EXT_ADD_RATE or 0, 4)
BATTLE_EXP_EXT_RATE =  min(VNG_CFG_NB_EXP_EXT_ADD_RATE or 0, 6)
--========================================================================================
ALL_ID = 0
SONG_ID = 1						--宋方阵营在mission中的ID
LIAO_ID = 2						--辽方阵营在mission中的ID
SONGLIAO_ID = SONG_ID+LIAO_ID;	--宋方ID＋辽方ID，这个主要是用来方便求敌对阵营的，敌对阵营＝SONGLIAO_ID－当前阵营ID
--============战场系统脚本全局变量=========================================================
DRIVE_PLAYER_OUTOF_SHELTER = 0;	--是否打开强制传送后营停留过久的玩家的功能
CURE_ALL_PLAYER = 0;			--是否治疗所有和平状态的玩家
ALLOW_SIGNUP = 0;				--是否允许玩家在战场开始后仍可报名（还有报名名额的情况下）
FORBIDENT_CREATE_TEAM = 1;		--是否禁止战场内同阵营组队，队员可共享积分。１为禁止，０为允许
RANDOM_CAMP_PLACE = 0;			--是否打开随机后营功能。１为打开，０为关闭。随机后营指的是宋辽双方各自的后营和战场进入点是不固定的。
STATISTIC_OPEN = 1;				--是否打开战场统计功能
SERIES_KILL_OPEN = 1;			--是否打开连斩积分加成功能
--============服务器全局变量=========================================================
GLB_FORBIDBATTLE = 31			--当该值1时表示停止战役的启动
GLB_NEW_BATTLESTATE = 32		--新战场的状态。个位为1表示副战场报名中，2为副战场开战中，3为主战场报名中，4为主战场开战中
GLB_VILLAGE =33;				--记录村落战的结果，0为平手，1为宋赢，2为辽赢，下同
GLB_RESOURCE = 34;				--记录资源战的结果
GLB_EMPLACEMENT = 35;			--记录炮台战的结果
GLB_MAINBATTLE = 36;			--记录主战场的结果
GLB_SIGN_UP_VILL_SONG = 37;		--记录各个战场双方报名人数
GLB_SIGN_UP_VILL_LIAO = 38;
GLB_SIGN_UP_RESO_SONG = 39;
GLB_SIGN_UP_RESO_LIAO = 40;
GLB_SIGN_UP_EMPL_SONG = 41;
GLB_SIGN_UP_EMPL_LIAO = 42;
GLB_SIGN_UP_MAIN_SONG = 43;
GLB_SIGN_UP_MAIN_LIAO = 44;
GLB_RANDOM_PLACE_VILL = 45;		--标记宋辽双方的随机后营。０表示默认（宋左辽右），１表示相反位置
GLB_RANDOM_PLACE_RESO = 46;
GLB_RANDOM_PLACE_EMPL = 47;
GLB_RANDOM_PLACE_MAIN = 48;
--============一些战场全局设置=======================================================
VILLAGE_MAP_ID = 881;			--地图ID
RESOURCE_MAP_ID = 882;
EMPLACEMENT_MAP_ID = 883;
MAIN_MAP_ID = 884;
--===================================================================================
SUB_BATTLE_MAX_PLAYER = 150		--副战场单方人数上限
MAIN_BATTLE_MAX_PLAYER = 300	--主战场单方人数上限
SUB_BATTLE_PLAYER_DIFF = 5		--副战场最大人数差
MAIN_BATTLE_PLAYER_DIFF = 5	--主战场最大人数差
SUB_BATTLE_SIGNUP_MAX_PLAYER = 150	--副战场报名单方人数上限
MAIN_BATTLE_SIGNUP_MAX_PLAYER = 300	--主战场报名单方人数上限
SUB_BATTLE_SIGNUP_PLAYER_DIFF = 5	--副战场报名最大人数差
MAIN_BATTLE_SIGNUP_PLAYER_DIFF = 5	--主战场报名最大人数差

TEAM_MEMBER_DISTANCE = 50;		--队员之间获得积分的最大距离
TEAM_POINT_ATTENUATION = 0.6;	--队伍积分的衰减，６０％

DEAD_BODY_TIME = 5;				--尸体存在时间

MAX_CHANGE_CAMP = 3;			--最多免费转换阵营次数

ACTIVITY_ADJUSTOR = 20;			--战场活跃系统调整参数（即玩家什么都不做的默认活跃系数）

FRAME_PER_SECOND = 18;			--游戏运行速度：每秒１８帧
FRAME_PER_MIN = 60*FRAME_PER_SECOND;--每分钟游戏帧数

EMPEROR_AWARD_EXP = 100000;		--皇帝嘉奖经验
EMPEROR_AWARD_POINT = 10;		--皇帝嘉奖积分
BATTLE_STAR_AWARD_EXP = 200000;	--战场之星奖励经验
BATTLE_STAR_AWARD_POINT = 20;	--战场之星奖励积分
INVINCIBILITY_TIME = 5;			--传出后营的无敌时间，单位秒
--============战场Mission ID=========================================================
VILLAGE_MISSION_ID = 25			--村落争夺战（各个战场的Mission ID）
RESOURCE_MISSION_ID = 26		--草谷争夺战
EMPLACEMENT_MISSION_ID = 27		--炮台争夺战
MAINBATTLE_MISSION_ID = 28		--主战场
--============战场ID=================================================================
VILLAGE_ID = 1					--村落争夺战（各个战场的ID，用以标识玩家在哪个战场里面）
RESOURCE_ID = 2					--草谷争夺战
EMPLACEMENT_ID = 3				--炮台争夺战
MAINBATTLE_ID = 4				--主战场
--==================排行榜ID=========================================================
RANK_RESOURCE = 0; 				--粮草战英雄榜=0
RANK_VILLAGE = 1;				--村落战英雄榜=1
RANK_EMPLACEMENT = 2;			--炮台战英雄榜=2
RANK_MAIN = 3;					--雁门关英雄榜=3
RANK_BATTLE_POINT = 4;			--积分排名=4
RANK_BATTLE_CONTRIBUTION = 5;	--军功排名=5
RANK_SINGLE_FIGHT = 6;			--单挑英雄榜=6
RANK_BATTLE_STAR = 7;			--战场之星=7
--===============一些table============================================================
tBTMSInfo = 					--战场ID与Mission ID和地图ID的对应关系
{
	[VILLAGE_ID] = {VILLAGE_MISSION_ID,VILLAGE_MAP_ID},
	[RESOURCE_ID] = {RESOURCE_MISSION_ID,RESOURCE_MAP_ID},
	[EMPLACEMENT_ID] = {EMPLACEMENT_MISSION_ID,EMPLACEMENT_MAP_ID},
	[MAINBATTLE_ID] = {MAINBATTLE_MISSION_ID,MAIN_MAP_ID},
}
tCampNameP = 					--阵营名字（拼音），设置阵营的时候用的
{
	[ALL_ID] = "noaligned",
	[SONG_ID] = "dasong",
	[LIAO_ID] = "daliao",
}

tCampNameZ =					--阵营名字（中文），显示对话的时候用的
{
	[ALL_ID] = "",
	[SONG_ID] = "T鑞g",
	[LIAO_ID] = "Li猽",
}

tSexName = {"Thi誹 hi謕","N� hi謕 "};
tRankName = {"Binh s�","Hi謚 髖","Й th鑞g","Ti猲 phong","Чi Tng","Nguy猲 So竔"};
tCampNickName = {"Ngi T鑞g","Ngi Li猽"};

tBattleName =					--战场名字
{
	[0]	= "",
	[VILLAGE_ID] = "Gi秈 C鴘 N玭g Trang",				--"Nh筺 M玭 Quan-chi課 d辌h Th玭 trang",
	[RESOURCE_ID] = "Thu Th藀 Lng Th秓", 		--"Nh筺 M玭 Quan-chi課 d辌h th秓 c鑓",
	[EMPLACEMENT_ID] = "B秓 V� Th祅h Tr�",			--"Nh筺 M玭 Quan-chi課 d辌h ph竜 i",
	[MAINBATTLE_ID] = "Nh筺 M玭 R鵦 L鯽",			--"Nh筺 M玭 Quan-chi課 d辌h ch輓h",
}

tBattleChannel = 
{								--频道名字与ID
	[VILLAGE_ID] = {"Gi秈 C鴘 N玭g Trang",12},
	[RESOURCE_ID] = {"Thu Th藀 Lng Th秓",13},
	[EMPLACEMENT_ID] = {"B秓 V� Th祅h Tr�",14},
	[MAINBATTLE_ID] = {"Nh筺 M玭 R鵦 L鯽",15},
}
tCampChannel = 					--战场上双方各自的聊天频道
{
	[1] = {"Gi秈 C鴘 N玭g Trang phe T鑞g",16},
	[2] = {"Gi秈 C鴘 N玭g Trang phe Li猽",17},
	[3] = {"Thu Th藀 Lng Th秓 phe T鑞g",18},
	[4] = {"Thu Th藀 Lng Th秓 phe Li猽",19},
	[5] = {"B秓 V� Th祅h Tr� phe T鑞g",20},
	[6] = {"B秓 V� Th祅h Tr� phe Li猽",21},
	[7] = {"Nh筺 M玭 R鵦 L鯽 phe T鑞g",22},
	[8] = {"Nh筺 M玭 R鵦 L鯽 phe Li猽",23},
}

tFaction = 						--门派
{
	[0] = "V� m玭 ph竔",
	[1] = "Thi誹 L﹎",
	[2] = "V� ng",
	[3] = "Nga My",
	[4] = "C竔 Bang",
	[5] = "Л阯g M玭",
	[6] = "Dng M玭",
	[7] = "Ng� чc",
	[8] = "Th髖 Y猲",
	[9] = "C玭 L玭",
	[10] = "Minh gi竜",
}

tRoute = 						--路线
{
	[0] = "V� m玭 ph竔",
	[1] = "Thi誹 L﹎",
	[2] = "T鬰 gia",
	[3] = "Thi襫 t╪g",
	[4] = "V� t╪g",
	[5] = "Л阯g M玭",
	[6] = "Л阯g M玭",
	[7] = "Nga My",
	[8] = "Nga My ph藅 gia",
	[9] = "Nga My t鬰 gia",
	[10] = "C竔 Bang",
	[11] = "C竔 Bang T躰h y",
	[12] = "C竔 Bang � Y",
	[13] = "V� ng",
	[14] = "V� ng o gia",
	[15] = "V� ng t鬰 gia",
	[16] = "Dng M玭",
	[17] = "Dng M玭 thng K�",
	[18] = "Dng M玭 Cung K�",
	[19] = "Ng� чc",
	[20] = "Hi謕 чc",
	[21] = "T� чc",
	[22] = "C玭 L玭",
	[23] = "C玭 L玭 Thi猲 S�",
	[24] = "Minh gi竜",
	[25] = "Minh Gi竜 Th竛h Chi課",
	[26] = "Minh Gi竜 Tr薾 Binh",
	[27] = "Minh Gi竜 Huy誸 Nh﹏",
	[28] = "Th髖 Y猲",
	[29] = "Th髖 Y猲 V� Ti猲",
	[30] = "Th髖 Y猲 Linh N�",
	[31] = "Л阯g M玭 Nh薽 Hi謕",
	[32] = "C玭 L玭 Ki誱 T玭",
}

tBattleItem = {					--战场物品列表
--		物品名　大类　小类１　小类２　退出战场是否删除
	[1]  = {"Lng th秓-s� c蕄",2,0,588,1},
	[2]  = {"Lng th秓-trung c蕄",2,0,589,1},
	[3]  = {"Lng th秓-cao c蕄",2,0,590,1},
	[4]	 = {"Cu鑓 lng th秓",2,0,591,1},
	[5]  = {"Hng d蒼 chi課 trng",2,0,595,0},
	[6]  = {"Huy襫 thi誸 kho竛g th筩h",2,0,594,1},
	[7]  = {"S琻 t芻-binh k�",2,0,593,1},
	[8]  = {"S琻 t芻-chi課 c�",2,0,592,1},
	[9]  = {"Sinh Sinh H鉧 T竛",1,0,205,1},
	[10] = {"Ng鋍 Cao t竛",1,0,204,1},
	[11] = {"V筺 V藅 Quy Nguy猲 n",1,0,206,1}
}

tBattleMed = --战场专用PK药
{--            物品名 大类 小类1 小类2 所需积分     药效说明         所需军衔
	[1]  = {"Ch輓h Nguy猲 H錳 T﹎ Кn(c.trng)",1,0,207,80,	"ph鬰 h錳 t蕋 c� nh鱪g k� n╪g b� ng b╪g",	 0},
	[2]  = {"Ng� Chuy觧 Linh B秓 Кn (c.trng)",1,0,208,50,	"Xu蕋 chi猽+5, duy tr� trong 10 gi﹜",	 	 0},
	[3]  = {"Th莕 Gi竝 Кn (chi課 trng)",	 1,0,209,50,	"Ngo筰 ph遪g 100%, duy tr� trong 5 gi﹜",	 0},
	[4]  = {"Th莕 Tr竜 Кn (chi課 trng)",	 1,0,210,50,	"N閕 ph遪g 100%, duy tr� 5 gi﹜",	 0},
	[5]  = {"Th玭g C﹏ T竛 (chi課 trng)",	 1,0,211,50,	"Mi詎 d辌h l祄 ch薽, duy tr� trong 10 gi﹜",	 0},
	[6]  = {"Ho箃 Huy誸 T竛 (chi課 trng)",	 1,0,212,50,	"Mi詎 d辌h gi秏 t鑓, duy tr� trong 10 gi﹜",	 0},
	[7]  = {"Sng L筩 T竛 (chi課 trng)",	 1,0,213,50,	"Mi詎 d辌h t� li謙, duy tr� trong 10 gi﹜",	 0},
--	[8]  = {"战场专用任督散",	 1,0,214,50,	"免疫封招，持续10秒",	 0},
	[8]  = {"C� Th筩h T竛 (chi課 trng)",	 1,0,215,50,	"Mi詎 d辌h y lui, duy tr� trong 10 gi﹜",	 0},
	[9] = {"Kim Cang T竛 (chi課 trng)",	 1,0,216,50,	"Mi詎 d辌h nh ng�, duy tr� trong 10 gi﹜",	 0},
	[10] = {"б Th莕 T竛 (chi課 trng)",	 1,0,217,50,	"Mi詎 d辌h m� man, duy tr� trong 10 gi﹜",	 0},
	[11] = {"Ng璶g H錸 T竛 (chi課 trng)",	 1,0,218,50,	"Mi詎 d辌h h鏽 lo筺, duy tr� trong 10 gi﹜",	 0},
	[12] = {"Th莕 Phong T竛 (chi課 trng)",	 1,0,219,50,	"Mi詎 d辌h nh th﹏, duy tr� trong 10 gi﹜",	 0},
	[13] = {"V� 髖 T竛 (chi課 trng)",	 1,0,220,50,	"Mi詎 cho竛g, duy tr� trong 10 gi﹜",	 0},
--	[15] = {"战场专用定心散",	 1,0,221,50,	"免疫迷惑，持续10秒",	 0},
--	[16] = {"战场专用玲珑真元丹",1,0,222,120,	"免疫所有负面，持续10秒",0},
	[14] = {"Th蕋 X秓 Linh Кn (chi課 trng)",	 1,0,223,200,	"Ti觰 v� ch, duy tr� trong 3 gi﹜",		 0},
	[15] = {"V� C鵦 Ti猲 Кn (chi課 trng)",	 1,0,224,500,	"Чi v� ch, duy tr� trong 6 gi﹜",		 0},
	[16] = {"Sinh Sinh H鉧 T竛",1,0,205,10,	"Nhanh ch鉵g ph鬰 h錳 sinh l鵦 v� n閕 l鵦",	 0},
	[17] = {"Ng鋍 Cao t竛",1,0,204,10,	"Nhanh ch鉵g ph鬰 h錳 sinh l鵦",			 0},
	[18] = {"V筺 V藅 Quy Nguy猲 n",1,0,206,8,		"Nhanh ch鉵g ph鬰 h錳 n閕 l鵦",			 0},
	[19] = {"Th蕋 Khi誹 Nguy猲 B秓 Кn(ctrng)",1,0,225,500,	"Xu蕋 chi猽+10, duy tr� trong 15 gi﹜", 	 4},
--	[23] = {"战场专用无上神元丹",1,0,226,500,	"免疫所有负面，持续20秒",4},
	[20] = {"Th玭g Thi猲 V� C鵦 Кn (ctrng)",1,0,227,1000,	"V� ch, duy tr� trong 9 gi﹜",		 4},
}

tPKMed = --PK药
{--         物品名 大类 小类1 小类2 所需积分 药效说明        所需军衔
	[1]  = {"Ch輓h Nguy猲 H錳 T﹎ n",1,0,50,1500,	"Lo筰 b� t蕋 c� k� n╪g CD",	 	 0},
	[2]  = {"Ng� Chuy觧 Linh B秓 n",1,0,53,1000,	"Xu蕋 chi猽+5",				 0},
	[3]  = {"Th莕 Gi竝 n",	 1,0,54,1000,	"Ngo筰 ph遪g 100%, duy tr� trong 5 gi﹜",	 0},
	[4]  = {"Th莕 Tr竜 n",	 1,0,55,1000,	"N閕 ph遪g 100%, duy tr� 5 gi﹜",	 0},
	[5]  = {"Th玭g C﹏ t竛",	 1,0,56,1000,	"Mi詎 d辌h l祄 ch薽, duy tr� trong 10 gi﹜",	 0},
	[6]  = {"Ho箃 Huy誸 t竛",	 1,0,57,1000,	"Mi詎 d辌h gi秏 t鑓, duy tr� trong 10 gi﹜",	 0},
	[7]  = {"Sng L筩 t竛",	 1,0,58,1000,	"Mi詎 d辌h t� li謙, duy tr� trong 10 gi﹜",	 0},
--	[8]  = {"任督散",	 1,0,59,1000,	"免疫封招，持续10秒",	 0},
	[8]  = {"C� Th筩h t竛",	 1,0,60,1000,	"Mi詎 d辌h y lui, duy tr� trong 10 gi﹜",	 0},
	[9] = {"Kim Cang t竛",	 1,0,61,1000,	"Mi詎 d辌h nh ng�, duy tr� trong 10 gi﹜",	 0},
	[10] = {"б Th莕 t竛",	 1,0,62,1000,	"Mi詎 d辌h m� man, duy tr� trong 10 gi﹜",	 0},
	[11] = {"Ng璶g H錸 t竛",	 1,0,63,1000,	"Mi詎 d辌h h鏽 lo筺, duy tr� trong 10 gi﹜",	 0},
	[12] = {"Th莕 Phong t竛",	 1,0,64,1000,	"Mi詎 d辌h nh th﹏, duy tr� trong 10 gi﹜",	 0},
	[13] = {"V� 髖 t竛",	 1,0,65,1000,	"Mi詎 cho竛g, duy tr� trong 10 gi﹜",	 0},
--	[15] = {"定心散",	 1,0,66,1000,	"免疫迷惑，持续10秒",	 0},
--	[16] = {"玲珑真元丹",1,0,67,1500,	"免疫所有负面，持续10秒",0},
	[14] = {"Th蕋 X秓 Linh n",	 1,0,68,2000,	"Ti觰 v� ch, duy tr� trong 3 gi﹜",		 0},
	[15] = {"V� C鵦 Ti猲 n",	 1,0,69,5000,	"Чi v� ch, duy tr� trong 6 gi﹜",		 0},
	[16] = {"Th蕋 Khi誹 Nguy猲 B秓 Кn",1,0,228,6000,	"Xu蕋 chi猽+10, duy tr� trong 15 gi﹜",	 4},
--	[20] = {"无上神元丹",1,0,229,8000,	"免疫所有负面，持续20秒",4},
	[17] = {"Th玭g Thi猲 V� C鵦 Кn",1,0,230,10000,	"V� ch, duy tr� trong 9 gi﹜",		 4},
}

EXIT_POINT = 	--退出点
{
	[ALL_ID] = {100,1456,2789},	--测试用点
	[SONG_ID] = {808,1748,3060},
	[LIAO_ID] = {808,1635,3192},
}
--========================================================================================
RELAY_DATA_BATTLE = "battle_statistic";	--共享数据库的字符串标识
RELAY_CALLBACK_SCRIPT = "\\script\\newbattles\\battlestatistic.lua";	--Relay共享数据库回调脚本路径
--========================================================================================
BATTLE_OFFSET = 700				--战场任务变量的偏移量
--=========战场任务变量===================================================================
PT_RANKPOINT = 1				--记录玩家的当前军功，宋方数值为正，辽方数值为负
PT_MAX_RANKPOINT_SONG = 2		--记录玩家的宋方最高军功
PT_MAX_RANKPOINT_LIAO = 3		--记录玩家的辽方最高军功
PT_CURRANK = 4					--记录玩家的当前军衔，宋方为正，辽方为负
PT_BATTLE_TYPE = 5;				--记录玩家现在在哪个战场，1为村落，2为资源，3为炮台，4为主战场，0不在任一战场
PT_MULTIPLE_JUNGONG = 6;		--N倍军功标记
PT_TOTALPOINT = 7				--记录玩家总的战场积分，用以消耗，会降低
PT_EMPEROR_AWARD_COUNT = 8		--皇帝嘉奖次数
PT_BATTLE_STAR_COUNT = 9		--成为战地之星次数
PT_LAST_RESULT = 10;			--记录玩家参加的上一场战场的结果
PT_SIGN_UP = 11					--记录玩家报名参加哪个小战场哪一阵营，个位记录阵营，十位记录战场
PT_BATTLE_DATE = 12				--记录玩家上次报名参加战场的日期(format:yymmdd)
PT_VILLAGE_WIN = 13				--记录玩家参加村落战赢的次数（输和平手不记录）
PT_RESOURCE_WIN = 14			--记录玩家参加资源战赢的次数（输和平手不记录）
PT_EMPLACEMENT_WIN = 15			--记录玩家参加炮台战赢的次数（输和平手不记录）
PT_MAIN_WIN = 16				--记录玩家参加主战场赢的次数（输和平手不记录）
PT_ATTEND_VILLAGE = 17			--参加村落战的次数（以战场正常结束为参加标准）
PT_ATTEND_RESOURCE = 18			--参加资源战的次数（以战场正常结束为参加标准）
PT_ATTEND_EMPLACEMENT = 19		--参加炮台战的次数（以战场正常结束为参加标准）
PT_ATTEND_MAIN = 20				--参加主战场的次数（以战场正常结束为参加标准）
PT_VILL_POINT = 21				--玩家在村落战场上所获得的个人积分
PT_RESO_POINT = 22				--玩家在资源战场上所获得的个人积分
PT_EMPL_POINT = 23				--玩家在炮台战场上所获得的个人积分
PT_MAIN_POINT = 24				--玩家在主战场上所获得的个人积分
PT_FIND_HEADER = 25				--找到首领次数
PT_HANDIN_RESOURCE = 26			--上交粮草数量
PT_KILL_EMPLACEMENT = 27		--夺取炮台次数
PT_HELP_REFUGEE = 28			--救援难民数量
PT_KILL_PIONEER = 29			--杀敌先锋数量
PT_KILL_GENERAL = 30			--杀敌大将
PT_KILL_MARSHAL = 31			--杀敌元帅
PT_KILL_SONG_PLAYER = 32		--杀死宋方玩家次数
PT_KILL_LIAO_PLAYER = 33		--杀死辽方玩家次数
PT_LAST_CAMP = 34;				--上一场战场的阵营
PT_BEST_SERIES_KILL = 35		--最高连斩数
PT_KILL_BY_SONG = 36			--被宋方玩家杀死次数
PT_KILL_BY_LIAO = 37			--被辽方玩家杀死次数
PT_SINGLE_WIN = 38				--单挑赢次数（单挑积分由这三个值计算而得，赢一场３分，平１分，负０分）
PT_SINGLE_LOSE = 39				--单挑输次数
PT_SINGLE_DRAW = 40				--单挑打平次数
PT_HAVE_REFUGEE = 41			--下线时是否有难民跟着
PT_SPYCLOTH_TIME = 42			--使用间谍装束的时间
PT_MAX_KILL = 43;				--主战场最高杀人记录
PT_MAX_DEATH = 44;				--主战场最高死亡记录	
PT_MAX_CURRANK_SONG = 45;		--玩家最高宋方军衔
PT_MAX_CURRANK_LIAO = 46;		--玩家最高辽方军衔
PT_OLD_BATTLE_POINT = 47;		--旧战场总积分
PT_1MIN2TYPE = 48;				--记录开始时间：一分钟内采取的都是中级粮草
PT_1MIN3TYPE = 49;				--记录开始时间：一分钟内采取的都是高级粮草
PT_1MIN3TYPEDOUBLE = 50;		--记录开始时间：一分钟内采取的都是2倍高级粮草
PT_1MINDOUBLE = 51;				--记录开始时间：一分钟内采取的都是2倍粮草
PT_3MINDOUBLE = 52;				--记录开始时间：三分钟内采取的都是2倍粮草
PT_EXP_AWARD = 53;				--记录所获得的经验奖励
PT_POINT_AWARD = 54;			--记录所获得的积分奖励	
PT_JUNGONG_AWARD = 55;			--记录所获得的军功奖励
PT_GOLDENEXP_AWARD = 56;		--记录所获得的健康经验转经验的奖励数值
PT_EXCHANGE_EXP_COUNT = 57;		--记录当天换取常规经验奖励的次数
PT_EXCHANGE_EXP_DATE = 58;		--记录换取常规经验奖励的日期
PT_CHANGE_CAMP_COUNT = 59;		--记录免费转换阵营的次数
PT_GET_EXP_AWARD_COUNT = 60;	--记录当天领取大战场经验奖励的次数
PT_GET_EXP_AWARD_DATE = 61;		--记录领取大战场经验奖励的日期
PT_LAST_BATTLE = 62;			--记录上一场参加的是哪一个战场
--==================玩家变量，只在进入不同的战场时被清除=======================================
PTNC_KILL = 80;					--单场战场杀人数目
PTNC_DEATH = 81;				--单场战场被杀数目
PTNC_SERIES_KILL = 82			--单场战场当前连斩数
PTNC_ACTIVITY = 83				--单场战场活跃系数
PTNC_BATTLEPOINT = 84			--单场战役的积分
PTNC_KILL_VILLAGER_POINT = 85	--主战场杀土民所获得的积分
PTNC_KILL_SOLDIER_POINT = 86	--主战场杀士兵所获得的积分
PTNC_GOT_MEDICINE= 87			--标记是否领取了战场免费药
PTNC_HELP_REFUGEE = 88			--单场救助难民数量
PTNC_USE_HOE_TIMES = 89			--草谷场使用锄头的次数

PT_TAG_CLEARED = 100			--标志战场变量有没有被清过，0表示没清过，1表示清过
--====================战场里面用到的临时变量===============================================
PTT_BEGIN = 20					--第一个临时变量
PTT_KILLERINDEX = 20			--记录杀死你的玩家的INDEX
PTT_KILLERID = 21				--记录杀死你的玩家的ID
PTT_KILLEDINDEX = 22			--记录被你杀死的玩家的INDEX
PTT_KILLEDID = 23				--记录被你杀死的玩家的ID
PTT_LOCK = 24					--记录是否出于锁定状态，(单条请求中或者单条中)
PTT_ROOMINDEX = 25				--记录在哪个单挑场地，0表示不在单挑场地
PTT_FOLLOWER = 26				--是不是带着土民，１是０否
PTT_FIGHT_STATE = 27			--在单挑场地的状态

PTT_PUBLIC_POINT = 29			--公共积分：用来作最后报告分数
PTT_RESULT_POINT = 30			--胜负积分：用来作最后报告分数
PTT_SELECTED = 31				--标识玩家是不是被选中的人
PTT_DIE_LOOP = 32				--记录玩家在战场死亡的时候，当前计时器的循环数
PTT_OPERATE_TIME = 33			--用来处理主战场单挑操作的延迟，单位秒
PTT_TITLE = 34;					--玩家临时战场称号
PTT_IN_TASK_AREA = 35;					--在防作弊区
PTT_END = 35;					--最后一个临时变量
--====================战场外面用到的临时变量===============================================
PTT_SNAPSHOOT = 49				--一个生存时间很短暂的临时变量，用于两个函数之间的参数传递
--====================Custom Data==========================================================
tCustomDataString = 			--记录CustomData的字符串，第一个元素为１表示退出战场时不会清除，０表示要清除
{								--这个东西暂时还没有被使用
	[1] = {0,"bt_yj_enemyname"},	--主战场单挑时用来记录对方的名字的
	[2] = {1,"bts_village"},		--各战场的统计数据
	[3] = {1,"bts_resource"},
	[4] = {1,"bts_emplacement"},
	[5] = {1,"bts_mainbattle"},
}
CD_ENEMY_NAME = tCustomDataString[1][2];
CD_BTS_VILLAGE = tCustomDataString[2][2];
CD_BTS_RESOURCE = tCustomDataString[3][2];
CD_BTS_EMPLACEMENT = tCustomDataString[4][2];
CD_BTS_MAINBATTLE = tCustomDataString[5][2];
--==========战场公用MissionV变量（１－３０）========================================
MV_BATTLE_STATE = 1;			--记录战场目前状态
MV_BATTLE_ID = 2;				--记录战场的唯一ID
MV_BATTLE_POINT_SONG = 3;		--记录宋方的公共积分
MV_BATTLE_POINT_LIAO = 4;		--记录辽方的公共积分
MV_WINNER = 5;					--记录胜负，１为宋方赢，２为辽方赢，０为打平
MV_TIMER_LOOP = 6;				--记录TIMER的报时次数
MV_SP_TIMER_STATE = 7;			--记录特殊计时器的状态。各种状态在mission_head.lua定义
MV_SP_TIMER_LOOP = 8;			--记录特殊计时器的报时次数
MV_DEATH_COUNT_SONG = 9			--宋方玩家死亡次数
MV_DEATH_COUNT_LIAO = 10		--辽方玩家死亡次数
MV_FACTION_PLAYER_COUNT1 = 11;	--记录战场里面各门派人数，共１１个门派（包括白名），每个变量记四个门派，需三个变量
MV_FACTION_PLAYER_COUNT2 = 12;
MV_FACTION_PLAYER_COUNT3 = 13;
--==========常量：战场的状态=======================================================
MS_STATE_PEACE = 0;				--和平状态，即战场还没开始报名
MS_STATE_READY = 1;				--准备状态
MS_STATE_FIGHT = 2;				--开战状态
MS_STATE_COMPLETE = 3;			--战争结束状态
--===========================================================================
LOG_ID = 1108;					--登陆触发器表ID
LOG_TRIGGER_ID = 3121;			--登陆触发器自定义ID 
--===========================================================================

--=========================以下是道具相关常量==========================================
ITEM_SPYCLOTH_TIME = 3*3600			--间谍装束有效时间，单位秒