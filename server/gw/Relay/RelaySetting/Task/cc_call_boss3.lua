--每天8:30；12:30；17:30；22:30准时刷新，每日共四轮

function TaskShedule()
	TaskName("L祄 m韎 Th� T� BOSS ");	

	-- 一天一次
	TaskInterval(1440);
	-- 设置触发时间
	TaskTime(17,30);
	OutputMsg(format("Th� T� BOSS  t筰 %s xu蕋 hi謓...", "17:30"));
	-- 执行无限次
	TaskCountLimit(0);

end

function TaskContent()
	local nDate = tonumber(date("%Y%m%d")) + random(10000);
	GlobalExecute(format("dw Cc_CreateBoss(%d)", tonumber(nDate)));
end