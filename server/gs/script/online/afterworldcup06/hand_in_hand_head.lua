--file name:hand_in_hand_head.lua
--author:yanjun(yim)
--create date:2006-7-7
--describe:携手世界杯活动头文件
TRIGGER_ID = 3119	--触发器自定义ID
TIME_TRIGGER_ID = 2	--时间触发器表里的ID

TASK_TEAMINDEX = 1687	--记录选择的队伍的索引
TASK_GOTCARD_TIME = 1688	--记录玩家上次得到卡片的时间
TASK_GOT4TEAM_AWARD = 1689	--记录换取4强队伍卡片奖励次数
TASK_GOTALLTEAM_AWARD = 1690	--记录换取套卡奖励次数
TASK_GOTRING_AWARD = 1691	--记录换取大力神项链的次数
TASK_GOTCARD_COUNT = 1692	--记录获得卡片的数量
TASK_GOTCARD_DATE = 1693	--记录获得卡片的日期
TASK_GOTAWARD_TIME = 1694	--记录玩家上次换取奖励的时间
TASK_GOTCHINA_CARD = 1695	--记录玩家得到中国队之卡的次数
TASK_GOTPET_TIME = 1696	--记录玩家宠物诞生时间
TASK_GOTGROUP_AWARD = 1697	--记录玩家换取小组卡的奖励的次数 

WAIT_TIME = 60*60;	--互动间隔时间,1小时
GET_AWARD_INTERVAL = 60*60;	--换取奖励间隔时间
CARD_COUNT_LIMIT = 6;	--每天获得卡片数量的限制

tTeamName = {
		[1] = "c",	
		[2] = "Costa Rica",
		[3] = "Ba Lan",
		[4] = "Ecuador",
		[5] = "Anh",
		[6] = "Paraguay",
		[7] = "Trinidad v� Tobago",
		[8] = "Th魕 觧",
		[9] = "竎hentina",
		[10] = "B� Bi觧 Ng�",
		[11] = "Nam T�",
		[12] = "H� Lan",
		[13] = "B� Уo Nha",
		[14] = "Iran",
		[15] = "Angola",
		[16] = "M� Hi C�",
		[17] = "�",
		[18] = "Ghana",
		[19] = "M�",
		[20] = "Ti謕 Kh綾",
		[21] = "Brazil",
		[22] = "Croatia",
		[23] = "骳",
		[24] = "Nh藅 B秐",
		[25] = "Ph竝",
		[26] = "Th魕 S�",
		[27] = "H祅 Qu鑓",
		[28] = "Togo",
		[29] = "Ukraina",
		[30] = "T﹜ Ban Nha",
		[31] = "Tunisia",
		[32] = "� R藀 X� 髏",
		}
	
tItemCard = {	--名字，编号1,编号2,编号3,概率
		[1] = {"th� c ",2,0,410,300},
		[2] = {"th� Costa Rica ",2,0,411,600},
		[3] = {"Ba Lan card ",2,0,412,900},
		[4] = {"Ecuador card ",2,0,413,1200},
		[5] = {"th� Anh ",2,0,414,1500},
		[6] = {"th� Paraguay ",2,0,415,1800},
		[7] = {"th� Trinidad v� Tobago ",2,0,416,2100},
		[8] = {"th� Th魕 觧 ",2,0,417,2400},
		[9] = {"th� 竎hentina ",2,0,418,2700},
		[10] = {"th� B� Bi觧 Ng� ",2,0,419,3000},
		[11] = {"th� Nam T� ",2,0,420,3300},
		[12] = {"th� H� Lan ",2,0,421,3600},
		[13] = {"th� B� Уo Nha ",2,0,422,3900},
		[14] = {"th� Iran ",2,0,423,4200},
		[15] = {"th� Angola ",2,0,424,4500},
		[16] = {"th� M� Hi C� ",2,0,425,5400},
		[17] = {"th� � ",2,0,426,4800},
		[18] = {"th� Ghana ",2,0,427,5100},
		[19] = {"th� M� ",2,0,428,5700},
		[20] = {"th� Ti謕 Kh綾 ",2,0,429,6000},
		[21] = {"th� Brazil ",2,0,430,6300},
		[22] = {"th� Croatia ",2,0,431,6600},
		[23] = {"th� 骳 ",2,0,432,6900},
		[24] = {"th� Nh藅 B秐 ",2,0,433,7200},
		[25] = {"th� Ph竝 ",2,0,434,7500},
		[26] = {"th� Th魕 S� ",2,0,435,7800},
		[27] = {"th� H祅 Qu鑓 ",2,0,436,8100},
		[28] = {"th� Togo ",2,0,437,8400},
		[29] = {"th� Ukraina ",2,0,438,8700},
		[30] = {"th� T﹜ Ban Nha ",2,0,439,9000},
		[31] = {"th� Tunisia ",2,0,440,9300},
		[32] = {"th� � R藀 ",2,0,441,9600},
		[33] = {"th� l璾 ni謒 c髉 th� gi韎 VLTK2",2,0,443,9995},
		[34] = {"th� Trung Qu鑓",2,0,442,10000},
		}

tItemOther = {
		present_bag = {"L� bao k� ni謒 c髉 th� gi韎",2,1,499},
		ring = {"Чi L鵦 Th莕 H筺g Li猲",0,102,28},
		monster_card = {"Ti觰 Ni猲 Th� Th莕 Ph�",2,1,498},
		transformer_card = {"B竎h Bi課 Ti觰 Th莕 Th玭g",2,1,497},
		intro_book = {"Hng d蒼 ho箃 ng c髉 th� gi韎",2,0,409},
		}

function Is_HandInHand_Open()
	local nDate = tonumber(date("%y%m%d"));
	if nDate >= 060714 and nDate <= 460723 then
		return 1;	--活动期间
	elseif nDate >= 060714 and nDate <= 460806 then
		return 2;	--活动结束，但还可以领奖
	else
		return 0;
	end;
end;

function nothing()

end;
