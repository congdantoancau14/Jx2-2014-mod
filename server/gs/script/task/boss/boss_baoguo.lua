--三大boss掉的小包裹
--by vivi
--2008/12/10
Include("\\script\\lib\\globalfunctions.lua");

TSK_GET_ITEM_TIME = 584; --记录拾起包裹的日期 每天一次
TSK_GET_ITEM_COUNT_BYTE = 1;
TSK_GET_ITEM_DAY_BYTE = 2;
TSK_GET_ITEM_MONTH_BYTE = 3;


function main()
	local npcIndex = GetTargetNpc()
	local nDay = tonumber(date("%d"))
	local nMonth = tonumber(date("%m"))

	if gf_GetTaskByte(TSK_GET_ITEM_TIME, TSK_GET_ITEM_DAY_BYTE) ~= nDay or gf_GetTaskByte(TSK_GET_ITEM_TIME, TSK_GET_ITEM_MONTH_BYTE) ~= nMonth then
		gf_SetTaskByte(TSK_GET_ITEM_TIME, TSK_GET_ITEM_COUNT_BYTE, 0)
	end
	
	if gf_GetTaskByte(TSK_GET_ITEM_TIME, TSK_GET_ITEM_COUNT_BYTE) >= 4 and GetItemCount(2,1,29000) < 1   then
		Talk(1,"","M鏸 ng祔 ch� c� th� nh苩 t鑙 產 4 t骾")
		return 0
	end
	
	local nWait = 300 - (GetTime() - GetUnitCurStates(npcIndex, 6))
	if nWait > 0  and GetItemCount(2,1,29000) < 1  then
		Talk(1,"","C遪 "..nWait.." gi﹜ m韎 c� th� nh苩 t骾!")
		return 0
	end
	
	local nDelay = 5 - (GetTime() - GetTask(2278))
	if nDelay > 0  and GetItemCount(2,1,29000) < 1  then
		Talk(1,"","Sau "..nDelay.." gi﹜ m韎 c� th� nh苩 t骾 ti誴 theo!")
		return 0
	end
	
	-- 把自己删除
	local nSelfIndex = GetTargetNpc()
	SetNpcLifeTime(nSelfIndex, 0)	

	gf_SetTaskByte(TSK_GET_ITEM_TIME, TSK_GET_ITEM_DAY_BYTE, nDay)
	gf_SetTaskByte(TSK_GET_ITEM_TIME, TSK_GET_ITEM_MONTH_BYTE, nMonth)
	gf_SetTaskByte(TSK_GET_ITEM_TIME, TSK_GET_ITEM_COUNT_BYTE, gf_GetTaskByte(TSK_GET_ITEM_TIME, TSK_GET_ITEM_COUNT_BYTE) + 1)
	SetTask(2278, GetTime())
	
	local nLv = GetLevel();
	local nExp = nLv^3*2;
	ModifyExp(nExp);
	Msg2Player("B筺 nh薾 頲 "..nExp.."Kinh nghi謒");
	local nRand = random(1,10000);
	if nRand <= 5 then
		AddItem(0,102,15,1,1,2,24,3,14,0,0);
	elseif nRand <= 10 then
		AddItem(0,102,20,1,1,2,24,3,14,0,0);
	end
	if nRand <= 9975 then
		gf_EventGiveCustomAward(3, 10, "Tui boss The Gioi")
	else
		gf_AddItemEx2({2, 1, 30071, 1}, "Nh﹏ S﹎ V筺 N╩", "Tui boss The Gioi")
	end

end