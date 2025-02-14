--春节副活动4
Include("\\script\\lib\\globalfunctions.lua") --公共函数文件
Include("\\script\\misc\\taskmanager.lua")
Include("\\script\\online\\zgc_public_fun.lua")
Include("\\script\\online\\viet_event\\ip_bonus\\ip_head.lua")

VET_201401_SPRING2_ACTIVITYID = 111;

VET_201401_SPRING2_MAIN = "T誸 n╩ 2014/Vet_201401_sprint2_main";

VET_201401_SPRING2_TASK = TaskManager:Create(2, 21)
VET_201401_SPRING2_TASK.DaySeq = 1
VET_201401_SPRING2_TASK.TaskStep = 2
VET_201401_SPRING2_TASK.Award = 3
VET_201401_SPRING2_TASK.WildPig = 4
VET_201401_SPRING2_TASK.WildPigCount = 5

function Vet_201401_sprint2_main()
	if gf_GetPlayerRebornCount() < 1 then
		Talk(1,"","Nh﹏ v藅 chuy觧 sinh 1 tr� l猲 m韎 tham gia 頲 ho箃 ng");
		return 0;
	end
	if VET_201401_SPRING2_TASK:GetTask(VET_201401_SPRING2_TASK.DaySeq) ~= zgc_pub_day_turn() then
		VET_201401_SPRING2_TASK:SetTask(VET_201401_SPRING2_TASK.DaySeq,zgc_pub_day_turn());
		VET_201401_SPRING2_TASK:SetTask(VET_201401_SPRING2_TASK.TaskStep,0);
		VET_201401_SPRING2_TASK:SetTask(VET_201401_SPRING2_TASK.Award,0);
	end
	local tTask = {
		[1] = "Ti猽 hao 1 V祅g + 1 gi� ng h� l猲 m筺g",
		[2] = "Giao n閜 240 G� Qu﹏ D鬾g",
		[3] = "Giao n閜 240 L� Dong",
		[4] = "Tr� l阨 3 c﹗ h醝",
		[5] = "Цnh b筰 240 con Heo R鮪g",
		[6] = "Ho祅 th祅h nhi謒 v�",
	}
	local nStep = VET_201401_SPRING2_TASK:GetTask(VET_201401_SPRING2_TASK.TaskStep)
	local tSay = {
		format("Nhi謒 v� ng祔 T誸 (%s)/#Vet_201401_sprint2_task(%d)", tTask[min(nStep + 1, 6)], nStep),
		"Nh薾 ph莕 thng nhi謒 v�/Vet_201401_sprint2_award",
		"T筰 h� ch� xem qua th玦/nothing",
	}
	Say("Ch骳 M鮪g N╩ M韎 ! ! !", getn(tSay), tSay);
end

function Vet_201401_sprint2_task(nStep, nTalk, nAns)
	if nStep == 0 then
		if GetCash() < 10000 then
			Talk(1,"",format("H祅h trang kh玭g gian %s kh玭g  %d", "V祅g", 1).." Kim ");
			return 0;
		end
--		if GetGameTime() < 3600 then
--			Talk(1,"","Th阨 gian tr猲 m筺g li猲 t鬰 kh玭g  1 ti課g ng h�");
--			return 0;
--		end
		if GetOnlineTime() < 1 * 3600 then
			Talk(1,"IpBonus","Th阨 gian tr猲 m筺g c馻 c竎 h� ch璦  1 gi�!")
			return
		end		
		if SetOnlineTime(3600,2) < 0 then	
			return 0
		end
		if Pay(10000) ~= 1 then
			return 0;
		end
	end
	if nStep == 1 then
		if GetItemCount(2, 0, 308) < 240 then
			Talk(1,"",format("H祅h trang kh玭g gian %s kh玭g  %d", "G� qu﹏ d鬾g", 240));
			return 0;
		end
		if DelItem(2, 0, 308, 240) ~= 1 then
			return 0;
		end
	end
	if nStep == 2 then
		if GetItemCount(2, 1, 30619) < 240 then
			Talk(1,"",format("H祅h trang kh玭g gian %s kh玭g  %d", "L� Dong", 240));
			return 0;
		end
		if DelItem(2, 1, 30619, 240) ~= 1 then
			return 0;
		end
	end
	if nStep == 3 then
		if nTalk == nil then
			Say("M錸g 1 T誸 __, M錸g 3 T誸 __.", 4, 
				format("M�, Cha/#Vet_201401_sprint2_task(%d, %d, %d)", nStep, 1, 1),
				format("Cha, M�/#Vet_201401_sprint2_task(%d, %d, %d)", nStep, 1, 2),
				format("Cha, Th莥/#Vet_201401_sprint2_task(%d, %d, %d)", nStep, 1, 3),
				format("g, B�/#Vet_201401_sprint2_task(%d, %d, %d)", nStep, 1, 4)
			)
			return 0;
		end
		if nTalk == 1 then
			if nAns ~= 3 then
				Talk(1,"","Tr� l阨 sai!");
				return 0;
			end 
			Say("M玭  Kh竎h Цo Thi猲 T礽 Цo, Gia H鱱 Nh﹏ Lai V筺 V藅 Lai ( c﹗ i n祔 d竛 � u trong nh� ?)", 4, 
				format("Tng nh�/#Vet_201401_sprint2_task(%d, %d, %d)", nStep, 2, 1),
				format("S祅 nh�/#Vet_201401_sprint2_task(%d, %d, %d)", nStep, 2, 2),
				format("S﹏ Nh�/#Vet_201401_sprint2_task(%d, %d, %d)", nStep, 2, 3),
				format("D竛 u c騨g 頲/#Vet_201401_sprint2_task(%d, %d, %d)", nStep, 2, 4)
			)
			return 0;
		end
		if nTalk == 2 then
			if nAns ~= 3 then
				Talk(1,"","Tr� l阨 sai!");
				return 0;
			end 
			Say("Ph骳 Nh� __,Th� T� Nam S琻.", 4, 
				format("Nam H秈/#Vet_201401_sprint2_task(%d, %d, %d)", nStep, 3, 1),
				format("B綾 H秈/#Vet_201401_sprint2_task(%d, %d, %d)", nStep, 3, 2),
				format("Йng H秈/#Vet_201401_sprint2_task(%d, %d, %d)", nStep, 3, 3),
				format("Long H秈/#Vet_201401_sprint2_task(%d, %d, %d)", nStep, 3, 4)
			)
			return 0;
		end
		if nTalk == 3 then
			if nAns ~= 3 then
				Talk(1,"","Tr� l阨 sai!");
				return 0;
			end 
		end
	end
	if nStep == 4 then
		if VET_201401_SPRING2_TASK:GetTask(VET_201401_SPRING2_TASK.WildPig) == 0 then
			VET_201401_SPRING2_TASK:SetTask(VET_201401_SPRING2_TASK.WildPig, 1);
			Talk(1,"","Чi hi謕 nhanh ch鉵g 甶 t譵 Heo R鮪g v� ti猽 di謙 n�!");
			Msg2Player(format("Nhi謒 v� ng祔 T誸: Ti猽 di謙 %d/%d con Heo R鮪g", 0, 240));
			return 0;
		end
		local nCount = VET_201401_SPRING2_TASK:GetTask(VET_201401_SPRING2_TASK.WildPigCount);
		if nCount < 240 then
			Talk(1,"",format("Nhi謒 v� ng祔 T誸: Ti猽 di謙 %d/%d con Heo R鮪g", nCount, 240));
			return 0;
		end
	end
	if nStep + 1 <= 5 then
		VET_201401_SPRING2_TASK:SetTask(VET_201401_SPRING2_TASK.TaskStep, nStep + 1);
		Vet_201401_sprint2_main();
	else
		Msg2Player("Ngi  ho祅 th祅h t蕋 c� nhi謒 v� ng祔 T誸, nhanh ch﹏ 甶 l穘h thng 甶!");
		Talk(1,"","Ngi  ho祅 th祅h t蕋 c� nhi謒 v� ng祔 T誸, nhanh ch﹏ 甶 l穘h thng 甶!");
	end
	return 0;
end

function Vet_201401_sprint2_trigger(sName)
	if gf_CheckEventDateEx(VET_201401_SPRING2_ACTIVITYID) ~= 1 then
		return 0;
	end
	if VET_201401_SPRING2_TASK:GetTask(VET_201401_SPRING2_TASK.WildPig) ~= 1 then
		return 0;
	end
	local nCount = VET_201401_SPRING2_TASK:GetTask(VET_201401_SPRING2_TASK.WildPigCount);
	if nCount >= 240 then
		return 0;
	end
	if sName == "Heo r鮪g" then
		VET_201401_SPRING2_TASK:SetTask(VET_201401_SPRING2_TASK.WildPigCount, nCount + 1);
		Msg2Player(format("Nhi謒 v� ng祔 T誸: Ti猽 di謙 %d/%d con Heo R鮪g", min(nCount + 1, 240), 240));
	end
end


function Vet_201401_sprint2_award()
	if VET_201401_SPRING2_TASK:GetTask(VET_201401_SPRING2_TASK.Award) ~= 0 then
		Talk(1,"","Ngi  nh薾 thng r錳");
		return 0;
	end
	if VET_201401_SPRING2_TASK:GetTask(VET_201401_SPRING2_TASK.TaskStep) ~= 5 then
		Talk(1,"","Ngi ch璦 ho祅 th祅h nhi謒 v� ng祔 T誸");
		return 0;
	end
	if gf_Judge_Room_Weight(4, 10," ") ~= 1 then
		return 0;
	end
	VET_201401_SPRING2_TASK:SetTask(VET_201401_SPRING2_TASK.Award, 1);
	gf_ModifyExp(20142014);
	gf_AddItemEx2({2, 1, 30167, 39}, "D鮝", "Event phu 4 thang 1");
	gf_AddItemEx2({2, 1, 30172, 39}, "Xo礽", "Event phu 4 thang 1");
	gf_AddItemEx2({2, 1, 30178, 39}, " я", "Event phu 4 thang 1");
	gf_AddItemEx2({2, 1, 30179, 39}, "M穘g C莡", "Event phu 4 thang 1");
	-------------------------------------------------
	--Complete By Veit
	--Update Value of Pet : 100 point
	local nCurPetLevel = mod(GetTask(TASK_VNG_PET), 100)
	if nCurPetLevel >= 1 then
		SetTask(TASK_VNG_PET, GetTask(TASK_VNG_PET) + (100 * 100)) --甶觤 n﹏g c蕄
		WriteLogEx("Event phu 4 thang 1", "nh薾 thng s� d鬾g v藅 ph萴 event ", 1, "100 甶觤 n﹏g c蕄")
		Msg2Player("B筺 nh薾 頲 100 觤 N﹏g C蕄 B筺 уng H祅h")
	end
	if nCurPetLevel >= 2 then
		--Pet's psychic value: 20 piont
		Pet_AddGP(20)
		WriteLogEx("Event phu 4 thang 1", "nh薾 thng s� d鬾g v藅 ph萴 event ", 1, "20 甶觤 linh l鵦")
		Msg2Player("B筺 nh薾 頲 20 觤 Linh L鵦 B筺 уng H祅h")
	end
	--
	-------------------------------------------------
end