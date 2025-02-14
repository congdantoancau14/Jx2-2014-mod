Include("\\script\\lib\\writelog.lua")

--=============================================
--create by baiyun 2009.4.9
--describe:越南版4月份种树活动
--=============================================

PLANT_TREE_LIMIT = 24;					--每天种树的最大数量
PLANT_TREE_INTERVAL = 2 * 60;		--两次连续种树的间隔
PLANT_TREE_ROLE_LEVEL_LIMIT = 10;					--可以种树的角色等级限制
PLANT_TREE_REWARD_ITEM_TIME_LIMIT = 7 * 24 * 60 * 60; --奖励物品的使用期限

--使用的任务变量
TASK_TREE_INDEX       = 2132;				--记录玩家种的树的NPC索引
TASK_TREE_GROW        = 2133;				--记录树的生成程度
TASK_WATER_TREE_TIME  = 2134;				--记录给树浇水的时间点，刚种下还未浇水时即为种下的时间
TASK_PLANT_TREE_COUNT = 2135;		    --记录玩家当天种树的次数
TASK_PLANT_TREE_DATE  = 2136;				--记录玩家种下树的日期
TASK_PLANT_TREE_TIME  = 2137;				--记录玩家上次种树的时间,(每次种下树后都要更新此值,用来限制两次连继种树)
TASK_PLANT_TREE_TYPE  = 2138;				--种下树的类型 1 - 5


TREE_TYPE = {									--模板名，NPC名字，出现概率
				{"M莔 hoa h錸g", "C﹜ H衞 骯",  9},
				{"M莔 Hoa h錸g", "C﹜ B蕋 T�", 16},
				{" nh竛h hoa h錸g", "C﹜ B筩h Ng﹏", 70},
				{"c﹜  M藅 Hoa Qu� nh�", "C﹜ Ho祅g Kim", 4},
				{"c﹜  M藅 Hoa Qu� l韓", "C﹜ B筩h Kim", 1},
			}
			
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
					[400] = "Чi L�"
				}

--黄金树奖励物品：物品名，出现概率，主类型，副类型，详细类型，使用期限，发放数量
GOLDEN_TREE_REWARD_ITEM_PARAM = {
									{"Ti猽 Ki誴 t竛", 50, 2, 0, 141, PLANT_TREE_REWARD_ITEM_TIME_LIMIT, 1},
									{"Th莕 h祅h b� ph�", 10, 0, 200, 39, PLANT_TREE_REWARD_ITEM_TIME_LIMIT, 1},
									{"Tu Ch﹏ Y誹 Quy誸", 40, 2, 0, 554, PLANT_TREE_REWARD_ITEM_TIME_LIMIT, 1}
	};

--白金树奖励物品：物品名，出现概率，主类型，副类型，详细类型，使用期限，发放数量
WHITE_TREE_REWARD_ITEM_PARAM = {
									{"B� C秐h", 5, 0, 105, 13, PLANT_TREE_REWARD_ITEM_TIME_LIMIT, 1},
									{"H鑤 L玦 B竎", 5, 0, 105, 12, PLANT_TREE_REWARD_ITEM_TIME_LIMIT, 1},
									{"X輈h Th�", 5, 0, 105, 9, PLANT_TREE_REWARD_ITEM_TIME_LIMIT, 1},
									{"Tr秓 Ho祅g Phi 謓", 5, 0, 105, 11, PLANT_TREE_REWARD_ITEM_TIME_LIMIT, 1},
									{"Phi猽 V�", 5, 0, 105, 15, PLANT_TREE_REWARD_ITEM_TIME_LIMIT, 1},
									{"B祅 Long b輈h", 10, 2, 1, 1000, PLANT_TREE_REWARD_ITEM_TIME_LIMIT, 1},
									{"V� Ng蕁 Th駓", 5, 2, 1, 503, PLANT_TREE_REWARD_ITEM_TIME_LIMIT, 1},
									{"S� tay s鑞g", 5, 2, 19, 1, PLANT_TREE_REWARD_ITEM_TIME_LIMIT, 1},
									{"B錸g Lai Ti猲 Кn", 50, 2, 1, 1013, PLANT_TREE_REWARD_ITEM_TIME_LIMIT, 1},
									{"T葃 T駓 linh n", 5, 2, 0, 137, PLANT_TREE_REWARD_ITEM_TIME_LIMIT, 1}
	};
--白银树的经验奖励：经验值，概率
WHITE_SILVER_TREE_EXP_REWARD_PARAM = {
									{200000, 50},
									{250000, 25},
									{300000, 25}
};

--黄金树的经验奖励：经验值，概率
YELLOW_GOLDEN_TREE_EXP_REWARD_PARAM = {
									{1000000, 80},
									{1500000, 15},
									{2000000, 5}
};

--白金树的经验奖励：经验值，概率
WHITE_GOLDEN_TREE_EXP_REWARD_PARAM = {
									{5000000, 50},
									{7500000, 25},
									{10000000, 25}
};
	
-----------------------------------------------------------------------
--checkPlaceMainCity()
--检查是否在指定地点种树：六大主城，汴京、成都、泉州、大理、襄阳、扬州
-----------------------------------------------------------------------
function checkPlaceMainCity()	
	local nMapID = GetWorldPos();
	if nMapID == 100 or nMapID == 150 or nMapID == 200 or nMapID == 300 or nMapID == 350 or nMapID == 400 then
		return 1;
	else
		return 0;
	end
end

function checkEventTime()		--检查活动时间00:00 – 12:00 和　17:00 – 00:00两个时间段
	local nHour = getLocalTime();
	if nHour >= 12 and nHour < 17 then
		return 0;
	else
		return 1;
	end
end

function checkEventDate()		--检查活动日期2009年04月24日　-- 2009年05月24日24点
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
	local nRand = random(1, 100);
	for i = 1, getn(ITEM_PARAM) do
		if nRand > nPos and nRand <= nPos + ITEM_PARAM[i][2] then
			return i;
		end
		nPos = nPos + ITEM_PARAM[i][2];
	end
	return 1;
end