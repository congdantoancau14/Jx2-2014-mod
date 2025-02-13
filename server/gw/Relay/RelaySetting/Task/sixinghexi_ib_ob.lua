-- =====================================================
-- 定时把四位神仙npc放到随机位置的脚本
-- =====================================================
g_nTotalNpcCount = 4;	--NPC总数
g_nTotalCityCount = 13;	--城市总数
g_nLastNpcIdx = 0;		--上次刷的NPC的编号，初始值是0
g_nLastCityIdx = 1;		--上次刷NPC的城市的编号，初始值是1
g_nInterValTime = 15;	--触发的间隔时间
-- 定时设定
function TaskShedule()
	-- 任务名字
	TaskName("Open IB: T� Tinh Gia H�")
	
	-- 15分钟触发一次
	TaskInterval(g_nInterValTime)
	
	-- 设置触发时间
	local nHour = tonumber(date("%H"))
	local nMin = tonumber(date("%M"))
	nMin = mod((floor(nMin/g_nInterValTime)+1)*g_nInterValTime,60)
	if nMin == 0 then
		nHour = nHour + 1; --如果在x点48分启动的话，那么就在x+1点0分创建NPC
	end;
	--Relay启动后下一个quarter执行
	TaskTime(nHour, nMin)

	-- 重复执行无限次数
	TaskCountLimit(0)
	
	local msg = "Open IB: Ho箃 ng T� Tinh Gia H�, Th阨 gian t筼 NPC l莕 1 l�"..nHour.." gi� "..nMin.." Ph髏 "
	OutputMsg(format(msg))
end;

-- 定时执行的内容
function TaskContent()
	local nDate = tonumber(date("%y%m%d"));
	if nDate >= 070415 and nDate < 070601 then
		local nNpcIdx,nCityIdx = get_next_npc_city(g_nLastNpcIdx,g_nLastCityIdx)
		local msg=nNpcIdx.."Th莕 ti猲 xu蕋 hi謓 t筰"..nCityIdx.."B秐  s�"
		OutputMsg(format(msg))
		g_nLastNpcIdx = nNpcIdx;
		g_nLastCityIdx = nCityIdx;
		GlobalExecute(format("dw Create_SiXing_IB_OB(%d,%d)", nNpcIdx,nCityIdx))
	end
end;

function get_next_npc_city(nCurNpcIdx,nCurCityIdx)
	local nNextNpcIdx,nNextCityIdx = 0,0;
	nNextNpcIdx = mod(nCurNpcIdx,g_nTotalNpcCount)+1;
	local nRand = random(2,g_nTotalCityCount);
	nNextCityIdx = mod(nCurCityIdx+nRand-2,g_nTotalCityCount)+1;
	return nNextNpcIdx,nNextCityIdx;
end;


