--=============================================
--create by baiyun 2009.5.30
--describe:越南版7月份活动之八烟花，烟花脚本
--=============================================
Include("\\script\\item\\yanhuo.lua");
Include("\\script\\online\\viet_event\\200907\\event_head.lua");

function OnUse(nItemIdx)
	local nDate = tonumber(date("%y%m%d%H"));
	local nDay = tonumber(date("%w"));
	local nHour = tonumber(date("%H"));
	if nDate < 09061900 or nDate >= 49071924 then
		Talk(1, "", "Ho箃 ng l莕 n祔  k誸 th骳");
		return
	end
	if GetLevel() < 50 then
		Talk(1, "", "Чi hi謕 v蒼 ch璦  c蕄 50, kh玭g th� s� d鬾g ph竜 hoa");
		return
	end
	if nDay == 1 or nDay == 2 or nDay == 3 then
		Talk(1, "", "Th阨 gian s� d鬾g ph竜 hoa l�: th� 5, 6,7, ch� nh藅 h籲g tu莕 trong kho秐g th阨 gian t� 16:00 � 24:00");
		return
	end
	if nHour < 16 then
		Talk(1, "", "Th阨 gian s� d鬾g ph竜 hoa l�: th� 5, 6,7, ch� nh藅 h籲g tu莕 trong kho秐g th阨 gian t� 16:00 � 24:00");
		return
	end
	if GetTask(TASK_LAST_USE_DATE) < tonumber(date("%y%m%d")) then
		SetTask(TASK_TODAY_USE_COUNT, 0);
		SetTask(TASK_USE_YANHUA_TIME, 0);
	end
	if GetTask(TASK_TODAY_USE_COUNT) >= CONST_MAX_USE_COUNT then
		Talk(1, "", "M鏸 ng祔 ch� 頲 s� d鬾g "..CONST_MAX_USE_COUNT.." ph竜 hoa");
		return
	end
	
	if tonumber(date("%H%M%S")) - GetTask(TASK_USE_YANHUA_TIME) < CONST_USE_YANHUA_INTERVAL  then
		Talk(1, "", "Gi穘 c竎h hai l莕 s� d鬾g ph竜 hoa l� 5 ph髏");
		return
	end
	
	if DelItemByIndex(nItemIdx, 1) ~= 1 then
		return
	end
	
	local nCount = getn(YANHUO_TABLE);
	local nIndex = random(1, nCount);
	local nRetCode = DoFireworks(YANHUO_TABLE[nIndex][2], YANHUO_TABLE[nIndex][3]);
	
	SetItemUseLapse(nItemIdx, CONST_USE_INTERVAL);	--冷却时间：5分钟
	
	SetTask(TASK_TODAY_USE_COUNT, GetTask(TASK_TODAY_USE_COUNT) + 1);
	SetTask(TASK_LAST_USE_DATE, tonumber(date("%y%m%d")));
	SetTask(TASK_USE_YANHUA_TIME, tonumber(date("%H%M%S")));
	gf_SetLogCaption("Hoat dong phao hoa viet nam");
	gf_Modify( "Exp", CONST_USE_GIVE_EXP);
	gf_SetLogCaption("");
	ModifyReputation(8,0)
	Msg2Player("B筺 nh薾 頲 8 甶觤 danh v鋘g.")
end