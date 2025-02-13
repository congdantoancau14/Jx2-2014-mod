-- =============================================================
-- FileName : wulinmeng_teshi.lua
-- Desc     : 武林盟特使的脚本,门派boss的功能
-- Date     : Dec 14 2006
-- Creator  : Tony(Jizheng)
-- =============================================================

Include("\\script\\online\\zgc_public_fun.lua")		--村长的公共函数
Include("\\script\\task\\killer_hall\\killer_hall_head.lua");	--杀手堂内容
Include("\\script\\lib\\writelog.lua")

TASK_ID_LAST_GET_DATE = 88			-- 上次领取任务的时间,任务变量ID
TASK_ID_HAVE_GOT_TODAY = 89			-- 今天是否已经领取了任务,任务变量ID

-- 默认对话入口
--function main()
--	if GetPlayerFaction() == 0 then				--2007劳动节增加师门历练活动
--		Say("<color=green>武林盟特使<color>：如今江湖纷乱，各大门派抛开门户之见，选出本门高手在一起切磋武学，以期挑出资质上佳的武林弟子传授本门绝学和神兵利器，现在委托我推举各大门派的后起之秀，传以绝学，少侠要不要了解看看。",
--			6,
--			"我要报名申请试练/get_boss_task_now",
--			"不知道是哪些武林前辈/get_boss_info",
--			"这些武林前辈出现在何处/get_bossweizhi_info",		
--			"如何才能获得绝学和神兵/get_prize_info",
--			"江湖历练活动/#labor_07_dia_main(2)",
--			"有空再来看看/cancel_dialog")
--			return
--	else
--		Say("<color=green>c s� V� L﹎<color>: ：如今江湖纷乱，各大门派抛开门户之见，选出本门高手在一起切磋武学，以期挑出资质上佳的武林弟子传授本门绝学和神兵利器，现在委托我推举各大门派的后起之秀，传以绝学，少侠要不要了解看看。",
--			5,
--			"我要报名申请试练/get_boss_task_now",
--			"不知道是哪些武林前辈/get_boss_info",
--			"这些武林前辈出现在何处/get_bossweizhi_info",		
--			"如何才能获得绝学和神兵/get_prize_info",
--			"有空再来看看/cancel_dialog")
--			return		
--	end
--end;

function get_factionboss_task()
	
		Say("<color=green>c s� V� L﹎<color>: V� l﹎ giang h� i lo筺, <color=yellow>c竎 i m玭 ph竔<color> 產ng ch鋘 trong b鎛 m玭 m閠 cao th� c� t� ch蕋 phi ph祄  truy襫 th� tuy謙 h鋍 v� th莕 binh c馻 b鎛 m玭. <color=yellow>C竎 i m玭 ph竔<color> nh� ta ti課 c� ngi 璾 t� nh蕋 c馻 c竎 m玭 ph竔, thi誹 hi謕 mu鑞 t譵 hi觰 kh玭g?",
			6,
			"Ta mu鑞 b竜 danh tham gia th� luy謓/get_boss_task_now",
			"Kh玭g bi誸 l� v� v� l﹎ ti襫 b鑙 n祇/get_boss_info",
			"V� ti襫 b鑙 n祔 b﹜ gi� 產ng � u/get_bossweizhi_info",		
			"L祄 th� n祇  c� 頲 tuy謙 h鋍 v� th莕 binh/get_prize_info",
			"Ta mu鑞 tham gia l辌h luy謓 giang h�/#labor_07_dia_main(2)",
			"Khi r秐h ta s� quay l筰!/cancel_dialog")
			return	
end
function main()
	local selTab = {
				"Ta mu鑞 d飊g 2 l謓h b礽 s� m玭 i m苩 n� S竧 Th� Л阯g/want_mask",
				"Ta mu鑞 mua m苩 n� S竧 Th� Л阯g (60 v祅g)/buy_mask",
				"Nghe n鉯 產ng c� ho箃 ng th� luy謓 S� m玭/get_factionboss_task",
				"Ta mu鑞 tham gia l辌h luy謓 giang h�/#labor_07_dia_main(2)",
				"Khi r秐h ta s� quay l筰!/cancel_dialog",
				}
	Say("<color=green>c s� V� L﹎<color>: T筰 <color=yellow>Tr骳 Ty чng t莕g 2<color>, S竧 th� 阯g do t� i 竎 nh﹏ <color=yellow>Nh﹏  ph� - L� Чi Ch駓<color> tr蕁 th� v祇 l骳 <color=yellow>12:30-13:30<color> v� <color=yellow>21:00-22:00<color> m鏸 ng祔 s� tri謚 h錳 m閠 s� s竧 th� t� b猲 ngo礽. N誹 ngi c� 2 l謓h b礽 s� m玭, ta s� t苙g ngi 1 m苩 n� S竧 Th� Л阯g  甶 v祇 S竧 th� 阯g nh b筰 nh鱪g t猲 b筰 ho筰 c馻 V� L﹎. Tuy nhi猲 ngi c莕 ph秈 luy謓 th祅h <color=red>v� c玭g cao c蕄 b鎛 m玭<color>.",getn(selTab),selTab);
end;

function want_mask()
	local nFaction = GetPlayerFaction();
	if nFaction == 0 then
		Talk(1,"","<color=green>c s� V� L﹎<color>: Ch璦 gia nh藀 m玭 ph竔, t鑤 h琻 ng bc ch﹏ v祇 S竧 th� 阯g!");
		return 0;
	end;
	if KH_Check_Skill_Level() ~= 1 then
		Talk(1,"","<color=green>c s� V� L﹎<color>: C莕 ph秈 h鋍 th祅h th鬰 v� c玭g cao c蕄 r錳 m韎 n g苝 ta.");
		return 0;
	end;
	local nDate = tonumber(date("%y%m%d"));
	if GetTask(KH_TASK_GOT_MASK_DATE) >= nDate then
		Talk(1,"","<color=green>c s� V� L﹎<color>: M苩 n� S竧 th� 阯g n祔 ch� t筼 kh玭g ph秈 d�, ng祔 mai h穣 quay l筰.");
		return 0;
	end;
	if gf_JudgeRoomWeight(1,20) ~= 1 then
		Talk(1,"","<color=green>c s� V� L﹎<color>: Kho秐g tr鑞g h祅h trang ho芻 s鴆 l鵦 kh玭g , xin ki觤 tra l筰!");
		return 0;
	end;
	if DelItem(tFactionTokenRing[nFaction][1],tFactionTokenRing[nFaction][2],tFactionTokenRing[nFaction][3],2) == 1 then
		SetTask(KH_TASK_GOT_MASK_DATE,nDate);
		AddItem(tItemInfo[1][2],tItemInfo[1][3],tItemInfo[1][4],1)
		Msg2Player("Nh薾 頲 1"..tItemInfo[1][1]);
	else
		Talk(1,"","<color=green>c s� V� L﹎<color>: S� l謓h b礽 s� m玭 mang theo kh玭g , c莕 ph秈 c�  <color=yellow>2 l謓h b礽 s� m玭<color>  ch鴑g minh n╪g l鵦!");
	end;
end;

function buy_mask()
	if gf_JudgeRoomWeight(1,20) ~= 1 then
		Talk(1,"","<color=green>c s� V� L﹎<color>: Kho秐g tr鑞g h祅h trang ho芻 s鴆 l鵦 kh玭g , xin ki觤 tra l筰!");
		return 0
	end
	if GetCash() < 600000 then
		Talk(1,"","<color=green>c s� V� L﹎<color>: Ngi kh玭g c�  ti襫 m� mu鑞 mua �!");
		return 0
	else
		if Pay(600000) == 1 then
			gf_AddItemEx2({2,1,1087,1}, "M苩 N� S竧 Th� Л阯g", "Hoat dong thang 5", "mua", 24*60*60)
		else
			return 0
		end
	end
end


-- 退出对话的函数
function cancel_dialog()
end;

-- 获得武林前辈的介绍
function get_boss_info()
	Talk(3, "", 
		 "Giang h� i lo筺 k� t� khi B� Phi Y猲 畂箃 Sinh Th莕 Cng.", 
		 "<color=yellow>C竎 i m玭 ph竔<color> 產ng chi猽 m� anh h祇 ki謙 xu蕋  truy襫 th� tuy謙 th� v� c玭g v� ch� t筼 th莕 kh�.",
		 "C竎 v� cao th� n祔 g錷: Trng l穙 <color=yellow>Huy襫 Ch﹏_Thi誹 L﹎ <color>, i hi謕 <color=yellow>Thanh Th璤V� ng<color>, s� th竔 <color=yellow>Tu� Minh_Nga My<color>, У ch� <color=yellow>Ho祅g Ch輓h Nh蕋_C竔 Bang<color>, nghi trng <color=yellow>Л阯g H鸰Л阯g M玭<color>, tng qu﹏ <color=yellow>Dng Di猲 c_Thi猲 Ba Dng Ph� <color>, v� <color=yellow>C� M芻 t� hi謕_Ng� чc <color>.")
end;

-- 获得神兵和绝学的取得途径介绍
function get_prize_info()
	Talk(3, "", 
		 "M鏸 th� 6, 7 ch� nh蕋 h祅g tu莕, l骳 <color=yellow>21:00<color> c竎 v� cao th� s� xu蕋 hi謓 b猲 ngo礽 c竎 m玭 ph竔. Trc ti猲 h穣 n ch� ta b竜 danh  ta xem n╪g l鵦 c馻 ngi th� n祇.", 
		 "N╪g l鵦 kh玭g  th� c竎 ngi kh玭g th� nh薾 <color=yellow>V藅 ph萴<color>. N誹 nh� nh b筰 c竎 v� cao th� ch鴑g minh 頲 n╪g l鵦 c馻 m譶h, th� c竎 ngi s� nh薾 頲 <color=yellow>t骾 b秓 b鑙<color> trong   m藅 t辌h v� h鋍 v� v藅 ph萴 b� truy襫 c馻 s� m玭.",
		 "Ngo礽 m藅 t辌h v� h鋍 v� v藅 ph萴 b� truy襫 c馻 s� m玭 ngi c遪 c� c� may nh薾 頲 c竎 v藅 ph萴 kh竎, ch� c莕 chi課 th緉g c竎 b薱 cao th� , h穣 c� l猲 !")
end;

-- 报名申请试练
function get_boss_task_now()
	-- 玩家等级要求超过75级
	local nPlayerLevel = GetLevel()
	if (nPlayerLevel < 75) then
		Say("Xem ngi t� ch蕋 c騨g kh玭g t�, nh璶g kinh nghi謒 giang h� c遪 non qu�, n <color=yellow>c蕄 75<color> quay l筰 t譵 ta!", 0)
		return
	end
	
	-- 55级技能需要学满
	local bHaveLearnFullSkill = get_full_skill_level()
	if (bHaveLearnFullSkill == 0) then
		Say("<color=yellow>V� h鋍 c馻 b鎛 m玭<color> ngi h穣 luy謓 cho tinh th玭g r錳 h穣 n t譵 ta.", 0)
		return	
	end
	
	local nLastGetTaskDate = GetTask(TASK_ID_LAST_GET_DATE)		-- 上次接任务是什么时候
	local nCurrTime = {date("%y"), date("%m"), date("%d"), date("%H"), date("%w")}
	local nCurDay = tonumber(nCurrTime[1]..nCurrTime[2]..nCurrTime[3])
	local nCurHour = tonumber(nCurrTime[4])
	local nCurWeekDay = tonumber(nCurrTime[5])
	
	if ((nCurWeekDay == 0 or nCurWeekDay == 5 or nCurWeekDay == 6) and (nCurHour >= 0 and nCurHour < 20)) then
		if (nLastGetTaskDate < nCurDay) then
			nLastGetTaskDate = nCurDay
			SetTask(TASK_ID_LAST_GET_DATE, nLastGetTaskDate)
			SetTask(TASK_ID_HAVE_GOT_TODAY, 1)
		end
		Say("Ngi chu萵 b� khi猽 chi課 v韎 c竎 b薱 cao th� ch鴑g minh th鵦 l鵦 c馻 m譶h. M鏸  th� 6, 7 ch� nh藅 l骳 <color=yellow>21:00<color> c竎 v� cao th� s� xu蕋 hi謓 b猲 ngo礽 c竎 m玭 ph竔. C� l猲!", 0)
		WriteLogEx("Boss su mon","nh薾 nhi謒 v�")
	else
		Say("<color=yellow>M鏸 th� 6, 7 v� ch� nh藅 h祅g tu莕 t� 0:00- 20:00<color>, c� th� n y b竜 danh. Hi謓  qu� th阨 gian, n誹 ngi v蒼 ch璦 b竜 danh th� l莕 sau quay l筰 nh�! <color=yellow>21:00<color> c竎 ti襫 b鑙 V� l﹎ s� xu蕋 hi謓 t筰 c竎 m玭 ph竔.", 0)
	end
end;

-- 获得55级技能是否已经学满了
function get_full_skill_level()
	local nRet = 0
	
	local nPlayerRoute = GetPlayerRoute()
	
	if (nPlayerRoute == 2) then				-- 少林俗家
		if (GetSkillLevel(31) == 7) then	-- 达摩武经
			nRet = 1
		end
	elseif (nPlayerRoute == 3) then			-- 少林禅宗
		if (GetSkillLevel(56) == 7) then	-- 大力金刚指
			nRet = 1
		end
	elseif (nPlayerRoute == 4) then			-- 少林武宗
		if (GetSkillLevel(43) == 7) then	-- 少林龙爪手
			nRet = 1
		end
	elseif (nPlayerRoute == 6) then			-- 唐门
		if (GetSkillLevel(73) == 7) then	-- 满天花雨
			nRet = 1
		end
	elseif (nPlayerRoute == 8) then			-- 峨嵋佛家
		if (GetSkillLevel(88) == 7) then	-- 大慈大悲咒
			nRet = 1
		end
	elseif (nPlayerRoute == 9) then			-- 峨嵋俗家
		if (GetSkillLevel(101) == 7) then	-- 迷心飘香曲
			nRet = 1
		end
	elseif (nPlayerRoute == 11) then		-- 丐帮净衣
		if (GetSkillLevel(112) == 7) then	-- 醉拳
			nRet = 1
		end
	elseif (nPlayerRoute == 12) then		-- 丐帮污衣
		if (GetSkillLevel(123) == 7) then	-- 打狗棍法
			nRet = 1
		end
	elseif (nPlayerRoute == 14) then		-- 武当道家
		if (GetSkillLevel(145) == 7) then	-- 真武七截剑
			nRet = 1
		end
	elseif (nPlayerRoute == 15) then		-- 武当俗家
		if (GetSkillLevel(158) == 7) then	-- 上清无极功
			nRet = 1
		end
	elseif (nPlayerRoute == 17) then		-- 杨门枪骑
		if (GetSkillLevel(731) == 7) then	-- 碧月飛星枪
			nRet = 1
		end
	elseif (nPlayerRoute == 18) then		-- 杨门弓骑
		if (GetSkillLevel(744) == 7) then	-- 流光绝影箭
			nRet = 1
		end
	elseif (nPlayerRoute == 20) then		-- 五毒邪侠
		if (GetSkillLevel(377) == 7) then	-- 尸裂神功
			nRet = 1
		end
	elseif (nPlayerRoute == 21) then		-- 五毒蛊师
		if (GetSkillLevel(363) == 7) then	-- 蛊魔
			nRet = 1
		end
	end
	
	return nRet
end;

-- 获得武林前辈的位置说明
function get_bossweizhi_info()
	Talk(1, "", 
		 "\n Trng l穙 Thi誹 L﹎ <color=yellow>Huy襫 Ch﹏<color> � <color=yellow>(172.202)<color>. \n Чi hi謕 V� ng <color=yellow>Thanh Th�<color> � <color=yellow>(197.211)<color>. \n S� th竔 Nga My <color=yellow>Tu� Minh<color> � <color=yellow>(209.211)<color>. \n У ch� C竔 Bang <color=yellow>Ho祅g Ch輓h Nh蕋<color> � <color=yellow>(185.202)<color>. \n Nghi Trng Л阯g M玭 <color=yellow>Л阯g H�<color> � <color=yellow>(196.187)<color>. \n Tng Qu﹏ Thi猲 Ba Dng Ph� <color=yellow>Dng Di猲 c<color> � <color=yellow>(209.206)<color>. \n T� Hi謕 Ng� чc <color=yellow>C� M芻<color> � <color=yellow>Ng� чc (213.200)<color>.")
end;

