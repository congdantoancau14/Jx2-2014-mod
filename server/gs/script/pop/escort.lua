--神秘烟火
--Include("\\script\\missions\\yp\\yp_head.lua")
Include("\\script\\task\\world\\task_var_id.lua");
Include("\\script\\task\\world\\task_trigger_list.lua");
Include("\\script\\task\\world\\task_head.lua");
Include("\\script\\misc\\observer\\observer_head.lua")
Include("\\script\\lib\\talktmp.lua");
Include("\\script\\lib\\npccmdhead.lua")

--一共需要五个哦，五个！！！！
TASK_ID_ESCORT_LYH	3378
TASK_ID_ESCORT_LL1	3379
TASK_ID_ESCORT_LL2	3380
TASK_ID_ESCORT_LL3	3381
TASK_ID_ESCORT_LL4	3382
TASK_ID_ESCORT_LLTM	3383
TASK_ID_ESCORT_DEATH 3384

function BeginEscort()
	if tGtCondition:check_taskid(591, 2) ~= nil then
		local nNpcIdx = CreateNpc("H� tr緉g", "Ti猽 S� L﹎ Nguy猲 H筼", GetWorldPos());
		SetTask(TASK_ID_ESCORT_LYH, nNpcIdx);
		g_NpcAI:setAI(nNpcIdx,AT_SM_MOVE);
		g_NpcAI:setWayPoint(nNpcIdx,{{1751, 3552}});
		
		--挂上区域触发器
		CreateTrigger(2, 1815);
	end
end

function RectTrigger()		--坐标触发器
	RemoveTrigger(GetRunningTrigger());

	for i =1, 4 do
		local nIdx = CreateNpc("H� tr緉g", "Thi猲  Gi竜-L﹗ La Cp Ti猽", GetWorldPos());
		SetNpcScript(nIdx, "\\script\\pop\\escort.lua");
		SetTask(TASK_ID_ESCORT_LYH + i, nIdx);
	end
	
	local nIdx = CreateNpc("H� tr緉g", "Thi猲  Cp Ti猽 u M鬰", GetWorldPos());
	SetNpcScript(nIdx, "\\script\\pop\\escort.lua");
	SetTask(TASK_ID_ESCORT_LLTM, nIdx);
	
	Talk(1, "", "N祔 anh em, l筰 c� ngi t� nguy猲 d﹏g hi課 r錳! H穣 c飊g nhau l猲 cho ta!");
end

--function DeathTrigger()		--OnDeath 也可以
function OnDeath()		--天阴XX
	--全部死光
	SetTask(TASK_ID_ESCORT_DEATH, GetTask(TASK_ID_ESCORT_DEATH) + 1);
	
	if mod(GetTask(TASK_ID_ESCORT_DEATH), 5) ~= 0 then --非零
		return;
	end
	
	--重新开始走动
	local nNpcIdx = GetTask(TASK_ID_ESCORT_LYH);
	g_NpcAI:setAI(nNpcIdx,AT_SM_MOVE);
	--根据当前的点处理下一步的移动
	local nMapID, nMapX, nMapY = GetWorldPos();
	if nMapX == 1726 and nMapY == 3472 then	-- 完成任务
		SetNpcLiftTime(nNpcIdx, 0);
	end
	g_NpcAI:setWayPoint(nNpcIdx,{{1726, 3472}});
end

function Fail()
	--1、把记录林元昊NPCID的任务变量设为0
		--1、补充：其他NPCID也是置为0
	--2、还要把林元昊这个任务置为未接。。。这样就可以重接了
	if tGtCondition:check_taskid(591, 2) ~= nil then
		for i = TASK_ID_ESCORT_LYH, TASK_ID_ESCORT_DEATH do
			SetTask(i, 0);
		end
		
		tGtTask:set_task(3, 591);	--取消任务
		Talk(1, "", "Nhi謒 v� h� t鑞g  th蕋 b筰, i hi謕 h穣 ti誴 t鬰 c� g緉g n祇!");
	end
end