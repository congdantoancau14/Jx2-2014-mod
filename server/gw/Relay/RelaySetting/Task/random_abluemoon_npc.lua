-- =====================================================
-- 定时把月亮兔活动的npc放到随机位置的脚本
-- =====================================================

-- 定时设定
function TaskShedule()
	-- 任务名字
	TaskName("NPC ho箃 ng Tr╪g r籱 s� t飝 l骳 xu蕋 hi謓")
	
	-- 一个小时一次
	TaskInterval(60)
	
	-- 设置触发时间
	local nHour = tonumber(date("%H"))
	
	if nHour >= 22 or nHour <= 7 then  --23点到8点之间不触发
		nHour = 9
	else
		nHour = nHour + 1
	end
	
	-- 当前relay启动后下一个小时就加载起来
	TaskTime(nHour, 0)

	-- 重复执行无限次数
	TaskCountLimit(0)
	
	local msg = "Ti觰 th� s� xu蕋 hi謓 l骳"..nHour.." gi� 0 ph髏 xu蕋 hi謓 "
	OutputMsg(format(msg))
end;

-- 定时执行的内容
function TaskContent()

	--    城市地点：
	tMap = {
		{"Tuy襫 Ch﹗", 100, 1459, 2811},
		{"Bi謓 Kinh", 200, 1169, 2845},
		{"Th祅h Й", 300, 1653, 3559},
		{"Tng Dng", 350, 1436, 2808},
		{"Dng Ch﹗", 150, 1680, 3118},
		{"Чi L�", 400, 1485, 3018},
	}
		
	local nIndex = random(1, 6)
	local nHour = tonumber(date("%H"))
	if nHour < 23 and nHour > 8 then
		local msg="Ti觰 th� s� xu蕋 hi謓 � v� tr� m韎:"..tMap[nIndex][1].."!"
		OutputMsg(format(msg))
	
		-- 执行召唤随机商会npc的脚本
		GlobalExecute(format("dw abluemoon_start(%d)", nIndex))
	end
end;

