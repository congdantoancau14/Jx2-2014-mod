--=============================================
--create by baiyun 2009.5.29
--describe:越南版7月份活动之五种树
--=============================================
Include("\\script\\online\\viet_event\\200907\\event_head.lua");

g_viet0908_event_title = "Hoat dong trong cay thang 8 (viet nam):";

TREE_TYPE = {									--模板名，NPC名字，出现概率
				{"M莔 hoa h錸g", "C﹜ H衞 骯",  5, "C﹜ H衞 骯"},
				{"M莔 Hoa h錸g", "C﹜ B蕋 T�", 10, "C﹜ B蕋 T�"},
				{" nh竛h hoa h錸g", "C﹜ B筩h Ng﹏", 80, "C﹜ B筩h Ng﹏"},
				{"c﹜  M藅 Hoa Qu� nh�", "C﹜ Ho祅g Kim", 4, "C﹜ Ho祅g Kim"},
				{"c﹜  M藅 Hoa Qu� l韓", "C﹜ B筩h Kim", 1, "C﹜ B筩h Kim"},
			}
			
--TREE_TYPE = {									
--				{"M莔 hoa h錸g", "C﹜ H衞 骯",  5, "C﹜ H衞 骯"},
--				{"Tr飊g Dng hoa 1", "C﹜ B蕋 T�", 10, "C﹜ B蕋 T�"},
--				{"Tr飊g Dng hoa 2", "C﹜ B筩h Ng﹏", 80, "C﹜ B筩h Ng﹏"},
--				{"Hoa h錸g v祅g", "C﹜ Ho祅g Kim", 4, "C﹜ Ho祅g Kim"},
--				{"Hoa h錸g ", "C﹜ B筩h Kim", 1, "C﹜ B筩h Kim"},
--			}
			
--树的属性：成长度，存活时间， 相对于种下树的时间再过多少秒后可以浇水， 所需露水
--在第六阶段为领取奖励
TREE_PARAM = {
				{1, 90, 45, 1},
				{2, 130, 90, 1},
				{3, 170, 130, 1},
				{4, 210, 170, 1},
				{5, 240, 210, 1},
				{6, 300, 240, 1},
}

--城市名与ID
CITY_NAME_ID =
				{
					[100] = "Tuy襫 Ch﹗",
					[150] = "Dng Ch﹗",
					[200] = "Bi謓 Kinh",
					[300] = "Th祅h Й",
					[350] = "Tng Dng",
					[400] = "Чi L�",
					[500] = "Phng Tng"
				}

SMALLEST_TREE_REWARD_ITEM_PARAM = {
									{"чc C�", 300,2, 17, 2, 0*24*60*60,20,0},
									{"M穘h чc C�", 50,2, 17, 3, 0*24*60*60,10,0},
									{"чc Y猽 C�", 20, 2, 17, 4, 0*24*60*60,5,0},
									{"Huy誸 C�", 300, 2, 17, 5, 0*24*60*60,20,0},
									{"Thi Huy誸 C�", 50, 2, 17, 6, 0*24*60*60,10,0},
									{"Huy誸 Tinh C�", 20, 2, 17, 7, 0*24*60*60,5,0},
									{"Hng C�", 1500, 2, 17, 8, 0*24*60*60,20,0},
									{"M� Hng C�", 200, 2, 17, 9, 0*24*60*60,10,0},
									{"б H� C�", 20, 2, 17, 10, 0*24*60*60,5,0},
									{"Thi C�", 300, 2, 17, 11, 0*24*60*60,20,0},
									{"Tam Thi C�", 50,2, 17, 12, 0*24*60*60,10,0},
									{"Qu� Vng C�", 20,2, 17, 13, 0*24*60*60,5,0},
									{"Y猽 C�", 3800,2, 17, 14, 0*24*60*60,20,0},
									{"Th鵦 Y猽 C�", 1000,2, 17, 15, 0*24*60*60,10,0},
									{"Y猽 Ho祅g C�", 20,2, 17, 16, 0*24*60*60,5,0},
									{"T﹎ C�", 300, 2, 17, 17, 0*24*60*60,20,0},
									{"Th鵦 T﹎ C�", 50,2, 17, 18, 0*24*60*60,10,0},
									{"T﹎ S竧 C�", 20,2, 17, 19, 0*24*60*60,5,0},
									{"Huy詎 C�", 1000,2, 17, 20, 0*24*60*60,20,0},
									{"B╪g Huy詎 C�", 50,2, 17, 21, 0*24*60*60,10,0},
									{"Vong Ti猲 C�", 20,2, 17, 22, 0*24*60*60,5,0},
									{"T祄 C�", 300,2, 17, 23, 0*24*60*60,20,0},
									{"Huy誸 T祄 C�", 50,2, 17, 24, 0*24*60*60,10,0},
									{"Kim T祄 C�", 20,2, 17, 25, 0*24*60*60,5,0},
									{"Linh C�", 300,2, 17, 26, 0*24*60*60,20,0},
									{"Linh Lung C�", 50,2, 17, 27, 0*24*60*60,10,0},
									{"Th蕋 Th竔 Ti觰 Thi猲 C�", 20,2, 17, 28,0*24*60*60,5,0},
									{"Ma C�", 100,2, 17, 29, 0*24*60*60,20,0},
									{"U 秐h C�", 50,2, 17, 30, 0*24*60*60,10,0},
									{"V� 秐h Ma C�", 20,2, 17, 31, 0*24*60*60,5,0},
	};

ETERNAL_TREE_REWARD_ITEM_PARAM = {
									{"уng Ti襫 V祅g", 160, 2,1,30094, 0, 1,0},									
									{"V筺 Nh蒼 (ch璦 gi竚 nh)", 820, 2,1,375, 0, 1,0},
									{"H醓 Tinh (ch璦 gi竚 nh)", 820, 2,1,376, 0, 1,0},
									{"Li謙 Di謒 (ch璦 gi竚 nh)", 820, 2,1,377, 0, 1,0},
									{"M穘 Thi猲 Hoa V� (ch璦 gi竚 nh)", 820, 2,1,378, 0, 1,0},
									{"C� лnh (ch璦 gi竚 nh)", 820, 2,1,379, 0, 1,0},
									{"Hi Nh﹏ C莔 (ch璦 gi竚 nh)", 820, 2,1,380, 0, 1,0},
									{"Th莕 H祅h (ch璦 gi竚 nh)", 820, 2,1,381, 0, 1,0},
									{"A La H竛 Trng (ch璦 gi竚 nh)", 820, 2,1,382, 0, 1,0},
									{"Чi H祇 L玦 Thng (ch璦 gi竚 nh)", 820, 2,1,383, 0, 1,0},
									{"Th莕 Cung (ch璦 gi竚 nh)", 820, 2,1,384, 0, 1,0},
									{"M穘h H� (ch璦 gi竚 nh)", 820, 2,1,385, 0, 1,0},
									{"L╪g Phong (ch璦 gi竚 nh)", 820, 2,1,386, 0, 1,0}
	};
--黄金树奖励物品：物品名，出现概率，主类型，副类型，详细类型，使用期限，发放数量
GOLDEN_TREE_REWARD_ITEM_PARAM = {
									{"Ti猽 Ki誴 t竛", 5000, 2, 0, 141, PLANT_TREE_REWARD_ITEM_TIME_LIMIT, 1,0},
									{"Th莕 h祅h b� ph�", 2295, 0, 200, 39, PLANT_TREE_REWARD_ITEM_TIME_LIMIT, 1,0},
									{"Tu Ch﹏ Y誹 Quy誸", 2500, 2, 0, 554, PLANT_TREE_REWARD_ITEM_TIME_LIMIT, 1,0},
									{"T� Kim H錸g Bao", 200, 2, 1, 537, PLANT_TREE_REWARD_ITEM_TIME_LIMIT, 1,0},
									{"Чi h錸g bao ho祅g kim", 5, 2, 1, 539, PLANT_TREE_REWARD_ITEM_TIME_LIMIT, 1,0}
	};

--白金树奖励物品：物品名，出现概率，主类型，副类型，详细类型，使用期限，发放数量
WHITE_TREE_REWARD_ITEM_PARAM = {
									{"B� C秐h", 500, 0, 105, 13, PLANT_TREE_REWARD_ITEM_TIME_LIMIT1, 1,1},
									{"H鑤 L玦 B竎", 500, 0, 105, 12, PLANT_TREE_REWARD_ITEM_TIME_LIMIT1, 1,1},
									{"X輈h Th�", 500, 0, 105, 9, PLANT_TREE_REWARD_ITEM_TIME_LIMIT1, 1,1},
									{"Tr秓 Ho祅g Phi 謓", 500, 0, 105, 11, PLANT_TREE_REWARD_ITEM_TIME_LIMIT1, 1,1},
									{"Phi猽 V�", 500, 0, 105, 15, PLANT_TREE_REWARD_ITEM_TIME_LIMIT1, 1,1},
									{"B祅 Long b輈h", 5499, 2, 1, 1000, PLANT_TREE_REWARD_ITEM_TIME_LIMIT1, 1,0},
									{"V� Ng蕁 Th駓", 500, 2, 1, 503, PLANT_TREE_REWARD_ITEM_TIME_LIMIT1, 1,0},
									{"S� tay s鑞g", 700, 2, 19, 1, PLANT_TREE_REWARD_ITEM_TIME_LIMIT1, 1,0},
									{"Nh﹏ S﹎ V筺 N╩", 699, 2, 1, 30071, PLANT_TREE_REWARD_ITEM_TIME_LIMIT1, 1,0},
									{"T葃 T駓 linh n", 100, 2, 0, 137, PLANT_TREE_REWARD_ITEM_TIME_LIMIT1, 1,0},
									{"B秓 Rng c Bi謙", 1, 2, 1, 30091, PLANT_TREE_REWARD_ITEM_TIME_LIMIT1, 1,0},
									{"Ng� H祅h M藅 t辌h", 1, 0, 107, 155, 0, 1,0},
	};
	
--白银树奖励物品：物品名，出现概率，主类型，副类型，详细类型，使用期限，发放数量
SILVER_TREE_REWARD_ITEM_PARAM = {
									{"B╪g Th筩h", 6000, 2, 1, 149, 0*24*60*60, 1,0},
									{"Th� Th﹏ Ph�", 200, 2, 0, 556, 15*24*60*60, 1,0},
									{"B竧 Nh� L韓", 190, 2, 0, 398, 15*24*60*60, 1,0},
									{"Th竔 D辌h H鏽 Nguy猲 C玭g у", 10, 2, 0, 1082,  0*24*60*60, 1,0},
									{"Kh玭g tr髇g g�", 3600, 0, 0, 0, 0, 0, 0},
	};

--白银树的经验奖励：经验值，概率
WHITE_SILVER_TREE_EXP_REWARD_PARAM = {
									{500000, 2500},
									{600000, 7000},
									{700000, 500}
};

--黄金树的经验奖励：经验值，概率
YELLOW_GOLDEN_TREE_EXP_REWARD_PARAM = {
									{2000000, 8000},
									{3000000, 1500},
									{4000000, 500}
};

--白金树的经验奖励：经验值，概率
WHITE_GOLDEN_TREE_EXP_REWARD_PARAM = {
									{10000000, 5000},
									{15000000, 2500},
									{20000000, 2500}
};

SEED_AWARD_COUNT = {
									{"B竧 Nh� Ch鴑g Th�", 2, 1, 30114, 15 * 24 * 3600, 1,0},
									{"u H錸", 2, 1, 1157, 15 * 24 * 3600, 1,0},									
									{"Qu﹏ C玭g Chng", 2, 1, 9999, 15 * 24 * 3600, 1,0},
									{"Qu﹏ C玭g Чi", 2, 1, 9998, 15 * 24 * 3600, 1,0},
									{"T祅g Ki誱 Anh H飊g Thi誴", 2, 0, 31, 7 * 24 * 3600, 1,0},
									
	};

	
-----------------------------------------------------------------------
--checkPlaceMainCity()
--检查是否在指定地点种树：六大主城，汴京、成都、泉州、大理、襄阳、扬州
-----------------------------------------------------------------------
function checkPlaceMainCity()	
	local nMapID = GetWorldPos();
	if nMapID == 100 or nMapID == 150 or nMapID == 200 or nMapID == 300 or nMapID == 350 or nMapID == 400  or nMapID == 500 then
		return 1;
	else
		return 0;
	end
end

--function checkEventTime()		--检查活动时间00:00 – 12:00 和　17:00 – 00:00两个时间段
--	local nHour = getLocalTime();
--	if nHour >= 12 and nHour < 17 then
--		return 0;
--	else
--		return 1;
--	end
--end

function checkEventDate()		--检查活动日期2009年04月24日　-- 2009年05月31日24点
                                        --检查活动日期2010年09月17日　-- 2009年10月24日24点 --10年中秋活动之四灵灯会
	local nDate = tonumber(date("%y%m%d%H"));
	if nDate >= 09091800 and nDate < 49102524 then
		return 1;
	end
	return 0;
end

function getLocalTime()
	nHour = date("%H");
	nMin = date("%M");
	return tonumber(nHour), tonumber(nMin)
end

function getCurDate()
	nDay = date("%d")
	return tonumber(nDay)
end

function getCurMonth()
	nMonth = date("%m");
	return tonumber(nMonth);
end

function getCurYear()
	nYear = date("%Y");
	return tonumber(nYear);
end

function getDateTimeString(nSecond)
	local nDay = 0;
	local nHour = 0;
	local nMin = 0;
	local nSec = 0;
	local sTime = "";
	nDay = floor(nSecond / (60 * 60 * 24));
	nHour = floor(mod(nSecond / (60 * 60),  24));
	nMin = floor(mod(nSecond / 60 , 60));
	nSec = mod(nSecond , 60);
	if nDay > 0 then
		sTime = sTime..nDay.."Thi猲";
	end
	if nHour > 0 then
		sTime = sTime .. nHour .. "h ";
	end
	if nMin > 0 then
		sTime = sTime .. nMin .. " ph髏 ";
	end
	if nSec >= 0 then
		sTime = sTime .. nSec .. " Gi﹜ ";
	end
	return sTime;
end

function doNothing()
end

--------------------------------------
--JQ_GetRandItem()
--取得随机物品
--------------------------------------
function PlantTree_GetRandItem(ITEM_PARAM)
	local nPos = 0;
	local nRand = random(1, 10000);
	for i = 1, getn(ITEM_PARAM) do
		if nRand > nPos and nRand <= nPos + ITEM_PARAM[i][2] then
			return i;
		end
		nPos = nPos + ITEM_PARAM[i][2];
	end
	return 1;
end

function PlantTree_GetRandItem_new(ITEM_PARAM, nMax)
	local nPos = 0;
	local nRand = random(1, nMax);
	for i = 1, getn(ITEM_PARAM) do
		if nRand > nPos and nRand <= nPos + ITEM_PARAM[i][2] then
			return i;
		end
		nPos = nPos + ITEM_PARAM[i][2];
	end
	return 1;
end
