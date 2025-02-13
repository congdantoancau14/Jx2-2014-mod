--跨服NPC接引人
Include("\\settings\\static_script\\exchg_server\\exchange_server_func.lua")

function main()
	local _,at_ggs = GetRealmType()
	if at_ggs == 0 then
		npc_talk_goto_ggs()
	elseif at_ggs == 1 then
		npc_talk_back_to_source_gs()
	end
end

function _goto_gs_or_ggs_pos(nPos, tPosition)
	local nPosidx = nPos
	if not nPos or not tPosition[nPos] then
		nPosidx = random(1, getn(tPosition))
	end
	
	local tPos = tPosition[nPosidx]
	local x,y = tPos[2], tPos[3]
	local x2, y2 = x + random(-3, 3), y + random(-3, 3);
	ChangeGroupWorld(tPos[1], x2, y2)
end

--跨服等待地图的坐标
t_ggs_svr_exit_pos ={
	{8899, 1310, 2693},
	{8899, 1405, 2800},
	{8899, 1490, 2743},
	{8899, 1366, 2608},
}

function goto_ggs_waiting_room()
	if 1 == _check_to_kuafu_condition() then
		SetTask(TASKID_EXCHG_SVR_TAG, 1, TASK_ACCESS_CODE_EXGSVR);
		_goto_gs_or_ggs_pos(nil, t_ggs_svr_exit_pos)
	end
end

t_source_gs_svr_exit_pos ={
	{300, 1855, 3550, "Th祅h Й"},
	{100, 1349, 2939, "Tuy襫 Ch﹗"},
	{150, 1780, 3119, "Dng Ch﹗"},
	{350, 1611, 2937, "Tng Dng"},
}

function back_to_source_gs(nPos)
	_goto_gs_or_ggs_pos(nPos, t_source_gs_svr_exit_pos)
end

function npc_talk_goto_ggs()
	local tbSay = {}
	local szTitle = "Ta c� th� a ngi n li猲 server, chu萵 b� xong ch璦?"
	tinsert(tbSay, "\nTa  chu萵 b� xong/goto_ggs_waiting_room")
	tinsert(tbSay, format("\n%s/nothing", "Ra kh醝"))
	Say(szTitle, getn(tbSay), tbSay)
end

function npc_talk_back_to_source_gs()
	local tbSay = {}
	local szTitle = "Ta co the dua cac ha tro ve khu vuc chuyen thoc, chuan bi xong chua?"
	for i= 1, getn(t_source_gs_svr_exit_pos) do
		local szCity = t_source_gs_svr_exit_pos[i][4] or ""
		tinsert(tbSay, format("%s%s/#back_to_source_gs(%d)", "Ta mu鑞 quay v�", szCity, i))
	end
	tinsert(tbSay, format("\n%s/nothing", "Ra kh醝"))
	Say(szTitle, getn(tbSay), tbSay)
end

function nothing()
end

