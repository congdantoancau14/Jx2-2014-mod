--File name:3festival_head.lua 
--Describe:三节连过头文件脚本
--Create Date:2006-8-22
--Author:yanjun
--2369至2500任务变量可用
Include("\\script\\lib\\globalfunctions.lua");
Include("\\script\\lib\\lingshi_head.lua");

IB_VERSION = 1;		--1表示是免费区，0表示收费区

--============================================================================
TASK_MAIN_RES = 2369;			--记录所加的主料
TASK_SUB_RES = 2370;			--记录所加的副料
TASK_FIREUP_TIME = 2371;		--记录生火的时间
TASK_ADD_FUEL_TIME = 2372;		--记录上次添加材料时间
TASK_TEMPERATURE_CHECKED = 2373	--记录是否查看过温度
TASK_TEMPERATURE = 2374			--记录加完燃料后的炉子温度
TASK_GOT_ITEM_TIME = 2375;		--记录玩家上次拿到小BOSS物品的时间
TASK_GOT_RESOURCE = 2376;		--记录玩家领取做月饼材料的日期
TASK_GOT_MOONCATE = 2377;		--记录玩家领取月饼的日期
TASK_HEALTHYEXP = 2378;			--记录玩家某天总共得到过多少健康经验
TASK_HEALTHYEXP_DATE = 2379;	--记录玩家获得健康经验时的日期
--=========================08年的===========================================
ABLUEMOON_LUCK_DATE = 617; --算命的日期 格式：%y%m%d
ABLUEMOON_LUCK = 618; --每天的幸运值 1～7表示运势 1表示大凶，7表示大吉
TASK_CHANGE_YUEBING = 929;    --记录玩家兑换月饼次数，4字节，分别表示盛世金梅寒香月、盛世白玉双黄月、盛世奇香五仁月、盛世百花什锦月
TASK_CHANGE_EXCHANGE = 930;		--记录玩家用江山嫦娥水晶月换取奖励的次数
TASK_GOT_ANNIVERSARY_REWARD = 931;	--记录玩家是否领取了周年奖励
TASK_WULIN_IS_AWARD = 932; 		--记录当天是否已经领过武林盟奖励，存储当天时间
TASK_WULIN_AWARD_NUM = 933; 		--记录领奖次数
TASK_WULIN_SHUANGBEI = 934;			--当天是否领取了双倍时间奖励
TASK_BAIJU_SB_TIME = 935;			--白驹丸双倍时间，单位：分钟
TASK_GENSUI_TOTAL = 936; 			--获得奖励的次数
TASK_GENSUI_DATE = 937; 			--获得奖励后记录日期
TASK_GOT_MOONCANT_COUNT = 938;		--记录领取月饼的次数
TASK_USE_HHDYB = 939;				--使用HHDYB次数
TASK_USE_JSHTYB = 940;				--使用JSHTYB次数
TASK_USE_JSJHYB= 941;				--使用JSJHYB次数
TASK_USE_JSMWYB = 942;				--使用JSMWYB次数
TASK_USE_JSYB = 943;				--使用JSYB次数
TASK_USE_CARD_20 = 944;			--使用2０张卡换奖励的次数
TASK_USE_CARD_40 = 945;			--使用4０张卡换奖励的次数
TASK_USE_TIE_BOX = 946;     --玩家开启铁箱子的次数 用于提高极品概率
TASK_USE_TONG_BOX = 947;     --玩家开启铜箱子的次数 用于提高极品概率
TASK_USE_YIN_BOX = 948;     --玩家开启银箱子的次数 用于提高极品概率
TASK_USE_JIN_BOX = 949;     --玩家开启金箱子的次数 用于提高极品概率
TASK_QIXING_EXCHANGE = 950;		--记录玩家用江山七星伴君月换取奖励的次数
--==============地图任务变量===============================================	
MAP_NPC_INDEX = 1;
MAP_ACTION_INDEX = 2;
MAP_NPC_CHAT_TIME = 3;
--===============临时变量===================================================
TT_MAIN_RES = 70;				--记录所添加的主料
TT_SUB_RES = 71;				--记录所添加的副料
TT_FIRE_SEED = 72;				--记录所添加的燃料
TT_AWARD_STATE = 73;			--记录玩家设置奖励的情况
TT_TIMER_LOOP = 74;				--记录玩家触发器当前循环剩余次数
TT_FIREWORKS_MAPID = 75;		--记录玩家放的烟火的位置的地图ID	
TT_FIREWORKS_MAPX = 76;			--记录玩家放的烟火的位置的地图X坐标
TT_FIREWORKS_MAPY = 77;			--记录玩家放的烟火的位置的地图Y坐标
TT_FIREWORKS_TIME = 78;			--记录玩家放烟火时的时间
TT_FIREWORKS_INDEX = 79;		--记录玩家放的烟火的NPC索引

--==========================================================================
CUTE_BOSS_COUNT = 50;			--大BOSS死后招的小BOSS数目
BEST_TEMP = 180;				--取出月饼的最佳温度
COOKING_TIME = 5*60;			--蒸好月饼所需的时间

TIMER_LOOP = 9;				--时间触发器执行次数，执行9次才会给10次奖励

GOOD_AWARD = 100;					--奖励1所需天数
BETTER_AWARD = 300;				--奖励2所需天数
BEST_AWARD = 600;				--奖励3所需天数

DISTANCE = 20;					--要获得健康经验，那么与烟火的距离不能大于这个，单位是NewWorld中所使用的单位

MAX_MOONCAKE_COUNT = 50;		--一个城市最多可发放的月饼数量

BOX_PROB_INCREASE = 0.05;   --开箱子极品概率的提高量
--===========================================================================
TRIGGER_TIMER = 3;				--时间触发器ID			
TRIGGER_LOGOUT = 402;			--登出触发器ID
TRIGGER_LOGIN = 403;			--登陆触发器ID
TRIGGER_TIMER_CID = 54;			--时间触发器自定义ID
TRIGGER_LOGOUT_CID = 55;		--登出触发器自定义ID
TRIGGER_LOGIN_CID = 56;			--登陆触发器自定义ID
--============================================================================
NEW_CEHUA_LIFETIME = 600;--新策划存在时间，10分钟

--武林盟处奖励	 
tWuLinAward = {
		 --奖励一(经验：万)  二（箱子）  三（钥匙）    奖励四id,个数,概率    奖励五......
	[1]={100,{"H閜 Ng鋍 B礽 Huy Ho祅g",2,0,1076,3,100},{"Ch譨 Kh鉧 Ng鋍 Huy Ho祅g",2,0,1072,1,3},{"H閜 уng B礽 Huy Ho祅g",2,0,1077,3,7500},{"Ch譨 Kh鉧 уng Huy Ho祅g",2,0,1073,1,889},{"H閜 Ng﹏ B礽 Vinh D�",2,0,1078,1,1500},{"Ch譨 Kh鉧 B筩 Vinh D�",2,0,1074,1,10},{"H閜 Kim B礽 Vinh D�",2,0,1079,1,100},{"Ch譨 Kh鉧 V祅g Vinh D�",2,0,1075,1,1}}, 
	[2]={150,{"H閜 Ng鋍 B礽 Huy Ho祅g",2,0,1076,4,100},{"Ch譨 Kh鉧 Ng鋍 Huy Ho祅g",2,0,1072,2,4},{"H閜 уng B礽 Huy Ho祅g",2,0,1077,4,7500},{"Ch譨 Kh鉧 уng Huy Ho祅g",2,0,1073,1,889},{"H閜 Ng﹏ B礽 Vinh D�",2,0,1078,1,1500},{"Ch譨 Kh鉧 B筩 Vinh D�",2,0,1074,1,10},{"H閜 Kim B礽 Vinh D�",2,0,1079,1,100},{"Ch譨 Kh鉧 V祅g Vinh D�",2,0,1075,1,1}},
	[3]={200,{"H閜 Ng鋍 B礽 Huy Ho祅g",2,0,1076,6,100},{"Ch譨 Kh鉧 Ng鋍 Huy Ho祅g",2,0,1072,3,6},{"H閜 уng B礽 Huy Ho祅g",2,0,1077,5,7500},{"Ch譨 Kh鉧 уng Huy Ho祅g",2,0,1073,2,889},{"H閜 Ng﹏ B礽 Vinh D�",2,0,1078,1,1500},{"Ch譨 Kh鉧 B筩 Vinh D�",2,0,1074,1,10},{"H閜 Kim B礽 Vinh D�",2,0,1079,1,100},{"Ch譨 Kh鉧 V祅g Vinh D�",2,0,1075,1,1}}	 
	}

--宝箱奖励
tAboutBoxIB = {--前面为必然获得，后面为概率获得
	{{"<color=yellow>1<color> th� k� ni謒 JX2 tr遪 3 n╩","C蕄 1-5 ng蓇 nhi猲 <color=yellow>1<color> Linh th筩h"},{"C秈 ","H閜 уng B礽 Huy Ho祅g","Thi猲 Th阨 Ch� Gi秈 ","Ng� H祅h M藅 t辌h","1 T祅g Ki誱 B秓 Rng","Vi猰 Ho祅g Thi誸 H錸"}},
	{{"<color=yellow>2<color> th� k� ni謒 JX2 tr遪 3 n╩","C蕄 1-6 ng蓇 nhi猲 <color=yellow>1<color> Linh th筩h"},{"M藅 h祄 s� m玭","H閜 Ng﹏ B礽 Vinh D�","Thi猲 Th阨 Ch� Gi秈 ","Ng� H祅h M藅 t辌h","1 T祅g Ki誱 B秓 Rng","Hi猲 Vi猲 Chi課","Vi猰 Ho祅g Thi誸 H錸"}},
	{{"<color=yellow>50<color> th� k� ni謒 JX2 tr遪 3 n╩"},{"C蕄 6-7 ng蓇 nhi猲 <color=yellow>1<color> Linh th筩h","M藅 t辌h L╪g Ba Vi B�","мnh H錸 Thi猲 Th筩h Th莕 Th筩h","H閜 Kim B礽 Vinh D�","Hi猲 Vi猲 Chi課","Hi猲 Vi猲 u","Vi猰 Ho祅g Thi誸 H錸"}},
	{{"<color=yellow>300<color> th� k� ni謒 JX2 tr遪 3 n╩"},{"C蕄 7 ng蓇 nhi猲 <color=yellow>3<color> Linh th筩h","мnh H錸 Thi猲 Th筩h Th莕 Th筩h","Nguy猲 cu鑞 m藅 t辌h L╪g Ba Vi B�","Hi猲 Vi猲 Chi課","Hi猲 Vi猲 u","Ho祅g д v� kh�","Vi猰 Ho祅g Thi誸 H錸"}}
	}
	
--宝箱奖励（收费区）
tAboutBox = {--前面为必然获得，后面为概率获得
	{{"<color=yellow>1<color> th� k� ni謒 JX2 tr遪 3 n╩","C蕄 1-5 ng蓇 nhi猲 <color=yellow>1<color> Linh th筩h"},{"C秈 ","H閜 уng B礽 Huy Ho祅g","Thi猲 Th阨 Ch� Gi秈 ","Ng� H祅h M藅 t辌h","1 T祅g Ki誱 B秓 Rng","Vi猰 Ho祅g Thi誸 H錸"}},
	{{"<color=yellow>2<color> th� k� ni謒 JX2 tr遪 3 n╩","C蕄 1-6 ng蓇 nhi猲 <color=yellow>1<color> Linh th筩h"},{"M藅 h祄 s� m玭","H閜 Ng﹏ B礽 Vinh D�","Thi猲 Th阨 Ch� Gi秈 ","Ng� H祅h M藅 t辌h","1 T祅g Ki誱 B秓 Rng","Hi猲 Vi猲 Chi課","Vi猰 Ho祅g Thi誸 H錸"}},
	{{"<color=yellow>50<color> th� k� ni謒 JX2 tr遪 3 n╩"},{"C蕄 6-7 ng蓇 nhi猲 <color=yellow>1<color> Linh th筩h","M藅 t辌h L╪g Ba Vi B�","мnh H錸 Thi猲 Th筩h Th莕 Th筩h","H閜 Kim B礽 Vinh D�","Hi猲 Vi猲 Chi課","Hi猲 Vi猲 u","Vi猰 Ho祅g Thi誸 H錸"}},
	{{"<color=yellow>300<color> th� k� ni謒 JX2 tr遪 3 n╩"},{"C蕄 7 ng蓇 nhi猲 <color=yellow>3<color> Linh th筩h","мnh H錸 Thi猲 Th筩h Th莕 Th筩h","Nguy猲 cu鑞 m藅 t辌h L╪g Ba Vi B�","Hi猲 Vi猲 Chi課","Hi猲 Vi猲 u","Ho祅g д v� kh�","Vi猰 Ho祅g Thi誸 H錸"}}
	}	

tNewCehua = {--模板名 npc名 地方 id 
	{"V� n� Ba T�","Vi猲 L璾 L璾","Th髖 Y猲",404,{1550,1630,1648},{2746,2736,2947}},
	{"Ch� c莔  Trung Nguy猲","Ti觰 Cng","C玭 L玭",509,{1452,1551,1576},{3363,3243,3107}},
	{"Th� sinh","V� c玭g t�","Quang Minh nh",508,{1631,1558,1641},{3031,3157,3236}}
	}

--===========================================================================================
tSex = {"Thi誹 hi謕","N� hi謕 "};
--tBossInfo与tItemInfo与tBossPos必须对应,顺序不能乱
tBossInfo = {	--BOSS模板名,小BOSS模板名,	刷怪时间
		[1] = {"Thi誸 Dng","Ti觰 Thi誸 Dng","Thi誸 Dng","Thu閏 h� c馻 Thi誸 Dng",21},
		[2] = {" Minh","Ti觰  Minh","Ti觰 Bi謓 Nhi","Thu閏 h� c馻 Ti觰 Bi謓 Nhi",19},
		[3] = {"H莡 Thu蒼","Ti觰 H莡 Thu蒼","Kh� m藀","Thu閏 h� c馻 Kh� m藀",16},
		[4] = {"B竧 H飊g","Ti觰 B竧 H飊g","B竧 H飊g","Thu閏 h� c馻 B竧 H飊g",21},
		[5] = {"H� Thi猲","Ti觰 H� Thi猲","Ti觰 Thi猲 Thi猲","Thu閏 h� c馻 Ti觰 Thi猲 Thi猲",19},
		[6] = {"Quang V� C鵦","Ti觰 Quang V� C鵦","C鰑 Tuy謙 Ki誱 Kh�","Thu閏 h� c馻 C鰑 Tuy謙 Ki誱 Kh�",21},
		[7] = {"A Vi","Ti觰 A Vi","Tr莕 C玭g t�","Thu閏 h� c馻 Tr莕 C玭g t�",16},
		}
		
tItemInfo = {
		[1] = {"Dng H鋋 Phi課",2,0,506},
		[2] = {"Y猲 Чi",2,0,509},
		[3] = {"H醓 Chi誸 T�",2,0,508},
		[4] = {"Tr骳 M�",2,0,511},
		[5] = {"M閏 h礽",2,0,510},
		[6] = {"Thu藅 C鰑 Chng",2,0,513},
		[7] = {"Loan Ph鬾g Ng鋍 B閕",2,0,512},
		[8] = {"Dng H鋋 C�",2,0,507},	--07年三节不用了
		[9] = {"Thi猲 Th筩h Ch飝",2,0,514},	--07年三节不用了
		[10] = {"Kh竛h 觧 di謒 h醓",2,0,515},
		[11] = {"Hng d蒼",2,0,1030},
		[12] = {"Bao thu鑓 c馻 Nguy謙 Lng Th�",0,102,41},
		[13] = {"H籲g Nga Nguy謙 V� Цi",0,102,42},
		[14] = {"H藆 Ngh� L筩 Nh藅 Ho祅",0,102,43},
		[15] = {"H閜 Ng鋍 B礽 Huy Ho祅g",2,0,1076},
		[16] = {"H閜 уng B礽 Huy Ho祅g",2,0,1077},
		[17] = {"H閜 Ng﹏ B礽 Vinh D�",2,0,1078},
		[18] = {"H閜 Kim B礽 Vinh D�",2,0,1079},
		[19] = {"Th� k� ni謒 m鮪g V� L﹎ tr遪 2 n╩",2,0,1081},
		[20] = {"Ch譨 Kh鉧 Ng鋍 Huy Ho祅g",2,0,1072},
		[21] = {"Ch譨 Kh鉧 уng Huy Ho祅g",2,0,1073},
		[22] = {"Ch譨 Kh鉧 B筩 Vinh D�",2,0,1074},
		[23] = {"Ch譨 Kh鉧 V祅g Vinh D�",2,0,1075},
		[24] = {"B錸g Lai Ti猲 L�",2,0,109},
		[25] = {"Vi猰 Ho祅g Thi誸 H錸",2,1,1146},
		[26] = {"C秈 ",2,1,1090},
		[27] = {"Thi猲 Th阨 Ch� Gi秈 ",2,1,3210},
		[28] = {"Ng� H祅h M藅 t辌h",0,107,155},
		[29] = {"M藅 t辌h ng� h祅h to祅 t藀",0,107,157},
		[30] = {"L╪g Ba Vi B�",0,112,78},
		[31] = {"L╪g Ba Vi B� to祅 t藀",0,112,158},
		[32] = {"M藅 h祄 s� m玭",2,1,1020},
		[33] = {"B秓 rng T祅g Ki誱 u qu竛",2,1,1059},
		[34] = {"B秓 rng T祅g Ki誱 y gi竝",2,1,1060},
		[35] = {"B秓 rng T祅g Ki誱 hoa kh�",2,1,1061},
		[36] = {"B秓 rng T祅g Ki誱 trang s鴆",2,1,1062},
		[37] = {"B秓 rng T祅g Ki誱 v� kh�",2,1,1063},
		[38] = {"мnh H錸 Thi猲 Th筩h Th莕 Th筩h",2,1,1067},
		[39] = {"Thi猲 Th筩h linh th筩h",2,1,1068}
		}

tMaterial = {
		[1] = {"Ng.li謚 ch輓h 1",2,0,518},
		[2] = {"Ng.li謚 ch輓h 2",2,0,519},
		[3] = {"Ng.li謚 ch輓h 3",2,0,520},
		[4] = {"Ng.li謚 ph� 1",2,0,521},
		[5] = {"Ng.li謚 ph� 2",2,0,522},
		[6] = {"Ng.li謚 ph� 3",2,0,523},
		[7] = {"Than nhi謙  cao",2,0,524},
		[8] = {"C駃 nhi謙  th蕄",2,0,525},
		[9] = {"L� nng b竛h Trung Thu",2,0,517},
		}

tBossPos = {
		[1] = {"B綾 Th祅h Й",308,1461,3156},
		[2] = {"Nam Th祅h Й",304,1494,2986},
		[3] = {"B綾 Tuy襫 Ch﹗",108,1521,3060},	
		[4] = {"T﹜ Tuy襫 Ch﹗",105,1545,3008},	
		[5] = {"B綾 Ph鬾g Tng",504,1487,3006},
		[6] = {"Long M玭 tr蕁",507,1682,3360},
		[7] = {"Ph鬾g Tng ph� Nam ",501,1436,2952},
		}

tMoonCake = {
		[1] = {"B竛h Trung Thu Giang S琻",2,0,1000},
		[2] = {"B竛h Trung Thu ch﹏ g� Giang S琻",2,0,1002},
		[3] = {"B竛h Trung Thu th辴 m苙 Giang S琻",2,0,1003},
		[4] = {"B竛h Trung Thu Kim Hoa Giang S琻",2,0,1004},
		[5] = {"B竛h Trung Thu Li猲 Dung Giang S琻",1,0,231},
		[6] = {"B竛h Trung Thu Nh﹏ T竜 Giang S琻",1,0,232},
		[7] = {"B竛h Trung Thu Nh﹏ u Giang S琻",1,0,233},
		[8] = {"B竛h Trung Thu Xo礽 Giang S琻",2,0,1005},
		[9] = {"B竛h Trung Thu S莡 Ri猲g Giang S琻",2,0,1006},
		[10] = {"B竛h Trung Thu Xo礽 Giang S琻",2,0,1007},	
		[11] = {"Th辬h Th� Mai H祅 Hng Nguy謙",2,0,1008},	
		[12] = {"Th辬h Th� B筩h Ng鋍 Song Nguy謙",2,0,1009},	
		[13] = {"Th辬h Th� K� Hng Ng� Nh﹏ Nguy謙",2,0,1010},	
		[14] = {"Th辬h Th� B竎h Hoa Th藀 C萴 Nguy謙",2,0,1011},	
		[15] = {"Th辬h Th� Th蕋 Tinh B筺 Qu﹏ Nguy謙",2,0,1012},	
		[16] = {"Th辬h Th� H籲g Nga Th駓 Tinh Nguy謙",2,0,1013},
		[17] = {"B竛h Trung Thu Giang S琻 M� V� ",2,0,1001},		
		[18] = {"B竛h trung thu nng",2,0,1014},	
		[19] = {"B竛h trung thu kh衪",2,0,1015},	
		}

tMappingTemp = {	--温度区间
		[1] = 1,
		[2] = 31,
		[3] = 61,
		[4] = 121,
		[5] = 151,
		[6] = 176,
		[7] = 180,
		[8] = 181,
		[9] = 186,
		[10] = 211,
		[11] = 241,
		[12] = 301,
		[13] = 361,
		[14] = 451,
		}

--下面是一个三维数组，第一维为主料类型，第二维为辅料类型，第三维为月饼机率
tMappingMoonCake = {	
	[1] = {
		[1] = {	--奇数项是月饼索引，偶数项是得到某个月饼的机率，如{17,75,2,100}表示有75％机率得到月饼17,有（100－75）％的机率得到月饼2
				{1,100},{17,50,1,100},{17,100},{17,75,2,100},	--温度区间1－4
				{17,25,2,100},{2,40,12,90,15,100},{12,50,15,80,16,100},{2,40,12,90,15,100},	--温度区间5－8
				{17,25,2,100},{17,75,2,100},{17,100},{17,33,18,100},	--温度区间9－12
				{18,100},{19,100},	--温度区间13－14
				},
		[2] = {
				{1,100},{17,50,1,100},{17,100},{17,75,3,100},	--温度区间1－4
				{17,25,3,100},{3,40,12,90,15,100},{12,50,15,80,16,100},{3,40,12,90,15,100},	--温度区间5－8
				{17,25,3,100},{17,75,3,100},{17,100},{17,33,18,100},	--温度区间9－12
				{18,100},{19,100},	--温度区间13－14
				},
		[3] = {
				{1,100},{17,50,1,100},{17,100},{17,75,4,100},	--温度区间1－4
				{17,25,4,100},{4,40,12,90,15,100},{12,50,15,80,16,100},{4,40,12,90,15,100},	--温度区间5－8
				{17,25,4,100},{17,75,4,100},{17,100},{17,33,18,100},	--温度区间9－12
				{18,100},{19,100},	--温度区间13－14
				},
		},
	[2] = {
		[1] = {
				{1,100},{1,100},{1,100},{1,75,5,100},	--温度区间1－4
				{1,25,5,100},{5,50,13,100},{13,100},{5,50,13,100},	--温度区间5－8
				{1,25,5,100},{1,75,5,100},{1,100},{1,33,18,100},	--温度区间9－12
				{19,100},{19,100},	--温度区间13－14
				},
		[2] = {
				{1,100},{1,100},{1,100},{1,75,6,100},	--温度区间1－4
				{1,25,6,100},{6,50,13,100},{13,100},{6,50,13,100},	--温度区间5－8
				{1,25,6,100},{1,75,6,100},{1,100},{1,33,18,100},	--温度区间9－12
				{19,100},{19,100},	--温度区间13－14
				},
		[3] = {
				{1,100},{1,100},{1,100},{1,75,7,100},	--温度区间1－4
				{1,25,7,100},{7,50,13,100},{13,100},{7,50,13,100},	--温度区间5－8
				{1,25,7,100},{1,75,7,100},{1,100},{1,33,18,100},	--温度区间9－12
				{19,100},{19,100},	--温度区间13－14
				}
		},
	[3] = {
		[1] = {
				{1,100},{1,100},{1,100},{1,75,8,100},	--温度区间1－4
				{1,25,8,100},{8,50,14,100},{14,100},{8,50,14,100},	--温度区间5－8
				{1,25,8,100},{1,75,8,100},{1,100},{1,33,18,100},	--温度区间9－12
				{19,100},{19,100},	--温度区间13－14
				},
		[2] = {
				{1,100},{1,100},{1,100},{1,75,9,100},	--温度区间1－4
				{1,25,9,100},{9,50,14,100},{14,100},{9,50,14,100},	--温度区间5－8
				{1,25,9,100},{1,75,9,100},{1,100},{1,33,18,100},	--温度区间9－12
				{19,100},{19,100},	--温度区间13－14
				},
		[3] = {
				{1,100},{1,100},{1,100},{1,75,10,100},	--温度区间1－4
				{1,25,10,100},{10,50,14,100},{14,100},{10,50,14,100},	--温度区间5－8
				{1,25,10,100},{1,75,10,100},{1,100},{1,33,18,100},	--温度区间9－12
				{19,100},{19,100},	--温度区间13－14
				},
		},
	}

tSexName = {"Thi誹 hi謕","N� hi謕 "};

tWeapon = {
	{"V筺 Nh蒼 ch璦 gi竚 nh",2,1,375},
	{"H醓 Tinh ch璦 gi竚 nh",2,1,376},
	{"Li謙 Di謒 ch璦 gi竚 nh",2,1,377},
	{"M穘 Thi猲 Hoa V� ch璦 gi竚 nh",2,1,378},
	{"C� лnh ch璦 gi竚 nh",2,1,379},
	{"Hi Nh﹏ C莔 ch璦 gi竚 nh",2,1,380},
	{"Th莕 H祅h ch璦 gi竚 nh",2,1,381},
	{"A La H竛 Trng ch璦 gi竚 nh",2,1,382},
	{"Чi H祇 L玦 Thng ch璦 gi竚 nh",2,1,383},
	{"Th莕 Cung ch璦 gi竚 nh",2,1,384},
	{"M穘h H� ch璦 gi竚 nh",2,1,385},
	{"L╪g Phong ch璦 gi竚 nh",2,1,386},
}

tHuangDiWeapon = 
{
	[0] = {{"Hi猲 Vi猲 To竔 V� o",0,3,8801},{"Hi猲 Vi猲 To竔 V� C玭",0,5,8802},{"Hi猲 Vi猲 C鰑 Nh� Trng",0,8,8803},{"Hi猲 Vi猲 H筼 Nhi猲 Th�",0,0,8804},{"Hi猲 Vi猲 Gi韎 T� Kim",0,1,8805},{"Hi猲 Vi猲 T� Tinh Ki誱",0,2,8806},{"Hi猲 Vi猲 Ph鬾g Ho祅g C莔",0,10,8807},{"Hi猲 Vi猲 Ng� Nh筩 Th�",0,0,8808},{"Hi猲 Vi猲 Ph� Thi猲 C玭",0,5,8809},{"Hi猲 Vi猲 H錸g Qu﹏ Ki誱",0,2,8810},{"Hi猲 Vi猲 Sinh T� B髏",0,9,8811},{"Hi猲 Vi猲 Ph� Qu﹏ Thng",0,6,8812},{"Hi猲 Vi猲 Khai Thi猲 Cung",0,4,8813},{"Hi猲 Vi猲  Dng Nh蒼",0,7,8814},{"Hi猲 Vi猲 U Minh Tr秓",0,11,8815}},
	[1] = {{"Hi猲 Vi猲 To竔 V� o",0,3,8801},{"Hi猲 Vi猲 To竔 V� C玭",0,5,8802},{"Hi猲 Vi猲 C鰑 Nh� Trng",0,8,8803},{"Hi猲 Vi猲 H筼 Nhi猲 Th�",0,0,8804}},
	[2] = {{"Hi猲 Vi猲 To竔 V� o",0,3,8801},{"Hi猲 Vi猲 To竔 V� C玭",0,5,8802}},
	[3] = {{"Hi猲 Vi猲 C鰑 Nh� Trng",0,8,8803}},
	[4] = {{"Hi猲 Vi猲 H筼 Nhi猲 Th�",0,0,8804}},
	[5] = {{"Hi猲 Vi猲 Gi韎 T� Kim",0,1,8805}},
	[6] = {{"Hi猲 Vi猲 Gi韎 T� Kim",0,1,8805}},
	[7] = {{"Hi猲 Vi猲 T� Tinh Ki誱",0,2,8806},{"Hi猲 Vi猲 Ph鬾g Ho祅g C莔",0,10,8807}},
	[8] = {{"Hi猲 Vi猲 T� Tinh Ki誱",0,2,8806}},
	[9] = {{"Hi猲 Vi猲 Ph鬾g Ho祅g C莔",0,10,8807}},
	[10] = {{"Hi猲 Vi猲 Ng� Nh筩 Th�",0,0,8808},{"Hi猲 Vi猲 Ph� Thi猲 C玭",0,5,8809}},
	[11] = {{"Hi猲 Vi猲 Ng� Nh筩 Th�",0,0,8808}},
	[12] = {{"Hi猲 Vi猲 Ph� Thi猲 C玭",0,5,8809}},
	[13] = {{"Hi猲 Vi猲 H錸g Qu﹏ Ki誱",0,2,8810},{"Hi猲 Vi猲 Sinh T� B髏",0,9,8811}},
	[14] = {{"Hi猲 Vi猲 H錸g Qu﹏ Ki誱",0,2,8810}},
	[15] = {{"Hi猲 Vi猲 Sinh T� B髏",0,9,8811}},
	[16] = {{"Hi猲 Vi猲 Ph� Qu﹏ Thng",0,6,8812},{"Hi猲 Vi猲 Khai Thi猲 Cung",0,4,8813}},
	[17] = {{"Hi猲 Vi猲 Ph� Qu﹏ Thng",0,6,8812}},
	[18] = {{"Hi猲 Vi猲 Khai Thi猲 Cung",0,4,8813}},
	[19] = {{"Hi猲 Vi猲  Dng Nh蒼",0,7,8814},{"Hi猲 Vi猲 U Minh Tr秓",0,11,8815}},
	[20] = {{"Hi猲 Vi猲  Dng Nh蒼",0,7,8814}},
	[21] = {{"Hi猲 Vi猲 U Minh Tr秓",0,11,8815}},
}

tbHuangDiRing1 = 
{
	[0] = {{"Hi猲 Vi猲 Chi課",0,102,8801},{"Hi猲 Vi猲 Chi課",0,102,8803},{"Hi猲 Vi猲 Chi課",0,102,8805},{"Hi猲 Vi猲 Chi課",0,102,8807},{"Hi猲 Vi猲 Chi課",0,102,8809},{"Hi猲 Vi猲 Chi課",0,102,8811},{"Hi猲 Vi猲 Chi課",0,102,8813},{"Hi猲 Vi猲 Chi課",0,102,8815},{"Hi猲 Vi猲 Chi課",0,102,8817},{"Hi猲 Vi猲 Chi課",0,102,8819},{"Hi猲 Vi猲 Chi課",0,102,8821},{"Hi猲 Vi猲 Chi課",0,102,8823},{"Hi猲 Vi猲 Chi課",0,102,8825},{"Hi猲 Vi猲 Chi課",0,102,8827}},
	[1] = {{"Hi猲 Vi猲 Chi課",0,102,8801},{"Hi猲 Vi猲 Chi課",0,102,8803},{"Hi猲 Vi猲 Chi課",0,102,8805}},
	[2] = {{"Hi猲 Vi猲 Chi課",0,102,8801}},
	[3] = {{"Hi猲 Vi猲 Chi課",0,102,8803}},
	[4] = {{"Hi猲 Vi猲 Chi課",0,102,8805}},
	[5] = {{"Hi猲 Vi猲 Chi課",0,102,8807}},
	[6] = {{"Hi猲 Vi猲 Chi課",0,102,8807}},
	[7] = {{"Hi猲 Vi猲 Chi課",0,102,8809},{"Hi猲 Vi猲 Chi課",0,102,8811}},
	[8] = {{"Hi猲 Vi猲 Chi課",0,102,8809}},
	[9] = {{"Hi猲 Vi猲 Chi課",0,102,8811}},
	[10] = {{"Hi猲 Vi猲 Chi課",0,102,8813},{"Hi猲 Vi猲 Chi課",0,102,8815}},
	[11] = {{"Hi猲 Vi猲 Chi課",0,102,8813}},
	[12] = {{"Hi猲 Vi猲 Chi課",0,102,8815}},
	[13] = {{"Hi猲 Vi猲 Chi課",0,102,8817},{"Hi猲 Vi猲 Chi課",0,102,8819}},
	[14] = {{"Hi猲 Vi猲 Chi課",0,102,8817}},
	[15] = {{"Hi猲 Vi猲 Chi課",0,102,8819}},
	[16] = {{"Hi猲 Vi猲 Chi課",0,102,8821},{"Hi猲 Vi猲 Chi課",0,102,8823}},
	[17] = {{"Hi猲 Vi猲 Chi課",0,102,8821}},
	[18] = {{"Hi猲 Vi猲 Chi課",0,102,8823}},
	[19] = {{"Hi猲 Vi猲 Chi課",0,102,8825},{"Hi猲 Vi猲 Chi課",0,102,8827}},
	[20] = {{"Hi猲 Vi猲 Chi課",0,102,8825}},
	[21] = {{"Hi猲 Vi猲 Chi課",0,102,8827}},
}

tbHuangDiRing2 = 
{
	[0] = {{"Hi猲 Vi猲 u",0,102,8802},{"Hi猲 Vi猲 u",0,102,8804},{"Hi猲 Vi猲 u",0,102,8806},{"Hi猲 Vi猲 u",0,102,8808},{"Hi猲 Vi猲 u",0,102,8810},{"Hi猲 Vi猲 u",0,102,8812},{"Hi猲 Vi猲 u",0,102,8814},{"Hi猲 Vi猲 u",0,102,8816},{"Hi猲 Vi猲 u",0,102,8818},{"Hi猲 Vi猲 u",0,102,8820},{"Hi猲 Vi猲 u",0,102,8822},{"Hi猲 Vi猲 u",0,102,8824},{"Hi猲 Vi猲 u",0,102,8826},{"Hi猲 Vi猲 u",0,102,8828}},
	[1] = {{"Hi猲 Vi猲 u",0,102,8802},{"Hi猲 Vi猲 u",0,102,8804},{"Hi猲 Vi猲 u",0,102,8806}},
	[2] = {{"Hi猲 Vi猲 u",0,102,8802}},
	[3] = {{"Hi猲 Vi猲 u",0,102,8804}},
	[4] = {{"Hi猲 Vi猲 u",0,102,8806}},
	[5] = {{"Hi猲 Vi猲 u",0,102,8808}},
	[6] = {{"Hi猲 Vi猲 u",0,102,8808}},
	[7] = {{"Hi猲 Vi猲 u",0,102,8810},{"Hi猲 Vi猲 u",0,102,8812}},
	[8] = {{"Hi猲 Vi猲 u",0,102,8810}},
	[9] = {{"Hi猲 Vi猲 u",0,102,8812}},
	[10] = {{"Hi猲 Vi猲 u",0,102,8814},{"Hi猲 Vi猲 u",0,102,8816}},
	[11] = {{"Hi猲 Vi猲 u",0,102,8814}},
	[12] = {{"Hi猲 Vi猲 u",0,102,8816}},
	[13] = {{"Hi猲 Vi猲 u",0,102,8818},{"Hi猲 Vi猲 u",0,102,8820}},
	[14] = {{"Hi猲 Vi猲 u",0,102,8818}},
	[15] = {{"Hi猲 Vi猲 u",0,102,8820}},
	[16] = {{"Hi猲 Vi猲 u",0,102,8822},{"Hi猲 Vi猲 u",0,102,8824}},
	[17] = {{"Hi猲 Vi猲 u",0,102,8822}},
	[18] = {{"Hi猲 Vi猲 u",0,102,8824}},
	[19] = {{"Hi猲 Vi猲 u",0,102,8826},{"Hi猲 Vi猲 u",0,102,8828}},
	[20] = {{"Hi猲 Vi猲 u",0,102,8826}},
	[21] = {{"Hi猲 Vi猲 u",0,102,8828}},
}

--打开四个箱子的奖励
tBoxAward = {
	{{"Th� k� ni謒 V� L﹎ 2 tr遪 2 n╩",2,0,1081,1},{1,4,70,1,4,100},{"Nguy謙 Hoa ",2,1,2002,1,10},{"H閜 уng B礽 Huy Ho祅g",2,0,1077,1,1000},{"Hi猲 Vi猲 Chi課",5}},
	{{"Th� k� ni謒 V� L﹎ 2 tr遪 2 n╩",2,0,1081,5},{1,5,70,1,5,100},{"Nguy謙 Hoa ",2,1,2002,1,50},{"H閜 Ng﹏ B礽 Vinh D�",2,0,1078,1,500},{"Hi猲 Vi猲 Chi課",10}},
	{{"Th� k� ni謒 V� L﹎ 2 tr遪 2 n╩",2,0,1081,50},{3,5,70,3,6,100},{"Nguy謙 Hoa ",2,1,2002,2,200},{"H閜 Kim B礽 Vinh D�",2,0,1079,1,500},{"Hi猲 Vi猲 Chi課",100,"Hi猲 Vi猲 u",200}},
	{{"Th� k� ni謒 V� L﹎ 2 tr遪 2 n╩",2,0,1081,100},{4,5,70,4,7,100},{"Nguy謙 Hoa ",2,1,2002,3,500},{"Hi猲 Vi猲 Chi課",1000,"Hi猲 Vi猲 u",2000,"Ho祅g д v� kh�",3000}}
	}

--箱子极品概率与常规概率
tBoxProb = {{20,950000},{100,950000},{10000,950000},{150000,1000000}};

--箱子常规概率分布 四种箱子
tBoxChangGui = {{800,990,991,1000},{800,990,995,1000},{960,980,1000},{700,850,1000}};

--铁箱子 对应上表概率
tBoxTie = {{{"C秈 ",2,1,1090}},{{"Thi猲 Th阨 Ch� Gi秈 ",2,1,3210}},{{"Ng� H祅h M藅 t辌h",0,107,155}},{{"B秓 rng T祅g Ki誱 u qu竛",2,1,1059},{"B秓 rng T祅g Ki誱 y gi竝",2,1,1060},{"B秓 rng T祅g Ki誱 hoa kh�",2,1,1061},{"B秓 rng T祅g Ki誱 trang s鴆",2,1,1062},{"B秓 rng T祅g Ki誱 v� kh�",2,1,1063}}};

--铜箱子
tBoxTong = {{{"M藅 h祄 s� m玭",2,1,1020}},{{"Thi猲 Th阨 Ch� Gi秈 ",2,1,3210}},{{"Ng� H祅h M藅 t辌h",0,107,155}},{{"B秓 rng T祅g Ki誱 u qu竛",2,1,1059},{"B秓 rng T祅g Ki誱 y gi竝",2,1,1060},{"B秓 rng T祅g Ki誱 hoa kh�",2,1,1061},{"B秓 rng T祅g Ki誱 trang s鴆",2,1,1062},{"B秓 rng T祅g Ki誱 v� kh�",2,1,1063}}};

function Get_3festival_State()
	local nDate = tonumber(date("%y%m%d"));
	if nDate >= 080911 and nDate <= 481007 then	--9月11至10月7日
		return 1;
	else
		return 0;
	end;
end;
--判断在哪台服务器上，在泉州的话就返回1，在汴京的话就返回2，在成都的话就返回3，在其它服务器则返回100
function Get_Server_Index()
	if SubWorldID2Idx(100) >= 0 then
		return 1;
	elseif SubWorldID2Idx(200) >= 0 then
		return 2;
	elseif SubWorldID2Idx(300) >= 0 then
		return 3;
	else
		return 100;
	end;
end;
--得到玩家与某一坐标的距离
function Get_Distance(nX,nY)
	local _,nPosX,nPosY = GetWorldPos();
	local nDis = floor(sqrt((nPosX-nX)^2+(nPosY-nY)^2));
	return nDis;
end;
--得到玩家设置奖励的情况，下面是返回值所对应的情况：
--  0:表示还没进行过奖励设置
--  1:表示设置奖励类型为1
-- 10:表示设置奖励类型为2
-- 11:表示设置奖励类型为3
--100:表示已领取过奖励
function Get_Award_State()
	local nExtPoint0 = GetExtPoint(0);
	local nResult = 0;
	for i=3,5 do 
		nResult = nResult + GetBit(nExtPoint0,i)*(10^(i-3));
	end;
	return nResult;
end;
--根据主料、辅料和温度给一个月饼玩家
function Give_MoonCake(nMainRes,nSubRes,nCurTemp)
	if nCurTemp <= 0 or nMainRes > 3 or nMainRes < 1 or nSubRes > 3 or nSubRes < 1 then
		WriteLog("[L鏸 Tam ti誸 li猲 th玭g]: L鏸 tham s� nh藀 v祇 trong h祄 s� Give_MoonCake, tham s� nh藀 v祇 l�:"..nMainRes..","..nSubRes..","..nCurTemp);
		return 0;
	end;
	local nCakeIndex = 0;
	local nRand = random(1,100);
	local nTempIndex = 0;
	local nRetCode = 0;
	for i=getn(tMappingTemp),1,-1 do
		if nCurTemp >= tMappingTemp[i] then
			nTempIndex = i;	--得到温度区间
			break;
		end;
	end;
	local nTabSize = getn(tMappingMoonCake[nMainRes][nSubRes][nTempIndex]);
	if mod(nTabSize,2) ~= 0 then
		WriteLog("[L鏸 Tam ti誸 li猲 th玭g]: Lo筰 b竛h l韓 nh� table l� s� l�");
		nCakeIndex = 1;
	else
		for i=1,nTabSize/2 do
			if nRand <= tMappingMoonCake[nMainRes][nSubRes][nTempIndex][i*2] then
				nCakeIndex = tMappingMoonCake[nMainRes][nSubRes][nTempIndex][i*2-1];
				break;
			end;
		end;
	end;
	nRetCode = AddItem(tMoonCake[nCakeIndex][2],tMoonCake[nCakeIndex][3],tMoonCake[nCakeIndex][4],1);
	if nRetCode == 1 then
		Say("Khi nhi謙  b誴 c馻 b筺 t <color=yellow>"..nCurTemp.."<color>  m� b誴, b筺 nh薾 頲 1 <color=yellow>"..tMoonCake[nCakeIndex][1].."<color>!",0);
		WriteLog("[Tam ti誸 li猲 th玭g]:"..GetName().."Nh薾 頲 1 c竔 b竛h Trung Thu, m� s� b竛h Trung Thu:"..nCakeIndex);
	else
		WriteLog("[L鏸 Tam ti誸 li猲 th玭g]:"..GetName().."L鏸 tr� quay l筰 AddItem khi nh薾 b竛h Trung Thu, tr� s� l鏸:"..nRetCode);
	end;
end;

function Msg2_LeiTai(szItemName)
	Msg2MSAll(4,GetName().."S� d鬾g 1	"..szItemName);
	Msg2MSAll(23,GetName().."S� d鬾g 1	"..szItemName);
	Msg2MSAll(29,GetName().."S� d鬾g 1	"..szItemName);
	Msg2MSAll(30,GetName().."S� d鬾g 1	"..szItemName);
end;

--函数名称：物品添加检查函数
--功        能：对当前玩家可否正常添加物品进行检测
--村长 
function Zgc_pub_goods_add_chk(goods_num,goods_weight)
	if GetFreeItemRoom() < goods_num then
		Talk (1,"","<color=red>kho秐g tr鑞g<color> trong h祅h trang kh玭g !")
		return 0
	elseif (GetMaxItemWeight() - GetCurItemWeight()) < goods_weight then			--判断玩家负重和空间
		Talk (1,"","<color=red>S鴆 l鵦<color> c馻 b筺 kh玭g !")
		return 0
	else 
		return 1
	end
end

function nothing()

end;

