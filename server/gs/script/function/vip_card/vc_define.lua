DebugOutput = nothing
--当前使用的武林vip卡索引
--\settings\vip_card.txt
--VC_CURRENT_ID = 1;
--VC_CURRENT_ID = 2;
--VC_CURRENT_ID = 3;
--VC_CURRENT_ID = 4;
VC_CURRENT_ID = 5;
TASKID_VC_VALUE_FLAG = 3239;
TASKID_VC_AUTO_FINISH_TIMES = 3241;
TASKID_VC_DAILY_TASK_FLAG = 3240;
TASKID_VC_DAILY_TASK_1 = 3242;
TASKID_VC_DAILY_TASK_2 = 3243;
TASKID_VC_DAILY_TASK_3 = 3253;

--记录具体任务完成情况（按字节记录）(VIP_CARD_ID索引)
VC_DAILY_TASK = {
	[5] = 
	{
		[1] = {
			Options = "Ph� b秐" ,
			Content = {
				{"Lng S琻 B筩 秈 8", 2, format("Ho祅 th祅h %s, ho祅 th祅h xong 頲 thng %s,  c鑞g hi課 %d 甶觤, EXP %d", "Lng S琻 B筩 秈 8", "Hu﹏ chng anh h飊g", 60, 6000000)},
				{"мa Huy襫 Cung 秈 7", 2, format("Ho祅 th祅h %s, ho祅 th祅h xong 頲 thng %s,  c鑞g hi課 %d 甶觤, EXP %d", "мa Huy襫 Cung 秈 7", "Hu﹏ chng anh h飊g", 60, 6000000)},
				{"V筺 Ki誱 Tr騨g 秈 4", 3, format("Ho祅 th祅h %s, ho祅 th祅h xong 頲 thng %s,  c鑞g hi課 %d 甶觤, EXP %d", "V筺 Ki誱 Tr騨g 秈 4", "Hu﹏ chng anh h飊g", 60, 6000000)},
				{"Vt qua Ph莕 Thi猲 L﹎-Th竔 Nh蕋 Th竝_Thng", 2, format("Ho祅 th祅h %s, ho祅 th祅h xong 頲 thng %s,  c鑞g hi課 %d 甶觤, EXP %d", "Vt qua Ph莕 Thi猲 L﹎-Th竔 Nh蕋 Th竝_Thng", "Hu﹏ chng anh h飊g", 60, 6000000)},
			},
			RandType = 1,
			TaskIndex = TASKID_VC_DAILY_TASK_1,
			ByteIndex = 1,
			Task = TASKID_VC_DAILY_TASK_1,
			Byte = 2,
			AutoFinish = {2, 97, 236, 5, "Thi猲 Ki猽 L謓h"},
			Award = "vc_Award_2_1()",
		},	
		[2] = {
			Options = "Chi課 trng" ,
			Content = {
				{"Chi課 th緉g trong Thi猲 M玭 Tr薾", 1, format("Ho祅 th祅h %s, ho祅 th祅h xong 頲 thng %s,  c鑞g hi課 %d 甶觤, EXP %d", "Chi課 th緉g trong Thi猲 M玭 Tr薾", "C� Linh Ng鋍", 40, 6000000)},
				{"Tham gia Thi猲 M玭 Tr薾", 2, format("Ho祅 th祅h %s, ho祅 th祅h xong 頲 thng %s,  c鑞g hi課 %d 甶觤, EXP %d", "Tham gia Thi猲 M玭 Tr薾", "C� Linh Ng鋍", 40, 6000000)},
				{"Tham gia chi課 trng l韓 Nh筺 M玭 Quan v� nh薾 thng", 1, format("Ho祅 th祅h %s, ho祅 th祅h xong 頲 thng %s,  c鑞g hi課 %d 甶觤, EXP %d", "Tham gia chi課 trng l韓 Nh筺 M玭 Quan v� nh薾 thng", "C� Linh Ng鋍", 40, 6000000)},
				{"Tham gia chi課 trng nh� b蕋 k� v� nh薾 thng", 1, format("Ho祅 th祅h %s, ho祅 th祅h xong 頲 thng %s,  c鑞g hi課 %d 甶觤, EXP %d", "Tham gia chi課 trng nh� b蕋 k� v� nh薾 thng", "C� Linh Ng鋍", 40, 6000000)},
				{" O竛 Уi_Gi祅h th緉g l頸 v� nh薾 thng", 1, format("Ho祅 th祅h %s, ho祅 th祅h xong 頲 thng %s,  c鑞g hi課 %d 甶觤, EXP %d", "Tham gia  O竛 Уi gi祅h th緉g l頸 v� nh薾 thng", "C� Linh Ng鋍", 40, 6000000)},
			},
			RandType = 2,
			TaskIndex = TASKID_VC_DAILY_TASK_1,
			ByteIndex = 3,
			Task = TASKID_VC_DAILY_TASK_1,
			Byte = 4,
			AutoFinish = {2, 97, 236, 3, "Thi猲 Ki猽 L謓h"},
			Award = "vc_Award_2_2()",
		},	
		[3] = {
			Options = "T╪g th猰" ,
			Content = {
				{"T╪g c蕄 trang b�", 1, format("Ho祅 th祅h %s, ho祅 th祅h xong 頲 thng %s,  c鑞g hi課 %d 甶觤, EXP %d", "T╪g c蕄 trang b�", "C� Linh Th筩h", 50, 6000000)},
				{"Dng th祅h trang b�", 1, format("Ho祅 th祅h %s, ho祅 th祅h xong 頲 thng %s,  c鑞g hi課 %d 甶觤, EXP %d", "Dng th祅h trang b�", "C� Linh Th筩h", 50, 6000000)},
				{"Tr錸g C﹜ B竧 Nh� Nh�", 2, format("Ho祅 th祅h %s, ho祅 th祅h xong 頲 thng %s,  c鑞g hi課 %d 甶觤, EXP %d", "Tr錸g C﹜ B竧 Nh� Nh�", "C� Linh Th筩h", 50, 6000000)},
				{"Tr錸g C﹜ B竧 Nh�", 2, format("Ho祅 th祅h %s, ho祅 th祅h xong 頲 thng %s,  c鑞g hi課 %d 甶觤, EXP %d", "Tr錸g C﹜ B竧 Nh�", "C� Linh Th筩h", 50, 6000000)},
				{"M� T骾 H箃 Gi鑞g", 2, format("Ho祅 th祅h %s, ho祅 th祅h xong 頲 thng %s,  c鑞g hi課 %d 甶觤, EXP %d", "M� T骾 H箃 Gi鑞g", "C� Linh Th筩h", 50, 6000000)},
			},
			RandType = 1,
			TaskIndex = TASKID_VC_DAILY_TASK_2,
			ByteIndex = 1,
			Task = TASKID_VC_DAILY_TASK_2,
			Byte = 2,
			AutoFinish = {2, 97, 236, 2, "Thi猲 Ki猽 L謓h"},
			Award = "vc_Award_2_3()",
		},	
	},
}

VC_VALUE_AWARD = {
	[5] = {
		[1]  = {1000, 1, {2, 1, 30499, 200},  "Hu﹏ Chng Anh H飊g"},
		[2]  = {2000, 1, {2, 1, 30368, 200}, "C� Linh Th筩h"},
		[3]  = {3000, 1, {2, 1, 30369, 200},  "C� Linh Ng鋍"},
		[4]  = {5000, 1, {2, 1, 30687, 150},  "Th竔 Nh蕋 L謓h"},
		[5]  = {7000, 1, {2, 1, 30370, 1},  "Thi猲 M玭 Kim L謓h"},
		[6]  = {9000, 1, {2, 95, 204, 1},  "Thi猲 Cang L謓h"},
		[7]  = {11000, 1, {2, 1, 30499, 25},  "H醓 Ph鬾g Tinh Hoa"},
		[8]  = {13000, 1, {2, 1, 30370, 1},  "Thi猲 M玭 Kim L謓h"},
		[9]  = {15000, 1, {2, 95, 204, 1},  "Thi猲 Cang L謓h"},
		[10]  = {17000, 1, {2, 1, 30498, 1,},  "H醓 Ph鬾g H錸"},
	},
}