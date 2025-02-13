Include("\\RelaySetting\\Task\\shinynight_head.lua");

INTERVAL_TIME = 1440	-- 每24小时触发

function TaskShedule()
	TaskName("Иm Huy Ho祅g kinh nghi謒 nh﹏ i");	

	TaskInterval(INTERVAL_TIME);
	-- 设置触发时间
	local hour = TIME_START
	local min = 0
	TaskTime(hour, min);
	OutputMsg(format("Nhi謒 v� Иm Huy Ho祅g kinh nghi謒 nh﹏ i b総 u v祇 l骳 %d:%d...", hour, min));
	-- 执行无限次
	TaskCountLimit(0);
end

function TaskContent()
	OutputMsg("ShinyNight start......")
	-- 选择倍率	
	local multiple = GetGlbInt(RELAYGLB_MULTIPLE)
	if (multiple == 0) then
		multiple = get_multiple()
	end
	
	-- 设置今天晚上辉煌之夜的内容
	local system = GetShiningChoice()
	if (system == 0) then
		-- 获取保存的系统索引
		system = GetGlbInt(RELAYGLB_SYSTEM)
		if (system == 0) then
			system = get_random_system()
		end
	end
	
	-- 获得最NB的投票人的名字
	local szVoteName = GetVoteName()

	-- 公告
	local multiple_msg = map_sysnames[system][3]
	if (multiple_msg == 0) then
		multiple_msg = multiple / 100
	end
	local msg = format("Ho箃 ng Иm Huy Ho祅g  b総 u, t鑙 19:00-23:15, %sPh莕 thng%s h� th鑞g t╪g%1.1f l莕, hy v鋘g m鋓 ngi tham gia ng .",
		map_sysnames[system][1],
		map_sysnames[system][2],
		multiple_msg)
		
	-- 辉煌之夜开始
	SetGlbInt(RELAYGLB_SHINYNIGHT, 1)

	GlobalExecute(format("dw AddGlobalNews([[%s]])", msg))
	GlobalExecute(format("dw ShinyNight_Start(%d,%d,%s)", system, multiple, szVoteName))
	
	-- 清除relay中的记忆
	ClearShiningNight()
end
