-- =========================================
-- File : XXX区，XX，制裤技能.lua
-- Name : 制裤技能
-- ID   : 1, 9
-- =========================================

Include("\\script\\task\\WeekEnd\\weekend_switch.lua");
Include("\\script\\task\\lifeskill\\lifeskill_task_head.lua");
Include("\\script\\task\\lingshi_task.lua")

-- == 预定义的一些任务变量ID =======================
ID_LEARNLIFESKILL		= 1925		-- 新手任务变量
LEV_LEARNRECIPE			= 1926		-- 配方学习情况记录
RECIPE_SEX				= 1935		-- 配方学习男女选择
FORGETMAIN_NUM			= 1940		-- 遗忘主技能次数

-- == 全局使用的名字 =======================
strName = ""
strTitle = ""

tNguyenLieu = { -- table nguy猲 li謚 ch? t筼 v秈 l鬭 cao c蕄
		[1] = {
			{"Huy誸 Nha v�",{2,1,285},5,"phi課"}
		},
		[2] = {
			{"L玭g c竜",{2,1,155},5,"mi課g"},
			{"L玭g s鉯",{2,1,5},10,"nh髆"},
		},
		[3] = {
			{"Mao Ng璾 b�",{2,1,287},5,"t蕀"},
			{"Da g蕌",{2,2,20},2,"t蕀"},
			{"Da S� t�",{2,2,47},2,"t蕀"},
		},
		[4] = {
			{"V� nhung",{2,1,291},5,"phi課"},
			{"Chu Tc v�",{2,2,49},1,"phi課"},
			{"Ph鬾g Ho祅g V�",{2,2,51},1,"phi課"},
		},
		[5] = {
			{"ng﹏ h� n",{2,1,167},10,"vi猲"}
		}
	}
tolua = {"T� L鬭 Чi L�",{2,95,929}}
tPrepareNL = {} -- table L璾 tr� danh m鬰 nguy猲 li謚  chu萵 b? ch? t筼 v秈 l鬭 cao c蕄

-- == 默认入口函数 =========================
function main()
	 if GetAntiEnthrallmentStatus() > 1 then
	 	Talk(1,"","Х qu� 5 gi� ch琲, h穣 ngh� ng琲  gi� g譶 s鴆 kh醗!")
	 	return
	 end
	strName = GetTargetNpcName()
	if random(1,15) == 1 then
		NpcChat(GetTargetNpc(),"ng qu猲 l� tr� linh kh� m� trang b� c� th� dung n筽 l� c� h筺!");
	end;
	if (strName == "" or strName == nil) then 
		return 
	end
	strTitle = "<color=green>"..strName.."<color>: "
    if (GetTask(ID_LEARNLIFESKILL) < 3) then
        Say(strTitle.."дn <color=yellow>C蕄 10<color> c� th� n <color=yellow>Th祅h Й<color> g苝 <color=yellow>Du Phng i phu<color> t譵 hi觰 <color=yellow>k� n╪g s鑞g<color>!", 0)
        TaskTip("дn c蕄 10 c� th� n Th祅h Й t譵 Du Phng i phu.")
        return
    elseif (GetTask(ID_LEARNLIFESKILL) < 15) then
    	Say(strTitle.."Mu鑞 h鋍 may h� y �? L骳 n祔 ta ch璦 d箉 頲", 0)
    	return
    end;
	
	local strtab = {
		"H鋍 k� n╪g may h� y/learn_shoes_skill",
		"H鋍 c竎h ph鑙 ch� m韎/learn_new_recipe",
		"H鋍 ph鑙 ch� trang b� Linh у/learnLtEquip",
		"Qu猲 k� n╪g may h� y/forget_life_skill",
		"Nh鱪g 甶襲 li猲 quan v� trang b� B竧 Qu竔/bagua",
		"T譵 hi觰 v藅 ph� gia/dating",
		"Th鵦 h祅h d謙 t� l鬭 Чi Ly'/detto"
		}
	if GetTask(TASK_LINGSHI_ID) == 2 or GetTask(TASK_LINGSHI_ID) == 11 then
		tinsert(strtab,"ti誴 t鬰 nhi謒 v� h鋍 t藀 Linh Th筩h B竧 Qu竔/task_new3");
	end
	if GetLifeSkillMaxLevel(1, 9) == 79 then
		tinsert(strtab, "Mu鑞 h鋍k� n╪g cao c蕄 h琻/update_max_skill_level");
	end 
	tinsert(strtab,"R阨 kh醝/exit_dialog");  		
	Say(strTitle.."Ta b譶h sinh r蕋 th輈h ch� t筼 h� gi竝, c� c莕 ta gi髉 g� kh玭g?",
		getn(strtab),
		strtab)
end;

function detto()

	local strtab = {
		"T譵 hi觰 nguy猲 li謚 d謙 l鬭/nguyenlieu",
		"Ta  chu萵 b�  nguy猲 li謚. Ta c莕 h頿 th祅h/kiemTraNL"
		}
	tinsert(strtab,"R阨 kh醝/exit_dialog");
	local nSex = GetSex();
	if nSex == 1 then
		nSex = "thi誹 hi謕"
	elseif nSex == 2 then
		nSex = "c� nng"
	end
	Say(strTitle.."Th鵦 ra lo筰 l鬭 n祔 ch� cung c蕄 cho Ho祅g Th蕋. Nh璶g v� tri襲 nh cho phep,"
		.."ta cu~ng kh玭g mu鑞 ngh� n祔 b� th蕋 truy襫 n猲 頲 th玦, ta s絥 l遪g gi髉 "..nSex ,
		getn(strtab),
		strtab)
end;

function kiemTraNL()
	
	--local tAvailableNL = {}; -- table l璾 tr� s� lng th鵦 t� t鑙 thi觰
	
	local nMax = 2000 -- con s� L璾 tr� s� t蕀 v秈 cao nh蕋 c� th� ch� t筼
	local tCountNL = {} -- table l璾 s� lng nguy猲 li謚 hi謓 c� trong h祅h trang
	
	for i=1, getn(tNguyenLieu) do -- duy謙 nguy猲 li謚 theo index
		local nNum = 0
		local nNum_old = nNum;
		
		local nMaxChoosenMaterial = 0 -- con s� l璾 tr� s� t蕀 v秈 cao nh蕋 c� th� ch� t筼 li' tng c馻 nguy猲 li謚 頲 ch鋘
		for j=1, getn(tNguyenLieu[i]) do -- duy謙 nguy猲 li謚 ch鋘 ch駈g lo筰, tr� v� nguy猲 li謚 kh� d鬾g c� s� lng nhi襲 nh蕋
			local item = {tNguyenLieu[i][j][2][1],tNguyenLieu[i][j][2][2],tNguyenLieu[i][j][2][3]}
			local nCountThucTe = GetItemCount(item[1], item[2], item[3]);
			local nCountTieuChuan = tNguyenLieu[i][j][3]
			local nDiv = floor(nCountThucTe/nCountTieuChuan)
			if nDiv >= 1 and nDiv > nNum_old then -- ki觤 tra N誹 s� lng mi課g v秈 m韎 kh� ch� nhi襲 h琻 s� lng cu~
				nNum_old = nNum
				nNum = nDiv
				tCountNL[i] = {tNguyenLieu[i][j][1],{item[1],item[2],item[3]},nCountThucTe,tNguyenLieu[i][j][4]}
				tPrepareNL[i] = {tNguyenLieu[i][j][1],{item[1],item[2],item[3]},tNguyenLieu[i][j][3],tNguyenLieu[i][j][4]}
				--tinsert(tPrepareNL, [i] = {tNguyenLieu[i][j][1],tNguyenLieu[i][j][2][1],tNguyenLieu[i][j][2][2],tNguyenLieu[i][j][2][3],tNguyenLieu[i][j][3],tNguyenLieu[i][j][4]})
			end
			
			-- if nCountThucTe >= nCountTieuChuan then
				-- tAvailableNL[i] = 1
				-- break
			-- end
		end
		nMaxChoosenMaterial = nNum
		if nNum < nMax then -- N誹 s� lng v藅 ph萴 kh� h頿 th祅h m韎 th蕄 h琻 s� lng v藅 ph萴 kh� h頿 th祅h c? th� l蕐 s� m韎
			nMax = nNum
		end
	end
	
	-- local nEcounter = 0;
	-- for i=1, getn(tAvailableNL) do
		-- if tAvailableNL[i] == 1 then
			-- nEcounter = nEcounter + 1
		-- end
	-- end
	
	if nMax == 0 then --nEcounter ~= getn(tNguyenLieu) then
		Say(strTitle.." B籲g h鱱 ch璦 chu萵 b�  nguy猲 li謚 r錳. H穣 c� g緉g l猲 nhe'!",1,
			"в ta chu萵 b� th猰/exit_dialog"
			)
	else
		local szSay = " S� nguy猲 li謚 hi謓 t筰 trong h祅h trang   ch� <color=yellow>"..nMax.."<color> t蕀 l鬭. Ph莕 d� th� b籲g h鱱 h穣 c蕋 甶\n"
		local tab = " "
		for i=1, getn(tCountNL) do
			szSay = szSay.."* <color=green>"..tCountNL[i][1].."<color>"..tab..tCountNL[i][3]..tab..tCountNL[i][4].."<enter>"
		end
		
		szSay = szSay.."C� mu鑞 ch� ngay kh玭g?"
		Say(strTitle..szSay,2,
			format("Л頲 y! Ta s絥 s祅g r錳!/#hopthanh(%d)",nMax),
			"в ta chu萵 b� th猰/exit_dialog"
			)
	end
end;

function hopthanh(nNum)
	AskClientForNumber("_request_number_call_back",1,nNum,"Nh藀 s� lng")
end;

function _request_number_call_back(nNum)
	
	if nNum < 1 then
		return 0;
	end
	
	nDelResult = 0;
	for i=1, getn(tPrepareNL) do
		local item = tPrepareNL[i][2]	
		local nDel = tPrepareNL[i][3]*nNum
		
		local nResult = DelItem(item[1],item[2],item[3], nDel)
		if nResult then
			nDelResult = nDelResult * 10 + 1
		end
	end
	
	if nDelResult == generateNumber(getn(tNguyenLieu)) then
		AddItem(tolua[2][1],tolua[2][2],tolua[2][3],nNum)
		szMsg = "Ch骳 m鮪g c竎 h�  ch� t筼 th祅h c玭g "..nNum.." m秐h "..tolua[1]
		Talk(1,"",szMsg)
		Msg2Player(szMsg)
	else
		Msg2Player("Ch� t筼 th蕋 b筰! C� th�  b� t鎛 th蕋 m閠 s� nguy猲 li謚")
	end
	
end

function generateNumber(nNum) -- t筼 d穣 s� to祅 s� 1 g錷 c� nNum ch� s�
	local res = 0
	for i=1,nNum do
		res = res * 10 + 1
	end
	return res
end;

function nguyenlieu()
	
	local szSay = strTitle.."Nguy猲 li謚 h頿 th祅h g錷 c�: \n"
	local space = " "
	for i=1,getn(tNguyenLieu) - 1 do
		szSay = szSay.."* <color=green>"..tNguyenLieu[i][1][1].."<color> "..tNguyenLieu[i][1][3]..space..tNguyenLieu[i][1][4].."<enter>"
	end
	szSay = szSay.."Nguy猲 li謚 ch� o l� l玭g vu~. Tuy v藋,  s秐 ph萴 c� ch蕋 lng t鑤 h琻 th� ta d飊g <color=green> "
	szSay = szSay..tNguyenLieu[getn(tNguyenLieu)][1][1].."<color> "..tNguyenLieu[getn(tNguyenLieu)][1][3]..space..tNguyenLieu[getn(tNguyenLieu)][1][4]
	szSay = szSay.." l祄 v藅 d蒼, ch� c莕 t竛 nh�, h遖 v祇 nc r錳 ng﹎ nguy猲 li謚 kho秐g 2 canh gi� l� 頲.\n"
	Talk (1,"showExpand",szSay)
	
end;

function showExpand()
	
	local szSay = strTitle.."Tr猲 y l� nh鱪g nguy猲 li謚 ph� th玭g, d� ki誱. Nh璶g n誹 b籲g h鱱 c� k� n╪g thu th藀 t鑤 th� h穣 xem xe't vi謈 thay th� ch髇g b籲g nguy猲 li謚 cao c蕄 h琻.\n"
	szSay = szSay.."в d� d祅g h琻 cho b籲g h鱱, ta s� cung c蕄 cho ngi danh s竎h y  n誹 ngi mu鑞."
	Say(szSay,2,
	"C� nng t鑤 qu�! H穣 cho ta xem danh s竎h v韎/showListFull",
	" t�  ch� gi竜. Ta bi猼 r錳/exit_dialog"
	);
end;

-- == 什么都不做的退出对话 ===================
function exit_dialog()
end;

function showListFull()
	local szSay = "Зy l� danh s竎h nguy猲 li謚 d筺g y :\n"
	local space = " "
	for i=1, getn(tNguyenLieu)-1 do
		szSay = szSay.."Nguy猲 li謚 "..i.."<enter>"
		for j=1, getn(tNguyenLieu[i]) do
			szSay = szSay.."    * <color=green>"..tNguyenLieu[i][j][1].."<color> "..tNguyenLieu[i][j][3]..space..tNguyenLieu[i][j][4].."<enter>"
		end
		--szSay = szSay.."___________________"
	end
	
	-- Say(szSay,10,
	-- " t�, 產 t�!/exit_dialog"
	-- );
	Talk(1,"",szSay)
end;

-- == 打听关于添加物的信息 ===================
function dating()
	Say(strTitle.."Ngi t trang b� v祇 sau  th猰 nguy猲 li謚, s� c� m鉵  nh� �.", 0)
end;


-- == 遗忘制裤技能 ===========================
function forget_life_skill()
	if (GetLifeSkillLevel(1, 9) > 0) then
		local nForgetTimes = GetTask(FORGETMAIN_NUM)	-- 主技能
		local nShouldPay = 5000
		if (nForgetTimes == 0) then
			nShouldPay = 5
		elseif (nForgetTimes == 1) then
			nShouldPay = 50
		elseif (nForgetTimes == 2) then
			nShouldPay = 500
		end
	
		Say(strTitle.."Зy l� l莕 th� "..(nForgetTimes + 1).." l莕 b� k� n╪g s秐 xu蕋, m蕋 "..nShouldPay.." lng, ngi suy ngh� k� ch璦?",
			2,
			"Ta  quy誸 nh r錳!/forget_now",
			"Khoan ! Ch� ta suy ngh� l筰!/exit_dialog")
	else
		Say(strTitle.."Ngi v蒼 ch璦 h鋍 k� n╪g may h� y �? Ta s� gi髉 ngi", 0)
	end
end;
function forget_now()
	local nForgetTimes = GetTask(FORGETMAIN_NUM)	-- 辅技能
	local nShouldPay = 5000
	if (nForgetTimes == 0) then
		nShouldPay = 5
	elseif (nForgetTimes == 1) then
		nShouldPay = 50
	elseif (nForgetTimes == 2) then
		nShouldPay = 500
	end
	local nShouldPayMoney = nShouldPay * 100
	
	if (GetLifeSkillLevel(1, 9) > 0) then
		if (Pay(nShouldPayMoney) == 1) then
			local nRet = AbandonLifeSkill(1, 9)
			if (nRet == 0) then
				Earn(nShouldPayMoney)
			else
				SetTask(FORGETMAIN_NUM, nForgetTimes + 1)
				SetTask(LEV_LEARNRECIPE, 0)
				SetTask(RECIPE_SEX, 0)
				Msg2Player("K� n╪g may h� y ngi  qu猲 r錳")				
			end
		else
			Say(strTitle.."Ngi kh玭g mang theo  ti襫! L蕐 ti襫 r錳 h穣 n nh�!", 0)
		end
	end
end;

-- == 学习制裤技能 ===========================
function learn_shoes_skill()
	if (GetLevel() < 10) then
		Say(strTitle.."B筺 kh玭g  <color=yellow>c蕄 10<color> ch璦 th� h鋍 k� n╪g s鑞g.", 0)
		return
	end  
	
	if (GetLifeSkillsNum(1) >= 2) then
		Say(strTitle.."B籲g h鱱  h鋍 k� n╪g s秐 xu蕋, mu鑞 h鋍 k� n╪g m韎 c莕 ph秈 b� k� n╪g c�.", 0)
    	return
	end

	Say(strTitle.."<color=yellow>K� n╪g may h� y<color> s� l� k� n╪g s秐 xu蕋, ngi c� mu鑞 h鋍 kh玭g?",
    	2,
    	"Ta mu鑞 h鋍/learn_as_main",
    	"в ta suy ngh� l筰/exit_dialog")
end;
-- == 选择男裤还是女裤 ====
function learn_as_main()
	if (2 > GetLifeSkillsNum(1)) then
		Say(strTitle.."K� n╪g may h� y g錷: <color=yellow>h� y nam<color> v� <color=yellow>h� y n�<color>, ngi mu鑞 h鋍 lo筰 n祇?",
			3,
			"May h� y nam/choose_man",
			"May h� y n�/choose_women",
			"в ta suy ngh�./exit_dialog")
	end
end;
-- == 选择男衣下装织造 ====
function choose_man()
	if (2 > GetLifeSkillsNum(1)) then
		if (LearnLifeSkill(1, 9, 1, 79, 1)) then
      		Msg2Player("B筺 h鋍 頲 ph鑙 ch�: k� n╪g may h� y")
      		
      		AddRecipe(323)
      		Msg2Player("B筺 h鋍 頲 ph鑙 ch�: Lang b� y")
			AddRecipe(324)
			Msg2Player("B筺 h鋍 頲 ph鑙 ch�: Trang ph鬰 Nh� �")
			AddRecipe(325)
			Msg2Player("B筺 h鋍 頲 ph鑙 ch�: H� b� y")
			AddRecipe(326)
			Msg2Player("B筺 h鋍 頲 ph鑙 ch�: Khinh Gi竝 y")
			AddRecipe(341)
			Msg2Player("B筺 h鋍 頲 ph鑙 ch�: M穘g Ng璾 y")
			AddRecipe(342)
			Msg2Player("B筺 h鋍 頲 ph鑙 ch�: Kim T� y")
			AddRecipe(343)
			Msg2Player("B筺 h鋍 頲 ph鑙 ch�: H祇 D騨g Trang")
			AddRecipe(344)
			Msg2Player("B筺 h鋍 頲 ph鑙 ch�: Kim L� Trang")
			
			SetTask(LEV_LEARNRECIPE, 10)
			SetTask(RECIPE_SEX, 1)
		end
	else
		Say(strTitle.."B筺  h鋍 k� n╪g s鑞g, kh玭g th� h鋍 th猰 k� n╪g kh竎.", 0)
	end
end;
-- == 选择女衣下装织造 ====
function choose_women()
	if (2 > GetLifeSkillsNum(1)) then
		if (LearnLifeSkill(1, 9, 1, 79, 1)) then
      		Msg2Player("B筺 h鋍 頲 ph鑙 ch�: k� n╪g may h� y")
    		
    		AddRecipe(359)
    		Msg2Player("B筺 h鋍 頲 ph鑙 ch�: H綾 Nhung T� Trang")
			AddRecipe(360)
			Msg2Player("B筺 h鋍 頲 ph鑙 ch�: B輈h V﹏ T� Trang")
			AddRecipe(361)
			Msg2Player("B筺 h鋍 頲 ph鑙 ch�: V� Luy謓 T� Trang")
			AddRecipe(362)
			Msg2Player("B筺 h鋍 頲 ph鑙 ch�: H醓 Ho祅 T� Trang")
			AddRecipe(377)
			Msg2Player("B筺 h鋍 頲 ph鑙 ch�: Phong Tr莕 T� Trang")
			AddRecipe(378)
			Msg2Player("B筺 h鋍 頲 ph鑙 ch�: Linh V薾 T� Trang")
			AddRecipe(379)
			Msg2Player("B筺 h鋍 頲 ph鑙 ch�: Phi H錸g T� Trang")
			AddRecipe(380)
			Msg2Player("B筺 h鋍 頲 ph鑙 ch�: Phong V� T� Trang")
			
		    SetTask(LEV_LEARNRECIPE, 10)
		    SetTask(RECIPE_SEX, 2)
		end
	else
		Say(strTitle.."B筺  h鋍 k� n╪g s鑞g, kh玭g th� h鋍 th猰 k� n╪g kh竎.", 0)
	end
end;



-- == 学习新的配方 ===========================
function learn_new_recipe()
	local nLevel = GetLifeSkillLevel(1, 9)
	
	if (nLevel >= 1 and GetTask(LEV_LEARNRECIPE) == 0) then
		Say(strTitle.."K� n╪g may h� y g錷: <color=yellow>h� y nam<color> v� <color=yellow>h� y n�<color>, ngi mu鑞 h鋍 lo筰 n祇?",
			3,
			"May h� y nam/recipe_man",
			"May h� y n�/recipe_women",
			"в ta suy ngh�./exit_dialog")
		return
	end
	
	-- 男装配方升级
	if (1 == GetTask(RECIPE_SEX)) then
		if (nLevel >= 10 and GetTask(LEV_LEARNRECIPE) == 10) then
			AddRecipe(327)
			Msg2Player("B筺 h鋍 頲 ph鑙 ch�: D� H祅h Trang")
			AddRecipe(328)
			Msg2Player("B筺 h鋍 頲 ph鑙 ch�: H醓 Tng Trang")
			AddRecipe(345)
			Msg2Player("B筺 h鋍 頲 ph鑙 ch�: Du Hi謕 Trang")
			AddRecipe(346)
			Msg2Player("B筺 h鋍 頲 ph鑙 ch�: H� B� K譶h Trang")
			SetTask(LEV_LEARNRECIPE, 20)
		elseif (nLevel >= 20 and GetTask(LEV_LEARNRECIPE) == 20) then
			AddRecipe(329)
			Msg2Player("B筺 h鋍 頲 ph鑙 ch�: X輈h Lang Trang")
			AddRecipe(330)
			Msg2Player("B筺 h鋍 頲 ph鑙 ch�: Trang ph鬰 Nh� �")
			AddRecipe(347)
			Msg2Player("B筺 h鋍 頲 ph鑙 ch�: C萴 Lan y")
			AddRecipe(348)
			Msg2Player("B筺 h鋍 頲 ph鑙 ch�: Thanh Sng Trang")
			SetTask(LEV_LEARNRECIPE, 30)
		elseif (nLevel >= 30 and GetTask(LEV_LEARNRECIPE) == 30) then
			AddRecipe(331)
			Msg2Player("B筺 h鋍 頲 ph鑙 ch�: Long B� y")
			AddRecipe(332)
			Msg2Player("B筺 h鋍 頲 ph鑙 ch�: Huy詎 秐h y")
			AddRecipe(349)
			Msg2Player("B筺 h鋍 頲 ph鑙 ch�: Thi猲 Phong Trang")
			AddRecipe(350)
			Msg2Player("B筺 h鋍 頲 ph鑙 ch�: B� 萵 Trang")
			SetTask(LEV_LEARNRECIPE, 40)
		elseif (nLevel >= 40 and GetTask(LEV_LEARNRECIPE) == 40) then
			AddRecipe(333)
			Msg2Player("B筺 h鋍 頲 ph鑙 ch�: Thi猲 Lang y")
			AddRecipe(334)
			Msg2Player("B筺 h鋍 頲 ph鑙 ch�: Phi Ng� y")
			AddRecipe(351)
			Msg2Player("B筺 h鋍 頲 ph鑙 ch�: Th莕 S竎h y")
			AddRecipe(352)
			Msg2Player("B筺 h鋍 頲 ph鑙 ch�: Thi猲 L玦 y")
			SetTask(LEV_LEARNRECIPE, 50)
		elseif (nLevel >= 50 and GetTask(LEV_LEARNRECIPE) == 50) then
			AddRecipe(335)
			Msg2Player("B筺 h鋍 頲 ph鑙 ch�: Thanh V﹏ y")
			AddRecipe(336)
			Msg2Player("B筺 h鋍 頲 ph鑙 ch�: B輈h L﹏ y")
			AddRecipe(353)
			Msg2Player("B筺 h鋍 頲 ph鑙 ch�: Nhu Cng y")
			AddRecipe(354)
			Msg2Player("B筺 h鋍 頲 ph鑙 ch�: Cu錸g Vi猰 y")
			SetTask(LEV_LEARNRECIPE, 60)
		elseif (nLevel >= 60 and GetTask(LEV_LEARNRECIPE) == 60) then
			AddRecipe(337)
			Msg2Player("B筺 h鋍 頲 ph鑙 ch�: S竧 Ki誴 Trang")
			AddRecipe(338)
			Msg2Player("B筺 h鋍 頲 ph鑙 ch�: � T籱 y")
			AddRecipe(355)
			Msg2Player("B筺 h鋍 頲 ph鑙 ch�: Huy誸 H� y")
			AddRecipe(356)
			Msg2Player("B筺 h鋍 頲 ph鑙 ch�: Thi猲 Cng y")
			SetTask(LEV_LEARNRECIPE, 70)
		else
		    Say(strTitle..": ng qu� n玭 n鉵g, kinh nghi謒 giang h� ngi c遪 k衜 l緈, c� g緉g th猰 nh�!", 0)
		end
		
	-- 女装配方升级
	else
		if (nLevel >= 10 and GetTask(LEV_LEARNRECIPE) == 10) then
			AddRecipe(363)
			Msg2Player("B筺 h鋍 頲 ph鑙 ch�: Luy謓 Gi竝 T� y")
			AddRecipe(364)
			Msg2Player("B筺 h鋍 頲 ph鑙 ch�: S� Man T� y")
			AddRecipe(381)
			Msg2Player("B筺 h鋍 頲 ph鑙 ch�: H穖 Tr薾 T� y")
			AddRecipe(382)
			Msg2Player("B筺 h鋍 頲 ph鑙 ch�: B輈h H� T� y")
			SetTask(LEV_LEARNRECIPE, 20)
		elseif (nLevel >= 20 and GetTask(LEV_LEARNRECIPE) == 20) then
			AddRecipe(365)
			Msg2Player("B筺 h鋍 頲 ph鑙 ch�: C萴 Anh T� y")
			AddRecipe(366)
			Msg2Player("B筺 h鋍 頲 ph鑙 ch�: V﹏ H� T� y")
			AddRecipe(383)
			Msg2Player("B筺 h鋍 頲 ph鑙 ch�: Thi猲 T籱 T� y")
			AddRecipe(384)
			Msg2Player("B筺 h鋍 頲 ph鑙 ch�: Kh雐 La T� y")
			SetTask(LEV_LEARNRECIPE, 30)
		elseif (nLevel >= 30 and GetTask(LEV_LEARNRECIPE) == 30) then
			AddRecipe(367)
			Msg2Player("B筺 h鋍 頲 ph鑙 ch�: To祅 Kim Gi竝 y")
			AddRecipe(368)
			Msg2Player("B筺 h鋍 頲 ph鑙 ch�: H錸g V﹏ T� y")
			AddRecipe(385)
			Msg2Player("B筺 h鋍 頲 ph鑙 ch�: V� Th莕 T� y")
			AddRecipe(386)
			Msg2Player("B筺 h鋍 頲 ph鑙 ch�: Linh Lung T� y")
			SetTask(LEV_LEARNRECIPE, 40)
		elseif (nLevel >= 40 and GetTask(LEV_LEARNRECIPE) == 40) then
			AddRecipe(369)
			Msg2Player("B筺 h鋍 頲 ph鑙 ch�: L玦 Th莕 y")
			AddRecipe(370)
			Msg2Player("B筺 h鋍 頲 ph鑙 ch�: Thi猲 M� y")
			AddRecipe(387)
			Msg2Player("B筺 h鋍 頲 ph鑙 ch�: B竎h Chi課 y")
			AddRecipe(388)
			Msg2Player("B筺 h鋍 頲 ph鑙 ch�: Th莕 N� y")
			SetTask(LEV_LEARNRECIPE, 50)
		elseif (nLevel >= 50 and GetTask(LEV_LEARNRECIPE) == 50) then
			AddRecipe(371)
			Msg2Player("B筺 h鋍 頲 ph鑙 ch�: Ph� Tr薾 y")
			AddRecipe(372)
			Msg2Player("B筺 h鋍 頲 ph鑙 ch�: Ph蕋 V﹏ y")
			AddRecipe(389)
			Msg2Player("B筺 h鋍 頲 ph鑙 ch�: V� Linh y")
			AddRecipe(390)
			Msg2Player("B筺 h鋍 頲 ph鑙 ch�: T秐 Hoa y")
			SetTask(LEV_LEARNRECIPE, 60)
		elseif (nLevel >= 60 and GetTask(LEV_LEARNRECIPE) == 60) then
			AddRecipe(373)
			Msg2Player("B筺 h鋍 頲 ph鑙 ch�: H� Khi誹 y")
			AddRecipe(374)
			Msg2Player("B筺 h鋍 頲 ph鑙 ch�: Th竔 Thanh y")
			AddRecipe(391)
			Msg2Player("B筺 h鋍 頲 ph鑙 ch�: H錸g Ng鋍 y")
			AddRecipe(392)
			Msg2Player("B筺 h鋍 頲 ph鑙 ch�: Xu蕋 V﹏ y")
			SetTask(LEV_LEARNRECIPE, 70)
		else
		    Say(strTitle..": ng qu� n玭 n鉵g, kinh nghi謒 giang h� ngi c遪 k衜 l緈, c� g緉g th猰 nh�!",0)
		end
	end
end;

function learnLtEquip()
	local nLevel = GetLifeSkillLevel(1, 9)
	if nLevel >= 79 then
    	AddRecipe(1139)
    	AddRecipe(1140)
    	AddRecipe(1141)
    	AddRecipe(1142)
    	Msg2Player(format("Х h鋍 ph鑙 ch� m韎: %s", "Linh у Trang (S竧 thng)"))
    	AddRecipe(1143)
    	AddRecipe(1144)
    	AddRecipe(1145)
    	AddRecipe(1146)
    	Msg2Player(format("Х h鋍 ph鑙 ch� m韎: %s", "Linh у Trang  (Ngo筰 c玭g)"))
    	AddRecipe(1147)
    	AddRecipe(1148)
    	AddRecipe(1149)
    	AddRecipe(1150)
    	Msg2Player(format("Х h鋍 ph鑙 ch� m韎: %s", "Linh у Trang (N閕 k輈h)"))
	else
    	Say(strTitle..": ng qu� n玭 n鉵g, kinh nghi謒 giang h� ngi c遪 k衜 l緈, c� g緉g th猰 nh�!",0)
	end
end

-- == 选择并且补习男裤制造技能 ====
function recipe_man()
	AddRecipe(323)
    Msg2Player("B筺 h鋍 頲 ph鑙 ch�: Lang b� y")
	AddRecipe(324)
	Msg2Player("B筺 h鋍 頲 ph鑙 ch�: Trang ph鬰 Nh� �")
	AddRecipe(325)
	Msg2Player("B筺 h鋍 頲 ph鑙 ch�: H� b� y")
	AddRecipe(326)
	Msg2Player("B筺 h鋍 頲 ph鑙 ch�: Khinh Gi竝 y")
	AddRecipe(341)
	Msg2Player("B筺 h鋍 頲 ph鑙 ch�: M穘g Ng璾 y")
	AddRecipe(342)
	Msg2Player("B筺 h鋍 頲 ph鑙 ch�: Kim T� y")
	AddRecipe(343)
	Msg2Player("B筺 h鋍 頲 ph鑙 ch�: H祇 D騨g Trang")
	AddRecipe(344)
	Msg2Player("B筺 h鋍 頲 ph鑙 ch�: Kim L� Trang")
			
	SetTask(LEV_LEARNRECIPE, 10)
	SetTask(RECIPE_SEX, 1)
end;
-- == 选择并且补习女裤制造技能 ====
function recipe_women()
	AddRecipe(359)
    Msg2Player("B筺 h鋍 頲 ph鑙 ch�: H綾 Nhung T� Trang")
	AddRecipe(360)
	Msg2Player("B筺 h鋍 頲 ph鑙 ch�: B輈h V﹏ T� Trang")
	AddRecipe(361)
	Msg2Player("B筺 h鋍 頲 ph鑙 ch�: V� Luy謓 T� Trang")
	AddRecipe(362)
	Msg2Player("B筺 h鋍 頲 ph鑙 ch�: H醓 Ho祅 T� Trang")
	AddRecipe(377)
	Msg2Player("B筺 h鋍 頲 ph鑙 ch�: Phong Tr莕 T� Trang")
	AddRecipe(378)
	Msg2Player("B筺 h鋍 頲 ph鑙 ch�: Linh V薾 T� Trang")
	AddRecipe(379)
	Msg2Player("B筺 h鋍 頲 ph鑙 ch�: Phi H錸g T� Trang")
	AddRecipe(380)
	Msg2Player("B筺 h鋍 頲 ph鑙 ch�: Phong V� T� Trang")
		
	SetTask(LEV_LEARNRECIPE, 10)
	SetTask(RECIPE_SEX, 2)
end;

function task_new3()
	talk_IV();
end

function bagua()
	Say("<color=green>T� Quy猲 C� Nng<color>: <color=red>Trang b� b竧 qu竔<color> l� s� trng c馻 ta + M筩 th� v� l穙 L璾 � Tng Dng, nh璶g t鑤 nh蕋 n猲 h醝 qua C玭g D� Th� gia trc, c遪 n誹 mu鑞 bi誸 chi ti誸 v� trang b� <color=yellow>kh秏 n筸 Linh th筩h<color> th� g苝 ta l� ng ngi r錳!",
	4,
	"L祄 sao ch� t筼 trang b� c� l� kh秏 n筸/kongzhuangbeizhizuo",
	"V藅 ph萴 th猰 v祇 c� t竎 d鬾g g�/tianjiawu",
	"L祄 sao trang b� 頲 ch� t筼 th祅h trang b� B竧 Qu竔/xiangqianzhuyi",
	"дn h醝 th╩ th玦 m�!/exit_dialog"
	)
end

function kongzhuangbeizhizuo()
	Talk(1,"",strTitle.."R蕋 n gi秐, qua nghi猲 c鴘 c馻 b鋘 ta, c秈 ti課 phng ph竝 ch� t筼 ta truy襫 th� cho c竎 ngi, b﹜ gi� ngi 產ng thu th藀 nguy猲 li謚 � khu v鵦 thu th藀, nh鱪g trang b� ch� t筼 ra c� m鴆 linh kh� t鑙 產 v� c� th� c� l� kh秏 n筸, nh璶g m� c騨g ch輓h v� v藋, nh鱪g trang b� c� thu閏 t輓h linh kh� kh玭g c遪 ch� t筼 頲 n鱝.")
end

function tianjiawu()
	Talk(1,"",strTitle.."V筺 v藅 tr猲 th� gian u c� gi� tr� ri猲g, gi� tr� t飝 v祇 linh kh� 輙 hay nhi襲, khi ch� t筼 trang b� t╪g v藅 ph萴 th猰 v祇, c� th� t╪g m鴆 linh kh� t鑙 產 v� t╪g s� l� kh秏 n筸 linh th筩h tr猲 trang b�. M鴆 linh kh� t鑙 產 c馻 trang b� quy誸 nh m鴆 linh kh�  kh秏 n筸 linh th筩h, v� s� l� quy誸 nh n� c� th� kh秏 bao nhi猽 linh th筩h, c� th� th祅h thu閏 t輓h b竧 qu竔 hay kh玭g, cho n猲 n誹 頲 th� c� g緉g th猰 v礽 v藅 c� gi� tr�.")
end

function xiangqianzhuyi()
	Talk(1,"",strTitle.."� tr猲  nh綾 n r錳, tr猲 trang b� c� m鴆 linh kh� t鑙 產 v� l� kh秏 n筸, 1 trang b� kh秏 <color=yellow>3 vi猲<color> linh th筩h, khi m鴆 linh kh� c馻 3 vi猲 linh th筩h b籲g v韎 m鴆 linh kh� t鑙 產 c馻 trang b�, s� h譶h th祅h trang b� thu閏 t輓h b竧 qu竔. Linh th筩h l� s� l� th� m鴆 linh kh� ﹎, Linh th筩h l� s� ch絥 th� m鴆 linh kh� dng, n誹 th� t� Linh Th筩h 頲 kh秏 kh玭g gi鑞g nhau, th� trang b� c� thu閏 t輓h b竧 qu竔 kh竎 nhau, tr猲 \'B竧 qu竔 B秓 觧\' d祅h cho h藆 du� c馻 C玭g D� Th� Gian c� ghi r蕋 r� l祄 th� n祇  ch� t筼 1 trang b� c� thu閏 t輓h b竧 qu竔 mong mu鑞, c� th阨 gian th� xem.")
end

function update_max_skill_level()
	Say(strTitle..format("M� r閚g c蕄 k� n╪g s秐 xu蕋 c莕 k� n╪g thu th藀 t c蕄 79 ng th阨 ti猽 hao %d V祅g", 1000), 
		2, "уng �/update_max_skill_level_ensure", "T筰 h� ch� xem qua th玦/exit_dialog")
end

function update_max_skill_level_ensure()
	if GetLifeSkillLevel(1, 9) < 79 then
		Talk(1,"",format("Hi謓 t筰 c蕄 k� n╪g s秐 xu蕋 ch璦 t c蕄 %d, kh玭g th� m� r閚g c蕄 gi韎 h筺 k� n╪g", 79));
		return 0;
	end
	if Pay(1000 * 10000) ~= 1 then
		Say(strTitle..format("Ng﹏ lng kh玭g  %d v祅g", 1000), 0);
		return 0;
	end
	SetLifeSkillMaxLevel(1, 9, 99);
	Msg2Player("Ch骳 m鮪g c蕄 gi韎 h筺 k� n╪g s秐 xu蕋  t c蕄 99");
	PlaySound("\\sound\\sound_i016.wav");
	SetCurrentNpcSFX(PIdx2NpcIdx(),905,0,0);
end