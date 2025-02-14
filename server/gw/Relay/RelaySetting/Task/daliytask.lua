--=============================================
--create by baiyun 2009.12.21
--describe:越南版武林使者日常任务 relay触发任务文件
--=============================================

--个人日常任务列表
DALIY_TASK_0912_PERSONAL_TASK_LIST = {
    {"Thu ph鬰  Phng Ho祅g t筰 Th竔 H� 秓 c秐h", 10, {"Kinh nghi謒 Ph鬾g ho祅g", "Luy謓 Ph鬾g Ho祅g", "B秓 Th筩h Ph鬾g ho祅g", "Trang b� Ph鬾g ho祅g"}},
    {"Thu ph鬰 Th鵦 Nh﹏ Th秓 t筰 Th竔 H� 秓 c秐h", 20, {"Kinh nghi謒 Th鵦 nh﹏ th秓", "Luy謓 Th鵦 Nh﹏ Hoa", "B秓 Th筩h Th鵦 Nh﹏ hoa", "Trang b� Th鵦 nh﹏ th秓"}},
    {"Thu ph鬰 Th� t筰 Th竔 H� 秓 c秐h", 20, {"Kinh nghi謒 Th�", "Luy謓 Th� t�", "B秓 Th筩h Th�", "Trang b� Th�"}},
    {"Thu ph鬰 H醓 K� L﹏ t筰 Th竔 H� 秓 c秐h", 10, {"Kinh nghi謒 H醓 K� L﹏", "Luy謓 H醓 K� L﹏", "B秓 Th筩h H醓 K� L﹏", "Trang b� H醓 K� L﹏"}},
    {"Thu ph鬰 B� T﹜ T筺g t筰 Th竔 H� 秓 c秐h", 20, {"Kinh nghi謒 B� T﹜ T筺g", "Luy謓 Mao Ng璾", "B秓 Th筩h B� T﹜ T筺g", "Trang b� B� T﹜ T筺g"}},
    {"Thu ph鬰 C莔 Ti猲 T� t筰 Th竔 H� 秓 c秐h", 20, {"Kinh nghi謒 C莔 Ti猲 T�", "Luy謓 C莔 Ti猲 T�", "B秓 Th筩h C莔 Ti猲 T�", "Trang b� C莔 Ti猲 T�"}},
}

--团队日常任务列表
DALIY_TASK_0912_TEAM_TASK_LIST = {
    {"Truy t譵 B綾 L鬰 L﹎ L謓h", 10, "B綾 L鬰 L﹎ l謓h"},
    {"Truy t譵 Tr鬰 秐h thng", 20, "Tr鬰 秐h Thng"},
    {"Truy t譵 Tuy謙 T譶h Th筩h", 20, "Tuy謙 T譶h Th筩h"},
    {"Truy t譵 L謓h B礽 T鎛g Qu秐 ngo筰 vi謓", 5, "L謓h b礽 t鎛g qu秐 ngo筰 vi謓"},
    {"Truy t譵 L謓h B礽 T鎛g qu秐 n閕 vi謓", 5, "L謓h b礽 t鎛g qu秐 n閕 vi謓"},
    {"Truy t譵 Vi謙 N� Ki誱", 5, "Vi謙 N� ki誱"},
    {"Truy t譵 Trang Ch� Kim 蕁", 15, "Trang ch� kim 蕁"},
    {"Truy t譵 Trng L穙 ch� ho祅", 20, "Trng L穙 Ch� Ho祅"},
}

---- 定时设定
function TaskShedule()
	-- 任务名字
	TaskName("nhi謒 v� thng nh藅 c� nh﹏".."nhi謒 v� thng nh藅 t� i")
	
	-- 24小时一次
	TaskInterval(24 * 60)
	
	TaskTime(0, 0)
	
	-- 重复执行无限次数
	TaskCountLimit(0)
	
	--local msg = "杀手堂活动于"..nHour.."时"..nMinute.."分开始！"
	--OutputMsg(format(msg))
end

-- 定时执行的内容
function TaskContent()
    local nPersonalTask = get_rand_item_by_table(DALIY_TASK_0912_PERSONAL_TASK_LIST, 100, 2);
    local nTeamTask = get_rand_item_by_table(DALIY_TASK_0912_TEAM_TASK_LIST, 100, 3);
    GlobalExecute(format("dw InitDaliyTask(%d, %d)", nPersonalTask, nTeamTask));
end

function get_rand_item_by_table(ITEM_PARAM, nMax, nDefault)
	local nPos = 0;
	local nRand = random(1, nMax);
	for i = 1, getn(ITEM_PARAM) do
		if nRand > nPos and nRand <= nPos + ITEM_PARAM[i][2] then
			return i;
		end
		nPos = nPos + ITEM_PARAM[i][2];
	end
	return nDefault;
end

