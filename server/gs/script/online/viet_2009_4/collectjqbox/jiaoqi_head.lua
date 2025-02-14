--=============================================
--create by baiyun 2009.4.13
--describe:越南版4月份收集校旗箱活动
--=============================================
Include("\\script\\online\\viet_2009_4\\planttrees\\planttrees_head.lua")
--任务变量
JQ_TASK_GET_BOX_NUM = 2142;									--本天通过师门任务获得校旗箱的次数
JQ_TASK_GET_BOX_DATE = 2143;								--通过师门任务获得校旗箱的日期
JQ_TASK_GOLDEN_FLAG_EXP_MAX = 2144;					--每天使用黄金旗获得的经验的最大值
JQ_TASK_GET_GOLDEN_FLAG_REWARD_DATE = 2145;	--获得黄金旗奖励的日期

JQ_MAX_GET_BOX_NUM = 10;										--角色每天最多获得的校旗箱数量

JQ_CJ_GET_BOX_PERCENT = 30; 								--通过藏剑内打怪可以获得校旗箱的概率为30%

JQ_LEVEL_B_TO_R_FLAG_MONEY = 10 * 100;			--升级蓝旗到红旗所需的钱（铜钱）
JQ_LEVEL_B_TO_R_FLAG_BFLAG_NUM = 3;					--升级蓝旗到红旗所需的蓝旗数
JQ_GOLDEN_FLAG_EXP_MAX = 200000000;					--每天使用黄金旗获得的经验的最大值
JQ_GOLDEN_FLAG_EACH_EXP = 125000;						--黄金旗每次获得的经验数

JQ_ITEM_LIMIT_TIME = 7 * 24 * 60 * 60;			--有的奖励物品的使用期限

--师门任务中角色获得校旗箱的数量
--角色等级，每次获得校旗箱的数量
JQ_SHIMEN_PARAM = {
					{1, 0},
					{2, 0},
					{3, 0},
					{4, 0},
					{5, 30},
					{6, 40},
					{7, 50},
					{8, 60},
					{9, 80},
		};

--白金旗奖励物品
--物品名，出现概率 / 100000000 , 大类型，副类型，详细类型，使用期限, 发放数量
JQ_WG_FLAG_ITEM_PARAM = {
					{"Kim Cang Ph鬰 Ma T﹎ Ph竝", 59524, 0, 107, 2, 0, 1},
					{"Ti襪 Long T﹎ Ph竝", 59524, 0, 107, 4, 0, 1},
					{"V� Tr莕 T﹎ Ph竝", 59524, 0, 107, 6, 0, 1},
					{"Thi猲 La T﹎ Ph竝", 59524, 0, 107, 8, 0, 1},
					{"Nh� � T﹎ Ph竝", 59524, 0, 107, 10, 0, 1},
					{"B輈h H秈 T﹎ Ph竝", 59524, 0, 107, 12, 0, 1},
					{"H鏽 чn T﹎ Ph竝", 59524, 0, 107, 14, 0, 1},
					{"Qu� Thi猲 T﹎ Ph竝", 59524, 0, 107, 16, 0, 1},
					{"Huy襫 秐h T﹎ Ph竝", 59524, 0, 107, 18, 0, 1},
					{"Qu﹏ T� T﹎ Ph竝", 59524, 0, 107, 20, 0, 1},
					{"Tr蕁 Qu﹏ T﹎ Ph竝", 59524, 0, 107, 22, 0, 1},
					{"Xuy猲 V﹏ T﹎ Ph竝", 59524, 0, 107, 24, 0, 1},
					{"U Minh T﹎ Ph竝", 59524, 0, 107, 26, 0, 1},
					{"Linh C� T﹎ Ph竝", 59524, 0, 107, 28, 0, 1},
					{"M秐h Thi猲 th筩h", 32000000, 2, 2, 7, 0, 1},
					{"Th� Th﹏ ph�", 14500000, 2, 0, 556, JQ_ITEM_LIMIT_TIME, 1},
					{"Ti猽 Ki誴 t竛", 20070867, 2, 0, 141, JQ_ITEM_LIMIT_TIME, 1},
					{"T祅g Ki誱 anh h飊g thi誴", 24000000, 2, 0, 31, JQ_ITEM_LIMIT_TIME, 1},
					{"B竧 B秓 T葃 T駓 Ti猲 Кn", 4167, 2, 0, 138, JQ_ITEM_LIMIT_TIME, 1},
					{"T葃 T駓 linh n", 8333, 2, 0, 137, JQ_ITEM_LIMIT_TIME, 1},
					{"Thi猲 H� M藅 t辌h", 833333, 0, 107, 64, 0, 1},
					{"T� H� M藅 t辌h", 833333, 0, 107, 65, 0, 1},
					{"Chi猰 Y Ph�", 416667, 0, 107, 66, 0, 1},
					{"L鬰 L﹎ Lang Y猲", 700000, 2, 1, 1014, JQ_ITEM_LIMIT_TIME, 1},
					{"Th駓 Ho祅g B� Chi誹", 700000, 2, 1, 1047, JQ_ITEM_LIMIT_TIME, 1},
					{"Uy猲 Μng Kim Ti B筩", 150000, 2, 1, 1048, JQ_ITEM_LIMIT_TIME, 1},
					{"Ph竜 hoa a tin", 3900000, 2, 1, 203, JQ_ITEM_LIMIT_TIME, 1},
					{"B秓 rng T祅g Ki誱 u qu竛", 100000, 2, 1, 1059, JQ_ITEM_LIMIT_TIME, 1},
					{"B秓 rng T祅g Ki誱 y gi竝", 150000, 2, 1, 1060, JQ_ITEM_LIMIT_TIME, 1},
					{"B秓 rng T祅g Ki誱 hoa kh�", 150000, 2, 1, 1061, JQ_ITEM_LIMIT_TIME, 1},
					{"B秓 rng T祅g Ki誱 trang s鴆", 100000, 2, 1, 1062, JQ_ITEM_LIMIT_TIME, 1},
					{"B秓 rng T祅g Ki誱 v� kh�", 100000, 2, 1, 1063, JQ_ITEM_LIMIT_TIME, 1},
					{"Nh蕋 Чi Чi Hi謕", 200000, 2, 1, 1041, JQ_ITEM_LIMIT_TIME, 1},
					{"Phong thng l謓h_Li猽 (Ti猲 Phong)", 99966, 2, 1, 9985, JQ_ITEM_LIMIT_TIME, 1},
					{"Phong thng l謓h_T鑞g (Ti猲 Phong)", 100000, 2, 1, 9986, JQ_ITEM_LIMIT_TIME, 1},
					{"Phong l謓h-cao c蕄", 50000, 2, 1, 1018, JQ_ITEM_LIMIT_TIME, 1}
}

--黄金旗奖励物品
--物品名，出现概率 / 100000000 , 大类型，副类型，详细类型，使用期限
JQ_YG_FLAG_ITEM_PARAM = {
					{"L� th駓", 10000000, 2, 0, 351, 0, 1},
					{"M秐h Thi猲 th筩h", 2025000, 2, 2, 7, 0, 1},
					{"Thi猲 th筩h", 3000000, 2, 2, 8, 0, 1},
					{"M秐h B╪g th筩h", 2000000, 2, 1, 148, 0, 1},
					{"B╪g th筩h", 3000000, 2, 1, 149, 0, 1},
					{"B錸g Lai Ti猲 Th駓", 1500000, 2, 1, 1012, 0, 1},
					{"B錸g Lai L� Th駓", 2000000, 2, 1, 1052, 0, 1},
					{"Danh v鋘g", 5000000, 0, 0, 0, 0, 3},
					{"Danh v鋘g", 1000000, 0, 0, 0, 0, 5},
					{"Danh v鋘g", 1000000, 0, 0, 0, 0, 10},
					{"Danh v鋘g", 500000, 0, 0, 0, 0, 50},
					{"Luy謓", 31000000, 0, 0, 0, 0, 20},
					{"觤 t祅g ki誱", 34500000, 0, 0, 0, 0, 100},
					{"T祅g Ki誱 anh h飊g thi誴", 500000, 2, 0, 31, JQ_ITEM_LIMIT_TIME, 1},
					{"Th� Th﹏ ph�", 1553800, 2, 0, 556, JQ_ITEM_LIMIT_TIME, 1},
					{"Ti猽 Ki誴 t竛", 1000000, 2, 0, 141, JQ_ITEM_LIMIT_TIME, 1},
					{"B竧 B秓 T葃 T駓 Ti猲 Кn", 375, 2, 0, 138, JQ_ITEM_LIMIT_TIME, 1},
					{"T葃 T駓 linh n", 750, 2, 0, 137, JQ_ITEM_LIMIT_TIME,1},
					{"Thi猲 H� M藅 t辌h", 75000, 0, 107, 64, 0, 1},
					{"T� H� M藅 t辌h", 75000, 0, 107, 65, 0, 1},
					{"Chi猰 Y Ph�", 37500, 0, 107, 66, 0, 1},
					{"L鬰 L﹎ Lang Y猲", 12500, 2, 1, 1014, JQ_ITEM_LIMIT_TIME, 1},
					{"Th駓 Ho祅g B� Chi誹", 12500, 2, 1, 1047, JQ_ITEM_LIMIT_TIME, 1},
					{"Uy猲 Μng Kim Ti B筩", 20000, 2, 1, 1048, JQ_ITEM_LIMIT_TIME, 1},
					{"Ph竜 hoa a tin", 50000, 2, 1, 203, JQ_ITEM_LIMIT_TIME, 1},
					{"B秓 rng T祅g Ki誱 u qu竛", 2000, 2, 1, 1059, JQ_ITEM_LIMIT_TIME, 1},
					{"B秓 rng T祅g Ki誱 y gi竝", 50000, 2, 1, 1060, JQ_ITEM_LIMIT_TIME, 1},
					{"B秓 rng T祅g Ki誱 hoa kh�", 4000, 2, 1, 1061, JQ_ITEM_LIMIT_TIME, 1},
					{"B秓 rng T祅g Ki誱 trang s鴆", 1000, 2, 1, 1062, JQ_ITEM_LIMIT_TIME, 1},
					{"B秓 rng T祅g Ki誱 v� kh�", 2000, 2, 1, 1063, JQ_ITEM_LIMIT_TIME, 1},
					{"Nh蕋 Чi Чi Hi謕", 5000, 2, 1, 1041, JQ_ITEM_LIMIT_TIME, 1},
					{"Phong thng l謓h_Li猽 (Ti猲 Phong)", 8000, 2, 1, 9985, JQ_ITEM_LIMIT_TIME, 1},
					{"Phong thng l謓h_T鑞g (Ti猲 Phong)", 8000, 2, 1, 9986, JQ_ITEM_LIMIT_TIME, 1},
					{"Phong l謓h-cao c蕄", 2000, 2, 1, 1018, JQ_ITEM_LIMIT_TIME, 1},
					{"Kim Cang Ph鬰 Ma kinh", 3970, 0, 107, 1, 0, 1},
					{"Ti襪 Long M藅 t辌h", 3970, 0, 107, 3, 0, 1},
					{"V� Tr莕 M藅 t辌h", 3970, 0, 107, 5, 0, 1},
					{"Thi猲 La M藅 T辌h", 3970, 0, 107, 7, 0, 1},
					{"Nh� � M藅 T辌h", 3970, 0, 107, 9, 0, 1},
					{"B輈h H秈 Ph�", 3970, 0, 107, 11, 0, 1},
					{"H鏽 чn M藅 t辌h", 3970, 0, 107, 13, 0, 1},
					{"Qu� Thi猲 M藅 t辌h", 3970, 0, 107, 15, 0, 1},
					{"Huy襫 秐h M藅 t辌h", 3970, 0, 107, 17, 0, 1},
					{"Qu﹏ T� M藅 t辌h", 3970, 0, 107, 19, 0, 1},
					{"Tr蕁 Qu﹏ M藅 t辌h", 3970, 0, 107, 21, 0, 1},
					{"Xuy猲 V﹏ M藅 t辌h", 3970, 0, 107, 23, 0, 1},
					{"U Minh Qu� L鬰", 3970, 0, 107, 25, 0, 1},
					{"Linh C� M藅 t辌h", 3970, 0, 107, 27, 0, 1}
					
}

function JQ_CheckEventDate()		--检查活动日期2009年04月24日　-- 2009年05月24日24点
	if getCurYear() ~= 2020 then
		return 0;
	end
	if getCurMonth() == 7 then
		if getCurDate() >= 24 then
			return 1;
		end
	end
	if getCurMonth() == 8 then
		if getCurDate() <= 31 then
			return 1;
		end
	end
	return 0;
end

function JQ_DoNothing()
end


--------------------------------------
--JQ_GetRandItem()
--取得随机物品
--------------------------------------
function JQ_GetRandItem(JQ_WYG_FLAG_ITEM_PARAM)
	local nPos = 0;
	local nRand = random(1, 100000000);
	for i = 1, getn(JQ_WYG_FLAG_ITEM_PARAM) do
		if nRand > nPos and nRand <= nPos + JQ_WYG_FLAG_ITEM_PARAM[i][2] then
			return i;
		end
		nPos = nPos + JQ_WYG_FLAG_ITEM_PARAM[i][2];
	end
	return 15;
end