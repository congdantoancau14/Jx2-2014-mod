--作者：严军
--创建日期：07年11月13日14:50
--师门关卡常量定义脚本文件
Include("\\script\\task\\faction_back_room\\stage_info.lua");
DEBUG_VERSION = 0;
IB_VERSION = 1;
UNCOMPLETED_VERSION = 0;	--不完整版本？指的是忽略一些程序机制
--==================================================================================
BACKROOM_RELAY_KEY = " backroom_timerecord";	--数据库主关键字
LOG_HEADER = "[S� m玭 m藅 th蕋]:";
LOG_ERR_HEADER = "[S� m玭 m藅 th蕋 b� l鏸]:";
MISSION_NAME = "S� m玭 m藅 th蕋 080129";
--==================================================================================
LOGIN_ID = 1107;	--登陆触发器，处理服务器宕机的情况
LOGIN_TRIGGER_ID = 3019;
--==================================================================================
MAX_DIFFICULTY_LEVEL = 9;	--最大循环
MAX_STAGE = 9;				--每循环最大关卡数
MAX_ATTEND_TIMES = 3;		--每周最大闯关次数
MAX_FAILURE_TIMES = 1;		--每周最大失败次数
MAX_FREE_READ_RECORD_TIMES = 2;	--每周最大免费读档次数
MAX_ROOM_COUNT = 100;		--道具所能开启的单台服务器最大房间数
MAX_ROUTE_ROOM_COUNT = 10;	--流派最大房间数

NEED_NUM_JIEGUAN = 2;		--接关所需道具数量
--总使用范围1121-1140==============================================================
--任务变量1121--1125================================================================
TSK_ATTEND_WEEK = 1121;			--上次闯关的时间（年周）

TSK_ENTER_TYPE = 1123;			--记录进入类型，0表示正常进入，1表示读档进入。此变量在某循环第一关时将被清0
TSK_TAG1 = 1124;				--标记1。用来标记玩家在调整后第1次上线
--任务变量1126--1130（每周一清）==================================================
TSK_WC_BEGIN = 1126;
TSK_WC_ATTEND_TIMES = 1126;	--本周闯关总次数
TSK_WC_FAIL_TIMES = 1127;		--本周闯关失败次数（清档次数）
TSK_WC_READ_RECORD_TIMES = 1128;	--本周读档次数
TSK_WC_LAST_RECORD = 1129;		--记录本周闯关进度。个位与十位记录小关，百位以上记录难度

TSK_WC_END = 1130;
--记录每循环最快时间1131至1139共9个变量
TSK_BEST_RECORD_BEGIN = 1131;
TSK_BEST_RECORD_END = 1139;
--任务变量1936--1940（退出关卡时清0）=================================================
TSK_NC_BEGIN = 1140;
TSK_NC_END = 1140;
--临时任务变量======================================================================
TTSK_BEGIN = 0;
TTSK_END = 0;
TTSK_NORMAL_ITEM_TYPE = 18;		--兑换物品时记录选择的是哪样物品
--地图变量==========================================================================
MAP_TSK_BEGIN = 1;
MAP_TSK_END = 1;
--=========================================================================================
CAMP_ALL = 0;
CAMP_PLAYER = 1;
CAMP_ENEMY = 2;
CAMP_EVIL = 3;
TB_CAMP_NAME =
{
	[0] = "",
	[1] = "camp_player",
	[2] = "camp_enemy",
	[3] = "camp_evil",
}
--关卡物品信息
TB_ITEM = 
{
	[1] = {"S� m玭 m藅 th蕋 l謓h",2,0,1048},
}
--消耗品信息
TB_NORMAL_ITEM = 
{	--名字，ID1，ID2，ID3，消耗物品数量，消耗金币（单位金）
	[1] = {"Ph莕 Quang Th莕 Sa",2,1,3333,15,0},
	[2] = {"Ng� Hoa T� Nguy猲 T竛 (s鴆 m筺h)",1,0,261,5,0},
	[3] = {"Ng� Hoa T� Nguy猲 T竛 (n閕 c玭g)",1,0,262,5,0},
	[4] = {"Ng� Hoa T� Nguy猲 T竛 (g﹏ c鑤)",1,0,263,5,0},
	[5] = {"Ng� Hoa T� Nguy猲 T竛 (th﹏ ph竝)",1,0,264,5,0},
	[6] = {"Ng� Hoa T� Nguy猲 T竛 (nhanh nh裯)",1,0,265,5,0},
	[7] = {"Th蕋 Hoa T� Nguy猲 T竛 (s鴆 m筺h, g﹏ c鑤)",1,0,266,8,50},
	[8] = {"Th蕋 Hoa T� Nguy猲 T竛 (s鴆 m筺h, th﹏ ph竝)",1,0,267,8,50},
	[9] = {"Th蕋 Hoa T� Nguy猲 T竛 (s鴆 m筺h, nhanh nh裯)",1,0,268,8,50},
	[10] = {"Th蕋 Hoa T� Nguy猲 T竛 (s鴆 m筺h, n閕 c玭g)",1,0,269,8,50},
	[11] = {"Th蕋 Hoa T� Nguy猲 T竛 (n閕 c玭g, g﹏ c鑤)",1,0,270,8,50},
	[12] = {"Th蕋 Hoa T� Nguy猲 T竛 (n閕 c玭g, th﹏ ph竝)",1,0,271,8,50},
	[13] = {"Th蕋 Hoa T� Nguy猲 T竛 (n閕 c玭g, nhanh nh裯)",1,0,272,8,50},
	[14] = {"Th蕋 Hoa T� Nguy猲 T竛 (th﹏ ph竝, g﹏ c鑤)",1,0,273,8,50},
	[15] = {"Th蕋 Hoa T� Nguy猲 T竛 (th﹏ ph竝, nhanh nh裯)",1,0,274,8,50},
	[16] = {"Th蕋 Hoa T� Nguy猲 T竛 (nhanh nh裯, g﹏ c鑤)",1,0,275,8,50},
}
TEMP_STATE_BEGIN = 2600001;
TEMP_STATE_END = 2600020;
--===================================================================================
--Mission相关常量定义======================================================================
MISSION_ID = 41;									--Mission的ID
TIMER_ID = 70;										--计时器的ID
--=========================================================================================
FRAME_PER_SECOND = 18;								--游戏运行速度：每秒１８帧
FRAME_PER_MIN = 60*FRAME_PER_SECOND;				--每分钟游戏帧数
--定义各个阶段的持续时间，=================================================================
READY_TIME = 5;										--准备时间，5分钟
STARTED_TIME = 10;									--进行时间时间，10分钟
SHORT_PAUSE_TIME = 1/6;								--默认的闯关时间							
ENDING_TIME = 2;									--等待结束时间，5分钟
--定义各个阶段计时器的触发间隔=============================================================
READY_TIMER_INTERVAL = 1;							--计时器触发的时间间隔，单位分钟
READY_TIMER_COUNT = (READY_TIME/READY_TIMER_INTERVAL)-1;	
STARTED_TIMER_INTERVAL = 1/12;	--5秒					
STARTED_TIMER_COUNT = (STARTED_TIME/STARTED_TIMER_INTERVAL)-1;
SHORT_PAUSE_TIMER_INTERVAL = 1/12;	--5秒
SHORT_PAUSE_TIMER_COUNT = (SHORT_PAUSE_TIME/SHORT_PAUSE_TIMER_INTERVAL)-1;
ENDING_TIMER_INTERVAL = 1/2;
ENDING_TIMER_COUNT = (ENDING_TIME/ENDING_TIMER_INTERVAL)-1;	
--MissionS变量=============================================================================
MS_MISSION_NAME = 1;								--记录Mission的名字，用作地图检查等
MS_MISSION_STRING = 10;								--Mission字符串，也用作地图检查
--MissionV变量=============================================================================
MV_MISSION_STATE = 1;								--记录Mission状态
MV_TIMER_LOOP = 2;									--记录计时器的计数
MV_MISSION_UID = 3;									--记录Mission的唯一ID
MV_CUR_DIFF = 4;									--当前处于第几循环
MV_CUR_STAGE = 5;									--当前处于第几关
MV_TOTAL_TIME = 6;									--通过某一循环所用的总时间
MV_MAPID = 7;										--记录场地的地图ID
MV_MAPIDX = 8;										--记录场地的地图索引
MV_FACTION = 9;										--记录这个场地是属于哪个门派的
MV_ROUTE = 10;										--记录玩家的路线
MV_PLAYERINDEX = 11;								--记录玩家的索引
MV_BEGIN_TIME = 12;									--记录某小关开始闯关的时间
MV_ENTRY_MAPID = 13;								--记录玩家进入秘室时所处的地图ID
MV_MAP_TYPE = 14;									--记录场地类型。如果为0表示该场地是服务器共享秘室地图，否则这个数值表示该场地是哪个流派的
--每小关清除的Mission变量==================================================================
MV_NSC_BEGIN = 71
MV_NSC_REMOVE_NPC_BODY = 71;						--NPC死的时候是否立刻删除尸体
MV_NSC_BOSS_INDEX = 72;								--记录BOSS的索引
MV_NSC_KILL_NPC_COUNT = 73;							--记录当前杀NPC数量
MV_NSC_NEED_KILL_NUMBER = 74;						--记录所需杀NPC数量
MV_NSC_REFLASH_KILL_NUMBER = 75;					--记录刷新前所杀的NPC数量

MV_NSC_VALUE1 = 80;									--共享变量
MV_NSC_END = 80
--记录NPC索引的变量========================================================================
MV_NPC_INDEX_BEGING = 81;							--用来记录NPC索引，占用８０至１００
MV_NPC_INDEX_END = 100;
--Mission状态集============================================================================
MS_STATE_IDEL = 0;									--场地空闲
MS_STATE_READY = 1;									--等待状态（包括开始等待与存档等待）
MS_STATE_STARTED = 2;								--闯关状态
MS_STATE_SHORT_PAUSE = 3;							--小关与小关之间的暂停
MS_STATE_END_WAITING = 4;							--结束状态（等待离场）
--=========================================================================================
