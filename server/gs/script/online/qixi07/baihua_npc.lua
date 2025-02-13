--七夕活动脚本
--by vivi
--07/26/2007

Include("\\script\\online\\qixi07\\qixi07_head.lua")
Include("\\script\\lib\\lingshi_head.lua")

-- Modified 04/09/2020
CREATED_YEAR = 2020
YEAR1 = 20200000 -- 20070000
YEAR2 = 20300000 -- 20080000
EVERY_YEAR = 1
CHEAT_MOD = 1

--任务变量
TASK_QINGREN_AWARD = 2402; --西方情人节是否领取过当天奖励
TASK_SANBA_AWARD = 2403;  --是否领取过当天三八妇女节奖励
TASK_SANBA_MAPID = 2404;  --领取城市
TASK_SANBA_TIME = 2405;		--领取时间
TASK_SANBA_PIG = 2406;    --领取猪的类型，用于二次领奖
TASK_SANBA_PETTIME = 2407; --跟宠时间
TASK_SANBA_TWO = 2408;    --是否领取了二次奖励
TASK_SANBA_TONGXIN = 2409; --是否使用了同心丸

--全局变量
SANBA_AWARD_TIME = 1800; --三八节二次领取奖励时间，单位：秒

--好感度 经验系数 天时注解数量
tExp = {{500,750000,2},{2000,1500000,5},{10000,3000000,7},{9999999,4500000,10}};

tSanbaAward =--等级 模板 第一次经验（男） 第二次经验（男） 模板 第一次经验（女） 第二次经验（女） 对应猪符id
	{{{"Ti觰 H綾 tr� (m�)",300000,800000},{"Ti觰 H綾 tr� (b�)",300000,900000},120,2,0,619},
	 {{"Ti觰 B筩h tr� (m�)",300000,1100000},{"Ti觰 B筩h tr� (b�)",400000,1200000},180,2,0,621},	
	 {{"Ti觰 Kim tr� (m�)",500000,1300000},{"Ti觰 Kim tr� (b�)",600000,1500000},999,2,0,625},	
	};

function main()
	local strtab={
		"Ta mu鑞 nh薾 h箃 gi鑞g hoa h錸g v� H箃 Th莕 b�/get_seed",
		"Ta  nu玦 l韓 H箃 Th莕 b�, ngi n xem th� 甶/check_seed",
		"Ta c� th� l祄 g� v祇 L� Th蕋 T辌h n祔, tr錸g hoa th� n祇/know_detail",
		"Ta ch� n xem th�/nothing"
		};
	local nDate = tonumber(date("%Y%m%d"));
	if EVERY_YEAR == 1 then
		nDate = tonumber(date("%m%d"));
		YEAR1 = 0;
		YEAR2 = 0;
	end
	
	if nDate >= YEAR1 + 1110 and nDate <= YEAR1 + 1111 then
		tinsert(strtab,4,"Ch骳 M鮪g l� Quang C玭, nh薾 ph莕 thng ch骳 m鮪g/request_singleman_award");
	end;
	if nDate >= YEAR2 + 0213 and nDate <= YEAR2 + 0215 then
		tinsert(strtab,4,"H玬 nay l� L� T譶h nh﹏, b鋘 ta n y  頲 ch骳 ph骳/about_qingren");
	end
	if nDate >= YEAR2 + 0308 and nDate <= YEAR2 + 0309 then
		tinsert(strtab,4,"Ch骳 m鮪g ng祔 qu鑓 t� ph� n� 8-3/about_sanba")
	end
	if nDate >= YEAR2 + 0614 and nDate <= YEAR2 + 0615 then
		tinsert(strtab,4,"Nh﹏ i kinh nghi謒/about_shuangbei")
	end
	if nDate < YEAR1 + 0801 then
		Talk(1,"","Ho箃 ng Th蕋 t辌h v蒼 ch璦 b総 u.")
	else
		Say("Ng祔 Ng璾 Lang Ch鴆 n� g苝 nhau  n r錳.. Ta c� r蕋 nhi襲 h箃 gi鑞g hoa h錸g, v祇 ng祔 n祔 h穣 tr錸g cho ngi y猽 c馻 m譶h m閠 kh鉳 hoa h錸g. Ta g莕 y ph竧 hi謓 1 lo筰 H箃 Th莕 b�, nh璶g tr錸g ho礽 kh玭g 頲, n誹 ngi gi髉 ta tr錸g, ta s� tr� c玭g cho ngi.",
			getn(strtab),
			strtab);
	end 
end

function get_seed()
	if Zgc_pub_goods_add_chk(2,2) ~= 1 then
		return
	end
	if GetLevel() < 11 then
		Talk(1,"","ngi v蒼 ph秈 r蘮 luy謓 giang h� nhi襲 h琻 n鱝!");
		return
	end
	if EVERY_YEAR == 1 then
		CREATED_YEAR = tonumber(date("%Y"));
	end
	if MkTime(CREATED_YEAR,08,16)+28800 <= GetCreateTime()+28800 then
		Talk(1,"","R蕋 ti誧, ch� nh鱪g ngi t筼 trc ng祔 16 th竛g 8 n╩ 2007 m韎 nh薾 頲.");
		return
	end
	local nDate = tonumber(date("%Y%m%d"));
	if CHEAT_MOD ~= 1 and nDate > YEAR1 + 0830 then
		Talk(1,"","Х h誸 th阨 gian nh薾. Xin l莕 sau h穣 n s韒!");
		return
	end
	if GetTask(TASK_GET_SEED) == 0 then
		Talk(1,"","H玬 nay L� T譶h Nh﹏, H� th鑞g t苙g b筺 h箃 1 h箃 gi鑞g hoa h錸g v� 1 h箃 gi鑞g th莕 k�. N誹 b筺 tr錸g h箃 gi鑞g n祔 l韓 l猲, h� th鑞g s� t苙g b筺 ph莕 thng th輈h h頿.");
		SetTask(TASK_GET_SEED,1);
		if GetSex() == 1 then --男的
			local add_flog_one = AddItem(2,0,1154,1);  --神秘种子
			local add_flog_two = AddItem(2,0,352,1);  --玫瑰花种子
			if add_flog_one == 1 and add_flog_two == 1 then
				Msg2Player("B筺 nh薾 頲 1 h箃 gi鑞g hoa h錸g v� h箃 gi鑞g th莕 k�.");
			else
				WriteLog("Ho箃 ng Th蕋 T辌h: Ngi ch琲"..GetName().."Nh薾 l蕐 h箃 gi鑞g hoa h錸g v� h箃 gi鑞g th莕 k� th蕋 b筰. V� tr� th蕋 b筰. V� tr� th蕋 b筰:"..add_flog_one.." v�"..add_flog_two);
			end
		else --女的
			local add_flog_one = AddItem(2,0,1154,1);  --神秘种子
			if add_flog_one == 1 then
				Msg2Player("B筺 nh薾 頲 1 h箃 gi鑞g th莕 k�!");
			else
				WriteLog("Ho箃 ng Th蕋 T辌h: Ngi ch琲"..GetName().."Nh薾 l蕐 h箃 gi鑞g hoa h錸g v� h箃 gi鑞g th莕 k� th蕋 b筰. V� tr� th蕋 b筰. V� tr� th蕋 b筰:"..add_flog_one);
			end
		end	
	else
		Talk(1,"","R蕋 ti誧! M鏸 ngi ch� nh薾 頲 1 ph莕.");
	end
end

function check_seed()
	if GetItemCount(2,0,1154) == 0 and GetItemCount(2,0,1155) == 0 then
		Talk(1,"","Tr猲 ngi b筺 kh玭g c� h箃 gi鑞g th莕 k� v� hoa th莕 k�!");
		return
	end
	local strtab = {
		"Xem hoa n祔! T玦 mu鑞 nh薾 ph莕 thng trng th祅h/get_grow_award",
		"T玦 a hoa cho b筺. T玦 mu鑞 nh薾 ph莕 thng cu鑙 c飊g./get_final_award",
		"T玦 c莕 ph秈 ti誴 t鬰 tr錸g hoa/nothing"
		};
	Say("B筺  tr錸g 頲 hoa th莕 k� n祔. H� th鑞g  chu萵 b� 2 ph莕 thng kh玭g li猲 ti誴, c╪ c� v祇  l韓 c馻 hoa 頲: ph莕 thng trng th祅h, n誹 tr鵦 ti誴 a hoa cho h� th鑞g s� 頲 ph莕 thng cu鑙 c飊g. <color=yellow>M鏸 ngi ch� 頲 tr錸g 1 l莕 hoa th莕 k�<color>.",
		getn(strtab),
		strtab
		);
end

function get_grow_award()
	local fl_grow = GetTask(TASK_FLOWER_GROW);
	local exp_arg = ((GetLevel()^3)/(80^3))*0.8;  --经验系数
	if fl_grow == 0 then	
		Talk(1,"","Hoa ch璦 trng th祅h!");
	else
		for i = 1,getn(tGrowAward) do
			if fl_grow <= tGrowAward[i][1] and fl_grow <= 100 then  
				if fl_grow <= 30 and GetBit(GetTask(TASK_AWARD_ONE),i) ~= 0 then 
					Talk(1,"","Hoa kh玭g c� thay i g�. Ti誴 t鬰 tr錸g."); 
				elseif fl_grow <= 30 and GetBit(GetTask(TASK_AWARD_ONE),i) == 0 then
					Talk(1,"","B筺 頲 1 甶觤 ch╩ ch�. ");
					SetBit(GetTask(TASK_AWARD_ONE),i,1);
					SetTask(TASK_AWARD_ONE,SetBit(GetTask(TASK_AWARD_ONE),i,1));
					local r=random(tGrowAward[i][2],tGrowAward[i][3]);  --在给定范围给随机经验
					ModifyExp(floor(r*10000*exp_arg));
					Msg2Player("Ch骳 m鮪g b筺 nh薾 頲 "..floor(r*10000*exp_arg).." kinh nghi謒.");
				elseif fl_grow > 30 and GetBit(GetTask(TASK_AWARD_TWO),i-30) ~= 0 then
					local tGrow = {40,50,60,80,100}
					for i = 1,getn(tGrow)-1 do
						if fl_grow > tGrow[i] and fl_grow < tGrow[i+1] then
							Talk(1,"","Hoa kh玭g c� thay i g�, ti誴 t鬰 tr錸g n khi <color=red>"..tGrow[i+1].."<color>. ")
							return
						end
					end
					Talk(1,"","Hoa kh玭g c� thay i g�. Ti誴 t鬰 tr錸g."); 
				elseif fl_grow > 30 and GetBit(GetTask(TASK_AWARD_TWO),i-30) == 0 then
					Talk(1,"","B筺 頲 1 甶觤 ch╩ ch�. ");
					SetBit(GetTask(TASK_AWARD_TWO),i-30,1);
					SetTask(TASK_AWARD_TWO,SetBit(GetTask(TASK_AWARD_TWO),i-30,1));
					local r=random(tGrowAward[i][2],tGrowAward[i][3]);  --在给定范围给随机经验
					ModifyExp(floor(r*10000*exp_arg));
					Msg2Player("Ch骳 m鮪g b筺 nh薾 頲 "..floor(r*10000*exp_arg).." kinh nghi謒.");										
				end
				break	   
			elseif fl_grow > 100 then
				WriteLog("Ho箃 ng Th蕋 T辌h, hoa th藅 c bi謙. Tr� s� c bi謙 l�:"..fl_grow);
				return
			end
		end
	end
end

function get_final_award()
	if GetTask(TASK_GET_FINAL) ~= 0 then
		Talk(1,"main","Ph莕 thng cu鑙 c飊g c馻 m鏸 nh﹏ v藅 ch� 頲 nh薾 1 l莕. B筺  nh薾 r錳.");
		return
	end	
	local strtab = {
		"Hoa n祔 t苙g cho h� th鑞g. Ta mu鑞 ph莕 thng /confirm_award",
		"T玦 mu鑞 suy ngh� l筰/nothing"
		};
	local fl_grow = GetTask(TASK_FLOWER_GROW);
	local j = 0;
	local exp_arg = ((GetLevel()^3)/(80^3))*0.8;			
	if fl_grow == 0 then
		Say("Ngi kh玭g ch╩ ch� tr錸g hoa, ch� c� th� nh薾 ph莕 thng n祔 th玦!",
			getn(strtab),
			strtab
			);
	else 
		for i = 2,getn(tFinalAward) do
			if fl_grow <= tFinalAward[i][1] and fl_grow <= 100 then
				j = i;
				break
			elseif fl_grow > 100 then
				WriteLog("Ho箃 ng Th蕋 T辌h, hoa th藅 c bi謙. Tr� s� c bi謙 l�:"..fl_grow);
				return
			end
		end		
		if j == 2 then
			Say("Ngi  ch╩ ch� tr錸g hoa, 頲 nh薾 1 s� ph莕 thng b錳 thng. T飝 theo  l韓 c馻 hoa, ngi nh薾 頲 <color=red>"..floor(tFinalAward[j][2]*exp_arg).." <color> kinh nghi謒,",
				getn(strtab),
				strtab
				);
		elseif j > 2 then
			Say("Ngi  ch╩ ch� tr錸g hoa, 頲 nh薾 1 s� ph莕 thng b錳 thng. T飝 theo  l韓 c馻 hoa, ngi nh薾 頲 <color=red>"..floor(tFinalAward[j][2]*exp_arg).." <color> kinh nghi謒,"..tBoxAward[j-2],
				getn(strtab),
				strtab
				);
		end			
	end
end

function confirm_award()
	local fl_grow = GetTask(TASK_FLOWER_GROW);
	local j = 0;
	local exp_arg = ((GetLevel()^3)/(80^3))*0.8;
	if fl_grow < 60 then
		if Zgc_pub_goods_add_chk(1,1) ~= 1 then
			return
		end
	elseif fl_grow < 80 then
		if Zgc_pub_goods_add_chk(2,2) ~= 1 then
			return
		end
	elseif fl_grow < 100 then
		if Zgc_pub_goods_add_chk(3,3) ~= 1 then
			return
		end		
	elseif fl_grow >= 100 then
		if Zgc_pub_goods_add_chk(5,5) ~= 1 then
			return
		end
	end					
	if fl_grow == 0 then
		if DelItem(2,0,1154,1) == 1 then   --没有种下花
			set_task_ling();
			ModifyExp(floor(tFinalAward[1][2]*exp_arg));
			Msg2Player("Ch骳 m鮪g b筺 nh薾 頲 "..floor(tFinalAward[1][2]*exp_arg).." kinh nghi謒.");
		elseif DelItem(2,0,1155,1) == 1 then  --种下了花
			set_task_ling();
			ModifyExp(floor(tFinalAward[1][2]*exp_arg));
			Msg2Player("Ch骳 m鮪g b筺 nh薾 頲 "..floor(tFinalAward[1][2]*exp_arg).." kinh nghi謒.");
		end
	else
		for i = 2,getn(tFinalAward) do
			if fl_grow <= tFinalAward[i][1] and fl_grow <= 100 then
				j = i;
				break
			elseif fl_grow > 100 then
				WriteLog("Ho箃 ng Th蕋 T辌h, hoa th藅 c bi謙. Tr� s� c bi謙 l�:"..fl_grow);
				return
			end
		end
		local r=random(1,100)
		local p=random(1,100)
		if DelItem(2,0,1155,1) == 1 then
			ModifyExp(floor(tFinalAward[j][2]*exp_arg));
			Msg2Player("Ch骳 m鮪g b筺 nh薾 頲 "..floor(tFinalAward[j][2]*exp_arg).." kinh nghi謒.");			
			if r <= tFinalAward[j][3] then 					
				local add_flog = AddItem(2,1,1153,tFinalAward[j][4]);
				if add_flog == 1 then
					Msg2Player("Ch骳 m鮪g b筺 nh薾 頲 h閜 уng T﹎"..tFinalAward[j][4].."!");
				else
					WriteLog("Ho箃 ng Th蕋 T辌h: Ngi ch琲"..GetName().."Nh薾 h閜 уng T﹎ th蕋 b筰. V� tr�:"..add_flog);
					return				
				end
			end
			if p <= tFinalAward[j][5] then
				local add_flog_two = AddItem(2,1,1152,tFinalAward[j][6]);
				if add_flog_two == 1 then
					Msg2Player("Ch骳 m鮪g b筺 nh薾 頲 h閜 Th莕 Binh S� qu鑓"..tFinalAward[j][6].."!");
				else
					WriteLog("Ho箃 ng Th蕋 T辌h: Ngi ch琲"..GetName().."Nh薾 h閜 Th莕 Binh S� qu鑓 th蕋 b筰. V� tr�:"..add_flog_two);
					return
				end
			end
			set_task_ling(); --变量清0
		end
	end
end

function set_task_ling()
	SetTask(TASK_FLOWER_GROW,0);
	SetTask(TASK_AWARD_ONE,0);
	SetTask(TASK_AWARD_TWO,0);
	SetTask(TASK_TOTAL_TIME,0);
	SetTask(TASK_IS_PLANT,0);	
	SetTask(TASK_IS_GROW,0);
	SetTask(TASK_CURRENT_LOGIN,0);
	SetTask(TASK_LAST_LOGIN,0);
	SetTask(TASK_GET_FINAL,1);	
end

function know_detail()
	local strtab = {
		"Ta c� th� tham gia ho箃 ng n祇/active",
		"Tr錸g hoa nh� th� n祇?/grow_flower",
		"T玦 mu鑞 xem ph莕 thng v� hoa c� nh鱪g m鉵 n祇/see_award",
		"Sau n祔 h穣 h醝/nothing"
		};
	Say("Th蕋 T辌h n祔 h� th鑞g  chu萵 b� r蕋 nhi襲 qu� t苙g. C竎 h� mu鑞 t譵 hi觰 g�?",
		getn(strtab),
		strtab
		);
end

function active()
	Talk(1,"know_detail","Th蕋 T辌h l� ng祔 l� l穘g m筺, l� d辮 g苝 nhau m鏸 n╩ 1 l莕 c馻 Ng璾 lang v� Ch鴆 N� t筰 c莡 � Thc. H� th鑞g  chu萵 b� h箃 gi鑞g hoa h錸g cho nh鱪g ngi y猽 nhau, c竎 v� thi誹 hi謕 h穣 v� ngi y猽 m� tr錸g 1 a hoa h錸g, c礽 l猲 t鉩 ngi y猽. H� th鑞g c� 1 h箃 gi鑞g th莕 k� t苙g cho b筺 tr錸g, n誹 tr錸g hoa l韓 l猲 s� 頲 1 s� l� v藅. <color=yellow> Ch� nh薾 h箃 gi鑞g trong v遪g 2 tu莕 khi ho箃 ng b総 u<color>");
end

function grow_flower()
	Talk(1,"know_detail","Ch� c莕 b筺 nh蕄 chu閠 ph秈 v祇 c竎 lo筰 hoa, th� l� c� th� tr錸g hoa, trong h祅h l� c馻 b筺 s� xu蕋 hi謓 1 'Hoa th莕 b�', ch� �, ch� khi s� d鬾g <color=red>B錸g Lai Ti猲 th駓<color> ho芻 <color=red>B錸g Lai Ti猲 l�<color> ho芻 <color=red>B錸g Lai Ti猲 n<color>, m鏸 ng祔 b筺 ch� c莕 l猲 m筺g 1 ti課g tr� l猲, c� th� t╪g 1 甶觤  trng th祅h, nh璶g m鏸 ng祔 ch� c� th� trng th祅h m閠 l莕,  trng th祅h t鑙 產 l� 100 甶觤.");
end

function see_award()
	Talk(1,"see_award2","Ta chu萵 b� hai lo筰 ph莕 thng, t飝 theo b筺 nu玦 hoa l韓 t韎 u, ta s� cho b筺 m閠 s� kinh nghi謒 l祄 ph莕 thng trng th祅h, n誹 b筺 tr鵦 ti誴 a hoa cho ta, ta s� cho b筺 ph莕 thng cu鑙 c飊g, nh璶g ph秈 ch� �, kh玭g th� cho hai ph莕 thng c飊g l骳, ph秈 chia ra nh薾. <color=yellow>H琻 n鱝 m鏸 ngi ch� c� th� tr錸g Hoa th莕 b� 1 l莕, n誹 i hoa l蕐 ph莕 thng cu鑙 c飊g, b筺 kh玭g 頲 ti誴 t鬰 tr錸g hoa n鱝<color>.");
end

function see_award2()
	Talk(1,"see_award3","Ph莕 thng cu鑙 c飊g nh� sau:: <color=yellow>\n trng th祅h t� 5 tr� xu鑞g, cho kinh nghi謒\n trng th祅h t� 10 tr� xu鑞g, cho kinh nghi謒 v� 10% x竎 su蕋 nh薾 頲 1 H閜 уng t﹎\n trng th祅h t� 20 tr� xu鑞g, cho kinh nghi謒 v� 20% x竎 su蕋 nh薾 頲 1 H閜 уng t﹎\n trng th祅h t� 40 tr� xu鑞g, cho kinh nghi謒 v� 40% x竎 xu蕋 nh薾 頲 1 H閜 уng t﹎\n trng th祅h t� 50 tr� xu鑞g, cho kinh nghi謒 v� 60% xu蕋 nh薾 頲 1 H閜 уng t﹎<color>");
end

function see_award3()
	Talk(1,"know_detail","<color=yellow>\n trng th祅h t� 60 tr� xu鑞g, cho kinh nghi謒 v� 80% x竎 su蕋 nh薾 頲 1 H閜 уng t﹎\n trng th祅h t� 80 tr� xu鑞g, cho kinh nghi謒 cho 1 H閜 уng t﹎, 1 H閜 Th莕 Binh S� qu鑓\n trng th祅h t� 100 tr� xu鑞g, cho kinh nghi謒 v� 1 H閜 уng t﹎, 2 H閜 Th莕 Binh S� qu鑓\n trng th祅h t 100, cho kinh nghi謒 v� cho 1 H閜 уng t﹎, 4 H閜 Th莕 Binh S� qu鑓<color>");
end

function request_singleman_award()
	local selTab = {
				"Nh薾 l� v藅 ch骳 m鮪g/get_singleman_award",
				"Quay u nh薾 l� v藅/nothing",
				}
	Say("L� Quang c玭 n r錳, kh玭g bi誸 ph秈 ch╪g b籲g h鱱? (hi謕 n�) v蒼 c遪 m閠 m譶h phi猽 b箃 ch鑞 giang h�, ng 產u l遪g, trong d辮 l� n祔, 2 i l� ki誱 v鈔g s� 頲 g鰅 n, ch髇g ta m芻 s鴆 hng th� th� gi韎 tr� ch琲! N誹 ngi kh玭g ph秈 c� gia qu� ph�, ng 產u l遪g, ta c騨g c� l� v藅 t苙g ngi. V祇 <color=yellow>ng祔 10 v� 11 th竛g 11, m鏸 t鑙 t� 18:00##23:00<color> n l穘h i l� kinh nghi謒!",getn(selTab),selTab);
end;

function get_singleman_award()
	local nDate = tonumber(date("%y%m%d"));
	local nHour = tonumber(date("%H"));
	local nGetDate = GetTask(1850);
	local nLevel = GetLevel();
	if nLevel <= 10 then
		Talk(1,"","Th藅 ng筰 qu�, ngi ch琲 t� c蕄 10 tr� l猲 m韎 頲 nh薾 l� ph萴.");
		return 0;
	end;
	if (nGetDate ~= 0 and nGetDate ~= 071110 and nGetDate ~= 071111) or nGetDate >= nDate then
		Talk(1,"","Th藅 ng筰 qu�, h玬 nay b筺  nh薾 l� ph萴 r錳.");
		return 0;	
	end;
	if nHour >= 18 and nHour < 23 then
		SetTask(1850,nDate);
		local nExp = 0;
		if GetMateName() == "" then
			nExp = floor((nLevel^4)/12);
		else
			nExp = floor((nLevel^4)/16);
		end;
		ModifyExp(nExp);
		Msg2Player("B筺 nh薾 頲 "..nExp.." 甶觤 kinh nghi謒");
		Talk(1,"","C� ch髏 qu� m鋘 cho b筺, ch骳 b筺 vui v�!");
	else
		Talk(1,"","V蒼 ch璦 n gi�. Xin i n <color=yellow>18:00##23:00<color>gi� nh薾");
	end;
end;

function nothing()
end

function about_qingren()
	local strtab = {
			"Ta 甶 c飊g � trung nh﹏/get_award_qingren",
			"Thuy誸 minh ho箃 ng l� T譶h nh﹏/about_qingren_detail",
			"Ta v蒼 ch璦 c� � trung nh﹏/nothing"};
			
	Say("L� t譶h nh﹏  n, t� ng祔13 n ng祔 15 th竛g 2, n誹 c竎 h� c� c秏 t譶h v韎 ai , c� th� c飊g t� i n g苝 ta, ta s� c╪ c� v祇  h秓 c秏 gi鱝 c竎 ngi, ban t苙g l阨 ch骳 ph骳. Xin ch� �, m閠 ngi m閠 ng祔 nh薾 頲 1 l莕 ch骳 ph骳.",
		getn(strtab),
		strtab);
end

function get_award_qingren()
	local nDate = tonumber(date("%Y%m%d"));
	local nOldIndex = PlayerIndex;
	local nSex1,nSex2 = 0,0;
	local nFriend = 0; --好感度
	
	if GetTeamSize() ~= 2 then
		Talk(1,"","Ph秈 d蒼 � trung nh﹏ c馻 ngi m閠 m譶h n g苝 ta.");
	else
		PlayerIndex = GetTeamMember(1);
		nSex1 = GetSex();
		if GetTask(TASK_QINGREN_AWARD) >= nDate then
			PlayerIndex = nOldIndex;
			Talk(1,"","Th藅 ng ti誧, ta  ch骳 ph骳 cho ngi trong i c馻 ngi r錳.");
			return
		end
		PlayerIndex = GetTeamMember(2);
		nSex2 = GetSex();
		if GetTask(TASK_QINGREN_AWARD) >= nDate then
			PlayerIndex = nOldIndex;
			Talk(1,"","Th藅 ng ti誧, ta  ch骳 ph骳 cho ngi trong i c馻 ngi r錳.");
			return
		end		
		PlayerIndex = nOldIndex;
		if nSex1 == nSex2 then
			Talk(1,"","Ph秈 d蒼 � trung nh﹏ c馻 ngi n, kh玭g ph秈 b籲g h鱱.");
			return
		end
		if PlayerIndex == GetTeamMember(1) then
			nFriend = GetMemberFriendliness(2);
		elseif PlayerIndex == GetTeamMember(2) then
			nFriend = GetMemberFriendliness(1);
		end
		for i = 1,getn(tExp) do
			if nFriend <= tExp[i][1] then 
				PlayerIndex = GetTeamMember(1);
				local nLv = GetLevel();
				if nLv == 99 then  --先对两个人进行负重检测
					if GetFreeItemRoom() < 1 or (GetMaxItemWeight() - GetCurItemWeight()) < tExp[i][3] then
						PlayerIndex = nOldIndex;
						Talk(1,"","H祅h trang ho芻 s鴆 l鵦 c馻 b筺 ho芻 ng i kh玭g , h穣 ch豱h l� l筰 甶.");
						return
					end
				elseif nLv <= 30 then
					PlayerIndex = nOldIndex;
					Talk(1,"","Hai ngi ph秈 t c蕄 30 tr� l猲 m韎 甶 頲.");
					return						
				end
				PlayerIndex = GetTeamMember(2);
				local nLv2 = GetLevel();
				if nLv2 == 99 then
					if GetFreeItemRoom() < 1 or (GetMaxItemWeight() - GetCurItemWeight()) < tExp[i][3] then
						PlayerIndex = nOldIndex;
						Talk(1,"","H祅h trang ho芻 s鴆 l鵦 c馻 b筺 ho芻 ng i kh玭g , h穣 ch豱h l� l筰 甶.");
						return
					end
				elseif nLv2 <= 30 then
					PlayerIndex = nOldIndex;
					Talk(1,"","Hai ngi ph秈 t c蕄 30 tr� l猲 m韎 甶 頲.");
					return						
				end
				
				PlayerIndex = GetTeamMember(1);								
				local nExp = floor(tExp[i][2]*nLv^2/80^2);				
				if nLv ~= 99 then
					SetTask(TASK_QINGREN_AWARD,nDate);
					ModifyExp(nExp);
					Msg2Player("Ch骳 m鮪g b筺 nh薾 頲 "..nExp.." 甶觤 kinh nghi謒.");
					Talk(1,"","Ta ch骳 hai ngi h筺h ph骳, c� ch髏 qu� t苙g c竎 ngi, "..nExp.." 甶觤 kinh nghi謒, gi髉 c竎 ngi h祅h t萿 giang h�.");
				else
					SetTask(TASK_QINGREN_AWARD,nDate);
					AddItem(2,1,3210,tExp[i][3]);
					Msg2Player("Ch骳 m鮪g b筺 nh薾 頲 "..tExp[i][3].."quy觧 Thi猲 Th阨 Ch� Gi秈");
					Talk(1,"","Ta ch骳 hai ngi h筺h ph骳, c� ch髏 qu� t苙g c竎 ngi, "..tExp[i][3].."quy觧 Thi猲 Th阨 Ch� Gi秈, gi髉 c竎 ngi phi猽 b箃 giang h�");
				end
				PlayerIndex = GetTeamMember(2);
				local nExp2 = floor(tExp[i][2]*nLv2^2/80^2);				
				if nLv2 ~= 99 then
					SetTask(TASK_QINGREN_AWARD,nDate);
					ModifyExp(nExp2);
					Msg2Player("Ch骳 m鮪g b筺 nh薾 頲 "..nExp2.." 甶觤 kinh nghi謒.");
					Talk(1,"","Ta ch骳 hai ngi h筺h ph骳, c� ch髏 qu� t苙g c竎 ngi, "..nExp2.." 甶觤 kinh nghi謒, gi髉 c竎 ngi h祅h t萿 giang h�.");
				else
					SetTask(TASK_QINGREN_AWARD,nDate);
					AddItem(2,1,3210,tExp[i][3]);
					Msg2Player("Ch骳 m鮪g b筺 nh薾 頲 "..tExp[i][3].."quy觧 Thi猲 Th阨 Ch� Gi秈");
					Talk(1,"","Ta ch骳 hai ngi h筺h ph骳, c� ch髏 qu� t苙g c竎 ngi, "..tExp[i][3].."quy觧 Thi猲 Th阨 Ch� Gi秈, gi髉 c竎 ngi phi猽 b箃 giang h�");
				end
				PlayerIndex = nOldIndex;
				break
			end
		end
	end								
end

function about_qingren_detail()
	Talk(1,"","Ta s� c╪ c� v祇  h秓 c秏 gi鱝 ngi v� i h鱱  t苙g ph莕 thng.\n0-500  h秓 c秏, n誹 b筺 � c蕄 80 s� 頲 75 v筺 kinh nghi謒\n501-2000  h秓 c秏, n誹 b筺 � c蕄 80 s� 頲 150 v筺 kinh nghi謒\n2001-10000  h秓 c秏, n誹 b筺 � c蕄 80 s� 頲 300 v筺 kinh nghi謒\n10001  h秓 c秏 tr� l猲, n誹 b筺 � c蕄 80 s� 頲 450 v筺 kinh nghi謒\nЪng c蕄 kh竎 s� 頲 gi秏 ho芻 t╪g nh蕋 nh, n誹 trong i c� ngi t c蕄 99 s� nh薾 頲'thi猲 th阨 ch� gi秈' l祄 ph莕 thng. Ch骳 L� t譶h nh﹏ vui v�!");
end

function about_sanba()
	local strtab={
		"Ch骳 m鮪g Qu鑓 t� ph� n�, m阨 nh薾 qu�/get_sanba_one",
		"Nh薾 l� v藅 ch骳 m鮪g l莕 th� 2/get_sanba_two",
		"Thuy誸 minh ph莕 thng/sanba_deteil",
		"Ta ch� n xem th�/nothing"
		};
	Say("Xu﹏ v� kh緋 n琲, v筺 v藅 h錳 sinh. Ch髇g ta l筰 ch祇 n ng祔 l� 'Qu鑓 t� ph� n� 8-3',  c秏 琻 c竎 ch� em ph� n�  駈g h� tr� ch琲, v祇 l骳 08:00�22:30 ng祔 8 v� ng祔 9 th竛g 3 ch髇g ta s� c� nh鱪g ph莕 qu� c bi謙 d祅h cho ch� em. Hai ngi m閠 t�, ng c蕄 hai ngi c祅g cao c祅g c� c� h閕 nh薾 qu� t鑤. M鏸 ngi m閠 ng祔 ch� nh薾 m閠 ph莕 qu�. H穣 s緋 x誴 l筰 h祅h trang. M竎h nh�: a cho ta 1 vi猲 уng T﹎ Ho祅, ta s� cho c竎 ngi s� ng筩 nhi猲 g蕄 3 l莕.",
			getn(strtab),
			strtab);	
end

function get_sanba_one()
	local strtab = {
			"Ch髇g ta ph秈 l蕐 l� v藅/#ask_use_tongxin(1)",
			"Ta mu鑞 l蕐 l� v藅/give_him_award",
			"Ta 甶 t譵 m閠 b籲g h鱱 !/nothing"
			};
	Say("Ngi m閠 m譶h n l蕐 hay d蒼 theo b筺 kh竎 gi韎 n l蕐?",
		getn(strtab),
		strtab)
end

function ask_use_tongxin(nNum)
	if nNum == 1 then
		Say("S� d鬾g уng T﹎ Ho祅 nh薾 畊頲 ph莕 thng kinh nghi謒 g蕄 3 l莕, hai ngi c莕 2 vi猲 уng T﹎ Ho祅, a уng T﹎ Ho祅 cho i trng. Mu鑞 s� d鬾g kh玭g?",
			3,
			"Л頲, ta ch蕄 nh薾./#give_them_award(1)",
			"Kh玭g c莕, tr鵦 ti誴 nh薾 l� ph萴/#give_them_award(2)",
			"ьi , ta v蒼 ch璦 chu萵 b�/nothing")
	elseif nNum == 2 then
		Say("S� d鬾g уng T﹎ Ho祅 nh薾 畊頲 ph莕 thng kinh nghi謒 g蕄 3 l莕, mu鑞 s� d鬾g kh玭g?",
			3,
			"Л頲, ta ng �./#confirm_sanba_award(1)",
			"Kh玭g c莕, tr鵦 ti誴 nh薾 l� ph萴/#confirm_sanba_award(2)",
			"ьi , ta v蒼 ch璦 chu萵 b�/nothing")
	end
end

function give_them_award(nType)
	local nDate = tonumber(date("%Y%m%d"));
	local nPos = GetWorldPos();
	local nOldIndex = PlayerIndex;
	local nSexOne,nSexTwo = 0,0;
	local nLvOne,nLvTwo,nLvTotal = 0,0,0;
	local sNameOne,sNameTwo = "","";
	local nTempType = 0; 
	
	if GetTeamSize() ~= 2 then
		Talk(1,"","D蒼 theo b筺 kh竎 gi韎 n s� c祅g c� nhi襲 ph莕 thng, c� hai ngi nh蕋 nh ph秈 n g苝 ta.");
	else 
		if PlayerIndex ~= GetTeamMember(0) then
			Talk(1,"","M阨 i trng n l蕐.");
			return
		end
		if nType == 1 then
			if GetItemCount(2,1,573) < 2 then
				Talk(1,"","C莕 2 vi猲 уng T﹎ Ho祅, ngi kh玭g c� .");
				return
			end
		end
		
		nSexOne = GetSex();
		nLvOne = GetLevel();
		sNameOne = GetName();
		if GetTask(TASK_SANBA_AWARD) >= nDate then
			PlayerIndex = nOldIndex;
			Talk(1,"","Th藅 ng ti誧, ta  t苙g qu� cho ngi trong i c馻 ngi r錳, m鏸 ngi m閠 ng祔 ch� 畊頲 l穘h m閠 l莕.");
			return
		end
		if PlayerIndex == GetTeamMember(1) then
			PlayerIndex = GetTeamMember(2);
		elseif PlayerIndex == GetTeamMember(2) then
			PlayerIndex = GetTeamMember(1);
		end
		nSexTwo = GetSex();
		nLvTwo = GetLevel();
		sNameTwo = GetName();
		if GetTask(TASK_SANBA_AWARD) >= nDate then
			PlayerIndex = nOldIndex;
			Talk(1,"","Th藅 ng ti誧, ta  t苙g qu� cho ngi trong i c馻 ngi r錳, m鏸 ngi m閠 ng祔 ch� 畊頲 l穘h m閠 l莕.");
			return
		end		
		PlayerIndex = nOldIndex;
		
		if nSexOne == nSexTwo then
			Talk(1,"","Ph秈 mang theo b筺 kh竎 gi韎 c馻 ngi n m韎 頲.");
			return
		end
		if nLvOne < 11 or nLvTwo < 11 then
			Talk(1,"","Ngi trong i ngi c莕 r蘮 luy謓 th猰 tr猲 giang h�.");
			return
		end			
		nLvTotal = nLvOne+nLvTwo; --等级之和
		for i=1,getn(tSanbaAward) do
			if nLvTotal < tSanbaAward[i][3] then
				nTempType = i;
				break
			end
		end
							
		local nExpOne = floor(tSanbaAward[nTempType][nSexOne][2]*nLvOne^3/80^3);
		local nExpTwo = floor(tSanbaAward[nTempType][nSexTwo][2]*nLvTwo^3/80^3);
		local nNumOne,nNumTwo = 1,1;
		if nType == 1 then
			if DelItem(2,1,573,2) == 1 then
				nExpOne = nExpOne*3;
				nExpTwo = nExpTwo*3;
				nNumOne = nNumOne*3;
				nNumTwo = nNumTwo*3;
			end
		end
		local nRandExp = random(1,100);
		if nRandExp >= 99 then
			nExpOne = nExpOne*3;
			nExpTwo = nExpTwo*3;
			nNumOne = nNumOne*3;
			nNumTwo = nNumTwo*3;
			Msg2Global("Ch骳 m鮪g "..sNameOne.."Trong ho箃 ng m鮪g 8-3 nh薾 頲 ph莕 thng kinh nghi謒 g蕄 3 l莕");
			Msg2Global("Ch骳 m鮪g "..sNameTwo.."Trong ho箃 ng m鮪g 8-3 nh薾 頲 ph莕 thng kinh nghi謒 g蕄 3 l莕");
		elseif nRandExp >= 96 then
			nExpOne = nExpOne*2;
			nExpTwo = nExpTwo*2;
			nNumOne = nNumOne*2;
			nNumTwo = nNumTwo*2;
			Msg2Global("Ch骳 m鮪g "..sNameOne.."Trong ho箃 ng m鮪g 8-3 nh薾 頲 ph莕 thng kinh nghi謒 g蕄 2 l莕!");
			Msg2Global("Ch骳 m鮪g "..sNameTwo.."Trong ho箃 ng m鮪g 8-3 nh薾 頲 ph莕 thng kinh nghi謒 g蕄 2 l莕!");			
		end		
		if nLvOne ~= 99 then		
			ModifyExp(nExpOne);
			Msg2Player("Ch骳 m鮪g b筺 nh薾 頲 "..nExpOne.."Kinh nghi謒");
		else
			for i=1,nNumOne do
				local nRand = random(1,6);
				lspf_AddLingShiInBottle(nRand,1);
				Msg2Player("Ch骳 m鮪g b筺 nh薾 頲 "..nRand.." (c蕄) Linh th筩h 1 vi猲");
			end
		end
		SetTask(TASK_SANBA_AWARD,nDate);
		SetTask(TASK_SANBA_MAPID,nPos);
		SetTask(TASK_SANBA_TIME,GetTime());
		SetTask(TASK_SANBA_PIG,nTempType);
		SetTask(TASK_SANBA_PETTIME,GetTime());
		if nType == 1 then
			SetTask(TASK_SANBA_TONGXIN,1);
		end
		AddItem(tSanbaAward[nTempType][4],tSanbaAward[nTempType][5],tSanbaAward[nTempType][6],1);
		Talk(1,"","T苙g cho c竎 ngi kinh nghi謒 phong ph� v� l頽 con d� thng@^_^@Sau n鯽 ti課g n鱝 n ch� ta! ( c� th� n trc m閠 m譶h) c遪 r蕋 nhi襲 ph莕 thng. Nh� r籲g ta l� B竎h Hoa s� gi� c馻 th祅h n祔, 甶 sai th祅h s� kh玭g nh薾 頲 qu�.");
		if PlayerIndex == GetTeamMember(1) then
			PlayerIndex = GetTeamMember(2);
		elseif PlayerIndex == GetTeamMember(2) then
			PlayerIndex = GetTeamMember(1);
		end		
		if nLvTwo ~= 99 then
			ModifyExp(nExpTwo);
			Msg2Player("Ch骳 m鮪g b筺 nh薾 頲 "..nExpTwo.."Kinh nghi謒");
		else
			for i=1,nNumTwo do
				local nRand = random(1,6);
				lspf_AddLingShiInBottle(nRand,1);
				Msg2Player("Ch骳 m鮪g b筺 nh薾 頲 "..nRand.." (c蕄) Linh th筩h 1 vi猲");
			end
		end
		SetTask(TASK_SANBA_AWARD,nDate);
		SetTask(TASK_SANBA_MAPID,nPos);
		SetTask(TASK_SANBA_TIME,GetTime());
		SetTask(TASK_SANBA_PIG,nTempType);
		SetTask(TASK_SANBA_PETTIME,GetTime());
		if nType == 1 then
			SetTask(TASK_SANBA_TONGXIN,1);
		end		
		AddItem(tSanbaAward[nTempType][4],tSanbaAward[nTempType][5],tSanbaAward[nTempType][6],1);	
		Talk(1,"","T苙g cho c竎 ngi kinh nghi謒 phong ph� v� l頽 con d� thng@^_^@Sau n鯽 ti課g n鱝 n ch� ta! ( c� th� n trc m閠 m譶h) c遪 r蕋 nhi襲 ph莕 thng. Nh� r籲g ta l� B竎h Hoa s� gi� c馻 th祅h n祔, 甶 sai th祅h s� kh玭g nh薾 頲 qu�.");
		PlayerIndex = nOldIndex;
	end		
end

function give_him_award()
	Say("Mu鑞 l蕐 qu� m閠 m譶h sao? D蒼 b筺 kh竎 gi韎 n s� c� nhi襲 c� h閕 h琻.",
		2,
		"Ta mu鑞 nh薾 /#ask_use_tongxin(2)",
		"Ta 甶 t譵 m閠 b籲g h鱱 !/nothing")
end

function confirm_sanba_award(nType)
	local nDate = tonumber(date("%Y%m%d"));
	local nLv = GetLevel();
	local nPos = GetWorldPos();
	local nSex = GetSex();
	local sName = GetName();
	
	if nLv < 11 then
		Talk(1,"","Ngi c莕 ph秈 r蘮 luy謓 giang h� l筰 m閠 phen.");
		return
	end		
	if GetTask(TASK_SANBA_AWARD) >= nDate then
		Talk(1,"","Th藅 ti誧, ta  t苙g qu� cho ngi r錳, m鏸 ng祔 ch� 畊頲 nh薾 1 l莕 th玦.");
		return
	end		
	
	--一个人领默认为奖励为第一种，即120级以下
	local nExp = floor(tSanbaAward[1][nSex][2]*nLv^3/80^3);
	local nLingshiNum = 1;
	if nType == 1 then
		if GetItemCount(2,1,573) < 1 then
			Talk(1,"","Ngi qu猲 mang theo уng T﹎ Ho祅 r錳 ch� g�?");
			return
		end
		if DelItem(2,1,573,1) == 1 then
			nExp = nExp*3;
			nLingshiNum = nLingshiNum*3;
			SetTask(TASK_SANBA_TONGXIN,1);
		end
	end
	local nRandExp = random(1,100);
	if nRandExp >= 99 then
		nExp = nExp*3;
		nLingshiNum = nLingshiNum*3;
		Msg2Global("Ch骳 m鮪g "..sName.."Trong ho箃 ng m鮪g 8-3 nh薾 頲 ph莕 thng kinh nghi謒 g蕄 3 l莕");
	elseif nRandExp >= 96 then
		nExp = nExp*2;
		nLingshiNum = nLingshiNum*2;
		Msg2Global("Ch骳 m鮪g "..sName.."Trong ho箃 ng m鮪g 8-3 nh薾 頲 ph莕 thng kinh nghi謒 g蕄 2 l莕!");	
	end	
	if nLv ~= 99 then
		ModifyExp(nExp);
		Msg2Player("Ch骳 m鮪g b筺 nh薾 頲 "..nExp.."Kinh nghi謒");
	else
		for i=1,nLingshiNum do
			local nRand = random(1,6);
			lspf_AddLingShiInBottle(nRand,1);
			Msg2Player("Ch骳 m鮪g b筺 nh薾 頲 "..nRand.." (c蕄) Linh th筩h 1 vi猲");
		end
	end
	SetTask(TASK_SANBA_AWARD,nDate);
	SetTask(TASK_SANBA_MAPID,nPos);
	SetTask(TASK_SANBA_TIME,GetTime());
	SetTask(TASK_SANBA_PIG,1);
	SetTask(TASK_SANBA_PETTIME,GetTime());
	AddItem(tSanbaAward[1][4],tSanbaAward[1][5],tSanbaAward[1][6],1);
	Talk(1,"","T苙g cho c竎 ngi kinh nghi謒 phong ph� v� l頽 con d� thng@^_^@Sau n鯽 ti課g n鱝 n ch� ta! ( c� th� n trc m閠 m譶h) c遪 r蕋 nhi襲 ph莕 thng. Nh� r籲g ta l� B竎h Hoa s� gi� c馻 th祅h n祔, 甶 sai th祅h s� kh玭g nh薾 頲 qu�.");	
end

function get_sanba_two()
	local nDate = tonumber(date("%Y%m%d"));
	local nPos = GetWorldPos();
	local nLv = GetLevel();
	local nSex = GetSex();
	local sName = GetName();
	local nType = GetTask(TASK_SANBA_PIG);
	local nTongxin = GetTask(TASK_SANBA_TONGXIN);
	
	if GetTask(TASK_SANBA_AWARD) >= nDate and GetTask(TASK_SANBA_TWO) >= nDate then
		Talk(1,"","Ngi  nh薾 t蕋 c� ph莕 thng c馻 ng祔 h玬 nay r錳.");
		return
	end
	if GetTask(TASK_SANBA_AWARD) < nDate then
		Talk(1,"get_sanba_one","L蕐 qu� trc r錳 h穣 t韎 y.");
		return
	end
	if nPos ~= GetTask(TASK_SANBA_MAPID) then
		Talk(1,"","Ch糿g ph秈 ngi  l蕐 qu� t筰 b鎛 th祅h r錳 sao?");
		return
	end
	if GetTime() - GetTask(TASK_SANBA_TIME) < SANBA_AWARD_TIME then
		Talk(1,"","ng g蕄 g竝, d蒼 ti觰 tr� 甶 ch琲 甶!");
		return
	end  
	local nExp = floor(tSanbaAward[nType][nSex][3]*nLv^3/80^3);
	local nLingshiNum = 1;
	if nTongxin == 1 then
		nExp = nExp*3;
		nLingshiNum = nLingshiNum*3;
	end
	local nRandExp = random(1,100);
	if nRandExp >= 99 then
		nExp = nExp*3;
		nLingshiNum = nLingshiNum*3;
		Msg2Global("Ch骳 m鮪g "..sName.."Trong ho箃 ng m鮪g 8-3 nh薾 頲 ph莕 thng kinh nghi謒 g蕄 3 l莕");
	elseif nRandExp >= 96 then
		nExp = nExp*2;
		nLingshiNum = nLingshiNum*2;
		Msg2Global("Ch骳 m鮪g "..sName.."Trong ho箃 ng m鮪g 8-3 nh薾 頲 ph莕 thng kinh nghi謒 g蕄 2 l莕!");	
	end		
	if nLv ~= 99 then
		ModifyExp(nExp);
		Msg2Player("Ch骳 m鮪g b筺 nh薾 頲 "..nExp.."Kinh nghi謒");
		Talk(1,"","Ch骳 m鮪g nh薾 頲 "..nExp.." 甶觤 kinh nghi謒!");
	else
		for i=1,nLingshiNum do
			local nRand = random(1,6);
			lspf_AddLingShiInBottle(nRand,1);
			Msg2Player("Ch骳 m鮪g b筺 nh薾 頲 "..nRand.." (c蕄) Linh th筩h 1 vi猲");
		end
	end
	SetTask(TASK_SANBA_TWO,nDate);
	SetTask(TASK_SANBA_TONGXIN,0);		
end

function sanba_deteil()
	Talk(1,"sanba_deteil2","в ch骳 m鮪g l� 8-3, ta c� ch髏 qu� m鋘 cho to祅 b� nam n� gi� tr� trong th祅h, v祇 l骳 08:00�22:30 gi� ng祔 8 v� ng祔 9 th竛g 3, c� th� n ch� ta l蕐 kinh nghi謒 v� ti觰 tr� th� nu玦. T� i kh竎 gi韎 c� c蕄 b薱 cao c� th� nh薾 頲 ph莕 thng c祅g cao. N鯽 ti課g sau n ch� B竎h Hoa s� gi� l蕐 ph莕 thng l莕 th� 1, ph莕 thng nh薾 頲 c祅g phong ph�. Ph莕 thng trong ng祔 c莕 ho祅 t蕋 l穘h trong ng祔. N誹 t苙g cho B竎h Hoa s� gi� 1 vi猲 уng T﹎ Ho祅, s� c� s� ng筩 nhi猲 g蕄 3 l莕. уng th阨 c遪 c� c� h閕 nh薾 頲 kinh nghi謒 g蕄 2 ho芻 g蕄 3 l莕. ")
end

function sanba_deteil2()
	Talk(1,"","Ъng c蕄 nam + n� < c蕄 120, hai ngi nh薾 頲 1 th� nu玦 ti觰 h綾 tr�.\n120<= ng c蕄 nam + n� < c蕄 180, hai ngi nh薾 頲 1 th� nu玦 ti觰 b筩h tr�.\nЪng c蕄 nam + n�>= c蕄 180, hai ngi nh薾 頲 1 ti觰 kim tr� th� nu玦.\n1 ngi ch� nh薾 頲 ti觰 h綾 tr�, ngi ch琲 c蕄 99 nh薾 頲 Linh th筩h c蕄 1-6 ng蓇 nhi猲.")
end

function about_shuangbei()
------------------初始化露水效果------------------------
	local tItemInfo =
	{
		{2, 1, 1012, 7200, 150, "B錸g Lai Ti猲 Th駓",1},
		{2, 0, 109, 7200, 200, "B錸g Lai Ti猲 L�",1.5},
		{2, 1, 1013, 7200, 300, "B錸g Lai Ti猲 Кn",2},
		{2, 1, 1052, 7200, 120, "B錸g Lai L� Th駓",0},
	}
	for index, value in tItemInfo do
		InitXclSpeed(index, value[5])
	end
----------------------------------------------------------	
	local nTime = tonumber(date("%H"));
	if nTime < 12 or nTime >= 23 then
		Talk(1,"","<color=green>B竎h Hoa s� gi�<color>: V祇 l骳 12:00 tr璦-23:00 t鑙 n nh薾.");
		return
	end
	local strtab = {
		"Ta mu鑞 nh薾 /get_shuangbei",
		"T筸 th阨 kh玭g nh薾/nothing"
		}
	Say("<color=green>B竎h Hoa s� gi�<color>:<color=yellow>14/6-15/6<color> m鏸 ngi m鏸 ng祔 c� th� n ch� ta nh薾 <color=yellow>4h nh﹏ i kinh nghi謒 v� nh﹏ i  c鑞g hi課 s� m玭 nguy猲 ng祔<color>,<color=red> ch� �, c� th� s� chuy觧 hi謚 qu� th阨 gian nh﹏ i c蕄 cao hi謓 t筰 c馻 ngi.<color>",
		getn(strtab),
		strtab)
end

function get_shuangbei()
	local nDate = tonumber(date("%Y%m%d"))
	if GetTask(542) >= nDate then
		Talk(1,"","<color=green>B竎h Hoa s� gi�<color>: Ngi  nh薾 ph莕 thng nh﹏ i c馻 ng祔 h玬 nay, m鏸 ngi m鏸 ng祔 ch� c� th� nh薾 1 l莕.");
		return
	end
	local nType, nTime, nSpeed = GetExistXclInfo();
	if nTime > 0 then
		if nSpeed > 200 then
			Talk(1,"","<color=green>B竎h Hoa s� gi�<color>: Hi謓 nay ngi c� hi謚 qu� kinh nghi謒 m筺h, kh玭g th� nh薾 頲.");
			return
		end
	end
	if GetTask(85) == nDate and GetTask(86) == 3 then
		Talk(1,"","<color=green>B竎h Hoa s� gi�<color>: Hi謓 nay ngi c� hi謚 qu�  c鑞g hi課 s� m玭 m筺h, kh玭g th� nh薾 頲. ");
		return
	end
	SetTask(542,nDate);
	local nRet = EatXcl(2,14400)
	if nRet == 1 then
		Msg2Player("B筺 nh薾 頲 hi謚 qu� nh﹏ i kinh nghi謒");
	end	
	SetTask(85,nDate);
	SetTask(86,2);
	Msg2Player("Trong h玬 nay  c鑞g hi課 s� m玭 b筺 nh薾 頲 t╪g 2 l莕");
end