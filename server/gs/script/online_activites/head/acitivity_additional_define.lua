--这里是副活动数据定义

VET_ACITIVUTY_ADDITIONAL_TABLE = {
	[93] = {
		--副活动ID和索引一致
		nActivityID = 93,
		nActivityName = "Qu鑓 T� Thi誹 Nhi",
		--使用的任务变量组
		tTaskGroup = {3, 16},
		--以下table大小需对应--------------------
		--数字与tCost一一对应
		tSayDialog = {
			"Ta m鑞 t苙g Qu� 1/6 cho c竎 em nh� (ti猽 hao 66 Qu� 1/6 + 66 V祅g)",
			"Ta mu鑞 t苙g K裲 B玭g cho c竎 em nh� (ti猽 hao 66 K裲 B玭g + 66 V祅g)",
			"Ta mu鑞 t苙g ph莕 thng cao qu� cho c竎 em nh� (ti猽 hao 160 Qu� 1/6 + 160 K裲 B玭g + 160 V祅g)",
		},
		--消耗道具和金币数量J
		tCostTable = {
			{{2, 1, 30547, 66 ,"Qu� 1/6"}, {66}},
			{{2, 1, 30548, 66 ,"K裲 B玭g"}, {66}},
			{{2, 1, 30547, 160 ,"Qu� 1/6"}, {2, 1, 30548, 160 ,"K裲 B玭g"}, {160}},
		},
		--每一项最大使用次数/每天
		tMaxUseCount = {3, 3, 3},
		--每一项的日志
		tMsg2Player = {
			"T苙g Qu� 1/6 %d/%d",
			"T苙g K裲 B玭g %d/%d",
			"T苙g ph莕 thng cao qu� %d/%d",
		},
		-----------------------------------------
		--普通经验奖励
		tNormalAward = {
			46000000,
			46000000,
			222222222,
		},
		tZhenQiAward = {
			46, 46, 222,
		},
		tXuAward = {
			0, 0, 22,
		},
		--最终奖励未打通和打通经脉的奖励值(填写这表示区别对待最后一次)
		tFinalAward = {},
		tZhenQiFinalAward = {},
		tXuFinalAward = {},
		-----------------------------------------
		--主活动条件5,6
		tTaskCondition = {},
		--每次都随机一次道具表(1)还是只有最后一次随机道具表(0)
		tConditionItemAward = {1, 1, 1, 1},
		--主活动未上限物品奖励
		tItemFinalAward = {
			[1] = {
							{1, 2000, "Nh﹏ S﹎ V筺 N╩", {2, 1, 30071, 6}, 0},
							{1, 1212, "C� Linh Ng鋍", {2, 1, 30369, 6}, 0},
							{1, 1212, "C� Linh Th筩h", {2, 1, 30368, 6}, 0},
							{1, 1212, "M秐h Thi猲 Cang", {2, 1, 30390, 6}, 0},
							{1, 1212, "M秐h Thi猲 M玭", {2, 1, 30410, 6}, 0},
							{3, 3060, 1660000, 1},
							{3, 92, 16160000, 1},
						},
			[2] = {
							{1, 2000, "Nh﹏ S﹎ V筺 N╩", {2, 1, 30071, 6}, 0},
							{1, 1212, "C� Linh Ng鋍", {2, 1, 30369, 6}, 0},
							{1, 1212, "C� Linh Th筩h", {2, 1, 30368, 6}, 0},
							{1, 1212, "M秐h Thi猲 Cang", {2, 1, 30390, 6}, 0},
							{1, 1212, "M秐h Thi猲 M玭", {2, 1, 30410, 6}, 0},
							{3, 3060, 1660000, 1},
							{3, 92, 16160000, 1},
						},
			[3] = {
							{31, 39995, "give_30_fruits()", 0},
							{1, 20000, "Nh﹏ S﹎ V筺 N╩", {2, 1, 30071, 10}, 0},
							{1, 10000, "C� Linh Ng鋍", {2, 1, 30369, 10}, 0},
							{1, 10000, "C� Linh Th筩h", {2, 1, 30368, 10}, 0},
							{1, 10000, "M秐h Thi猲 Cang", {2, 1, 30390, 10}, 0},
							{1, 10000, "M秐h Thi猲 M玭", {2, 1, 30410, 10}, 0},
							{3, 5, 66660000, 1},
						},
		},
		--主活动已上限物品奖励
		tItemFinalAwardOverLimit = {},
		------------------------------------------
		--自定义奖励
		bUdIsExist = 1,
		tUdAward = {
			nTaskSeq = 3 + 2,  --使用第几个任务变量(第一个是跨天标记)
			nTimesLimit = 9, --要求兑换过多少次
			szTitle = format("Nh薾 ph莕 thng VIP (ho祅 th祅h %d tr� l猲 i t蕋 c�)", 9),  --对话文字
			uFunc = "Ud_GiveVipAward_201306",  --自定义执行函数
			nMaxCount = 1, --最大领取次数
			nFreeRoom = 22, --需要的背包空间个数
		},
	},
	[95] = {
		--副活动ID和索引一致
		nActivityID = 95,
		nActivityName = "Qu鑓 T� Thi誹 Nhi",
		--使用的任务变量组
		tTaskGroup = {5, 6},
		--以下table大小需对应--------------------
		--数字与tCost一一对应
		tSayDialog = {
			"Ta mu鑞 i 'Sinh T� Th藀 C萴' nh薾 thng ( ti猽 hao 6 Sinh T� Th藀 C萴 + 6 V祅g)",
			"Ta mu鑞 i 'Tr竔 C﹜ D莔' nh薾 thng ( ti猽 hao 6 Tr竔 C﹜ D莔 + 6 V祅g)",
			"Ta mu鑞 i ph莕 thng cao qu�  nh薾 thng (ti猽 hao 16  'Sinh T� Th藀 C萴' + 16 'Tr竔 C﹜ D莔' + 16 V祅g)  ",
		},
		--消耗道具和金币数量J
		tCostTable = {
			{{2, 1, 30552, 6 ,"Sinh T� Th藀 C萴"}, {6}},
			{{2, 1, 30553, 6 ,"Tr竔 C﹜ D莔"}, {6}},
			{{2, 1, 30552, 16 ,"Sinh T� Th藀 C萴"}, {2, 1, 30553, 16 ,"Tr竔 C﹜ D莔"}, {16}},
		},
		--每一项最大使用次数/每天
		tMaxUseCount = {3, 3, 3},
		--每一项的日志
		tMsg2Player = {
			"фi Sinh T� Th藀 C萴 %d%d",
			"фi Tr竔 C﹜ D莔 %d%d",
			"фi ph莕 thng cao qu� %d%d",
		},
		-----------------------------------------
		--普通经验奖励
		tNormalAward = {
			4000000,
			4000000,
			12000000,
		},
		tZhenQiAward = {
			40, 40, 120,
		},
		tXuAward = {
			0, 0, 0,
		},
		--最终奖励未打通和打通经脉的奖励值(填写这表示区别对待最后一次)
		tFinalAward = {},
		tZhenQiFinalAward = {},
		tXuFinalAward = {},
		-----------------------------------------
		--主活动条件5,6
		tTaskCondition = {},
		--每次都随机一次道具表(1)还是只有最后一次随机道具表(0)
		tConditionItemAward = {1, 1, 1, 1},
		--主活动未上限物品奖励
		tItemFinalAward = {
			[1] = {
							{1, 2000, "Nh﹏ S﹎ V筺 N╩", {2, 1, 30071, 1}, 0},
							{1, 1212, "Tu Ch﹏ Y誹 Quy誸", {2, 0, 554, 1}, 0},
							{1, 1212, "Чi Nh﹏ s﹎", {2, 0, 553, 1}, 0},
							{1, 1212, "Th莕 N玭g Кn", {2, 1, 343, 1}, 0},
							{1, 1212, "Ti猽 Ki誴 t竛", {2, 0, 141, 1}, 0},
							{3, 3060, 160000, 1},
							{3, 92, 1600000, 1},
						},
			[2] = {
							{1, 2000, "Nh﹏ S﹎ V筺 N╩", {2, 1, 30071, 1}, 0},
							{1, 1212, "Tu Ch﹏ Y誹 Quy誸", {2, 0, 554, 1}, 0},
							{1, 1212, "Чi Nh﹏ s﹎", {2, 0, 553, 1}, 0},
							{1, 1212, "Th莕 N玭g Кn", {2, 1, 343, 1}, 0},
							{1, 1212, "Ti猽 Ki誴 t竛", {2, 0, 141, 1}, 0},
							{3, 3060, 160000, 1},
							{3, 92, 1600000, 1},
						},
			[3] = {
							{31, 39995, format("ahf_GetNFruits(%d)", 3), 0},
							{1, 20000, "Nh﹏ S﹎ V筺 N╩", {2, 1, 30071, 10}, 0},
							{1, 10000, "Tu Ch﹏ Y誹 Quy誸", {2, 0, 554, 2}, 0},
							{1, 10000, "Чi Nh﹏ s﹎", {2, 0, 553, 2}, 0},
							{1, 10000, "Th莕 N玭g Кn", {2, 1, 343, 2}, 0},
							{1, 10000, "Ti猽 Ki誴 t竛", {2, 0, 141, 2}, 0},
							{3, 5, 6660000, 1},
						},
		},
		--主活动已上限物品奖励
		tItemFinalAwardOverLimit = {},
		------------------------------------------
		--自定义奖励
		bUdIsExist = 1,
		tUdAward = {
			nTaskSeq = 1 + 3 + 1,  --使用第几个任务变量(第一个是跨天标记)
			nTimesLimit = 9, --要求兑换过多少次
			szTitle = format("Nh薾 ph莕 thng VIP (ho祅 th祅h %d tr� l猲 i t蕋 c�)", 9),  --对话文字
			uFunc = "Ud_GiveVipAward_201307",  --自定义执行函数
			nMaxCount = 1, --最大领取次数
			nFreeRoom = 22, --需要的背包空间个数
		},
	},
	[97] = {
		--副活动ID和索引一致
		nActivityID = 97,
		nActivityName = "Ho箃 ng ph� th竛g 8",
		--使用的任务变量组
		tTaskGroup = {7, 6},
		--以下table大小需对应--------------------
		--数字与tCost一一对应
		tSayDialog = {
			"Ta mu鑞 i B� D鬾g C� H鋍 T藀  nh薾 ph莕 thng (ti猽 hao 5 B� D鬾g C� H鋍 T藀 + 9 v祅g)",
			"Ta mu鑞 i C苝 S竎h  nh薾 ph萵 thng (ti猽 hao 5 C苝 S竎h + 9 v祅g)",
			"Ta mu鑞 i ph莕 thng cao qu�  nh薾 ph莕 thng (ti猽 hao 9 D鬾g C� H鋍 T藀 + 9 C苝 S竎h + 9 v祅g)",
		},
		--消耗道具和金币数量J
		tCostTable = {
			{{2, 1, 30565, 5 ,"B� D鬾g C� H鋍 T藀"}, {9}},
			{{2, 1, 30566, 5 ,"C苝 S竎h"}, {9}},
			{{2, 1, 30565, 9 ,"B� D鬾g C� H鋍 T藀"}, {2, 1, 30566, 9 ,"C苝 S竎h"}, {9}},
		},
		--每一项最大使用次数/每天
		tMaxUseCount = {6, 6, 6},
		--每一项的日志
		tMsg2Player = {
			"фi B� D鬾g C� H鋍 T藀 %d/%d",
			"фi C苝 S竎h %d/%d",
			"фi ph莕 thng cao qu� %d%d",
		},
		-----------------------------------------
		--普通经验奖励
		tNormalAward = {
			5000000,
			5000000,
			10000000,
		},
		tZhenQiAward = {
			50, 50, 100,
		},
		tXuAward = {
			0, 0, 2,
		},
		--最终奖励未打通和打通经脉的奖励值(填写这表示区别对待最后一次)
		tFinalAward = {},
		tZhenQiFinalAward = {},
		tXuFinalAward = {},
		-----------------------------------------
		--主活动条件5,6
		tTaskCondition = {},
		--每次都随机一次道具表(1)还是只有最后一次随机道具表(0)
		tConditionItemAward = {1, 1, 1, 1},
		--主活动未上限物品奖励
		tItemFinalAward = {
			[1] = {
							{1, 10, "Nh﹏ S﹎ V筺 N╩", {2, 1, 30071, 1}, 0},
							{1, 5, "Tu Ch﹏ Y誹 Quy誸", {2, 0, 554, 1}, 7 * 24 * 3600},
							{1, 5, "Чi Nh﹏ s﹎", {2, 0, 553, 1}, 7 * 24 * 3600},
							{1, 5, "Th莕 N玭g Кn", {2, 1, 343, 1}, 7 * 24 * 3600},
							{1, 5, "Ti猽 Ki誴 t竛", {2, 0, 141, 1}, 7 * 24 * 3600},
							{31, 25, "AwardGenuineQi(50)", 1},
							{2, 32, 250000, 1},
							{32, 1, 50, 1},
							{5, 6, 5, 1},
							{4, 6, 5, 1},
						},
			[2] = {
							{1, 10, "Nh﹏ S﹎ V筺 N╩", {2, 1, 30071, 1}, 0},
							{1, 5, "Tu Ch﹏ Y誹 Quy誸", {2, 0, 554, 1}, 7 * 24 * 3600},
							{1, 5, "Чi Nh﹏ s﹎", {2, 0, 553, 1}, 7 * 24 * 3600},
							{1, 5, "Th莕 N玭g Кn", {2, 1, 343, 1}, 7 * 24 * 3600},
							{1, 5, "Ti猽 Ki誴 t竛", {2, 0, 141, 1}, 7 * 24 * 3600},
							{31, 25, "AwardGenuineQi(50)", 1},
							{2, 32, 250000, 1},
							{32, 1, 50, 1},
							{5, 6, 5, 1},
							{4, 6, 5, 1},
						},
			[3] = {
							{1, 20, "Nh﹏ S﹎ V筺 N╩", {2, 1, 30071, 2}, 0},
							{1, 5, "Tu Ch﹏ Y誹 Quy誸", {2, 0, 554, 2}, 7 * 24 * 3600},
							{1, 5, "Чi Nh﹏ s﹎", {2, 0, 553, 2}, 7 * 24 * 3600},
							{1, 5, "Th莕 N玭g Кn", {2, 1, 343, 2}, 7 * 24 * 3600},
							{1, 5, "Ti猽 Ki誴 t竛", {2, 0, 141, 2}, 7 * 24 * 3600},
							{31, 20, "AwardGenuineQi(100)", 1},
							{2, 27, 500000, 1},
							{32, 1, 50, 1},
							{5, 6, 5, 1},
							{4, 6, 5, 1},
						},
		},
		--主活动已上限物品奖励
		tItemFinalAwardOverLimit = {},
		------------------------------------------
		--自定义奖励
		bUdIsExist = 1,
		tUdAward = {
			nTaskSeq = 1 + 3 + 1,  --使用第几个任务变量(第一个是跨天标记)
			nTimesLimit = 18, --要求兑换过多少次
			szTitle = format("Nh薾 ph莕 thng VIP (ho祅 th祅h %d tr� l猲 i t蕋 c�)", 18),  --对话文字
			uFunc = "Ud_GiveVipAward_201308",  --自定义执行函数
			nMaxCount = 1, --每天最大领取次数
			nFreeRoom = 3, --需要的背包空间个数
		},
	},
	[99] = {
		--副活动ID和索引一致
		nActivityID = 99,
		nActivityName = "Ho箃 ng ph� th竛g 8",
		--使用的任务变量组
		tTaskGroup = {9, 6},
		--以下table大小需对应--------------------
		--数字与tCost一一对应
		tSayDialog = {
			"Ta mu鑞 t苙g [B竛h Trung Thu Cam]  nh薾 ph莕 thng ( ti猽 hao 09 [B竛h Trung Thu Cam] + 09 v祅g)",
			"Ta mu鑞 t苙g [B竛h Trung Thu D﹗]  nh薾 ph莕 thng ( ti猽 hao 09 [B竛h Trung Thu D﹗] + 09 v祅g) ",
			"Ta mu鑞 t苙g [B竛h Trung Thu Socola]  nh薾 ph莕 thng ( ti猽 hao 06 [B竛h Trung Thu Socola] + 09 v祅g) ",
			"Ta mu鑞 t苙g ph莕 thng cao qu�  nh薾 ph莕 thng ( ti猽 hao 09 [B竛h Trung Thu Cam] + 09 [B竛h Trung Thu D﹗] + 06 [B竛h Trung Thu Socola] + 29 v祅g)"
		},
		--消耗道具和金币数量J
		tCostTable = {
			{{2, 1, 30569, 9 ,"B竛h Trung Cam"}, {9}},
			{{2, 1, 30570, 9 ,"B竛h Trung Thu � Mai"}, {9}},
			{{2, 1, 30571, 6 ,"B竛h Trung Thu Socola"}, {9}},
			{{2, 1, 30569, 9 ,"B竛h Trung Cam"}, {2, 1, 30570, 9 ,"B竛h Trung Thu � Mai"}, {2, 1, 30571, 6 ,"B竛h Trung Thu Socola"}, {29}},
		},
		--每一项最大使用次数/每天
		tMaxUseCount = {6, 6, 6, 6},
		--每一项的日志
		tMsg2Player = {
			"T苙g [B竛h Trung Thu Cam] %d/%d",
			"T苙g [B竛h Trung Thu D﹗] %d/%d",
			"T苙g [B竛h Trung Thu Socola] %d/%d",
			"T苙g ph莕 thng cao qu� %d/%d",
		},
		-----------------------------------------
		--普通经验奖励
		tNormalAward = {
			6900000,
			6900000,
			6900000,
			19000000,
		},
		tZhenQiAward = {
			50, 50, 50, 100,
		},
		tXuAward = {
			0, 0, 0, 2,
		},
		--最终奖励未打通和打通经脉的奖励值(填写这表示区别对待最后一次)
		tFinalAward = {},
		tZhenQiFinalAward = {},
		tXuFinalAward = {},
		-----------------------------------------
		--主活动条件5,6
		tTaskCondition = {},
		--每次都随机一次道具表(1)还是只有最后一次随机道具表(0)
		tConditionItemAward = {1, 1, 1, 1},
		--主活动未上限物品奖励
		tItemFinalAward = {
			[1] = {
							{1, 10, "Nh﹏ S﹎ V筺 N╩", {2, 1, 30071, 1}, 0},
							{1, 5, "Tu Ch﹏ Y誹 Quy誸", {2, 0, 554, 1}, 7 * 24 * 3600},
							{1, 5, "Чi Nh﹏ s﹎", {2, 0, 553, 1}, 7 * 24 * 3600},
							{1, 5, "Th莕 N玭g Кn", {2, 1, 343, 1}, 7 * 24 * 3600},
							{1, 5, "Ti猽 Ki誴 t竛", {2, 0, 141, 1}, 7 * 24 * 3600},
							{31, 25, "AwardGenuineQi(50)", 1},
							{2, 32, 250000, 1},
							{32, 1, 50, 1},
							{5, 6, 5, 1},
							{4, 6, 5, 1},
						},
			[2] = {
							{1, 10, "Nh﹏ S﹎ V筺 N╩", {2, 1, 30071, 1}, 0},
							{1, 5, "Tu Ch﹏ Y誹 Quy誸", {2, 0, 554, 1}, 7 * 24 * 3600},
							{1, 5, "Чi Nh﹏ s﹎", {2, 0, 553, 1}, 7 * 24 * 3600},
							{1, 5, "Th莕 N玭g Кn", {2, 1, 343, 1}, 7 * 24 * 3600},
							{1, 5, "Ti猽 Ki誴 t竛", {2, 0, 141, 1}, 7 * 24 * 3600},
							{31, 25, "AwardGenuineQi(50)", 1},
							{2, 32, 250000, 1},
							{32, 1, 50, 1},
							{5, 6, 5, 1},
							{4, 6, 5, 1},
						},
			[3] = {
							{1, 10, "Nh﹏ S﹎ V筺 N╩", {2, 1, 30071, 1}, 0},
							{1, 5, "Tu Ch﹏ Y誹 Quy誸", {2, 0, 554, 1}, 7 * 24 * 3600},
							{1, 5, "Чi Nh﹏ s﹎", {2, 0, 553, 1}, 7 * 24 * 3600},
							{1, 5, "Th莕 N玭g Кn", {2, 1, 343, 1}, 7 * 24 * 3600},
							{1, 5, "Ti猽 Ki誴 t竛", {2, 0, 141, 1}, 7 * 24 * 3600},
							{31, 25, "AwardGenuineQi(50)", 1},
							{2, 32, 250000, 1},
							{32, 1, 50, 1},
							{5, 6, 5, 1},
							{4, 6, 5, 1},
						},
			[4] = {
							{1, 20, "Nh﹏ S﹎ V筺 N╩", {2, 1, 30071, 3}, 0},
							{1, 5, "Tu Ch﹏ Y誹 Quy誸", {2, 0, 554, 2}, 7 * 24 * 3600},
							{1, 5, "Чi Nh﹏ s﹎", {2, 0, 553, 2}, 7 * 24 * 3600},
							{1, 5, "Th莕 N玭g Кn", {2, 1, 343, 2}, 7 * 24 * 3600},
							{1, 5, "Ti猽 Ki誴 t竛", {2, 0, 141, 2}, 7 * 24 * 3600},
							{31, 20, "AwardGenuineQi(100)", 1},
							{2, 27, 500000, 1},
							{32, 1, 100, 1},
							{5, 6, 10, 1},
							{4, 6, 10, 1},
						},
		},
		--主活动已上限物品奖励
		tItemFinalAwardOverLimit = {},
		------------------------------------------
		--自定义奖励
		bUdIsExist = 1,
		tUdAward = {
			nTaskSeq = 1 + 4 + 1,  --使用第几个任务变量(第一个是跨天标记)
			nTimesLimit = 24, --要求兑换过多少次
			szTitle = format("Nh薾 ph莕 thng VIP (ho祅 th祅h %d tr� l猲 i t蕋 c�)", 24),  --对话文字
			uFunc = "Ud_GiveVipAward_201309",  --自定义执行函数
			nMaxCount = 1, --每天最大领取次数
			nFreeRoom = 5, --需要的背包空间个数
		},
	},
	[102] = {
		--副活动ID和索引一致
		nActivityID = 102,
		nActivityName = "Evnet ph� th竛g 10",
		--使用的任务变量组
		tTaskGroup = {3, 10},
		--以下table大小需对应--------------------
		--数字与tCost一一对应
		tSayDialog = {
			"Ta mu鑞 t苙g [Tranh G鉯]  nh薾 ph莕 thng ( ti猽 hao 09 [ Tranh G鉯 ] +09 v祅g)",
			"Ta mu鑞 t苙g [Tranh уng H錧  nh薾 ph莕 thng ( ti猽 hao 09 [ Tranh уng H� ] +09 v祅g)",
			"Ta mu鑞 t苙g [Tranh Th� Ph竝]  nh薾 ph莕 thng ( ti猽 hao 09 [ Tranh Th� Ph竝] +09 v祅g)",
			"Ta mu鑞 t苙g ph莕 thng cao qu� ( ti猽 hao 19 [ Tranh G鉯] + 19 [Tranh уng H� ] +19 [ Tranh Th� Ph竝] +39 v祅g)"
		},
		--消耗道具和金币数量J
		tCostTable = {
			{{2, 1, 30580, 9 ,"Tranh G鑙"}, {9}},
			{{2, 1, 30581, 9 ,"Tranh уng H�"}, {9}},
			{{2, 1, 30582, 9 ,"Tranh Th� Ph竝"}, {9}},
			{{2, 1, 30580, 19 ,"Tranh G鑙"}, {2, 1, 30581, 19 ,"Tranh уng H�"}, {2, 1, 30582, 19 ,"Tranh Th� Ph竝"}, {39}},
		},
		--每一项最大使用次数/每天
		tMaxUseCount = {6, 6, 6, 6},
		--每一项的日志
		tMsg2Player = {
			"T苙g [Tranh G鉯] %d/%d",
			"T苙g [Tranh уng H錧 %d/%d",
			"T苙g [Tranh Th� Ph竝] %d/%d",
			"T苙g ph莕 thng cao qu� %d/%d",
		},
		-----------------------------------------
		--普通经验奖励
		tNormalAward = {
			6900000,
			6900000,
			6900000,
			39000000,
		},
		tZhenQiAward = {
			50, 50, 50, 100,
		},
		tXuAward = {
			0, 0, 0, 2,
		},
		--最终奖励未打通和打通经脉的奖励值(填写这表示区别对待最后一次)
		tFinalAward = {},
		tZhenQiFinalAward = {},
		tXuFinalAward = {},
		-----------------------------------------
		--主活动条件5,6
		tTaskCondition = {},
		--每次都随机一次道具表(1)还是只有最后一次随机道具表(0)
		tConditionItemAward = {1, 1, 1, 1},
		--主活动未上限物品奖励
		tItemFinalAward = {
			[1] = {
							{1, 10, "Nh﹏ S﹎ V筺 N╩", {2, 1, 30071, 1}, 0},
							{1, 5, "Tu Ch﹏ Y誹 Quy誸", {2, 0, 554, 1}, 7 * 24 * 3600},
							{1, 5, "Чi Nh﹏ s﹎", {2, 0, 553, 1}, 7 * 24 * 3600},
							{1, 5, "Th莕 N玭g Кn", {2, 1, 343, 1}, 7 * 24 * 3600},
							{1, 5, "Ti猽 Ki誴 t竛", {2, 0, 141, 1}, 7 * 24 * 3600},
							{31, 3, "ahf_GetPetBook(1)", ""},
							{31, 3, "ahf_GetPetBook(2)", ""},
							{31, 25, "AwardGenuineQi(50)", 1},
							{2, 25, 250000, 1},
							{32, 2, 50, 1},
							{5, 6, 5, 1},
							{4, 6, 5, 1},
						},
			[2] = {
							{1, 10, "Nh﹏ S﹎ V筺 N╩", {2, 1, 30071, 1}, 0},
							{1, 5, "Tu Ch﹏ Y誹 Quy誸", {2, 0, 554, 1}, 7 * 24 * 3600},
							{1, 5, "Чi Nh﹏ s﹎", {2, 0, 553, 1}, 7 * 24 * 3600},
							{1, 5, "Th莕 N玭g Кn", {2, 1, 343, 1}, 7 * 24 * 3600},
							{1, 5, "Ti猽 Ki誴 t竛", {2, 0, 141, 1}, 7 * 24 * 3600},
							{31, 3, "ahf_GetPetBook(1)", ""},
							{31, 3, "ahf_GetPetBook(2)", ""},
							{31, 25, "AwardGenuineQi(50)", 1},
							{2, 25, 250000, 1},
							{32, 2, 50, 1},
							{5, 6, 5, 1},
							{4, 6, 5, 1},
						},
			[3] = {
							{1, 10, "Nh﹏ S﹎ V筺 N╩", {2, 1, 30071, 1}, 0},
							{1, 5, "Tu Ch﹏ Y誹 Quy誸", {2, 0, 554, 1}, 7 * 24 * 3600},
							{1, 5, "Чi Nh﹏ s﹎", {2, 0, 553, 1}, 7 * 24 * 3600},
							{1, 5, "Th莕 N玭g Кn", {2, 1, 343, 1}, 7 * 24 * 3600},
							{1, 5, "Ti猽 Ki誴 t竛", {2, 0, 141, 1}, 7 * 24 * 3600},
							{31, 3, "ahf_GetPetBook(1)", ""},
							{31, 3, "ahf_GetPetBook(2)", ""},
							{31, 25, "AwardGenuineQi(50)", 1},
							{2, 25, 250000, 1},
							{32, 2, 50, 1},
							{5, 6, 5, 1},
							{4, 6, 5, 1},
						},
			[4] = {
							{1, 20, "Nh﹏ S﹎ V筺 N╩", {2, 1, 30071, 3}, 0},
							{1, 5, "Tu Ch﹏ Y誹 Quy誸", {2, 0, 554, 3}, 7 * 24 * 3600},
							{1, 5, "Чi Nh﹏ s﹎", {2, 0, 553, 2}, 7 * 24 * 3600},
							{1, 5, "Th莕 N玭g Кn", {2, 1, 343, 2}, 7 * 24 * 3600},
							{1, 5, "Ti猽 Ki誴 t竛", {2, 0, 141, 2}, 7 * 24 * 3600},
							{31, 3, "ahf_GetPetBook(3)", ""},
							{31, 3, "ahf_GetPetBook(4)", ""},
							{31, 20, "AwardGenuineQi(150)", 1},
							{2, 20, 1000000, 1},
							{32, 2, 150, 1},
							{5, 6, 10, 1},
							{4, 6, 10, 1},
						},
		},
		--主活动已上限物品奖励
		tItemFinalAwardOverLimit = {},
		------------------------------------------
		--自定义奖励
		bUdIsExist = 1,
		tUdAward = {
			nTaskSeq = 1 + 4 + 1,  --使用第几个任务变量(第一个是跨天标记)
			nTimesLimit = 24, --要求兑换过多少次
			szTitle = format("Nh薾 ph莕 thng VIP (ho祅 th祅h %d tr� l猲 i t蕋 c�)", 24),  --对话文字
			uFunc = "Ud_GiveVipAward_201310",  --自定义执行函数
			nMaxCount = 1, --每天最大领取次数
			nFreeRoom = 7, --需要的背包空间个数
		},
		tPointAward = {
			szTitle = "T輈h l騳 nh薾 thng phong ph�",
			uFunc = {
				"Ta mu鑞 xem 甶觤 t輈h l騳 c馻 b秐 th﹏/#Ud_Check_Point(%d)",
				"Ta mu鑞 s� d鬾g 甶觤 t輈h l騳  i thng/#Ud_Use_Exchange_Point(%d)",
			},
		},
	},
	[104] = {
		--副活动ID和索引一致
		nActivityID = 104,
		nActivityName = "Event ph� th竛g 11",
		--使用的任务变量组
		tTaskGroup = {5, 7},
		--以下table大小需对应--------------------
		--数字与tCost一一对应
		tSayDialog = {
			"Ta mu鑞 t苙g Qu� 20/11  nh薾 thng (ti猽 hao 09 Qu� 20/11 + 09 V祅g)",
			"Ta mu鑞 t苙g Hoa 觤 10  nh薾 thng (ti猽 hao 09 Hoa 觤 10 + 09 V祅g)",
			"Ta mu鑞 t苙g B籲g Khen  nh薾 thng (ti猽 hao 09 B籲g Khen + 09 V祅g )",
		},
		--消耗道具和金币数量J
		tCostTable = {
			{{2, 1, 30606, 9, "Qu� 20/11"}, {9}},
			{{2, 1, 30607, 9, "Hoa 觤 10"}, {9}},
			{{2, 1, 30608, 9, "B籲g Khen"}, {9}},
		},
		--每一项最大使用次数/每天
		tMaxUseCount = {4, 4, 4},
		--每一项的日志
		tMsg2Player = {
			"T苙g ?Q颽 20/11? %d%d",
			"T苙g ?Hoa 觤 10? %d%d",
			"T苙g ?B籲g Khen? %d%d",
		},
		-----------------------------------------
		--普通经验奖励
		tNormalAward = {
			7800000,
			7800000,
			7800000,
		},
		tZhenQiAward = {
			50, 50, 50,
		},
		tXuAward = {
			0, 0, 0,
		},
		--最终奖励未打通和打通经脉的奖励值(填写这表示区别对待最后一次)
		tFinalAward = {},
		tZhenQiFinalAward = {},
		tXuFinalAward = {},
		-----------------------------------------
		--主活动条件5,6
		tTaskCondition = {},
		--每次都随机一次道具表(1)还是只有最后一次随机道具表(0)
		tConditionItemAward = {1, 1, 1},
		--主活动未上限物品奖励
		tItemFinalAward = {
			[1] = {
							{2, 20, 2500000, 1},
							{1, 15, "Nh﹏ S﹎ V筺 N╩", {2, 1, 30071, 1}, 7 * 24 * 3600},
							{1, 15, "Tu Ch﹏ Y誹 Quy誸", {2, 0, 554, 2}, 7 * 24 * 3600},
							{1, 10, "Ti觰 Nh﹏ s﹎ qu�", {2, 0, 552, 1}, 7 * 24 * 3600},
							{1, 10, "Чi Nh﹏ s﹎", {2, 0, 553, 1}, 7 * 24 * 3600},
							{1, 6, "C� Linh Ng鋍", {2, 1, 30369, 2}, 0},
							{1, 6, "C� Linh Th筩h", {2, 1, 30368, 2}, 0},
							{1, 6, "Ma Tinh", {2, 1, 30497, 1}, 0},
							{5, 6, 10, 1},
							{4, 6, 10, 1},
						},
			[2] = {
							{2, 20, 2500000, 1},
							{1, 15, "Nh﹏ S﹎ V筺 N╩", {2, 1, 30071, 1}, 7 * 24 * 3600},
							{1, 15, "Tu Ch﹏ Y誹 Quy誸", {2, 0, 554, 2}, 7 * 24 * 3600},
							{1, 10, "Ti觰 Nh﹏ s﹎ qu�", {2, 0, 552, 1}, 7 * 24 * 3600},
							{1, 10, "Чi Nh﹏ s﹎", {2, 0, 553, 1}, 7 * 24 * 3600},
							{1, 6, "C� Linh Ng鋍", {2, 1, 30369, 2}, 0},
							{1, 6, "C� Linh Th筩h", {2, 1, 30368, 2}, 0},
							{1, 6, "Ma Tinh", {2, 1, 30497, 1}, 0},
							{5, 6, 10, 1},
							{4, 6, 10, 1},
						},
			[3] = {
							{2, 20, 2500000, 1},
							{1, 15, "Nh﹏ S﹎ V筺 N╩", {2, 1, 30071, 1}, 7 * 24 * 3600},
							{1, 15, "Tu Ch﹏ Y誹 Quy誸", {2, 0, 554, 2}, 7 * 24 * 3600},
							{1, 10, "Ti觰 Nh﹏ s﹎ qu�", {2, 0, 552, 1}, 7 * 24 * 3600},
							{1, 10, "Чi Nh﹏ s﹎", {2, 0, 553, 1}, 7 * 24 * 3600},
							{1, 6, "C� Linh Ng鋍", {2, 1, 30369, 2}, 0},
							{1, 6, "C� Linh Th筩h", {2, 1, 30368, 2}, 0},
							{1, 6, "Ma Tinh", {2, 1, 30497, 1}, 0},
							{5, 6, 10, 1},
							{4, 6, 10, 1},
						},
		},
		--主活动已上限物品奖励
		tItemFinalAwardOverLimit = {},
		------------------------------------------
		--自定义奖励
		bUdIsExist = 1,
		tUdAward = {
			nTaskSeq = 1 + 3 + 1,  --使用第几个任务变量(第一个是跨天标记)
			nTimesLimit = 12, --要求兑换过多少次
			szTitle = format("Nh薾 ph莕 thng VIP (ho祅 th祅h %d tr� l猲 i t蕋 c�)", 12),  --对话文字
			uFunc = "Ud_GiveVipAward_201311",  --自定义执行函数
			nMaxCount = 1, --每天最大领取次数
			nFreeRoom = 7, --需要的背包空间个数
		},
	},
	[106] = {
		--副活动ID和索引一致
		nActivityID = 106,
		nActivityName = "Event ph� th竛g12",
		--使用的任务变量组
		tTaskGroup = {7, 7},
		--以下table大小需对应--------------------
		--数字与tCost一一对应
		tSayDialog = {
			"Nh薾 1 b� ngo筰 trang Noel ( Ti猽 hao 3 H閜 Qu� Noel)",
			"Nh薾 1 Tu莕 L閏 ( Ti猽 hao 3 H閜 Qu� Noel)",
			"Nh薾 1 Xe Tu莕 L閏 () ( Ti猽 hao 4 H閜 Qu� Noel)",
			"Nh薾 1 Xe Tu莕 L閏 (xanh) ( Ti猽 hao 4 H閜 Qu� Noel)",
			"Nh薾 1 Xe Tu莕 L閏 (v祅g) (Ti猽 hao 4 H閜 Qu� Noel)",
			"Nh薾 24122013 Kinh Nghi謒, 24 甶觤 S� M玭, 24 甶觤 Danh V鋘g, 24 甶觤 Ch﹏ Kh�, 24 甶觤 Qu﹏ C玭g, 24 D﹗ (Ti猽 hao 24 H閜 Qu� Noel + 24 Ti猽 Dao Ng鋍)",
		},
		--消耗道具和金币数量J
		tCostTable = {
			{{2, 1, 30611, 3, "H閜 qu� gi竛g sinh"}, {0}},
			{{2, 1, 30611, 3, "H閜 qu� gi竛g sinh"}, {0}},
			{{2, 1, 30611, 4, "H閜 qu� gi竛g sinh"}, {0}},
			{{2, 1, 30611, 4, "H閜 qu� gi竛g sinh"}, {0}},
			{{2, 1, 30611, 4, "H閜 qu� gi竛g sinh"}, {0}},
			{{2, 1, 30611, 24, "H閜 qu� gi竛g sinh"}, {2, 1, 30603, 24, "Ti猽 Dao Ng鋍"}, {0}},
		},
		--每一项最大使用次数/每天
		tMaxUseCount = {1, 1, 1, 1, 1, 1},
		--需求背包空间
		tFreeRoom = {3, 1, 1, 1, 1, 1},
		tFreeWeight = {100, 100, 100, 100, 100, 100},
		--每一项的日志
		tMsg2Player = {
		},
		-----------------------------------------
		--普通经验奖励
		tNormalAward = {
		},
		tZhenQiAward = {
		},
		tXuAward = {
		},
		--最终奖励未打通和打通经脉的奖励值(填写这表示区别对待最后一次)
		tFinalAward = {},
		tZhenQiFinalAward = {},
		tXuFinalAward = {},
		-----------------------------------------
		--主活动条件5,6
		tTaskCondition = {},
		--每次都随机一次道具表(1)还是只有最后一次随机道具表(0)
		tConditionItemAward = {1, 1, 1, 1, 1, 1},
		--主活动未上限物品奖励
		tItemFinalAward = {
			[1] = {
							{31, 100, "Ud_GiveAward_106_1()", 1},
						},
			[2] = {
							{31, 100, "Ud_GiveAward_106_2()", 1},
						},
			[3] = {
							{31, 100, "Ud_GiveAward_106_3()", 1},
						},
			[4] = {
							{31, 100, "Ud_GiveAward_106_4()", 1},
						},
			[5] = {
							{31, 100, "Ud_GiveAward_106_5()", 1},
						},
			[6] = {
							{31, 100, "Ud_GiveAward_106_6()", 1},
						},
		},
		--主活动已上限物品奖励
		tItemFinalAwardOverLimit = {},
		------------------------------------------
		--自定义奖励
		bUdIsExist = 0,
		tUdAward = {
		},
	},
	[108] = {
		--副活动ID和索引一致
		nActivityID = 108,
		nActivityName = "Event ph� 1 th竛g 1 n╩ 2014",
		--使用的任务变量组
		tTaskGroup = {9, 7},
		--以下table大小需对应--------------------
		--数字与tCost一一对应
		tSayDialog = {
			"Nh薾 1 b� ngo筰 trang Xu﹏ ( ti猽 hao 3 B竛h Ch璶g + 3 B竛h T衪) ",
			"Nh薾 1 Ni猲 Th� ( ti猽 hao 3 B竛h Ch璶g + 3 B竛h T衪 + 3 Ti猽 Dao Ng鋍)",
			"Nh薾 20142014Exp, 24 甶觤 s� m玭, 24 甶觤 danh v鋘g, 24 甶觤 ch﹏ kh�, 24 甶觤 qu﹏ c玭g, 24 Xo礽, 4 T� Ngh躠 L謓h, 4 Th玭g Thi猲 L謓h B礽 ( ti猽 hao 19 B竛h Ch璶g + 19 B竛h T衪 + 19 Ti猽 Dao Ng鋍) ",
		},
		--消耗道具和金币数量J
		tCostTable = {
			{{2, 1, 30621, 3, "B竛h Ch璶g"}, {2, 1, 30622, 3, "B竛h T衪"}},
			{{2, 1, 30621, 3, "B竛h Ch璶g"}, {2, 1, 30622, 3, "B竛h T衪"}, {2, 1, 30603, 3, "Ti猽 Dao Ng鋍"}},
			{{2, 1, 30621, 19, "B竛h Ch璶g"}, {2, 1, 30622, 19, "B竛h T衪"}, {2, 1, 30603, 19, "Ti猽 Dao Ng鋍"}},
		},
		--每一项最大使用次数/每天
		tMaxUseCount = {1, 1, 1},
		--需求背包空间
		tFreeRoom = {1, 1, 3},
		tFreeWeight = {100, 100, 100},
		--每一项的日志
		tMsg2Player = {
		},
		-----------------------------------------
		--普通经验奖励
		tNormalAward = {
		},
		tZhenQiAward = {
		},
		tXuAward = {
		},
		--最终奖励未打通和打通经脉的奖励值(填写这表示区别对待最后一次)
		tFinalAward = {},
		tZhenQiFinalAward = {},
		tXuFinalAward = {},
		-----------------------------------------
		--主活动条件5,6
		tTaskCondition = {},
		--每次都随机一次道具表(1)还是只有最后一次随机道具表(0)
		tConditionItemAward = {1, 1, 1},
		--主活动未上限物品奖励
		tItemFinalAward = {
			[1] = {
							{31, 100, "Ud_GiveAward_108_1()", 1},
						},
			[2] = {
							{31, 100, "Ud_GiveAward_108_2()", 1},
						},
			[3] = {
							{31, 100, "Ud_GiveAward_108_3()", 1}
						},		
		},
		--主活动已上限物品奖励
		tItemFinalAwardOverLimit = {},
		------------------------------------------
		--自定义奖励
		bUdIsExist = 0,
		tUdAward = {
		},
	},
	[113] = {
		--副活动ID和索引一致
		nActivityID = 113,
		nActivityName = "Ho箃 ng ph� 1 th竛g 2 n╩ 2014",
		--使用的任务变量组
		tTaskGroup = {5, 8},
		--以下table大小需对应--------------------
		--数字与tCost一一对应
		tSayDialog = {
			"Ph莕 thng pha c� ph� (ti猽 hao 500 b閠 ca cao nguy猲 ch蕋 + 500 s鱝 ti v� tr鴑g + 50 v祅g) ",
			"Ph莕 thng t苙g b竛h (ti猽 hao 25 Chocolare Chips Muffin + 250 v祅g)",
			"Ph莕 thng t苙g b竛h (ti猽 hao 25 Dark Chocolate + 66 XU)",
		},
		--消耗道具和金币数量J
		tCostTable = {
			{{2, 1, 30628, 500, "Ca cao nguy猲 ch蕋"}, {2, 1, 30629, 500, "S鱝 ti v� tr鴑g"},{50}},
			{{2, 1, 30630, 25, "Chocolare Chips Muffin"}, {250}},
			{{2, 1, 30631, 25, "Dark Chocolate"}, {2, 1, 30230, 66, "XU"}},
		},
		--每一项最大使用次数/每天
		tMaxUseCount = {5, 5, 5},
		--需求背包空间
		tFreeRoom = {0, 1, 1},
		tFreeWeight = {10, 10, 10},
		--每一项的日志
		tMsg2Player = {
			"Ph莕 thng pha c� ph� %d/%d",
			"Ph莕 thng t苙g b竛h %d/%d",
			"Ph莕 thng t苙g b竛h %d/%d",
		},
		-----------------------------------------
		--普通经验奖励
		tNormalAward = {
		},
		tZhenQiAward = {
		},
		tXuAward = {
		},
		--最终奖励未打通和打通经脉的奖励值(填写这表示区别对待最后一次)
		tFinalAward = {},
		tZhenQiFinalAward = {},
		tXuFinalAward = {},
		-----------------------------------------
		--主活动条件5,6
		tTaskCondition = {},
		--每次都随机一次道具表(1)还是只有最后一次随机道具表(0)
		tConditionItemAward = {1, 1, 1},
		--主活动未上限物品奖励
		tItemFinalAward = {
			[1] = {
							{31, 100, "Ud_GiveAward_113_1()", 1},
						},
			[2] = {
							{31, 100, "Ud_GiveAward_113_2()", 1},
						},
			[3] = {
							{31, 100, "Ud_GiveAward_113_3()", 1},
						},		
		},
		--主活动已上限物品奖励
		tItemFinalAwardOverLimit = {},
		------------------------------------------
		--自定义奖励
		bUdIsExist = 1,
		tUdAward = {
			nTaskSeq = 1 + 3 + 1,  --使用第几个任务变量(第一个是跨天标记)
			nTimesLimit = 15, --要求兑换过多少次
			szTitle = format("Nh薾 thng c� ph�-b竛h(sau khi nh薾 thng %d s� l莕 pha c� ph� v� t苙g b竛h m鏸 lo筰)", 5),  --对话文字
			uFunc = "Ud_GiveLastAward_201402",  --自定义执行函数
			nMaxCount = 1, --每天最大领取次数
			nFreeRoom = 4, --需要的背包空间个数
		},
	},
	[116] = {
		--副活动ID和索引一致
		nActivityID = 116,
		nActivityName = "event ph� th竛g 3 n╩ 2014",
		--使用的任务变量组
		tTaskGroup = {8, 8},
		--以下table大小需对应--------------------
		--数字与tCost一一对应
		tSayDialog = {
			"g鉯 hoa nh薾 thng (ti猽 hao 350 gi蕐 b鉵g ki課g +350 b譨 c鴑g +66 v祅g )",
			"t苙g qu� nh薾 thng ( ti猽 hao 25 ph莕 qu� 8/3+268 v祅g)",
			"t苙g qu� nh薾 thng(ti猽 hao 25 b玭g hoa 8/3+68 ng鋍 ti猽 dao)",
		},
		--消耗道具和金币数量J
		tCostTable = {
			{{2, 1, 30632, 350, "gi蕐 b鉵g ki課g "}, {2, 1, 30633, 350, "b譨 c鴑g"},{66}},
			{{2, 1, 30634, 25, "qu� 8/3"}, {268}},
			{{2, 1, 30635, 25, "hoa 8/3"}, {2, 1, 30603, 68, "Ti猽 Dao Ng鋍"}},
		},
		--每一项最大使用次数/每天
		tMaxUseCount = {6, 6, 6},
		--需求背包空间
		tFreeRoom = {0, 1, 1},
		tFreeWeight = {0, 10, 10},
		--每一项的日志
		tMsg2Player = {
			"g鉯 qu� nh薾 thng %d/%d",
			"t苙g qu� nh薾 thng (qu� 8/3) %d/%d",
			"t苙g qu� nh薾 thng (hoa 8/3) %d/%d",
		},
		-----------------------------------------
		--普通经验奖励
		tNormalAward = {
		},
		tZhenQiAward = {
		},
		tXuAward = {
		},
		--最终奖励未打通和打通经脉的奖励值(填写这表示区别对待最后一次)
		tFinalAward = {},
		tZhenQiFinalAward = {},
		tXuFinalAward = {},
		-----------------------------------------
		--主活动条件5,6
		tTaskCondition = {},
		--每次都随机一次道具表(1)还是只有最后一次随机道具表(0)
		tConditionItemAward = {1, 1, 1},
		--主活动未上限物品奖励
		tItemFinalAward = {
			[1] = {
							{31, 100, "Ud_GiveAward_116_1()", 1},
						},
			[2] = {
							{31, 100, "Ud_GiveAward_116_2()", 1},
						},
			[3] = {
							{31, 100, "Ud_GiveAward_116_3()", 1},
						},		
		},
		--主活动已上限物品奖励
		tItemFinalAwardOverLimit = {},
		------------------------------------------
		--自定义奖励
		bUdIsExist = 1,
		tUdAward = {
			nTaskSeq = 1 + 3 + 1,  --使用第几个任务变量(第一个是跨天标记)
			nTimesLimit = 18, --要求兑换过多少次
			szTitle = format("nh薾 thng t礽 n╪g ( sau khi nh薾 頲 ph莕 thng g鉯 hoa v� t苙g qu� m鏸 lo筰%d l莕)", 6),  --对话文字
			uFunc = "Ud_GiveLastAward_201403",  --自定义执行函数
			nMaxCount = 1, --每天最大领取次数
			nFreeRoom = 6, --需要的背包空间个数
		},
	},
	[120] = {
		--副活动ID和索引一致
		nActivityID = 120,
		nActivityName = "event ph� th竛g 4 n╩ 2014 ",
		--使用的任务变量组
		tTaskGroup = {2, 15},
		--以下table大小需对应--------------------
		--数字与tCost一一对应
		tSayDialog = {
			"giao nguy猲 li謚 nh薾 thng ( ti猽 hao 500 gi蕐 ng� s綾 + 500 h� keo + 50 v祅g )",
			"giao chi課 k� nh薾 thng (ti猽 hao 25 b筩h k� +250 v祅g )",
			"Giao chi課 k� nh薾 thng ( ti猽 hao 25 h綾 k� + 66 ti猽 dao ng鋍)",
		},
		--消耗道具和金币数量J
		tCostTable = {
			{{2, 1, 30637, 500, "gi蕐 ng� s綾 "}, {2, 1, 30638, 500, "h� keo "},{50}},
			{{2, 1, 30639, 25, " b筩h k� "}, {250}},
			{{2, 1, 30640, 25, " h綾 k� "}, {2, 1, 30603, 66, "Ti猽 Dao Ng鋍"}},
		},
		--每一项最大使用次数/每天
		tMaxUseCount = {6, 6, 6},
		--需求背包空间
		tFreeRoom = {0, 1, 1},
		tFreeWeight = {0, 10, 10},
		--每一项的日志
		tMsg2Player = {
			"giao nguy猲 li謚 nh薾 thng  %d/%d",
			"giao chi課 k� nh薾 thng ( b筩h k� ) %d/%d",
			"giao chi課 k� nh薾 thng ( h綾 k� ) %d/%d",
		},
		-----------------------------------------
		--普通经验奖励
		tNormalAward = {
		},
		tZhenQiAward = {
		},
		tXuAward = {
		},
		--最终奖励未打通和打通经脉的奖励值(填写这表示区别对待最后一次)
		tFinalAward = {},
		tZhenQiFinalAward = {},
		tXuFinalAward = {},
		-----------------------------------------
		--主活动条件5,6
		tTaskCondition = {},
		--每次都随机一次道具表(1)还是只有最后一次随机道具表(0)
		tConditionItemAward = {1, 1, 1},
		--主活动未上限物品奖励
		tItemFinalAward = {
			[1] = {
							{31, 100, "Ud_GiveAward_120_1()", 1},
						},
			[2] = {
							{31, 100, "Ud_GiveAward_120_2()", 1},
						},
			[3] = {
							{31, 100, "Ud_GiveAward_120_3()", 1},
						},		
		},
		--主活动已上限物品奖励
		tItemFinalAwardOverLimit = {},
		------------------------------------------
		--自定义奖励
		bUdIsExist = 1,
		tUdAward = {
			nTaskSeq = 1 + 3 + 1,  --使用第几个任务变量(第一个是跨天标记)
			nTimesLimit = 18, --要求兑换过多少次
			szTitle = format("chi課 binh xu蕋 s綾 (sau khi n閜 nguy猲 li謚 v� chi課 k� m鏸 lo筰 %d nh薾 thng)", 6),  --对话文字
			uFunc = "Ud_GiveLastAward_201404",  --自定义执行函数
			nMaxCount = 1, --每天最大领取次数
			nFreeRoom = 8, --需要的背包空间个数
		},
	},
	[124] = {
		--副活动ID和索引一致
		nActivityID = 124,
		nActivityName = "Ho箃 ng ph� event th竛g 5 n╩ 2014",
		--使用的任务变量组
		tTaskGroup = {6, 9},
		--以下table大小需对应--------------------
		--数字与tCost一一对应
		tSayDialog = {
			"Giao t礽 nguy猲 nh薾 thng ( ti猽 hao 499 d﹗ ti +499 b筩 h� +49 v祅g)(6 l莕/ng祔 )",
			"Giao 25 sero d﹗ ti +249 v祅g nh薾 頲 (6 l莕/ng祔 )",
			"Giao 25 sero b筩 h� + 49Ti猽 Dao Ng鋍 (6 l莕/ng祔 )",
		},
		--消耗道具和金币数量J
		tCostTable = {
			{{2, 1, 30645, 499, "D﹗ ti "}, {2, 1, 30646, 499, "B筩 h� "},{49}},
			{{2, 1, 30647, 25, "Sero d﹗ ti "}, {249}},
			{{2, 1, 30648, 25, "Sero b筩 h� "}, {2, 1, 30603, 49, "Ti猽 Dao Ng鋍"}},
		},
		--每一项最大使用次数/每天
		tMaxUseCount = {6, 6, 6},
		--需求背包空间
		tFreeRoom = {0, 1, 1},
		tFreeWeight = {0, 10, 10},
		--每一项的日志
		tMsg2Player = {
			"Giao t礽 nguy猲 %d/%d",
			"Giao sero d﹗ ti %d/%d",
			"Giao  sero b筩 h� %d/%d",
		},
		-----------------------------------------
		--普通经验奖励
		tNormalAward = {
		},
		tZhenQiAward = {
		},
		tXuAward = {
		},
		--最终奖励未打通和打通经脉的奖励值(填写这表示区别对待最后一次)
		tFinalAward = {},
		tZhenQiFinalAward = {},
		tXuFinalAward = {},
		-----------------------------------------
		--主活动条件5,6
		tTaskCondition = {},
		--每次都随机一次道具表(1)还是只有最后一次随机道具表(0)
		tConditionItemAward = {1, 1, 1},
		--主活动未上限物品奖励
		tItemFinalAward = {
			[1] = {
							{31, 100, "Ud_GiveAward_124_1()", 1},
						},
			[2] = {
							{31, 100, "Ud_GiveAward_124_2()", 1},
						},
			[3] = {
							{31, 100, "Ud_GiveAward_124_2()", 1},
						},		
		},
		--主活动已上限物品奖励
		tItemFinalAwardOverLimit = {},
		------------------------------------------
		--自定义奖励
		bUdIsExist = 1,
		tUdAward = {
			nTaskSeq = 1 + 3 + 1,  --使用第几个任务变量(第一个是跨天标记)
			nTimesLimit = 18, --要求兑换过多少次
			szTitle = "Ph莕 thng VIP (Giao t礽 nguy猲 v� nc sero m鏸 lo筰 6 l莕 )(t鎛g c閚g 18 l莕 )",  --对话文字
			uFunc = "Ud_GiveLastAward_201405",  --自定义执行函数
			nMaxCount = 1, --每天最大领取次数
			nFreeRoom = 7, --需要的背包空间个数
		},
	},
	[127] = {
		--副活动ID和索引一致
		nActivityID = 127,
		nActivityName = "Ho箃 ng ph� th竛g 06/2014",
		--使用的任务变量组
		tTaskGroup = {9, 9},
		--以下table大小需对应--------------------
		--数字与tCost一一对应
		tSayDialog = {
			"N閜 nguy猲 li謚 (Ti猽 hao 499 Tr竔 C﹜ + 499 M藅 Ong + 49 V祅g) (M鏸 ng祔 6 l莕)",
			"N閜 25 K裲 D蝟 Tr竔 C﹜ + 249 V祅g (M鏸 ng祔 6 l莕)",
			"N閜 25 K裲 D蝟 Chip Chip + 49 Ti猽 Dao Ng鋍 (M鏸 ng祔 6 l莕)",
		},
		--消耗道具和金币数量J
		tCostTable = {
			{{2, 1, 30660, 499, "M藅 Ong"}, {2, 1, 30661, 499, "Tr竔 c﹜"},{49}},
			{{2, 1, 30662, 25, "K裲 D蝟 Tr竔 C﹜"}, {249}},
			{{2, 1, 30663, 25, "K裲 D蝟 Chip Chip"}, {2, 1, 30603, 49, "Ti猽 Dao Ng鋍"}},
		},
		--每一项最大使用次数/每天
		tMaxUseCount = {6, 6, 6},
		--需求背包空间
		tFreeRoom = {0, 1, 1},
		tFreeWeight = {0, 10, 10},
		--每一项的日志
		tMsg2Player = {
			"N閜 nguy猲 li謚 %d/%d",
			"N閜 K裲 D蝟 Tr竔 C﹜ %d/%d",
			"N閜 K裲 D蝟 Chip Chip %d/%d",
		},
		-----------------------------------------
		--普通经验奖励
		tNormalAward = {
		},
		tZhenQiAward = {
		},
		tXuAward = {
		},
		--最终奖励未打通和打通经脉的奖励值(填写这表示区别对待最后一次)
		tFinalAward = {},
		tZhenQiFinalAward = {},
		tXuFinalAward = {},
		-----------------------------------------
		--主活动条件5,6
		tTaskCondition = {},
		--每次都随机一次道具表(1)还是只有最后一次随机道具表(0)
		tConditionItemAward = {1, 1, 1},
		--主活动未上限物品奖励
		tItemFinalAward = {
			[1] = {
							{31, 100, "Ud_GiveAward_127_1()", 1},
						},
			[2] = {
							{31, 100, "Ud_GiveAward_127_2()", 1},
						},
			[3] = {
							{31, 100, "Ud_GiveAward_127_2()", 1},
						},		
		},
		--主活动已上限物品奖励
		tItemFinalAwardOverLimit = {},
		------------------------------------------
		--自定义奖励
		bUdIsExist = 1,
		tUdAward = {
			nTaskSeq = 1 + 3 + 1,  --使用第几个任务变量(第一个是跨天标记)
			nTimesLimit = 18, --要求兑换过多少次
			szTitle = "Ph莕 thng VIP (Sau khi ho祅 th祅h n閜 nguy猲 li謚 v� k裲 d蝟 s� nh薾 頲 ph莕 thng VIP) (T鎛g c玭g 18 l莕)",  --对话文字
			uFunc = "Ud_GiveLastAward_201406",  --自定义执行函数
			nMaxCount = 1, --每天最大领取次数
			nFreeRoom = 7, --需要的背包空间个数
		},
	},
	[130] = {
		--副活动ID和索引一致
		nActivityID = 130,
		nActivityName = "Ho箃 ng ph� 07/2014",
		--使用的任务变量组
		tTaskGroup = {3, 14},
		--以下table大小需对应--------------------
		--数字与tCost一一对应
		tSayDialog = {
			"Ti猽 hao 299 Gi蕐 G鉯 Qu� + 299 H閜 Qu� + 69 V祅g (M鏸 ng祔 6 l莕) ",
			"N閜 06 Qu� M鮪g Phi猲 B秐 M韎 + 119 V祅g nh薾 頲 (M鏸 ng祔 6 l莕)",
			"N閜 06 Hoa M鮪g Phi猲 B秐 M韎 + 19 Ti猽 Dao Ng鋍 nh薾 頲 (M鏸 ng祔 6 l莕)",
		},
		--消耗道具和金币数量J
		tCostTable = {
			{{2, 1, 30695, 299, "H閜 Qu�"}, {2, 1, 30696, 299, "Gi蕐 G鉯 Qu�"},{69}},
			{{2, 1, 30697, 6, "Qu� M鮪g Phi猲 B秐 M韎"}, {119}},
			{{2, 1, 30698, 6, "Hoa M鮪g Phi猲 B秐 M韎"}, {2, 1, 30603, 19, "Ti猽 Dao Ng鋍"}},
		},
		--每一项最大使用次数/每天
		tMaxUseCount = {6, 6, 6},
		--需求背包空间
		tFreeRoom = {0, 1, 1},
		tFreeWeight = {0, 10, 10},
		--每一项的日志
		tMsg2Player = {
			"N閜 nguy猲 li謚 %d/%d",
			"N閜 Qu� M鮪g Phi猲 B秐 M韎 %d/%d",
			"N閜 Hoa M鮪g Phi猲 B秐 M韎 %d/%d",
		},
		-----------------------------------------
		--普通经验奖励
		tNormalAward = {
		},
		tZhenQiAward = {
		},
		tXuAward = {
		},
		--最终奖励未打通和打通经脉的奖励值(填写这表示区别对待最后一次)
		tFinalAward = {},
		tZhenQiFinalAward = {},
		tXuFinalAward = {},
		-----------------------------------------
		--主活动条件5,6
		tTaskCondition = {},
		--每次都随机一次道具表(1)还是只有最后一次随机道具表(0)
		tConditionItemAward = {1, 1, 1},
		--主活动未上限物品奖励
		tItemFinalAward = {
			[1] = {
							{31, 100, "Ud_GiveAward_130_1()", 1},
						},
			[2] = {
							{31, 100, "Ud_GiveAward_130_2()", 1},
						},
			[3] = {
							{31, 100, "Ud_GiveAward_130_2()", 1},
						},		
		},
		--主活动已上限物品奖励
		tItemFinalAwardOverLimit = {},
		------------------------------------------
		--自定义奖励
		bUdIsExist = 1,
		tUdAward = {
			nTaskSeq = 1 + 3 + 1,  --使用第几个任务变量(第一个是跨天标记)
			nTimesLimit = 18, --要求兑换过多少次
			szTitle = "Ph莕 thng VIP (Ho祅 th祅h n閜 nguy猲 li謚 v� qu� s� nh薾 頲 ph莕 thng VIP, 3 d遪g ch鋘 t鎛g c閚g ph秈 ho祅 th祅h 18 l莕)",  --对话文字
			uFunc = "Ud_GiveLastAward_201407",  --自定义执行函数
			nMaxCount = 1, --每天最大领取次数
			nFreeRoom = 5, --需要的背包空间个数
		},
	},
	[132] = {
		--副活动ID和索引一致
		nActivityID = 132,
		nActivityName = "Ho箃 ng ph� 08/2014",
		--使用的任务变量组
		tTaskGroup = {6, 10},
		--以下table大小需对应--------------------
		--数字与tCost一一对应
		tSayDialog = {
			"Ti猽 hao 299 Hoa Sen + 299 H箃 Sen + 69 V祅g (M鏸 ng祔 6 l莕) ",
			"Giao n閜 06 B竛h M藅 + 119 V祅g (M鏸 ng祔 6 l莕)",
			"Giao n閜 06 B竛h L� Sen + 19 Ti猽 Dao Ng鋍 (M鏸 ng祔 6 l莕)",
		},
		--消耗道具和金币数量J
		tCostTable = {
			{{2, 1, 30705, 299, "Hoa sen"}, {2, 1, 30706, 299, "H箃 Sen"},{69}},
			{{2, 1, 30707, 6, "B竛h M藅"}, {119}},
			{{2, 1, 30708, 6, "B竛h L� Sen"}, {2, 1, 30603, 19, "Ti猽 Dao Ng鋍"}},
		},
		--每一项最大使用次数/每天
		tMaxUseCount = {6, 6, 6},
		--需求背包空间
		tFreeRoom = {0, 1, 1},
		tFreeWeight = {0, 10, 10},
		--每一项的日志
		tMsg2Player = {
			"N閜 nguy猲 li謚 %d/%d",
			"Giao n閜 B竛h M藅 %d/%d",
			"Giao n閜 B竛h L� Sen %d/%d",
		},
		-----------------------------------------
		--普通经验奖励
		tNormalAward = {
		},
		tZhenQiAward = {
		},
		tXuAward = {
		},
		--最终奖励未打通和打通经脉的奖励值(填写这表示区别对待最后一次)
		tFinalAward = {},
		tZhenQiFinalAward = {},
		tXuFinalAward = {},
		-----------------------------------------
		--主活动条件5,6
		tTaskCondition = {},
		--每次都随机一次道具表(1)还是只有最后一次随机道具表(0)
		tConditionItemAward = {1, 1, 1},
		--主活动未上限物品奖励
		tItemFinalAward = {
			[1] = {
							{31, 100, "Ud_GiveAward_132_1()", 1},
						},
			[2] = {
							{31, 100, "Ud_GiveAward_132_2()", 1},
						},
			[3] = {
							{31, 100, "Ud_GiveAward_132_2()", 1},
						},		
		},
		--主活动已上限物品奖励
		tItemFinalAwardOverLimit = {},
		------------------------------------------
		--自定义奖励
		bUdIsExist = 1,
		tUdAward = {
			nTaskSeq = 1 + 3 + 1,  --使用第几个任务变量(第一个是跨天标记)
			nTimesLimit = 18, --要求兑换过多少次
			szTitle = "Ph莕 thng VIP (Ho祅 th祅h n閜 nguy猲 li謚 v� qu� s� nh薾 頲 ph莕 thng VIP, 3 d遪g ch鋘 t鎛g c閚g ph秈 ho祅 th祅h 18 l莕)",  --对话文字
			uFunc = "Ud_GiveLastAward_201408",  --自定义执行函数
			nMaxCount = 1, --每天最大领取次数
			nFreeRoom = 5, --需要的背包空间个数
		},
	},
	[134] = {
		--副活动ID和索引一致
		nActivityID = 134,
		nActivityName = "Ho箃 ng ph� 09/2014",
		--使用的任务变量组
		tTaskGroup = {9, 10},
		--以下table大小需对应--------------------
		--数字与tCost一一对应
		tSayDialog = {
			"Ti猽 hao 299 Gi蕐 Ki課g M祏 + 299 D鬾g C� L祄 n + 69 v祅g (M鏸 ng祔 6 l莕)",
			"N閜 06 L錸g n Trung Thu п + 119 v祅g nh薾 頲 (M鏸 ng祔 6 l莕)",
			"N閜 06 L錸g n Trung Thu T輒 + 19 Ti猽 Dao Ng鋍 (M鏸 ng祔 6 l莕)",
		},
		--消耗道具和金币数量J
		tCostTable = {
			{{2, 1, 30717, 299, "Gi蕐 Ki課g M祏"}, {2, 1, 30718, 299, "D鬾g C� L祄 n"},{69}},
			{{2, 1, 30719, 6, "L錸g n Trung Thu п"}, {119}},
			{{2, 1, 30720, 6, "L錸g n Trung Thu T輒"}, {2, 1, 30603, 19, "Ti猽 Dao Ng鋍"}},
		},
		--每一项最大使用次数/每天
		tMaxUseCount = {6, 6, 6},
		--需求背包空间
		tFreeRoom = {0, 1, 1},
		tFreeWeight = {0, 10, 10},
		--每一项的日志
		tMsg2Player = {
			"N閜 nguy猲 li謚 %d/%d",
			"N閜 L錸g n Trung Thu п %d/%d",
			"N閜 L錸g n Trung Thu T輒 %d/%d",
		},
		-----------------------------------------
		--普通经验奖励
		tNormalAward = {
		},
		tZhenQiAward = {
		},
		tXuAward = {
		},
		--最终奖励未打通和打通经脉的奖励值(填写这表示区别对待最后一次)
		tFinalAward = {},
		tZhenQiFinalAward = {},
		tXuFinalAward = {},
		-----------------------------------------
		--主活动条件5,6
		tTaskCondition = {},
		--每次都随机一次道具表(1)还是只有最后一次随机道具表(0)
		tConditionItemAward = {1, 1, 1},
		--主活动未上限物品奖励
		tItemFinalAward = {
			[1] = {
							{31, 100, "Ud_GiveAward_134_1()", 1},
						},
			[2] = {
							{31, 100, "Ud_GiveAward_134_2()", 1},
						},
			[3] = {
							{31, 100, "Ud_GiveAward_134_2()", 1},
						},		
		},
		--主活动已上限物品奖励
		tItemFinalAwardOverLimit = {},
		------------------------------------------
		--自定义奖励
		bUdIsExist = 1,
		tUdAward = {
			nTaskSeq = 1 + 3 + 1,  --使用第几个任务变量(第一个是跨天标记)
			nTimesLimit = 18, --要求兑换过多少次
			szTitle = "Ph莕 thng VIP (Ho祅 th祅h n閜 nguy猲 li謚 v� qu� s� nh薾 頲 ph莕 thng VIP, 3 d遪g ch鋘 t鎛g c閚g ph秈 ho祅 th祅h 18 l莕)",  --对话文字
			uFunc = "Ud_GiveLastAward_201409",  --自定义执行函数
			nMaxCount = 1, --每天最大领取次数
			nFreeRoom = 5, --需要的背包空间个数
		},
	},
	[136] = {
		--副活动ID和索引一致
		nActivityID = 136,
		nActivityName = "Ho箃 ng ph� th竛g 10/2014",
		--使用的任务变量组
		tTaskGroup = {5, 11},
		--以下table大小需对应--------------------
		--数字与tCost一一对应
		tSayDialog = {
			"Ti猽 hao 299 D鬾g C� G鉯 Hoa + 299 Hoa H錸g + 69 V祅g (M鏸 ng祔 6 l莕)",
			"N閜 06 сa H錸g п + 119 V祅g (M鏸 ng祔 6 l莕)",
			"N閜 06 сa H錸g V祅g + 19 Ti猽 Dao Ng鋍 (M鏸 ng祔 6 l莕)",
		},
		--消耗道具和金币数量J
		tCostTable = {
			{{2, 1, 30735, 299, "D鬾g C� G鉯 Hoa"}, {2, 1, 30736, 299, "Hoa h錸g"},{69}},
			{{2, 1, 30737, 6, "Hoa h錸g "}, {119}},
			{{2, 1, 30738, 6, "Hoa h錸g v祅g"}, {2, 1, 30603, 19, "Ti猽 Dao Ng鋍"}},
		},
		--每一项最大使用次数/每天
		tMaxUseCount = {6, 6, 6},
		--需求背包空间
		tFreeRoom = {0, 1, 1},
		tFreeWeight = {0, 10, 10},
		--每一项的日志
		tMsg2Player = {
			"N閜 nguy猲 li謚 %d/%d",
			"N閜 сa H錸g п %d/%d",
			"N閜 сa H錸g V祅g %d/%d",
		},
		-----------------------------------------
		--普通经验奖励
		tNormalAward = {
		},
		tZhenQiAward = {
		},
		tXuAward = {
		},
		--最终奖励未打通和打通经脉的奖励值(填写这表示区别对待最后一次)
		tFinalAward = {},
		tZhenQiFinalAward = {},
		tXuFinalAward = {},
		-----------------------------------------
		--主活动条件5,6
		tTaskCondition = {},
		--每次都随机一次道具表(1)还是只有最后一次随机道具表(0)
		tConditionItemAward = {1, 1, 1},
		--主活动未上限物品奖励
		tItemFinalAward = {
			[1] = {
							{31, 100, "Ud_GiveAward_136_1()", 1},
						},
			[2] = {
							{31, 100, "Ud_GiveAward_136_2()", 1},
						},
			[3] = {
							{31, 100, "Ud_GiveAward_136_2()", 1},
						},		
		},
		--主活动已上限物品奖励
		tItemFinalAwardOverLimit = {},
		------------------------------------------
		--自定义奖励
		bUdIsExist = 1,
		tUdAward = {
			nTaskSeq = 1 + 3 + 1,  --使用第几个任务变量(第一个是跨天标记)
			nTimesLimit = 18, --要求兑换过多少次
			szTitle = "Ph莕 thng VIP (Ho祅 th祅h c� 3 h筺g m鬰 t鎛g c閚g l� 18 l莕)",  --对话文字
			uFunc = "Ud_GiveLastAward_201410",  --自定义执行函数
			nMaxCount = 1, --每天最大领取次数
			nFreeRoom = 5, --需要的背包空间个数
		},
	},
	[139] = {
		--副活动ID和索引一致
		nActivityID = 139,
		nActivityName = "Ho箃 ng ph� th竛g 10/2014",
		--使用的任务变量组
		tTaskGroup = {8, 11},
		--以下table大小需对应--------------------
		--数字与tCost一一对应
		tSayDialog = {
			"Ti猽 hao 299 N裵 Tranh + 299 Nghi猲 M鵦 + 69 V祅g (6 l莕/ng祔)",
			"N閜 06 Tranh Th� Ph竝 + 119 V祅g (6 l莕/ng祔)",
			"N閜 06 Tranh Th� Ph竝 c Bi謙 + 19 Ti猽 Dao Ng鋍 (6 l莕/ng祔)",
		},
		--消耗道具和金币数量J
		tCostTable = {
			{{2, 1, 30741, 299, "N裵 Tranh"}, {2, 1, 30742, 299, "Nghi猲 M鵦"},{69}},
			{{2, 1, 30743, 6, "Tranh Th� Ph竝"}, {119}},
			{{2, 1, 30744, 6, "Tranh Th� Ph竝 c Bi謙"}, {2, 1, 30603, 19, "Ti猽 Dao Ng鋍"}},
		},
		--每一项最大使用次数/每天
		tMaxUseCount = {6, 6, 6},
		--需求背包空间
		tFreeRoom = {0, 3, 3},
		tFreeWeight = {0, 10, 10},
		--每一项的日志
		tMsg2Player = {
			"N閜 nguy猲 li謚 %d/%d",
			"N閜 Tranh Th� Ph竝 %d/%d",
			"N閜 Tranh Th� Ph竝 c Bi謙 %d/%d",
		},
		-----------------------------------------
		--普通经验奖励
		tNormalAward = {
		},
		tZhenQiAward = {
		},
		tXuAward = {
		},
		--最终奖励未打通和打通经脉的奖励值(填写这表示区别对待最后一次)
		tFinalAward = {},
		tZhenQiFinalAward = {},
		tXuFinalAward = {},
		-----------------------------------------
		--主活动条件5,6
		tTaskCondition = {},
		--每次都随机一次道具表(1)还是只有最后一次随机道具表(0)
		tConditionItemAward = {1, 1, 1},
		--主活动未上限物品奖励
		tItemFinalAward = {
			[1] = {
							{31, 100, "Ud_GiveAward_139_1()", 1},
						},
			[2] = {
							{31, 100, "Ud_GiveAward_139_2()", 1},
						},
			[3] = {
							{31, 100, "Ud_GiveAward_139_2()", 1},
						},		
		},
		--主活动已上限物品奖励
		tItemFinalAwardOverLimit = {},
		------------------------------------------
		--自定义奖励
		bUdIsExist = 1,
		tUdAward = {
			nTaskSeq = 1 + 3 + 1,  --使用第几个任务变量(第一个是跨天标记)
			nTimesLimit = 18, --要求兑换过多少次
			szTitle = "Ph莕 thng VIP (Ho祅 th祅h c� 3 h筺g m鬰 t鎛g c閚g l� 18 l莕)",  --对话文字
			uFunc = "Ud_GiveLastAward_201411",  --自定义执行函数
			nMaxCount = 1, --每天最大领取次数
			nFreeRoom = 3, --需要的背包空间个数
		},
	},
}