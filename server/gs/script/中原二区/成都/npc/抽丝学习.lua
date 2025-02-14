-- =========================================
-- File : 中原二区，成都，抽丝学习.lua
-- Name : 黄大婶
-- ID   : 0, 6
-- =========================================
Include("\\script\\task\\lifeskill\\lifeskill_task_head.lua");

--*****************************************定义常量及预处理***************************************
ID_LEARNLIFESKILL		= 1925		-- 新手任务标示（本脚本中不改该值）
LEVELTASKID49			= 518		-- 花笼百鸟裙
TASK49_BEGGING			= 1933		-- 49级晋级任务开始标示
FORGETMAIN_NUM			= 1940		-- 遗忘主技能次数
FORGETOHTER_NUM			= 1941		-- 遗忘主技能次数
strName = "";
strTitle = "";

--*****************************************MAIN函数*****************************************
function main()
	 if GetAntiEnthrallmentStatus() > 1 then
	 	Talk(1,"","Х qu� 5 gi� ch琲, h穣 ngh� ng琲  gi� g譶 s鴆 kh醗!")
	 	return
	 end
	strName = GetTargetNpcName()
	if random(1,30) == 1 then
		NpcChat(GetTargetNpc(),"Mu鑞 l祄 c玭g c� ph遪g v� c� linh kh�, nh蕋 nh ph秈 d飊g t� t鑤 m韎 頲!");
	end;
	if (strName == "" or strName == nil) then
		return
	end
	strTitle = "<color=green>"..strName.."<color>: "
	
	-----------------------------------------新手任务-----------------------------------------
    if (GetTask(ID_LEARNLIFESKILL) < 15) then
        Say(strTitle.."дn <color=yellow>C蕄 10<color> c� th� n <color=yellow>Th祅h Й<color> g苝 <color=yellow>Du Phng i phu<color> t譵 hi觰 <color=yellow>k� n╪g s鑞g<color>!", 0)
        TaskTip("дn c蕄 10 c� th� n Th祅h Й t譵 Du Phng i phu.")
        return 
    end
    

 ----------------------------------76级武器配方山狮精皮任务----------------------------------
	local nSkillGenre, nSkillDetail = GetMainLifeSkill()
	local nSkillLevel = GetLifeSkillLevel(nSkillGenre, nSkillDetail)
	local nTaskState_shanshi = GetTask(TASK_WEAVE_SHANSHI)
		
	if (nSkillGenre == 1 and nSkillDetail == 5 and nSkillLevel >= 79) then
		--与黄大婶对话
		if (nTaskState_shanshi == 4) then
			weave_shanshi_009()
			return
		--未回去回复锦娘
		elseif (nTaskState_shanshi == 5) then
			weave_shanshi_010()
			return
		end
	end
		
	--提示玩家76级武器配方任务
	if (nSkillGenre == 1 and nSkillDetail <= 8 and nSkillLevel >= 79 and 
		GetTask(1600) == 0 and GetTask(1602) == 0 and 
		GetTask(1603) == 0 and GetTask(1604) == 0 and 
		GetTask(1605) == 0) then 
		weapon_76_recipe_tip(nSkillDetail);
		return
	end		

---------------------------------------------主对话-------------------------------------------
	Say(strTitle.."T譵 頲 Thi猲 T祄 Ti l� l� tng duy nh蕋 c馻 cu閏 i ta, ng ti猚 ta  gi� r錳 kh玭g th� tr蘯 o vt su鑙, ch� c� th� g鰅 g緈 tr竎h nhi謒 n祔 cho b鋘 tr� c竎 ngi, mu鑞 h鋍 c竎h k衞 t� kh玭g?",
		8,
		"уng �/luaLearnLifeSkill",
		"Mu鑞 h鋍 k� n╪g cao c蕄 h琻/update_max_skill_level",
		"дn Kh玭g Tang s琻 (s� c蕄)/GotoWorld_Confirm1",
		"дn C玭 Ng� s琻 (trung c蕄)/GotoWorld_Confirm2",
		"дn T� Tang s琻 (cao c蕄)/GotoWorld_Confirm3",
		--"遗忘抽丝技能/forget_life_skill",
		"T譵 hi觰 k衞 t�/Info",
		"Ch糿g hay i th萴 c� b竛 Ng鋍 N� thoa kh玭g?/buy_chucnuthoa",
    	"R阨 kh醝/Main_Exit")
end;

function buy_chucnuthoa()
	Say(strTitle.."Ng鋍 N� thoa th� ta c� nh璶g kh玭g b竛. N誹 b筺 tr� mu鑞 th� ta s� t苙g ngi nh璶g ta c騨g c莕 c� 10 kh骳 <color=yellow>Chng m閏<color>. Kh玭g bi誸 c竎 h� c� th� ki誱 頲 kh玭g?",2,
		"C� ch�, ta c� s絥 th� i th萴 c莕 y r錳/check_materials",
		"T筸 th阨 ch璦 c�,  ta ki誱 r錳 g苝 i th萴 sau/Main_Exit"
	)
end;

function check_materials()
	if DelItem(2,7,2,10) == 1 then 
		Talk(1,"",strTitle.."Hay qu�! Kh玭g ng� ngi c騨g t譵 頲 lo筰 g� n祔. Ng鋍 n� thoa c馻 ngi y!");
		AddItem(0,200,21,1);
		Talk(1,"",format("<color=green>%s<color>:  t� i th萴! Khi c莕 ta s� t韎 nh� i th萴 n鱝 nh�!",GetName()));
		return 1;
	else
		Talk(1,"",strTitle.."H譶h nh� ngi ch璦 chu萵 b� ! Nh� l� ph秈 ng Chng m閏 y nh�. Lo筰  m韎 th輈h h頿 d飊g l祄 thoi.");
		return 0;
	end
end;

-- 遗忘生活技能
function forget_life_skill()
	if (GetLifeSkillLevel(0, 6) > 0) then
		local nForgetTimes = GetTask(FORGETOHTER_NUM)	-- 辅技能
		local nShouldPay = 5000
		if (nForgetTimes == 0) then
			nShouldPay = 5
		elseif (nForgetTimes == 1) then
			nShouldPay = 50
		elseif (nForgetTimes == 2) then
			nShouldPay = 500
		end
	
		Say(strTitle.."Зy l� l莕 th� "..(nForgetTimes + 1)..", ngi h駓 k� n╪g thu th藀, ta ph秈 thu"..nShouldPay.." lng, ngi suy ngh� k� ch璦?",
			2,
			"Ta  quy誸 nh r錳!/forget_now",
			"Khoan ! Ch� ta suy ngh� l筰!/SayHello")
	else
		Say(strTitle.."Ngi ch璦 h鋍 k� n╪g k衞 t�? Ta kh玭g th� gi髉 ngi!", 0)
	end
end;
function forget_now()
	local nForgetTimes = GetTask(FORGETOHTER_NUM)	-- 辅技能
	local nShouldPay = 5000
	if (nForgetTimes == 0) then
		nShouldPay = 5
	elseif (nForgetTimes == 1) then
		nShouldPay = 50
	elseif (nForgetTimes == 2) then
		nShouldPay = 500
	end
	local nShouldPayMoney = nShouldPay * 100
	
	if (GetLifeSkillLevel(0, 6) > 0) then
		if (Pay(nShouldPayMoney) == 1) then
			local nRet = AbandonLifeSkill(0, 6)
			if (nRet == 0) then
				Earn(nShouldPayMoney)
			else
				SetTask(FORGETOHTER_NUM, nForgetTimes + 1)
				SetTask(LEVELTASKID49, 0)
				Msg2Player("K� n╪g k衞 t� c馻 ngi  h駓")				
			end
		else
			Say(strTitle.."Ngi kh玭g mang theo  ti襫! L蕐 ti襫 r錳 h穣 n nh�!", 0)
		end
	end
end;



------------------------------------------ 学习生活技能--------------------------------------
function luaLearnLifeSkill()
    if (GetLevel() < 10) then
        Say (strTitle.."H鮩� Th﹏ th� c馻 ngi c遪 k衜 l緈. H穣 ra ngo礽 th祅h tu luy謓 n c蕄 10 h穣 n t譵 ta!", 0)
		return
	end

	-- 判断是否已经学会了采集技能 - 抽丝
	if (GetLifeSkillLevel(0, 6) > 0) then
        Say (strTitle.."B筺 tr�! Ngi  h鋍 xong k� n╪g k衞 t�!", 0)
		return
	end

	if GetLifeSkillsNum(0)>=2 then
        Say (strTitle.."B筺  h鋍 2 K� n╪g thu th藀, kh玭g th� h鋍 th猰 n鱝!",0)
		return
	end

	Say(strTitle.."Ngi mu鑞 h鋍 k� n╪g <color=yellow>k衞 t�<color>?",
    	2,
    	"Ta mu鑞 h鋍/LearnYes",
    	"в ta suy ngh� l筰/LearnNo")
end;
--学习技能
function LearnYes()
	if (GetLifeSkillLevel(0, 6) > 0) then
		Say (strTitle.."B筺  h鋍 k� n╪g k衞 t�!", 0)
	else
		if (LearnLifeSkill(0, 6, 1, 79, 0)) then
			AddItem(0, 200, 15, 1, 1)
        	Msg2Player("B筺  h鋍 k� n╪g K衞 t� v� nh薾 頲 1 Con thoi")
    	end
	end
end
--取消学习技能
function LearnNo()
    Say (strTitle.."Ngh� k� r錳 h穣 n!", 0)
end


---------------------------------- 确认去相应挂机地点----------------------------------------
function GotoWorld_Confirm1()
	Say(strTitle.."Ngi mu鑞 n <color=yellow>Kh玭g Tang S琻<color> k衞 t� �? N琲  c� nhi襲 <color=yellow>Th� <color>, <color=yellow>T籱<color>, <color=yellow>Ng� s綾 tr飊g<color> v� <color=yellow>Lang Chu<color>. Nh� mang theo <color=yellow>Th莕 N玭g Кn<color>!",
		2,
		"Ta mu鑞 甶/#GotoWorld(712,1472,2918)",
		"Kh玭g 甶 u/Main_Exit")
end;
function GotoWorld_Confirm2()
	Say(strTitle.."Ngi mu鑞 n <color=yellow>C玭 Ng� S琻<color> k衞 t� �? N琲  c� nhi襲 <color=yellow>Huy誸 t祄<color>, <color=yellow>Linh Chu<color> v� <color=yellow>Kim t�<color>. Nh� mang theo <color=yellow>Th莕 N玭g Кn<color>!",
		2,
		"Ta mu鑞 甶/#GotoWorld(717,1736,2906)",
		"Kh玭g 甶 u/Main_Exit")
end;
function GotoWorld_Confirm3()
	Say(strTitle.."B﹜ gi� ngi mu鑞 n <color=yellow>T� Tang s琻<color> k衞 t� �? �  c� r蕋 nhi襲 <color=yellow>L穘h Tr飊g<color>, <color=yellow>Thi猲 T祄<color> v� <color=yellow>Th� V﹏<color>, ngi ph秈 d飊g <color=yellow>Th莕 N玭g n<color> m韎 c� th� k衞 t�.",
		2,
		"Ta mu鑞 甶/#GotoWorld(722,1748,3420)",
		"Kh玭g 甶 u/Main_Exit")
end;
-- 去相应的挂机地点
function GotoWorld(MapID, x, y)
		CleanInteractive()
		LeaveTeam()
		SetFightState(0)
		
		NewWorld(MapID, x, y)
end;



-- 介绍相关信息
function Info()
	Say(strTitle.."<color=yellow>K衞 t�<color> l� m閠 trong <color=yellow>6<color> k� n╪g thu th藀 c馻 h� th鑞g k� n╪g s鑞g, sau khi h鋍 k� n╪g n祔 nh薾 頲 nguy猲 li謚 <color=yellow>ch� 竜<color>. Ngi c� th� n <color=yellow>ti謒 t筽 h鉧<color> mua d鬾g c� thu閏 da <color=yellow>s� c蕄<color> sau  b総 u k衞 t�. N誹 mu鑞 l猲 n骾 k衞 t� ph秈 v祇 <color=yellow>Ng� c竎<color> mua <color=yellow>Th莕 N玭g Кn<color> s� d鬾g m韎 頲.", 0)
end;
-- 什么也不做的空函数
function Main_Exit()
end;

function update_max_skill_level()
	Say(strTitle..format("M� r閚g c蕄 k� n╪g s秐 xu蕋 c莕 k� n╪g thu th藀 t c蕄 79 ng th阨 ti猽 hao %d V祅g", 1000), 
		2, "уng �/update_max_skill_level_ensure", "T筰 h� ch� xem qua th玦/Main_Exit")
end

function update_max_skill_level_ensure()
	local nGen = 0;
	local nSkillId = 6;
	local nMaxLevel = GetLifeSkillMaxLevel(nGen, nSkillId);
	if nMaxLevel > 79 then
		Talk(1,"",format("Hi謓 t筰 c蕄 k� n╪g thu th藀  t gi韎 h筺 c蕄 %d", nMaxLevel))
		return 0;
	end
	if GetLifeSkillLevel(nGen, nSkillId) < 79 then
		Talk(1,"",format("Hi謓 t筰 c蕄 k� n╪g thu th藀 ch璦 t c蕄 %d, kh玭g th� m� r閚g c蕄 gi韎 h筺 k� n╪g", 79));
		return 0;
	end
	if Pay(1000 * 10000) ~= 1 then
		Say(strTitle..format("Ng﹏ lng kh玭g  %d v祅g", 1000), 0);
		return 0;
	end
	SetLifeSkillMaxLevel(nGen, nSkillId, 99);
	Msg2Player("Ch骳 m鮪g c蕄 gi韎 h筺 k� n╪g thu th藀  t c蕄 99");
	PlaySound("\\sound\\sound_i016.wav");
	SetCurrentNpcSFX(PIdx2NpcIdx(),905,0,0);
end

