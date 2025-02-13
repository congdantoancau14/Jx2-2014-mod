--create date:2007-07-04
--author:yanjun
--describe:帮会关卡头文件
Include("\\script\\lib\\globalfunctions.lua");
Include("\\script\\missions\\tong_mission\\fields.lua");
Include("\\script\\missions\\tong_mission\\position.lua");
Include("\\script\\missions\\tong_mission\\stage\\npc_info.lua");
Include("\\script\\missions\\tong_mission\\stage\\stage1.lua");
Include("\\script\\missions\\tong_mission\\stage\\stage2.lua");
Include("\\script\\missions\\tong_mission\\stage\\stage3.lua");
Include("\\script\\missions\\tong_mission\\stage\\stage4.lua");
Include("\\script\\missions\\tong_mission\\stage\\stage5.lua");
Include("\\script\\missions\\tong_mission\\stage\\stage6.lua");
DEBUG_VERSION = 0;		--调试版本？
LIMIT_VERSION = 1;		--限制版本？
--==========以下是Mission相关的常量定义====================================================
MISSION_ID = 36;									--Mission的ID
ALL_CAMP = 0;
TIMER_ID = 64;										--计时器的ID
ASSI_TIMER_ID = 65;									--辅助计时器ID
LOG_ID = 206;										--登陆触发器ID
LOG_CUSTOM_ID = 262;								--登陆触发器自定义编号
--=========================================================================================
FRAME_PER_SECOND = 18;								--游戏运行速度：每秒１８帧
FRAME_PER_MIN = 60*FRAME_PER_SECOND;				--每分钟游戏帧数
--定义各个阶段的持续时间，只能填整数，单位为秒=============================================
READY_TIME = 2*60;									--准备时间
STARTED_TIME = 0;									--进行时间时间，填０表示无限时
ENDING_TIME = 1*60;									--等待结束时间
--定义各个阶段计时器的触发间隔=============================================================
READY_TIMER_INTERVAL = 1*60;							--计时器触发的时间间隔，单位秒
READY_TIMER_COUNT = (READY_TIME/READY_TIMER_INTERVAL)-1;	
STARTED_TIMER_INTERVAL = 5;					
STARTED_TIMER_COUNT = (STARTED_TIME/STARTED_TIMER_INTERVAL)-1;	
ENDING_TIMER_INTERVAL = 1*60;
ENDING_TIMER_COUNT = (ENDING_TIME/ENDING_TIMER_INTERVAL)-1;	
--MissionS变量=============================================================================
MS_TONG_NAME = 1;									--记录帮会的名字
--MissionV变量=============================================================================
MV_MISSION_STATE = 1;								--记录Mission状态
MV_TIMER_LOOP = 2;									--记录计时器的计数
MV_MISSION_UID = 3;									--记录Mission的唯一ID
MV_WEEK = 4											--记录开始关卡时所处的week
MV_KILL_SUB_NPC = 5;								--记录杀死替补区NPC的数量
MV_TIMER_TRIGGER_STATE = 6;							--记录关卡自定义的时间触发器的状态，1表示运行中，0表示停止
MV_GET_BOX = 7;										--记录是否拾取了宝箱
MV_APPLY_TIME = 8;									--记录上次玩家提出申请的时间
MV_ENTER_TIME = 9;									--记录上次玩家进入内堂的时间
MV_CHECK_POINT = 10;								--检查点
MV_STAGE = 11;										--记录当前处于第几关
MV_STAGE_OVER = 12;									--标记当前是否过关
MV_STAGE_START_TIME = 13;							--记录关卡开始时间
MV_BOSS1 = 14;										--BOSS1的索引
MV_BOSS2 = 15;										--BOSS2的索引
MV_NPC_COUNT = 16;									--记录NPC的数量
MV_FAC_NPC_COUNT = 17;								--记录门派类NPC的数量
MV_BOSS_COUNT = 18;									--记录BOSS的数量
MV_STAGE_STARTED = 19;								--标记是否已正式开始关卡(这个变量有点多余，暂时没起作用)
MV_CITY_MAP_ID = 20;								--记录这个关卡是在哪个城市的

MV_VALUE1 	= 21;									--STAGE的共用变量
MV_VALUE2 	= 22;									--不同关卡有不同的意义
MV_VALUE3 	= 23;									--使用时请在脚本中标明该值的含义
MV_VALUE4 	= 24;
MV_VALUE5 	= 25;
MV_VALUE6 	= 26;
MV_VALUE7 	= 27;
MV_VALUE8 	= 28;
MV_VALUE9 	= 29;
MV_VALUE10 	= 30;

--Mission状态集============================================================================
MS_STATE_IDEL = 0;									--场地空闲
MS_STATE_READY = 1;									--准备阶段
MS_STATE_STARTED = 2;								--开始阶段
MS_STATE_ENDING = 3;								--等待结束阶段
--=========================================================================================
--===========以下是关卡设置常量============================================================
MAX_STAGE = 6;					--最大关卡数
MAX_AREA = 2;					--每台服务器的区数量
MAX_FIELD = 3;					--每个区的场地数量
MAX_NORMAL_PLAYER_COUNT = 16;	--最大正选玩家数
MAX_PLAYER_COUNT = 60;			--最大玩家数，这个数减去正选玩家数就是替补玩家数
MAX_ROUTE_PLAYER_COUNT = 3;		--内堂最大相同职业玩家数量
MIN_ENTER_INTERVAL = 2*60;		--最小进入时间间隔
MIN_APPLY_INTERVAL = 60;		--个人最小申请时间间隔
MIN_MS_APPLY_INTERVAL = 30;		--Mission的最小申请时间间隔
MIN_TEAM_MEMBER = 1;			--最小队伍人数
MIN_LEVEL = 75;					--最小要求等级
MIN_JOIN_TONG_DAY = 0;			--最小入帮时间
MIN_PLAYER_COUNT = 1;			--最少玩家数
MIN_KILL_SUB_NPC_COUNT = 300;	--获得外堂奖励要杀的最少外堂小怪数量
KILL_SUB_NPC_POINT = 100;		--杀外堂小怪所获的额外积分
SUB_NPC_COUNT = 20;				--外堂小怪刷新数量
--=========================================================================================

--Relay共享数据key=========================================================================
KEY_WEEK = "tong_mission_key_week";	--保存帮会在哪一周通关了（年份与周数组成的数据）
KEY_STAGE = "tong_mission_key_stage";	--保存帮会当前关卡
KEY_ATTEND = "tong_mission_key_attend"	--参与闯关的年份与周数
--===================以下是任务变量(650-660)========================================================
TSK_BEGIN = 650;
TSK_WEEK = 650;				--记录上次闯关是今年的第几周
TSK_APPLY_TIME = 651;		--记录上次申请进入内堂的时间
TSK_POINT = 652;			--记录玩家个人关卡积分
TSK_ATTEND_STAGE_1 = 653;	--记录每周通过第1关的次数
TSK_ATTEND_STAGE_2 = 654;	--记录每周通过第2关的次数
TSK_ATTEND_STAGE_3 = 655;	--记录每周通过第3关的次数
TSK_ATTEND_STAGE_4 = 656;	--记录每周通过第4关的次数
TSK_ATTEND_STAGE_5 = 657;	--记录每周通过第5关的次数
TSK_ATTEND_STAGE_6 = 658;	--记录每周通过第6关的次数
TSK_END = 660;
--===================以下是临时任务变量(61-69)====================================================
TEMP_BEGIN = 61;
TSK_TEMP_STATUS = 61;								--标记玩家身份，0为替补，1为正选
TSK_TEMP_AREA_IDX = 62;								--记录区域索引
TSK_TEMP_FIELD_IDX = 63;							--记录场地索引
TSK_TEMP_MAP_ID = 64;								--记录进入时的地图ID
TSK_TEMP_HELPER = 65;								--标记是否为外援
TEMP_END = 69;
--=========================================================================================
TONG_MISSIONEX = "tong_mission";	--missionEx的名字
--=========================================================================================
GLB_CLEAR_FIELD = 81;				--服务器变量，记录是否请过场地
--=========================================================================================
TB_BOSS_INFO = 
{
	[0] = "Chng kh� c馻 Thng C� Th莕 Th� t� l筰 th祅h b鉵g ngi, mu鑞 ti猽 di謙 ph秈 d飊g m玭 ph秈 i 鴑g, n誹 kh玭g s� h錳 sinh. N誹 nh�  b鉵g h� v� t� t藀 qu� nhi襲 s� d蒼 n vt 秈 th蕋 b筰.",
	[1] = "\nThu閏 t輓h v� k� n╪g c th� c馻 Boss: l祄 m蕋 m竨 ph筸 vi l韓\nTi觰 qu竔 c th�: Li Ph� N� Tng (S� d鬾g k� n╪g c s竧 � ph筸 vi nh�), m鏸 m閠 giai 畂筺 s� hi謓 th猰 Li Y猲 h� tr�. \nB鉵g h� v� c�: ",
	[2] = "\nThu閏 t輓h v� k� n╪g c th� c馻 Boss: H錳 sinh (Trong su鑤 th阨 gian � 秈 n祔 Boss s� s� d鬾g Gia y Th莕 C玭g  h錳 sinh b秐 th﹏, t鎛g th阨 gian h錳 sinh l� 3 l莕, n誹 nh� trong th阨 gian nh蕋 nh m� nh ch誸 Boss 4 l莕 s� kh玭g h錳 sinh th猰 n鱝, n誹 kh玭g vt 秈 s� th蕋 b筰).\nTi觰 qu竔 c th�: C蕀 V� Binh (S� s� d鬾g k� n╪g cng l鵦  c玭g k輈h v� v藋 c莕 ph秈 nhanh ch鉵g ti猽 di謙) \nB鉵g h� v� c�: ",
	[3] = "\nThu閏 t輓h v� k� n╪g c th� c馻 Boss: \nHai tay nh� m閠 (M鏸 giai 畂筺 s� l祄 ngi ch琲 m蕋 50% sinh l鵦, kho秐g c竎h hai boss h琻 30 s� h駓 b�)\nV藅 i sao d阨 (M鏸 giai 畂筺 th阨 gian s� l祄 ngi ch琲 m蕋 5% sinh l鵦 v� duy tr� trong v遪g 20 gi﹜,  khi hai boss c� kho秐g c竎h l韓 h琻 10 th� s� h駓 b� b閏 ph竧) \nTi觰 qu竔 c th�: T� Чi  Ti謓 Nh﹏ (N誹 m閠 trong b鑞 con ch誸 th� ph秈 gi誸 h誸 c遪 l筰 n誹 kh玭g s� h錳 sinh nh� c�) \nB鉵g h� v� c�: ",
	[4] = "\nThu閏 t輓h v� k� n╪g c th� c馻 Boss: L玦 ёnh Nh蕋 K輈h (M鏸 l莕 ph鉵g ra s� g﹜ m蕋 10% sinh l鵦, v� s� l祄 t蕋 c� m鋓 ngi nh th莕 1 畂筺 th阨 gian \nC� quan thu藅:  Kh緋 n閕 阯g s� c� y r蓎 nh鱪g c� quan, theo tu莕 t� t� tr竔 sang ph秈 ho箃 ng \nB鉵g h� v� c�:",
	[5] = "\nThu閏 t輓h v� k� n╪g c th� c馻 Boss: Kh玭g c鉢nTi觰 qu竔 c th�: C� quan (Khi c� quan ph� h駓 s� t筼 th祅h 5% t鎛 thng c竎 c� quan xung quanh), 竎 khuy觧 \nB鉵g h� v�: kh玭g",
	[6] = "\nThu閏 t輓h v� k� n╪g c th� c馻 Boss: \nH醓 V�: m鏸 20 gi﹜ sinh l鵦 h錳 ph鬰 1%\nL璾 Quang: M鏸 20 gi﹜ sinh l鵦 gi秏 1%\nDi Hoa Ti誴 M閏: M鏸 m閠 畂筺 th阨 gian H醓 V� s� chuy觧 cho L璾 Quang 6% sinh l鵦\nPh鑙 h頿 sai v� ﹎ dng: Khi ph莕 tr╩ sinh l鵦 c馻 H醓 V� v� L璾 Quang kh玭g b籲g nhau s� t筼 cho ngi ch琲 ch辵 m閠 l鵦 s竧 thng li猲 ti誴, ch猲h l謈h c祅g cao th� s竧 thng c祅g m筺h.\nB鉵g h� v� c�: ",
}

TB_STAGE = 			--各个关卡所对应的类（即table）
{
	[1] = CSTAGE1,
	[2] = CSTAGE2,
	[3] = CSTAGE3,
	[4] = CSTAGE4,
	[5] = CSTAGE5,
	[6] = CSTAGE6,
}