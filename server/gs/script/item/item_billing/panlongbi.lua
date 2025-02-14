------------------------------------------------------------
-- 大包白云散的脚本 dabaobaiyunsan.lua
--
-- comment: 打开后获得250个白云散
-- creator: Tony(Jizheng)
-- Date   : Jul 14th, 2006
--
-- Item ID:  2,1,486
-- 白云散ID: 1,0,4
------------------------------------------------------------
TSK_USE_PLB_DATE = 596
TSK_USE_HSB_DATE = 597
TSK_USE_PLB = 598
TSK_USE_HSB = 599

-- 脚本被程序默认调用的入口函数
function OnUse()
	-- Say("B筺 c� mu鑞 l蕐 <color=yellow>B祅 Long b輈h<color> i th祅h ti襫 game kh玭g? C� th� i 頲 <color=yellow>35<color> ti襫.",
		-- 2,
		-- "Л頲/open_panlongbi",
		-- "T筸 th阨 kh玭g m�/cancel_dialog")
end;

-- 退出对话，不做任何操作
function cancel_dialog()
end;

function open_panlongbi()
	local nDate = tonumber(date("%Y%m%d"));
	local nLimitTime = get_limit_time();
	if GetTask(TSK_USE_PLB_DATE) < nDate then
		SetTask(TSK_USE_PLB,0);
	end;
	local nCurUseTime = GetTask(TSK_USE_PLB);
	if nCurUseTime >= nLimitTime and nLimitTime ~= 0 then
		Talk(1,"","D鵤 v祇 ng c蕄 hi謓 t筰, h玬 nay b筺 ch� c� th� d飊g <color=yellow>"..nLimitTime.."<color> B祅 Long b輈h.");
		return 0;
	end;
	if (DelItem(2, 1, 1000, 1) == 1) then
		Earn(350000);
		SetTask(TSK_USE_PLB_DATE,nDate);
		SetTask(TSK_USE_PLB,nCurUseTime+1);
		if nLimitTime == 0 then
			Say("B筺 nh薾 頲 <color=yellow>35 ti襫 game<color>!",0);
		else
			Say("B筺 nh薾 頲 <color=yellow>35 ti襫 game<color>! H玬 nay b筺  d飊g B祅 Long b輈h l莕 th� <color=yellow>"..(nCurUseTime+1).."<color>. D鵤 v祇 ng c蕄 hi謓 t筰, h玬 nay b筺 c� th� d飊g <color=yellow>"..nLimitTime.."<color> B祅 Long b輈h.", 0)
			Msg2Player("H玬 nay b筺 ng th�"..(nCurUseTime+1).." l莕");
		end;
		WriteLog("[B祅 Long b輈h]:"..GetName().."H玬  l莕 "..(nCurUseTime+1).." l莕");
	else
		Say("B筺 kh玭g h� c�<color=yellow>B祅 long b輈h<color>!", 0)
	end
end;

function get_limit_time()
	local nLevel = GetLevel();
	local nLimitTime = 0;
	if nLevel <= 10 then
		nLimitTime = 1;
	elseif nLevel <= 20 then
		nLimitTime = 2;
	elseif nLevel <= 30 then
		nLimitTime = 3;
	elseif nLevel <= 40 then
		nLimitTime = 4;
	elseif nLevel <= 50 then
		nLimitTime = 5;
	elseif nLevel <= 60 then
		nLimitTime = 10;
	elseif nLevel <= 70 then
		nLimitTime = 20;
	elseif nLevel <= 75 then
		nLimitTime = 40;
	else
		nLimitTime = 0;
	end;
	return nLimitTime;
end;

