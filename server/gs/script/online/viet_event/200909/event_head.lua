--=============================================
--create by baiyun 2009.8.24
--describe:越南版9月份中秋活动头文件
--=============================================
Include("\\script\\lib\\globalfunctions.lua");
VIET_0909_TASK_SHANGXIAN_AWORD = 2263;	--领取上线奖励的日期
VIET_0909_TASK_SHIMENG_DATE = 2264;			--师门任务得到白面包的日期
VIET_0909_TASK_SHIMENG_NUM = 2265;			--师门任务得到白面包的数量
VIET_0909_TASK_ALREADY_GET_EXP = 2266;	--使用绿豆饼和什锦饼已经获得的经验
VIET_0909_TASK_GET_BOX_DATE = 2267;			--领取宝箱的日期
VIET_0909_TASK_OPEN_BOX_DATE = 2268;		--打开箱子的日期
VIET_0909_TASK_OPEN_BOX_COUNT = 2269;		--今天已经打开的箱子的数量
VIET_0909_TASK_GET_FUZHU_DATE = 2270;		--接受辅助的日期
VIET_0909_TASK_GET_FUZHU_TYPE = 2271;		--接受辅助的类型
VIET_0908_TASK_GET_SHAQI_DATE = 2087;					--获得杀气值的日期
VIET_0908_TASK_GET_SHAQI_COUNT = 2088;				--获得杀气值的数量

--上线奖励
tbVIET_0909_SHANGXIAN_AWORD = {
	{3000, 3999, 200000},
	{4000, 4999, 300000},
	{5000, 5999, 400000},
	{6000, 6999, 500000},
	{7000, 7999, 600000},
	{8000, 8999, 700000},
	{9000, 9999, 800000},
	{10000, 10999, 900000},
	{11000, 14999, 1000000},
	{15000, 19999, 1100000},
	{20000, 24999, 1200000},
	{25000, 0, 1300000},
};
--上线奖励给的白面包数量
tbVIET_0909_SHANGXIAN_AWARD2 = {
	[1] = 50,
	[2] = 50,
	[3] = 50,
	[4] = 100,
	[5] = 100,
	[6] = 100,
	[7] = 100,
	[8] = 150,
	[9] = 150,
	[10] = 150,
	[11] = 150,
	[12] = 150,
};

--通过师门任务获得的白面包的数量
tVIET_SHIMEN_BAIMIANBAO = {
	[1] = 10,
	[2] = 10,
	[3] = 20,
	[4] = 30,
	[5] = 50,
	[6] = 50,
	[7] = 70,
	[8] = 70,
	[9] = 80,
};

tbViet_0908_SkillID = 
	{
		[0] = 0,
		[1] = 0,	
		[2] = 32,	--少林俗家,易筋经
		[3] = 57,	--少林禅僧,洗髓经
		[4] = 44,	--少林武僧,如来神掌
		[5] = 0,			--唐门
		[6] = 74,	--唐门,吸星阵
		[7] = 0,			--峨嵋
		[8] = 89,	--峨嵋佛家,万相神功
		[9] = 102,	--峨嵋俗家,天音镇魂曲
		[10] = 0,			--丐帮
		[11] = 113,--丐帮净衣,降龙十八掌
		[12] = 124,--丐帮污衣,打狗棍阵
		[13] = 0,			--武当
		[14] = 146,--武当道家,无上太极剑
		[15] = 159,--武当俗家,太极神功
		[16] = 0,			--杨门
		[17] = 732,--杨门枪骑,连环钻龙枪
		[18] = 745,--杨门弓骑,霸王翔凤箭
		[19] = 0,			--五毒
		[20] = 775,--五毒邪侠,无天魔功
		[21] = 774,--五毒蛊师,无影魔蛊
};

--内功辅助功能,属性字符串，出现概率，要修改的属性值，说明
viet_0909_tb_InBuff = {
					{"T╪g 4000 sinh l鵦", 20, {{"state_life_max_point_add", 4000}}},
					{"T╪g 10% n閕 l鵦", 20, {{"state_neili_max_percent_add", 10}}},
					{"T╪g 15% s竧 thng n閕 c玭g", 20, {{"state_m_attack_percent_add", 15}}},
					{"T╪g 15% ph遪g th� n閕 c玭g", 20, {{"state_magic_parmor_poi_add", 15}}},
					{"Kh竛g t蕋 c� +20", 10, {{"state_add_dexterity", 20}, {"state_add_energy", 20}, {"state_add_observe", 20}, {"state_add_strength", 20}, {"state_add_vitality", 20}}},
					{"T╪g 15 s竧 th� v� ph遪g th� n閕 c玭g", 10, {{"state_m_attack_percent_add", 15}, {"state_magic_parmor_per_add", 15}}}
};

--外功辅助功能
viet_0909_tb_OutBuff = {
					{"T╪g 4000 sinh l鵦", 20, {{"state_life_max_point_add", 4000}}},
					{"T╪g 10% n閕 l鵦", 20, {{"state_neili_max_percent_add", 10}}},
					{"T╪g 15%  s竧 thng ngo筰 c玭g", 20, {{"state_p_attack_percent_add", 15}}},
					{"T╪g 15% ph遪g th� ngo筰 c玭g", 20, {{"state_physical_parmor_poi_add", 15}}},
					{"Kh竛g t蕋 c� +20", 10, {{"state_add_dexterity", 20}, {"state_add_energy", 20}, {"state_add_observe", 20}, {"state_add_strength", 20}, {"state_add_vitality", 20}}},
					{"T╪g 15% ph遪g th� v� s竧 thng ngo筰 c玭g", 10, {{"state_p_attack_percent_add", 15}, {"state_physical_parmor_per_add", 15}}}
};


--什锦饼的奖励经验,概率基数1000
tbVIET_0909_SHIJINBING_EXP = {
	{100000, 590},
	{125000, 200},
	{150000, 160},
	{200000, 20},
	{250000, 10},
	{300000, 10},
	{500000, 5},
	{1000000, 5},
};

--什锦饼和绿豆饼的物品奖励，基数1000000
tbVIET_0909_SJLD_AWARD = {
	{"B祅 Long b輈h", 2500, {2, 1, 1000, 1}, 15 * 24 * 3600},
	{"M秐h Thi猲 th筩h", 20000, {2, 2, 7, 1}, 0},
	{"Thi猲 th筩h", 20000, {2, 2, 8, 1}, 0},
	{"M秐h B╪g th筩h", 30000, {2, 1, 148, 1},  0},
	{"B╪g th筩h", 20000, {2, 1, 149, 1}, 0},
	{"T葃 T駓 linh n", 100, {2, 0, 137, 1}, 15 * 24 * 3600},
	{"уng Ti襫 V祅g", 1000, {2, 1, 30094, 1}, 0},
	{"L� th駓", 500000, {2, 0, 351, 1}, 0},
	{"Tu Ch﹏ Y誹 Quy誸", 26879, {2, 0, 554, 1}, 15 * 24 * 3600},
	{"Rng B� K輕", 500, {2, 1, 30093, 1}, 30 * 24 * 3600},
	{"Rng Y誹 Quy誸_Cao C蕄", 20, {2, 1, 30112, 1}, 30 * 24 * 3600},
	{"Ph鬾g Huy誸 ho祅", 100, {2, 1, 1004, 1}, 15 * 24 * 3600},
	{"Long Huy誸 ho祅", 100, {2, 1, 1002, 1}, 15 * 24 * 3600},
	{"K� L﹏ ho祅", 100, {2, 1, 1003, 1}, 15 * 24 * 3600},
	{"Chi課 Th莕 ho祅", 100, {2, 1, 1005, 1}, 15 * 24 * 3600},
	{"u h錸", 2000, {2, 1, 1157, 1}, 15 * 24 * 3600},
	{"Th莕 N玭g Кn", 5000, {2, 1, 343, 1}, 15 * 24 * 3600},
	{"V╪ C萴 H筽", 1000, {2, 1, 1100, 1}, 15 * 24 * 3600},
	{"Qu﹏ C玭g Chng", 1000, {2, 1, 9999, 1}, 15 * 24 * 3600},
	{"Th竔 H�  M藅 Qu� ", 10000, {2, 1, 387, 1}, 15 * 24 * 3600},
	{"S� m玭 t譶h nguy謓 th�", 2500, {2, 1, 1019, 1}, 15 * 24 * 3600},
	{"S� m玭 l謓h th�", 2500, {2, 1, 1016, 1}, 15 * 24 * 3600},
	{"T祅g Ki誱 anh h飊g thi誴", 5000, {2, 0, 31, 1}, 15 * 24 * 3600},
	{"Th� Th﹏ ph�", 15000, {2, 0, 556, 1}, 15 * 24 * 3600},
	{"Tranh S綾 Y猲 Hoa", 40000, {2, 1, 189, 1}, 0},
	{"Lam S綾 Y猲 Hoa", 40000, {2, 1, 190, 1}, 0},
	{"鑞g B玭g Gi蕐", 253100, {2, 1, 30092, 1}, 0},
	{"Nh﹏ S﹎ V筺 N╩", 1000, {2, 1, 30071, 1}, 0},
	{"B秓 Rng c Bi謙", 1, {2, 1, 30091, 1}, 30 * 24 * 3600},
	{"Rng Tr蕁 Ph竔", 500, {2, 1, 30113, 1}, 30 * 24 * 3600},
};

--百宝箱_黄的奖励列表，概率基数为1000000
tbVIET_0909_BAIBAOXIANG = {
	{"Tu ch﹏ y誹 quy誸",10000,{2,0,554,1},15*24*3600},	
	{"C﹜ b竧 nh�",2400,{2,0,398,1},15*24*3600},	
	{"Ti猽 Ki誴 T竛",2000,{2,0,141,1},15*24*3600},	
	{"Ti觰 nh﹏ s﹎ qu�",4000,{2,0,552,1},15*24*3600},	
	{"B祅 long b輈h",4000,{2,1,1000,1},15*24*3600},	
	{"Nguy謙 Hoa",3800,{2,1,2002,1},0},	
	{"Th� th﹏ ph�",2700,{2,0,556,1},15*24*3600},	
	{"M苩 n� s竧 th� 阯g",2700,{2,1,1087,1},15*24*3600},	
	{"T祅g ki誱 anh h飊g thi誴",2700,{2,0,31,1},15*24*3600},	
	{"S� m玭 l謓h th�",2700,{2,1,1016,1},15*24*3600},	
	{"Gi竛 甶謕 trang",2700,{2,1,9995,1},15*24*3600},	
	{"Th竔 h� 產 m藅 qu�",2000,{2,1,387,1},15*24*3600},	
	{"S� m玭 t譶h nguy謓 th�",2000,{2,1,1019,1},15*24*3600},	
	{"Qu﹏ c玭g chng",2000,{2,1,9999,1},15*24*3600},	
	{"Tinh luy謓 b╪g th筩h",1300,{2,1,533,1},15*24*3600},	
	{"Чi nh﹏ s﹎ ",1300,{2,0,553,1},15*24*3600},	
	{"Qu﹏ c玭g b礽",1300,{2,1,997,1},15*24*3600},	
	{"X輈h th�",1300,{0,105,9,1,1,-1,-1,-1,-1,-1,-1},30*24*3600},	
	{"Tr秓 ho祅g phi 甶謓",1300,{0,105,11,1,1,-1,-1,-1,-1,-1,-1},30*24*3600},	
	{"T葃 T駓 Кn",1100,{2,0,136,1},15*24*3600},	
	{"C� quan nh﹏",800,{2,1,1011,1},15*24*3600},	
	{"H鑤 l玦 b竎",800,{0,105,12,1,1,-1,-1,-1,-1,-1,-1},30*24*3600},	
	{"B秓 rng t祅g ki誱 y gi竝",800,{2,1,1060,1},15*24*3600},	
	{"B� c秐h",700,{0,105,13,1,1,-1,-1,-1,-1,-1,-1},30*24*3600},	
	{"L鬰 l﹎ lang y猲",600,{2,1,1014,1},15*24*3600},	
	{"Th駓 ho祅g b� chi誹",600,{2,1,1047,1},15*24*3600},	
	{"Uy猲 ng kim ti b筩",600,{2,1,1048,1},15*24*3600},	
	{"C鰑 Chuy觧 H錳 H錸 Кn (x100)",500,{1,0,32,100},0},	
	{"B秓 rng t祅g ki誱 hoa kh�",500,{2,1,1061,1},15*24*3600},	
	{"V� qu鑓 y",400,{0,109,121,1},30*24*3600},	
	{"H綾 thi誸 y",400,{0,109,122,1},30*24*3600},	
	{"T� v薾 y",400,{0,109,124,1},30*24*3600},	
	{"Th髖 nh﹏ y",400,{0,109,123,1},30*24*3600},	
	{"Chi課 b祇 c髉 th� gi韎",400,{2,1,505,1},15*24*3600},	
	{"Trng kh玭g bao",400,{2,0,596,1},15*24*3600},	
	{"Huy hi謚 chi課 c玭g i",400,{2,1,9998,1},15*24*3600},	
	{"Nguy謙 Hoa chi tinh",400,{2,1,3219,1},15*24*3600},	
	{"Th莕 h祅h b� ph�",300,{0,200,39,1},15*24*3600},	
	{"V� ng蕁 th駓",300,{2,1,503,1},15*24*3600},	
	{"B秓 rng t祅g ki誱 u qu竛",300,{2,1,1059,1},15*24*3600},	
	{"B秓 rng t祅g ki誱 v� kh�",300,{2,1,1063,1},15*24*3600},	
	{"B秓 rng t祅g ki誱 trang s鴆",300,{2,1,1062,1},15*24*3600},	
	{"Rng b� k輕",200,{2,1,30093,1},15*24*3600},	
	{"T葃 T駓 Linh Кn",100,{2,0,137,1},15*24*3600},	
	{"Bao m秐h thi猲 th筩h",100,{2,1,1049,1},15*24*3600},	
	{"N� oa tinh th筩h",100,{2,1,504,1},15*24*3600},	
	{"H遖 Th� B輈h",100,{2,1,1001,1},15*24*3600},		
	{"Th莕 h祅h b秓 甶觧",50,{0,200,40,1},15*24*3600},	
	{"Huy hi謚 chi課 c玭g (huy ho祅g)",50,{2,1,9977,1},15*24*3600},	
	{"20 v祅g",20000,"Earn(%d)",200000},
	{"30 v祅g",10000,"Earn(%d)",300000},
	{"40 v祅g",5000,"Earn(%d)",400000},
	{"50 v祅g ",4000,"Earn(%d)",500000},
	{"100 v祅g",3400,"Earn(%d)",1000000},
	{"5h 駓 th竎 b筩h c﹗ ho祅",18300,"SetTask(2501, GetTask(2501) + %d)", 5*60},
	{"5h 駓 th竎 l鬰 th莕 ho祅",24400,"EatLiushen(1, %d)", 5*60},
	{"5h 駓 th竎 th莕 n玭g n",7300,"SetTask(2502, GetTask(2502) + %d)", 5*60},
	{"10h 駓 th竎 b筩h c﹗ ho祅",9100,"SetTask(2501, GetTask(2501) + %d)",10* 60},
	{"10h 駓 th竎h L鬰 th莕 ho祅",12200,"EatLiushen(1, %d)", 10*60},
	{"10h 駓 th竎 th莕 n玭g n",3700,"SetTask(2502, GetTask(2502) + %d)", 10*60},
	{"50000 exp",10000,"ModifyExp(%d)",50000},
	{"500000 exp",10000,"ModifyExp(%d)",500000},
	{"750000 exp",10000,"ModifyExp(%d)",750000},
	{"1000000 exp",20000,"ModifyExp(%d)",1000000},
	{"5000000 exp",20000,"ModifyExp(%d)",5000000},
	{"уng ti襫 v祅g",30000,{2,1,30094,1},0},	
	{"20 danh v鋘g",40000,"ModifyReputation(%d,0)",20},	
	{"30 danh v鋘g",30000,"ModifyReputation(%d,0)",30},
	{"50 danh v鋘g",20000,"ModifyReputation(%d,0)",50},
	{"70 danh v鋘g",10000,"ModifyReputation(%d,0)",70},
	{"100 danh v鋘g",4000,"ModifyReputation(%d,0)",100},
	{"20 甶觤 c鑞g hi課 s� m玭",40000,"SetTask(336, GetTask(336) + %d)", 20}	,
	{"30 甶觤 c鑞g hi課 s� m玭",30000,"SetTask(336, GetTask(336) + %d)", 30},
	{"50 甶觤 c鑞g hi課 s� m玭",20000,"SetTask(336, GetTask(336) + %d)", 50},
	{"70 甶觤 c鑞g hi課 s� m玭",10000,"SetTask(336, GetTask(336) + %d)", 70},
	{"100 甶觤 c鑞g hi課 s� m玭",4000,"SetTask(336, GetTask(336) + %d)", 100},
	{"100 Kho竛g th筩h qu﹏ d鬾g",45000,{2,0,307,100},0},	
	{"150 Kho竛g th筩h qu﹏ d鬾g",20000,{2,0,307,150},0},	
	{"200 Kho竛g th筩h qu﹏ d鬾g",10000,{2,0,307,200},0},	
	{"100 Dc th秓 qu﹏ d鬾g",45000,{2,0,312,100},0},	
	{"150 Dc th秓 qu﹏ d鬾g",20000,{2,0,312,150},0},	
	{"200 Dc th秓 qu﹏ d鬾g",10000,{2,0,312,200},0},	
	{"100 G� qu﹏ d鬾g",45000,{2,0,308,100},0},	
	{"150 G� qu﹏ d鬾g",20000,{2,0,308,150},0},	
	{"200 G� qu﹏ d鬾g",10000,{2,0,308,200},0},	
	{"100 T� t籱 qu﹏ d鬾g",45000,{2,0,311,100},0},	
	{"150 T� t籱 qu﹏ d鬾g",20000,{2,0,311,150},0},	
	{"200 T� t籱 qu﹏ d鬾g",10000,{2,0,311,200},0},	
	{"100 Thu閏 da qu﹏ d鬾g",40000,{2,0,310,100},0},	
	{"150 Thu閏 da qu﹏ d鬾g",20000,{2,0,310,150},0},	
	{"200 Thu閏 da qu﹏ d鬾g",10000,{2,0,310,200},0},	
	{"100 Linh huy誸 qu﹏ d鬾g",40000,{2,0,313,100},0},	
	{"150 Linh huy誸 qu﹏ d鬾g",20000,{2,0,313,150},0},	
	{"200 Linh huy誸 qu﹏ d鬾g",10000,{2,0,313,200},0},	
	{"100 L骯 m筩h qu﹏ d鬾g",40000,{2,0,309,100},0},	
	{"150 L骯 m筩h qu﹏ d鬾g",20000,{2,0,309,150},0},	
	{"200 L骯 m筩h qu﹏ d鬾g",10000,{2,0,309,200},0},	
};

--高级要诀箱物品列表,概率基数为100
tbVIET_0909_GAOJIYAOJUE = {
	{"Чt Ma V� quy誸", 7, {2, 6, 10, 1}},
	{"Hu� Nh穘 quy誸", 7, {2, 6, 14, 1}},
	{"S� T� H鑞g", 7, {2, 6, 29, 1}},
	{"M穘 Thi猲 V� quy誸", 7, {2, 6, 46, 1}},
	{"Thanh Ph筺 quy誸", 7, {2, 6, 53, 1}},
	{"Ph骳 Th駓 ph竝", 7, {2, 6, 67, 1}},
	{"T髖 謕", 7, {2, 6, 78, 1}},
	{"Ф C萿 quy誸", 7, {2, 6, 88, 1}},
	{"T輈h Dng Ki誱 quy誸", 7, {2, 6, 99, 1}},
	{"Thi誹 Dng quy誸", 7, {2, 6, 114, 1}},
	{"Ng� M� quy誸", 7, {2, 6, 129, 1}},
	{"L璾 Tuy謙 Ti詎 quy誸", 7, {2, 6, 141, 1}},
	{"B� ki誴 Th玦 Thi T� Kh�", 7, {2, 6, 151, 1}},
	{"B� ki誴 Huy詎 C�", 7, {2, 6, 167, 1}},
};

--阵派箱脚本列表
tbVIET_0909_ZHENPAIXIANG = {
	{"D辌h C﹏ Kinh-thng", 2, {2, 1, 916, 1}},
	{"D辌h C﹏ Kinh-trung", 2, {2, 1, 917, 1}},
	{"D辌h C﹏ Kinh-h� ", 2, {2, 1, 918, 1}},
	{"Nh� Lai Th莕 Chng-thng", 2, {2, 1, 919, 1}},
	{"Nh� Lai Th莕 Chng-trung", 2, {2, 1, 920, 1}},
	{"Nh� Lai Th莕 Chng-h� ", 2, {2, 1, 921, 1}},
	{"T葃 T駓 Kinh-thng", 2, {2, 1, 922, 1}},
	{"T葃 T駓 Kinh-trung", 2, {2, 1, 923, 1}},
	{"T葃 T駓 Kinh-h� ", 2, {2, 1, 924, 1}},
	{"H蕄 Tinh Tr薾-thng", 2, {2, 1, 925, 1}},
	{"H蕄 Tinh Tr薾-trung", 2, {2, 1, 926, 1}},
	{"H蕄 Tinh Tr薾-h� ", 2, {2, 1, 927, 1}},
	{"V筺 Tng Th莕 C玭g-thng", 2, {2, 1, 928, 1}},
	{"V筺 Tng Th莕 C玭g-trung", 2, {2, 1, 929, 1}},
	{"V筺 Tng Th莕 C玭g-h� ", 2, {2, 1, 930, 1}},
	{"Thi猲  Tr蕁 H錸 Kh骳-thng", 2, {2, 1, 931, 1}},
	{"Thi猲  Tr蕁 H錸 Kh骳-trung", 2, {2, 1, 932, 1}},
	{"Thi猲  Tr蕁 H錸 Kh骳-h� ", 2, {2, 1, 933, 1}},
	{"Gi竛g Long Th藀 B竧 Chng-thng", 2, {2, 1, 934, 1}},
	{"Gi竛g Long Th藀 B竧 Chng-trung", 2, {2, 1, 935, 1}},
	{"Gi竛g Long Th藀 B竧 Chng-h� ", 2, {2, 1, 936, 1}},
	{"Ф C萿 C玭 Tr薾-thng", 2, {2, 1, 937, 1}},
	{"Ф C萿 C玭 Tr薾-trung", 2, {2, 1, 938, 1}},
	{"Ф C萿 C玭 Tr薾-h� ", 2, {2, 1, 939, 1}},
	{"V� Thng Th竔 C鵦 Ki誱-thng", 2, {2, 1, 940, 1}},
	{"V� Thng Th竔 C鵦 Ki誱-trung", 2, {2, 1, 941, 1}},
	{"V� Thng Th竔 C鵦 Ki誱-h� ", 2, {2, 1, 942, 1}},
	{"Th竔 C鵦 Th莕 C玭g-thng", 2, {2, 1, 943, 1}},
	{"Th竔 C鵦 Th莕 C玭g-trung", 2, {2, 1, 944, 1}},
	{"Th竔 C鵦 Th莕 C玭g-h� ", 2, {2, 1, 945, 1}},
	{"Li猲 Ho祅 To祅 Long Thng-thng", 2, {2, 1, 946, 1}},
	{"Li猲 Ho祅 To祅 Long Thng-trung", 2, {2, 1, 947, 1}},
	{"Li猲 Ho祅 To祅 Long Thng-h� ", 2, {2, 1, 948, 1}},
	{"B� Vng Tng Ph鬾g Ti詎-thng", 2, {2, 1, 949, 1}},
	{"B� Vng Tng Ph鬾g Ti詎-trung", 2, {2, 1, 950, 1}},
	{"B� Vng Tng Ph鬾g Ti詎-h� ", 2, {2, 1, 951, 1}},
	{"V� 秐h Ma C�-thng", 2, {2, 1, 952, 1}},
	{"V� 秐h Ma C�-trung", 2, {2, 1, 953, 1}},
	{"V� 秐h Ma C�-h� ", 2, {2, 1, 954, 1}},
	{"V� Thi猲 Ma C玭g-thng", 2, {2, 1, 955, 1}},
	{"V� Thi猲 Ma C玭g-trung", 2, {2, 1, 956, 1}},
	{"V� Thi猲 Ma C玭g-h� ", 2, {2, 1, 957, 1}},
	{"Kim Cang B竧 Nh� Kinh", 1, {0, 107, 166, 1}},
	{"Ti襪 Long T辌h Di謙 Kinh", 1, {0, 107, 167, 1}},
	{"V� Tr莕 B� б Kinh", 1, {0, 107, 168, 1}},
	{"Thi猲 La Li猲 Ch﹗ L鬰", 1, {0, 107, 169, 1}},
	{"Nh� � Kim жnh M藅 T辌h", 1, {0, 107, 170, 1}},
	{"B輈h H秈 Tuy謙  Ph�", 1, {0, 107, 171, 1}},
	{"H鏽 чn Tr蕁 Nh筩 M藅 T辌h", 1, {0, 107, 172, 1}},
	{"Qu� Thi猲 Du Long M藅 T辌h", 1, {0, 107, 173, 1}},
	{"Huy詎 秐h M� Tung M藅 T辌h", 1, {0, 107, 174, 1}},
	{"Qu﹏ T� Ti謙 Phong M藅 T辌h", 1, {0, 107, 175, 1}},
	{"Tr蕁 Qu﹏ Phi Long Thng", 1, {0, 107, 176, 1}},
	{"Xuy猲 V﹏ L筩 H錸g M藅 T辌h", 1, {0, 107, 177, 1}},
	{"U Minh Phong Ma L鬰", 1, {0, 107, 178, 1}},
	{"Linh C� Huy詎 T� L鬰", 1, {0, 107, 179, 1}},
	{"B竎h Th秓 m藅 t辌h", 1, {0, 107, 156, 1}},
	{"Ng� H祅h M藅 t辌h", 1, {0, 107, 155, 1}},
}

--蚊子包奖励，概率基数为100
tb_VIET_0909_WENZIBAO = {
	{"H遖 Th� B輈h", 3, {2, 1, 1001, 1}, 15 * 24 * 3600},
	{"T葃 T駓 linh n", 3, {2, 0, 137, 1}, 15 * 24 * 3600},
	{"Rng B� K輕", 3, {2, 1, 30093, 1}, 30 * 24 * 3600},
	{"Rng Y誹 Quy誸_Cao C蕄", 1, {2, 1, 30112, 1}, 30 * 24 * 3600},
	{"Rng Tr蕁 Ph竔", 3, {2, 1, 30113, 1}, 30 * 24 * 3600},
	{"Nguy謙 Hoa Chi Tinh", 5, {2, 1, 3219, 1}, 0},
	{"Thi猲 Th筩h linh th筩h", 1, {2, 1, 1068, 1}, 15 * 24 * 3600},
	{"Th莕 h祅h b秓 甶觧", 4, {0, 200, 40, 1}, 30 * 24 * 3600},
	{"Th� Th﹏ ph�", 20, {2, 0, 556, 1}, 15 * 24 * 3600},
	{"Ti猽 Ki誴 t竛", 57, {2, 0, 141, 1}, 15 * 24 * 3600},
};

--玉兔箱奖励，概率基数为100000
tb_VIET_0909_YUTUXIANG = {
	{"M秐h Thi猲 th筩h", 5033, {2, 2, 7, 1}, 0},
	{"Thi猲 th筩h", 5000, {2, 2, 8, 1}, 0},
	{"B╪g th筩h", 1400, {2, 1, 149, 1}, 0},
	{"T葃 T駓 linh n", 100, {2, 0, 137, 1}, 15 * 24 * 3600},
	{"Rng B� K輕", 500, {2, 1, 30093, 1}, 30 * 24 * 3600},
	{"Si猽 Quang", 100, {0, 105, 19, 1,1,-1,-1,-1,-1,-1,-1}, 30 * 24 * 3600},
	{"Nh﹏ S﹎ V筺 N╩", 500, {2, 1, 30071, 1}, 0},
	{"Ti猽 Ki誴 t竛", 2000, {2, 0, 141, 1}, 15 * 24 * 3600},
	{"Thi猲 Th筩h linh th筩h", 10, {2, 1, 1068, 1}, 15 * 24 * 3600},	
	{"Rng Tr蕁 Ph竔", 60, {2, 1, 30113, 1}, 30 * 24 * 3600},
--	{"Rng Y誹 Quy誸_Cao C蕄", 20, {2, 1, 30112, 1}, 30 * 24 * 3600},
--	{"B秓 Rng c Bi謙", 16, {2, 1, 30091, 1}, 30 * 24 * 3600},
	{"Th莕 h祅h b秓 甶觧", 40, {0, 200, 40, 1}, 30 * 24 * 3600},
	{"T� Quang B礽", 120, {2, 0, 762, 1}, 15 * 24 * 3600},
	{"C琺 chi猲 tr鴑g", 15137, {1, 1, 14, 1}, 0},
	{"B竛h B閠 v祅g", 14000, {1, 1, 15, 1}, 0},
	{"L筩 Mai", 14000, {1, 1, 16, 1}, 0},
	{"Minh Nguy謙 D�", 14000, {1, 1, 17, 1}, 0},
	{"M閏 Lan Xu﹏", 14000, {1, 1, 18, 1}, 0},
	{"T﹜ B綾 V鋘g", 14000, {1, 1, 19, 1}, 0},
};

VIET_0909_LOG_TITLE = "[Hoat dong trung thu 2009]";

function GiveNghichLanDauHon()
	if random(10) == 1 then
		--AddItem(2,1,1156,1) -- ngh辌h l﹏
		gf_AddItemEx2({2,1,1156,1},"Ngh辌h l﹏","Hoat dong Tet Nguyen Dan","gi誸 th�",15*24*3600);
	end
	if random(1,100) == 1 then
		--AddItem(2,1,1157,1) -- u h錸
		gf_AddItemEx2({2,1,1157,1},"u h錸","Hoat dong Tet Nguyen Dan","gi誸 th�",15*24*3600);
	end
end;

--领取上线奖励
function Viet0909_Give_ShangXian_Aword()
	if tonumber(date("%y%m%d")) < 090918 or tonumber(date("%y%m%d")) >= 491026 then
		Talk(1, "", "Ho箃 ng  qu� h筺");
		return 0;
	end
	local nDayWeek = tonumber(date("%w"));
	local nHour = tonumber(date("%H"));
	if nDayWeek == 2 or nDayWeek == 3 or nDayWeek == 4 then
		Talk(1, "", "Ch� c� th� 2, 6, 7 ch� nh藅 m韎 c� th� nh薾 ph莕 thng l猲 m筺g");
		return 0;
	end
	if nHour < 16 then
		Talk(1, "", "Th阨 gian nh薾 online nh薾 thng v祇 m鏸 ng祔 t� 16 n 24 gi�");
		return 0;
	end
	if GetLevel() < 73 or GetPlayerRoute() == 0 then
		Talk(1, "", "Th蕄 h琻 c蕄 73 v� ch璦 v祇 m玭 ph竔 th� kh玭g th� nh薾 lo筰 ph莕 thng n祔");
		return 0;
	end
	if GetTask(VIET_0909_TASK_SHANGXIAN_AWORD) >= tonumber(date("%y%m%d")) then
		Talk(1, "", "H玬 nay i hi謕  nh薾 ph莕 thng, xin h穣 i ng祔 mai");
		return 0;
	end
	local nExp = 0;
	local nRep = GetReputation();
	local nFac = GetTask(336);
	local nRepLevel = viet0909_get_aword_level(nRep, tbVIET_0909_SHANGXIAN_AWORD);
	local nFacLevel = viet0909_get_aword_level(nFac, tbVIET_0909_SHANGXIAN_AWORD);
	if nRepLevel == 0 and nFacLevel == 0 then
		Talk(1, "", "觤 danh v鋘g v� c鑞g hi課 s� m玭 kh玭g  nh薾 ph莕 thng n祔.");
		return 0;
	end
	if gf_Judge_Room_Weight(2, 10, " ") ~= 1 then 
		return 0;
	end
	if nRepLevel ~= 0 then
		ModifyExp(tbVIET_0909_SHANGXIAN_AWORD[nRepLevel][3]);
		Msg2Player("B筺 nh薾 頲 "..tbVIET_0909_SHANGXIAN_AWORD[nRepLevel][3].." 甶觤 kinh nghi謒");
		WriteLog(GetName() .. "Nh薾 頲 "..tbVIET_0909_SHANGXIAN_AWORD[nRepLevel][3] .. "  甶觤 kinh nghi謒")
		gf_AddItemEx({2, 1, 30106, tbVIET_0909_SHANGXIAN_AWARD2[nRepLevel]}, "B閠 M�");
		WriteLogEx("Hoat dong trung thu","nh薾 Danh v鋘g "..tbVIET_0909_SHANGXIAN_AWORD[nRepLevel][1])
	end
	if nFacLevel ~= 0 then
		ModifyExp(tbVIET_0909_SHANGXIAN_AWORD[nFacLevel][3]);
		Msg2Player("B筺 nh薾 頲 "..tbVIET_0909_SHANGXIAN_AWORD[nFacLevel][3].." 甶觤 kinh nghi謒");
		WriteLog(GetName() .. "Nh薾 頲 "..tbVIET_0909_SHANGXIAN_AWORD[nFacLevel][3] .. "  甶觤 kinh nghi謒")
		gf_AddItemEx({2, 1, 30106, tbVIET_0909_SHANGXIAN_AWARD2[nFacLevel]}, "B閠 M�");
		WriteLogEx("Hoat dong trung thu","nh薾 S� m玭 "..tbVIET_0909_SHANGXIAN_AWORD[nFacLevel][1])
	end
	SetTask(VIET_0909_TASK_SHANGXIAN_AWORD, tonumber(date("%y%m%d")));
end

--判断现在的声望和师门贡献度可以获得第几级奖励
function viet0909_get_aword_level(nValue, tAword)
	for i = getn(tAword), 1, -1 do
		if tAword[i][2] == 0 then
			if nValue >= tAword[i][1] then
				return i;
			end
		else
			if nValue >= tAword[i][1] and nValue <= tAword[i][2] then
				return i;
			end
		end
	end
	return 0;
end

function Viet0909_Add_ShaQi()
	if (tonumber(date("%y%m%d")) >= 491001) then
		Talk(1, "", "Ho箃 ng  qu� h筺");
		return 0;
	end
	local nDayWeek = tonumber(date("%w"));
	if nDayWeek == 2 or nDayWeek == 3 or nDayWeek == 4 then
		Talk(1, "", "Ch� t筰 th� 2, 6, 7 ch� nh藅 m韎 c� th� nh薾 頲 tr� s竧 kh�");
		return 0;
	end
	local nRoute = GetPlayerRoute();
	if tbViet_0908_SkillID[nRoute] == 0 or GetSkillLevel(tbViet_0908_SkillID[nRoute]) == 0 then
		Talk(1, "", "Чi hi謕 v蒼 ch璦 h鋍 k� n╪g tr蕁 ph竔, v� v藋 kh玭g th� t╪g tr� s竧 kh� 頲.");
		return 0;
	end
	if GetMomentum() >= 10 then
		Talk(1, "", "Tr� s竧 kh� hi謓 t筰  y, kh玭g th� t╪g th猰 甶觤 s竧 kh� 頲.");
		return 0;
	end
	if GetTask(VIET_0908_TASK_GET_SHAQI_DATE) < tonumber(date("%y%m%d")) then
		SetTask(VIET_0908_TASK_GET_SHAQI_COUNT, 0);
	end
	if GetTask(VIET_0908_TASK_GET_SHAQI_COUNT) >= 10 then
		Talk(1, "", "H玬 nay c竎 h�  nh薾 tr� s竧 kh� 10 l莕 r錳, kh玭g th� nh薾 th猰 頲 n鱝.");
		return 0;
	end
	SetMomentum(GetMomentum() + 5);
	SetTask(VIET_0908_TASK_GET_SHAQI_COUNT, GetTask(VIET_0908_TASK_GET_SHAQI_COUNT) + 1);
	SetTask(VIET_0908_TASK_GET_SHAQI_DATE, tonumber(date("%y%m%d")));
	Msg2Player("B筺 nh薾 頲 5 甶觤 s竧 kh� fix by thanhduongjokoe");
	WriteLogEx("Hoat dong thang 9", "Tran phai Than Khi");
end

function viet_0909_nothing()

end