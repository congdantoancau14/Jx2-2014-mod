--每天12:00,19:00准时刷新

function TaskShedule()
	TaskName("T筼 m韎 NPC L﹏ S�...");	

	-- 一天一次
	TaskInterval(1440);
	-- 设置触发时间
	TaskTime(19,00);
	-- 执行无限次
	TaskCountLimit(0);

end

function TaskContent()
	local nDate = tonumber(date("%Y%m%d")) + random(10000);
	GlobalExecute(format("dw Ws_CreateWushiNpc(%d)", tonumber(nDate)));
end