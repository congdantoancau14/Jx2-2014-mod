--08新年新年活动使者脚本
--by vivi
--2007/11/14

Include("\\script\\online\\newyear08\\newyear08_head.lua");
Include("\\script\\online_activites\\2014_01\\spring1.lua") 
Include("\\script\\online_activites\\2014_01\\valentine.lua")
Include("\\script\\online_activites\\2014_01\\spring2.lua") 

function main()
	if get_spring_festival_state() == 1 then
		local strtab = {
			"N╩ m韎 ch骳 t誸/wind_action",
			"Thu th藀  c�/guwan_collect",
			"Nh薾 h錸g bao n╩ m韎/about_hongbao",
			"Nh薾 hng d蒼 ho箃 ng/get_action_manual",
			"Ta ch� n xem th�/nothing"
			};
		Say("H� th鑞g  chu萵 b� nhi襲 l� h閕 m颽 xu﹏, tham gia th� xem.",
			getn(strtab),
			strtab);
	else
		Talk(1,"","N╩ m韎, ch骳 m鋓 ngi V筺 S� Nh� �.");
	end
end

function wind_action()
	local strtab = {
		"Ta mu鑞 ch骳 t誸 m鋓 ngi/battle_is_finish"
		};
	if GetTask(TASK_WIND_ID) ~= 0 then
		tinsert(strtab,"Ta  ch骳 t誸 t蕋 c� m鋓 ngi./finish_wind_task");
		tinsert(strtab,"Phi襫 ph鴆 qu�. Ta kh玭g mu鑞 ch骳 t誸/giveup_wind_task");
	end	
	tinsert(strtab,"Thuy誸 minh v� ph莕 thng nhi謒 v�/about_wind_task");
	tinsert(strtab,"Ta mu鑞 tham gia h鋋 ng /main");
	Say("M鏸 khi n╩ m韎 n, c� kh玭g 輙 ngi tronh th祅h s鑞g n c, c竎 b筺 甶 ch骳 t誸 h� s� khi課 h� c秏 nh薾 頲 ni襪 vui t誸 n. H� th鑞g c� nhi襲 qu� t苙g. Ch� �, t� 9: 00 h� th鑞g b総 u g鰅 l謓h ch骳 t誸 nh鱪g ngi , n鯽 ti課g g鰅 1 l莕 n 23:00 t鑙! Ngi n nhanh s� c� ph莕 thng c bi謙. \n Ch� �: ph莕 thng g錷 c� <color=yellow>ph莕 thng qu﹏ c玭g<color>, ngi ho祅 th祅h nhi謒 v� n祔 s� <color=yellow>kh玭g th� nh薾 ph莕 thng chi課 trng<color>.",
		getn(strtab),
		strtab);
end

function battle_is_finish()
	local nWindDate = tonumber(date("%y%m%d"));
	local nState = getwindstate();
	local nLv = GetLevel();
	if nState ~= 1 then
		Talk(1,"","Ch璦 h誸 th阨 gian, ng n玭 n鉵g!");
		return
	end
	if nLv <= 10 then
		Talk(1,"","B筺 c遪 ph秈 h鋍 h醝 nhi襲 tr猲 giang h�.");
		return
	end	
	if nWindDate > GetTask(761) then
		SetTask(760,0);
	end;
	if GetTask(760) > 0 then
		Talk(1,"","H玬 nay b筺  nh薾 ph莕 thng chi課 trng, kh玭g th� nh薾 th猰 nhi謒 v� ch骳 t誸 c馻 ng祔 h玬 nay.");
		return	
	else
		get_wind_task();
	end
end

function get_wind_task()
	local nMapId = GetWorldPos();	
	local nState,nWindStep = getwindstate();
	local nActionStep = GetMapTaskTemp(nMapId,MAP_WIND_TIME);
	local nWindDate = tonumber(date("%Y%m%d"));
	if GetTask(TASK_WIND_DATE) >= nWindDate then
		Talk(1,"","H玬 nay b筺  gi髉 m鋓 ngi ch骳 t誸.");
		return
	end		 
	if nState ~= 1 or nWindStep > nActionStep then
		Talk(1,"","Ch璦 h誸 th阨 gian, ng n玭 n鉵g!");
		return
	end
	if GetTask(TASK_WIND_ID) ~= 0 and GetTask(TASK_WIND_ID) < nActionStep then
		RemoveTrigger(GetTrigger(WIND_TRIGGER_ID)); --删除触发器
		SetTask(TASK_WIND_ID,0);
		SetTask(TASK_WIND_POS,0);
		SetTask(TASK_WIND_STEP,0);
		SetTask(TASK_WIND_TABLE_IDX,0);
		SetTask(TASK_WIND_RAND,0);
		Talk(1,"wind_action","B筺 ch璦 ho祅 th祅h nhi謒 v�, c� th� ti誴 nh薾 l筰 nhi謒 v� ch骳 t誸.");		
		return
	end	
	if GetTask(TASK_WIND_ID) > 0 then
		Talk(1,"","Ngi c� ph秈  nh薾 nhi謒 v� ch骳 t誸?");
		return
	end
	
	local nRand = random(1,getn(tWindNpc[nMapId][2]));
	if CreateTrigger(4,tWindNpc[nMapId][3][nRand],WIND_TRIGGER_ID) == 0 then
		WriteLog("[Ho箃 ng n╩ m韎 08, k誸 n鑙 npc b� l鏸]: Ngi ch琲"..GetName().."Thi誸 l藀 k誸 n鑙 npc CreateTrigge (4,tWindNpc[nMapId][3][nRand],WIND_TRIGGER_ID)  th蕋 b筰, tr� WIND_TRIGGER_ID:"..WIND_TRIGGER_ID..". Tr� tWindNpc[nMapId][3][nRand]:"..tWindNpc[nMapId][3][nRand]);
		return 0;	--创建失败
	end;	
	SetTask(TASK_WIND_ID,nActionStep);
	SetTask(TASK_WIND_POS,nMapId);
	SetTask(TASK_WIND_STEP,1);
	SetTask(TASK_WIND_TABLE_IDX,nRand); 
	Talk(1,"","T鑤, y l� bc th� nh蕋, <color=yellow>"..tWindNpc[nMapId][1].."-"..tWindNpc[nMapId][2][nRand].."<color> n╩ nay n t誸 m閠 m譶h trong th祅h, ngi 甶 ch骳 t誸 huynh 蕐 甶. Ti謓 th� h醝 huynh 蕐 xem c遪 ai n t誸 m閠 m譶h kh玭g, ch髇g ta c飊g 甶 ch骳 t誸!")
	Msg2Player("B筺  nh薾 1 nhi謒 v� ch骳 t誸, ch骳 "..tWindNpc[nMapId][1].."-"..tWindNpc[nMapId][2][nRand].."Ch骳 t誸.");
end

function finish_wind_task()
	local nStep = GetTask(TASK_WIND_STEP);
	local nMapId = GetWorldPos();
	local nIdx = GetTask(TASK_WIND_TABLE_IDX);
	local nLv = GetLevel();
	local nExp = floor(6000000*nLv^2/80^2);
	local nState = getwindstate();
	local nActionStep = GetMapTaskTemp(nMapId,MAP_WIND_TIME);
	local nTianshiNum = 15; --天时注解数量，99级玩家
	local nWindDate = tonumber(date("%Y%m%d"));
		
	if GetTask(TASK_WIND_POS) ~= nMapId then
		Talk(1,"","Ngi kh玭g nh薾 nhi謒 v� ch骳 t誸 t筰 y. ");
		return
	end
	if GetTask(TASK_WIND_ID) ~= 0 and GetTask(TASK_WIND_ID) < nActionStep then
		RemoveTrigger(GetTrigger(WIND_TRIGGER_ID)); --删除触发器
		SetTask(TASK_WIND_ID,0);
		SetTask(TASK_WIND_POS,0);
		SetTask(TASK_WIND_STEP,0);
		SetTask(TASK_WIND_TABLE_IDX,0);
		SetTask(TASK_WIND_RAND,0);
		Talk(1,"wind_action","B筺 ch璦 ho祅 th祅h nhi謒 v�, c� th� ti誴 nh薾 l筰 nhi謒 v� ch骳 t誸.");		
		return
	end
	if nStep <= WIND_STEP_TOTAL then
		Talk(1,"","Ngi kh玭g ph秈 n ch骳 t誸 <color=yellow>"..tWindNpc[nMapId][1].."-"..tWindNpc[nMapId][2][nIdx].."<color> sao? C� chi l筰 quay v�?");
	else
		if GetTask(760) > 0 then 
			SetTask(TASK_WIND_ID,0);
			SetTask(WIND_STEP_TOTAL,0);
			SetTask(TASK_WIND_POS,0);
			SetTask(TASK_WIND_TABLE_IDX,0);
			SetTask(TASK_WIND_RAND,0);
			SetTask(TASK_WIND_NUM,GetTask(TASK_WIND_NUM)+1);
			SetTask(TASK_WIND_FINISH,nActionStep);
			SetTask(TASK_WIND_DATE,nWindDate);			
			Talk(1,"","R蕋 t鑤, ngi  ch骳 t誸 t蕋 c� m鋓 ngi v� nh薾 ph莕 thng chi課 trng n猲 h玬 nay kh玭g 頲 l穘h thng, ng祔 mai h穣 l祄 ti誴 nh�!");
			return
		end   
    if GetTask(TASK_WIND_RAND) == 0 then
    	SetMapTaskTemp(nMapId,MAP_WIND_RAND,GetMapTaskTemp(nMapId,MAP_WIND_RAND)+1);
    	SetTask(TASK_WIND_RAND,GetMapTaskTemp(nMapId,MAP_WIND_RAND));    	
    end
    local nNum = GetTask(TASK_WIND_RAND);
    if nNum == 1 then	
    	nExp = nExp*2;
    	nTianshiNum = nTianshiNum*2;
			Msg2SubWorld(GetName().."Ngi u ti猲 n ch骳 t誸 ngi c� n s� nh薾 頲 ph莕 thng g蕄 i (kh玭g bao g錷 qu﹏ c玭g). ");    	
    elseif nNum >= 2 and nNum <= 5 then
    	nExp = floor(nExp*1.6);
    	nTianshiNum = nTianshiNum*1.5;
			Msg2SubWorld(GetName().."Ngi l� ngi th� "..nNum.." ch骳 t誸 ngi c� n, 頲 nh薾 ph莕 thng g蕄 1.6 l莕 (kh玭g bao g錷 qu﹏ c玭g). ");    
    elseif nNum >=6 and nNum <= 10 then
    	nExp = floor(nExp*1.2);
    	nTianshiNum = nTianshiNum*1.2
    end
    if nLv == 99 then
	    Say("Ngi  ch骳 t誸 xong, ngi l� ngi th� <color=yellow>"..nNum.."<color> ho祅 th祅h nhi謒 v� n祔. Ta s� thng cho ngi <color=yellow>"..nTianshiNum.."<color> quy觧 Thi猲 Th阨 Ch� Gi秈 v� <color=yellow>600 qu﹏ c玭g<color>. ngi c� th� d飊g <color=yellow>qu﹏ c玭g chng<color>  t╪g nh薾 qu﹏ c玭g. Ngi h穣 s絥 s祅g nh薾 thng. Ngi c騨g c� th� h駓 nhi謒 v� l莕 n祔 v� th鵦 hi謓 nhi謒 v� n祔 sau. ",
	    	2,
	    	"Ta  s絥 s祅g nh薾 thng /is_use_jungong",
	    	"Ta ch璦 s絥 s祅g nh薾 thng /nothing");    
    else
	    Say("Ngi  ch骳 t誸 xong, ngi l� ngi th� <color=yellow>"..nNum.."<color> ho祅 th祅h nhi謒 v� n祔. Ta s� thng cho ngi <color=yellow>"..nExp.."<color> 甶觤 kinh nghi謒 v� <color=yellow>600 qu﹏ c玭g<color>. ngi c� th� d飊g <color=yellow>qu﹏ c玭g chng<color>  t╪g nh薾 qu﹏ c玭g. Ngi h穣 s絥 s祅g nh薾 thng. Ngi c騨g c� th� h駓 nhi謒 v� l莕 n祔 v� th鵦 hi謓 l筰 sau.",
	    	2,
	    	"Ta  s絥 s祅g nh薾 thng /is_use_jungong",
	    	"Ta ch璦 s絥 s祅g nh薾 thng /nothing");
	  end
  end
end

function is_use_jungong()
	Say("C� d飊g qu﹏ c玭g chng  t╪g thng qu﹏ c玭g kh玭g?",
		5,
		"Ta kh玭g d飊g qu﹏ c玭g chng (600 qu﹏ c玭g)/#confirm_get_final(0)",
		"Ta d飊g 2 qu﹏ c玭g chng (1600 qu﹏ c玭g)/#confirm_get_final(1)",
		"Ta d飊g 2 i qu﹏ c玭g chng (4000 qu﹏ c玭g)/#confirm_get_final(2)",
		"Ta d飊g 2 huy ho祅g qu﹏ c玭g chng (8000 qu﹏ c玭g)/#confirm_get_final(3)",
		"T筸 th阨 kh玭g l穘h/nothing");
end    
    
function confirm_get_final(nType)
	local nJungong = GetTask(701); --玩家当前军功，正为宋，负为辽
	local nGetJungong = 600; --获得的军功
	local nStep = GetTask(TASK_WIND_STEP);
	local nMapId = GetWorldPos();
	local nIdx = GetTask(TASK_WIND_TABLE_IDX);
	local nLv = GetLevel();
	local nExp = floor(6000000*nLv^2/80^2);
	local nNum = GetTask(TASK_WIND_RAND);
	local nState = getwindstate();  
	local nActionStep = GetMapTaskTemp(nMapId,MAP_WIND_TIME);
	local nWindDate = tonumber(date("%Y%m%d"));
	local nTianshiNum = 15; --天时注解数量，99级玩家
	
	if GetTask(TASK_WIND_POS) ~= nMapId then
		Talk(1,"","Ngi kh玭g nh薾 nhi謒 v� ch骳 t誸 t筰 y. ");
		return
	end
	if GetTask(TASK_WIND_ID) ~= 0 and GetTask(TASK_WIND_ID) < nActionStep then
		SetTask(TASK_WIND_ID,0);
		SetTask(TASK_WIND_POS,0);
		SetTask(TASK_WIND_STEP,0);
		SetTask(TASK_WIND_TABLE_IDX,0);
		SetTask(TASK_WIND_RAND,0);
		Talk(1,"wind_action","Ngi kh玭g n nh薾 thng trong th阨 gian quy nh n猲 b� h駓 ph莕 thng, ngi c� th� nh薾 nhi謒 v� ch骳 t誸 kh竎.");		
		return
	end
	
	if nLv == 99 then
		if Zgc_pub_goods_add_chk(1,15) ~= 1 then
			return
		end
	end
	
	if nType == 1 then
		if GetItemCount(2,1,9999) < 2 then
			Talk(1,"","Ngi kh玭g  qu﹏ c玭g chng. ");
			return
		else
			if DelItem(2,1,9999,2) == 1 then
				if nJungong >= 0 then
					nGetJungong = 800*2;
				else
					nGetJungong = -800*2;
				end
			end
		end
	elseif nType == 2 then
		if GetItemCount(2,1,9998) < 2 then
			Talk(1,"","Ngi kh玭g  i qu﹏ c玭g chng. ");
			return
		else
			if DelItem(2,1,9998,2) == 1 then
				if nJungong >= 0 then
					nGetJungong = 800*5;
				else
					nGetJungong = -800*5;
				end
			end
		end
	elseif nType == 3 then
		if GetItemCount(2,1,9977) < 2 then
			Talk(1,"","Ngi kh玭g  huy ho祅g qu﹏ c玭g chng. ");
			return
		else
			if DelItem(2,1,9977,2) == 1 then
				if nJungong >= 0 then
					nGetJungong = 800*10;
				else
					nGetJungong = -800*10;
				end
			end
		end
	else
		if nJungong >= 0 then
			nGetJungong = 600;
		else
			nGetJungong = -600;
		end		
	end	
 
  if nNum == 1 then	
  	nExp = nExp*2;
  	nTianshiNum = nTianshiNum*2;
  elseif nNum >= 2 and nNum <= 5 then
  	nExp = floor(nExp*1.6);
  	nTianshiNum = nTianshiNum*1.6;
  elseif nNum >=6 and nNum <= 10 then
  	nExp = floor(nExp*1.2);
  	nTianshiNum = nTianshiNum*1.2;
  end	

	SetTask(TASK_WIND_ID,0);
	SetTask(WIND_STEP_TOTAL,0);
	SetTask(TASK_WIND_POS,0);
	SetTask(TASK_WIND_TABLE_IDX,0);
	SetTask(TASK_WIND_RAND,0);
	SetTask(TASK_WIND_NUM,GetTask(TASK_WIND_NUM)+1);
	SetTask(TASK_WIND_FINISH,nActionStep);
	SetTask(TASK_WIND_DATE,nWindDate);
--  	SetMapTaskTemp(nMapId,MAP_WIND_RAND,GetMapTaskTemp(nMapId,MAP_WIND_RAND)+1);

	SetTask(701,nJungong+nGetJungong);
	if nJungong >= 0 then
		Msg2Player("Ch骳 m鮪g b筺 nh薾 頲 "..nGetJungong.."C玭g tr筺g");
	else
		Msg2Player("Ch骳 m鮪g b筺 nh薾 頲 "..-nGetJungong.."C玭g tr筺g");
	end
	
	if nLv == 99 then
		AddItem(2,1,3210,nTianshiNum);
		Msg2Player("Ch骳 m鮪g b筺 nh薾 頲 "..nTianshiNum.."Thi猲 Th阨 Ch� Gi秈.");
	else
		ModifyExp(nExp);
		Msg2Player("Ch骳 m鮪g b筺 nh薾 頲 "..nExp.."Kinh nghi謒");
	end
	
	if nNum == 1 then		
		Talk(1,"","Ngi l� ngi u ti猲 ch骳 t誸 t蕋 c� m鋓 ngi, th藅 ng khen, c� g緉g ph竧 huy nh�. ");
	elseif nNum >= 2 and nNum <=5 then		
		Talk(1,"","T鑤, ngi l� ngi th� "..nNum.." ch骳 t誸 t蕋 c� m鋓 ngi, th藅 ng khen, c� g緉g ph竧 huy nh�. "); 
	elseif nNum >=6 and nNum <= 10 then
		Talk(1,"","T鑤, ngi l� ngi th� "..nNum.." ch骳 t誸 t蕋 c� m鋓 ngi, th藅 ng khen, c� g緉g ph竧 huy nh�. "); 	
	else
		Talk(1,"","Gi醝, ngi  ch骳 t誸 t蕋 c� m鋓 ngi, ph莕 thng c馻 ngi y. ");
	end	 			
end   

function giveup_wind_task()
	Talk(1,"","N誹 kh玭g mu鑞 ti誴 t鬰 ch骳 t誸 c騨g kh玭g n猲 b� cu閏 gi鱝 ch鮪g, nhi謒 v� ch骳 t誸 s� t� h駓 n誹 c� nhi謒 v� kh竎. ");
end

--function confirm_giveup_wind()
--	RemoveTrigger(GetTrigger(WIND_TRIGGER_ID)); --删除触发器
--	local nActionStep = GetMapTaskTemp(nMapId,MAP_WIND_TIME);
--	local nWindDate = tonumber(date("%Y%m%d"));
--	SetTask(TASK_WIND_ID,0);
--	SetTask(WIND_STEP_TOTAL,0);
--	SetTask(TASK_WIND_POS,0);
--	SetTask(TASK_WIND_TABLE_IDX,0);
--	SetTask(TASK_WIND_FINISH,nActionStep);
--	SetTask(TASK_WIND_DATE,nWindDate);
--	SetTask(TASK_WIND_RAND,0);
--	Talk(1,"","<color=green>新年活动使者<color>：你放弃了本次的风媒任务，希望以后能再接再厉。");	
--end

function about_wind_task()
	local strtab = {
		"Hng d蒼 ho箃 ng/about_wind_action",
		"Thuy誸 minh ph莕 thng/about_wind_award",
		"Ch� xem th�!/nothing"
		};
	Say("Ngi mu鑞 bi誸 v� v蕁  g�?",
		getn(strtab),
		strtab);
end

function about_wind_action()
	Talk(1,"about_wind_action2","S� gi� n╩ m韎: 9:00 s竛g h籲g ng祔 ta s� c玭g b� nhi謒 v� ch骳 t誸, ngi ch琲 c蕄 10 c� th� n ch� ta l穘h thng. Ta s� ch� nh ngi ph秈 n ch骳 t誸, ngi  s� ch� d蒼 ngi n ch骳 t誸 ngi ti誴 theo, khi ch骳 t誸 xong t蕋 c� m鋓 ngi, h穣 quay v� ch� n祔 x竎 nh薾 v� l穘h thng. ");
end	

function about_wind_action2()
	Talk(1,"about_wind_task","Ph莕 thng: \n Sau khi ch骳 t誸 t蕋 c� m鋓 ngi, h穣 n y l穘h thng. Ch� �: ngi u ti猲 ho祅 th祅h nhi謒 v� s� 頲 thng g蕄 i, t� ngi th� 2 n th� 5 s� dc thng g蕄 1.6, t� ngi th� 6 n ngi th� 10 頲 thng g蕄 1.2. \n N誹 kh玭g h礽 l遪g v韎 x誴 h筺g ch骳 t誸 l莕 n祔, c� th� kh玭g giao n閜 nhi謒 v� v� tham gia l筰 v祇 l莕 sau, nh璶g khi  nh薾 thng th� h玬  kh玭g 頲 tham gia n鱝. \ N誹 kh玭g mu鑞 ti誴 t鬰 ch骳 t誸 n鱝, c騨g kh玭g n猲 b� cu閏 gi鱝 ch鮪g, nhi謒 v� ch骳 t誸 s� t� h駓 n誹 c� nhi謒 v� kh竎.");
end

function about_wind_award()
	Talk(1,"about_wind_task","Ph莕 thng ch骳 t誸 r蕋 phong ph�, ta s� thng kinh nghi謒 c� b秐 v� qu﹏ c玭g.\n 襲 c莕 ch� � l� sau khi nh薾 thng th� <color=yellow>kh玭g th� nh薾 ph莕 thng chi課 trng trong ng祔  n鱝<color>. \nT蕋 c� ph莕 thng u c╪ c� v祇 ng c蕄 c馻 ngi. \nN誹 kh玭g c� th阨 gian ch骳 t誸 c� th� 甶 mua thi謕 ch骳 t誸, v� c� th� nh薾 ngay ph莕 thng, tuy nhi猲 ph莕 thng kh玭g nhi襲, nhi謒 v� ch骳 t誸 h玬 nay c� th� d飊g 1 thi謕 ch骳 t誸  ho祅 th祅h. Ngi c� m蕐 ng祔 ch璦 ho祅 th祅h nhi謒 v� th� s� d鬾g b蕐 nhi猽 thi謕 ch骳 t誸. ");
end

function who_is_hero()
	local strtab = {
		"Nh薾 b鱝 ╪ t蕋 ni猲/get_hero_drink",
		"Hng d蒼 ho箃 ng v� ph莕 thng/about_hero_drink",
		"Ch� xem th�!/nothing"
		}
	Say("Ta  t ti謈 chi猽 i ch� v� anh h飊g h秓 h竛 t筰 е Nh蕋 L莡 v祇 m giao th鮝, m阨 ch� v� n tham gia.",
		getn(strtab),
		strtab)	
end

function get_hero_drink()
	local nDate = tonumber(date("%Y%m%d"));
	if GetTask(TASK_GET_DRINK) >= nDate then
		Talk(1,"","Ta ch� chu萵 b� cho m鏸 v� m閠 ph莕, kh玭g th� nh薾 th猰.");
		return
	end
	if Zgc_pub_goods_add_chk(1,1) ~= 1 then
		return
	end
	local Add_flag = AddItem(0,0,1,1); --年夜饭订单
	if Add_flag == 1 then
		SetTask(TASK_GET_DRINK,nDate);
		Talk(1,"","Зy l� n t ti謈 c馻 ngi, h穣 甶 c飊g v韎 nh鉳 b筺 v� s� d鬾g n t ti謈 n祔.");
	end
end

function about_hero_drink()
	Talk(1,"who_is_hero","T筼 th祅h t� i v韎 b籲g h鱱 r錳 s� d鬾g n t ti謈, t� m苩 t s� xu蕋 hi謓 b祅 ti謈 do е Nh蕋 L莡 mang n, c竎 v� trong bu鎖 ti謈 s� nh薾 頲 ph莕 thng. \nNgi trong t� i c祅g s� d鬾g nhi襲 n t ti謈 th� c祅g nh薾 頲 nhi襲 qu�, nhi襲 nh蕋 l� s� d鬾g c飊g l骳 <color=yellow>8 n t ti謈<color>, s� nh薾 頲 b鱝 ti謈 th辬h so筺. \nN閕 dung ph莕 thng: \nSau m閠 kho秐g th阨 gian ng錳 t筰 b祅 ti謈 s� nh薾 頲 kinh nghi謒, c竎h 5 ph髏 s� d鋘 l猲 m鉵 s駃 c秓 1 l莕. \n s駃 c秓 s� nh薾 頲 kinh nghi謒. \n1 B鱝 ti謈 c� th� k衞 d礽 12 ph髏. ");
end

--古玩大收集
function guwan_collect()
	local strtab = {
				"D飊g nh鱪g m秐h v� gh衟 l筰 th祅h  c�/suipian_cube_guwan",
				"Ta mu鑞 d飊g  c� i ph莕 thng v韎 ngi/guwan_change_award",
				"Hng d蒼 quy t綾 thu gom  c�/about_guwan_collect",
				"Ch� xem th�!/nothing"
				};
	Say("Ta mu鑞 t苙g 1 m鉵  c� cho b籲g h鱱 ta, nh璶g v蒼 ch璦 t譵 頲 m鉵  璶g �, n誹 ngi c�, ta s� tr鋘g tr鋘g c� thng. у c� kh玭g nh� nh鱪g  v藅 kh竎, tuy ch� v礽 m秐h v鬾 nh璶g v蒼 c� gi� tr� r蕋 cao, ngi c� th� a cho ta th祅h ph萴 ho芻 b竛 th祅h ph萴 c騨g 頲.",
		getn(strtab),
		strtab); 
end

function suipian_cube_guwan()
	local strtab = {
				"Ta ph秈 d飊g m秐h ng c蕄 2  h頿 th祅h m秐h ng c蕄 1/cube_input_num",
				"Ta ph秈 d飊g m秐h ng c蕄 1 v� ph� ki謓 Thanh уng nh c蕄 4 h頿 th祅h Thanh уng nh c蕄 4/#ask_is_cube(2)",
				"Ta ph秈 d飊g Thanh уng nh c蕄 4 v� ph� ki謓 Thanh уng nh c蕄 3 h頿 th祅h Thanh уng nh c蕄 3/#ask_is_cube(3)",
				"Ta ph秈 d飊g Thanh уng nh c蕄 3 v� ph� ki謓 Thanh уng nh c蕄 2 h頿 th祅h Thanh уng nh c蕄 2./#ask_is_cube(4)",
				"Ta ph秈 d飊g Thanh уng nh c蕄 2 v� ph� ki謓 Thanh уng nh c蕄 1 h頿 th祅h Thanh уng nh c蕄 1/#ask_is_cube(5)",
				"Ch鋘 sai r錳, tr� l筰/guwan_collect",
				"Ta s� quay l筰 l祄 sau/nothing"
				};
	Say("Kh玭g bi誸 ngi nh d飊g m秐h n祇 th� h頿 th祅h!",
		getn(strtab),
		strtab);	
end

function cube_input_num()
	local nNum = floor(GetItemCount(2,1,3212)/5);
	if nNum < 1 then
		Talk(1,"","<color=yellow>5<color> m秐h ng h頿 th祅h <color=yellow>1<color>m秐h ng c蕄 1, ngi kh玭g  m秐h ng c蕄 2. ");
		return
	else
		AskClientForNumber("confirm_cube_erjitongqi",1,tonumber(nNum)," Ngi mu鑞 i m秐h ng c蕄 1 v韎 gi� bao nhi猽?")
	end
end

function confirm_cube_erjitongqi(nNum)
	local nDelNum = nNum*5;
	if GetItemCount(2,1,3212) < nDelNum then
		Talk(1,"","Ngi kh玭g c�  m秐h ng c蕄 2. ");
		return
	end
	if Zgc_pub_goods_add_chk(1,nNum) ~= 1 then
		return
	end
	if DelItem(2,1,3212,nDelNum) == 1 then
		AddItem(2,1,3211,nNum);
		Msg2Player("Ch骳 m鮪g b筺  i m秐h ng c蕄 2 th祅h c玭g!");
		Talk(1,"","Ch骳 m鮪g ngi  i m秐h ng c蕄 2 th祅h c玭g. ");	
	end	
end

function ask_is_cube(nType)
	if nType == 1 then
		return
	else
		local strtab = {
			"Ta mu鑞 i 1 "..tTingTong[nType][11].."/#confirm_cube(1,"..nType..")",
			"Ta mu鑞 i 10 "..tTingTong[nType][11].."/#confirm_cube(10,"..nType..")"			
			};
		if nType ~= 5 then
			tinsert(strtab,"Ta mu鑞 i 50 "..tTingTong[nType][11].."/#confirm_cube(50,"..nType..")");
			tinsert(strtab,"Ta mu鑞 i 500 "..tTingTong[nType][11].."/#confirm_cube(500,"..nType..")");
		end
		tinsert(strtab,"Ch鋘 sai r錳, tr� l筰/suipian_cube_guwan");
		tinsert(strtab,"Ta s� quay l筰 l祄 sau/nothing");
		Say("фi quy t綾 th祅h <color=yellow>"..tTingTong[nType][2].."c竔"..tTingTong[nType][1].." v�"..tTingTong[nType][7].."c竔"..tTingTong[nType][6].."<color> h頿 th祅h <color=yellow>"..tTingTong[nType][12].."c竔"..tTingTong[nType][11].."<color>. M鏸 l莕 i ngi c� <color=yellow>"..tTingTong[nType][16].."%<color> x竎 su蕋 th祅h c玭g, n誹 th蕋 b筰, ngi s� m蕋 t蕋 c�  v藅. Ngi mu鑞 i bao nhi猽?",
				getn(strtab),
				strtab);
	end
end

function confirm_cube(nNum,nType)
	local nRequestNumOne = tTingTong[nType][2]*nNum;
	local nRequestNumTwo = tTingTong[nType][7]*nNum;
	local nNeedNum = tTingTong[nType][12]*nNum;
	if GetItemCount(tTingTong[nType][3],tTingTong[nType][4],tTingTong[nType][5]) < nRequestNumOne then
		Talk(1,"","H祅h trang c馻 ngi ch璦  "..tTingTong[nType][1]..". ");
		return
	end
	if nType ~= 1 then
		if GetItemCount(tTingTong[nType][8],tTingTong[nType][9],tTingTong[nType][10]) < nRequestNumTwo then
			Talk(1,"","H祅h trang c馻 ngi ch璦  "..tTingTong[nType][6]..". ");
			return
		end
	end
	if Zgc_pub_goods_add_chk(1,1) ~= 1 then
		return
	end
	if nType == 1 then
		return
	else
		if DelItem(tTingTong[nType][3],tTingTong[nType][4],tTingTong[nType][5],nRequestNumOne) == 1 and DelItem(tTingTong[nType][8],tTingTong[nType][9],tTingTong[nType][10],nRequestNumTwo) == 1 then
			local nSuccNum = 0; --成功兑换次数
			for i = 1,nNeedNum do 
				local nRand = random(1,100);
				if nRand <= tTingTong[nType][16] then
					local add_flag = AddItem(tTingTong[nType][13],tTingTong[nType][14],tTingTong[nType][15],tTingTong[nType][12]);			
					if add_flag == 1 then
						nSuccNum = nSuccNum+1;
						if nType == 4 or nType == 5 then
							WriteLog("Ho箃 ng m颽 xu﹏ i Thanh уng nh: "..GetName().."фi"..tTingTong[nType][11].."Th祅h c玭g.");
						end
					else
						WriteLog("Ho箃 ng m颽 xu﹏ i Thanh уng nh: "..GetName().."фi"..tTingTong[nType][11].." th蕋 b筰, v� tr� th蕋 b筰:"..add_flag);
					end
				end
			end
			if nSuccNum ~= 0 then
				if nNeedNum ~= 1 then
					Msg2Player("Ch骳 m鮪g b筺  i "..tTingTong[nType][11].." th祅h c玭g!");
					Talk(1,"","Ch骳 m鮪g ngi nh薾 頲 <color=yellow>"..(tTingTong[nType][12]*nSuccNum).."c竔"..tTingTong[nType][11].."<color>. Ngi i "..tTingTong[nType][11].." th祅h c玭g <color=yellow>"..nSuccNum.."<color> l莕, th蕋 b筰 "..(nNeedNum-nSuccNum).." l莕.");	
				else
					Msg2Player("Ch骳 m鮪g b筺  i "..tTingTong[nType][11].." th祅h c玭g!");
					Talk(1,"","Ch骳 m鮪g ngi  i "..tTingTong[nType][11].."Th祅h c玭g.");					
				end
			else
				Talk(1,"","Kh玭g th祅h c玭g, th� l筰 nh�!");
			end			
		else
			Talk(1,"","Trogn h祅h trang c馻 ngi kh玭g  v藅 li謚 h頿 th祅h.");
		end
	end
end

function guwan_change_award()
	local strtab = {		
			"Ta c� th� i ph莕 thng n祇/about_guwan_award",
			"Ta ph秈 d飊g m秐h ng c蕄 1 i ph莕 thng/#ask_is_change(1)",
			"Ta ph秈 d飊g Thanh уng nh c蕄 4 i ph莕 thng/#ask_is_change(2)",
			"Ta ph秈 d飊g Thanh уng nh c蕄 3 i ph莕 thng/#ask_is_change(3)",
			"Ta ph秈 d飊g Thanh уng nh c蕄 2 i ph莕 thng/#ask_is_change(4)",
			"Ta ph秈 d飊g Thanh уng nh c蕄 1 i ph莕 thng/#ask_is_change(5)",
			"Ta ph秈 d飊g 2000 m秐h ng i ph莕 thng/#ask_is_change(6)",
			"T筸 th阨 kh玭g i ph莕 thng	/nothing"
			};
	Say("Ngi nh i ph莕 thng g�?",
		getn(strtab),
		strtab);
end

function about_guwan_award()
	Talk(1,"guwan_change_award","M秐h ng c蕄 1: c� th� i 1 輙 kinh nghi謒, m鏸 ngi c� th� nh薾 t鎛g c閚g 1000 l莕. \nThanh уng nh c蕄 4: i Thi猲 Th阨 Ch� Gi秈, m鏸 ngi c� th� nh薾 t鎛g c閚g 100 l莕. \nThanh уng nh c蕄 3: i 1 Nguy謙 Hoa 1 ho芻 t飝 � 1 quy觧 sinh ho箃 k� n╪g. \nThanh уng nh c蕄 2: i 1 tinh Nguy謙 Hoa? (120 linh kh� thng h筺 v藅 ph萴) ho芻 t飝 � 1 quy觧 sinh ho箃 k� n╪g ph鑙 phng. \nThanh уng nh c蕄 1: i trang b� Thi猲 мa Huy襫 Ho祅g. \n2000 m秐h ng: i trang b� Thi猲 мa Huy襫 Ho祅g. ");
end

function ask_is_change(nType)
	local nLv = GetLevel();
	local nExp = nLv^2;
	if nType == 1 then
		if nLv == 99 then
			Say("D飊g m秐h ng c蕄 1 c� th� i <color=yellow>50 甶觤<color> Danh v鋘g, i kh玭g? M鏸 ngi c� th� nh薾 t鎛g c閚g 1000 l莕. ",
				3,
				"Ta mu鑞 i 1 m秐h ng c蕄 1/#change_yijisuipian(1)",
				"Ta mu鑞 i 50 m秐h ng c蕄 1/#change_yijisuipian(50)",
				"Kh玭g, ta nh莔!/guwan_change_award");
		else	
			Say("D飊g m秐h ng c蕄 1 c� th� i <color=yellow>"..nExp.."<color> kinh nghi謒, i kh玭g? M鏸 ngi c� th� nh薾 t鎛g c閚g 1000 l莕. ",
				3,
				"Ta mu鑞 i 1 m秐h ng c蕄 1/#change_yijisuipian(1)",
				"Ta mu鑞 i 50 m秐h ng c蕄 1/#change_yijisuipian(50)",
				"Kh玭g, ta nh莔!/guwan_change_award");
		end
	elseif nType == 2 then
		Say("D飊g Thanh уng nh c蕄 4 c� th� i <color=yellow>1 Thi猲 Th阨 Ch� Gi秈<color>, i kh玭g? M鏸 ngi c� th� nh薾 t鎛g c閚g 100 l莕. ",
			2,
			"�, ta mu鑞 i./change_sijiding",
			"Kh玭g, ta nh莔!/guwan_change_award");
	elseif nType == 3 then
		Say("D飊g Thanh уng nh c蕄 3 c� th� i <color=yellow>1 Nguy謙 Hoa ho芻 t飝 � 1 quy觧 sinh ho箃 k� n╪g thng h筺<color>, i kh玭g? ",
			2,
			"�, ta mu鑞 i./change_sanjiding",
			"Kh玭g, ta nh莔!/guwan_change_award");
	elseif nType == 4 then
		Say("D飊g Thanh уng nh c蕄 2 c� th� i <color=yellow>1 tinh Nguy謙 Hoa (120 linh kh� thng h筺 v藅 ph萴) ho芻 t飝 � 1 quy觧 sinh ho箃 k� n╪g ph鑙 phng<color>, i kh玭g? ",
			2,
			"�, ta mu鑞 i./#change_erjiding(0)",
			"Kh玭g, ta nh莔!/guwan_change_award");
	elseif nType == 5 then
		Say("D飊g Thanh уng nh c蕄 1 c� th� i <color=yellow>trang b� Thi猲 мa Huy襫 Ho祅g<color>, i kh玭g? ",
			2,
			"�, ta mu鑞 i./chang_yijiding",
			"Kh玭g, ta nh莔!/guwan_change_award");
	elseif nType == 6 then
		Say("D飊g 2000 m秐h ng c� th� i <color=yellow>trang b� Thi猲 мa Huy襫 Ho祅g<color>, i kh玭g? ",
			2,
			"�, ta mu鑞 i./chang_tongqisuipian",
			"Kh玭g, ta nh莔!/guwan_change_award");
	end					
end

function change_yijisuipian(nNum)
	local nLv = GetLevel();
	local nExp = (nLv^2)*nNum;
	local nRep = 50*nNum;
	if GetItemCount(2,1,3211) < nNum then
		Talk(1,"","Ngi kh玭g  m秐h ng c蕄 1.");
	else
		if GetTask(TASK_TONGQI_AWARD) >= 1000 then
			Talk(1,"","M鏸 ngi c� th� i t鎛g c閚g 1000 l莕, ngi  h誸 lt i. ");
			return
		end
		if GetTask(TASK_TONGQI_AWARD)+nNum > 1000 then
			Talk(1,"","M鏸 ngi c� th� i t鎛g c閚g 1000 l莕, ngi kh玭g th� i "..nNum.." n鱝. ");
			return
		end
		if DelItem(2,1,3211,nNum) == 1 then
			if nLv == 99 then
				ModifyReputation(nRep,0);
				SetTask(TASK_TONGQI_AWARD,GetTask(TASK_TONGQI_AWARD)+nNum);
				Talk(1,"guwan_change_award","Ch骳 m鮪g ngi  i th祅h c玭g m秐h ng c蕄 1, hi謓  i <color=yellow>"..GetTask(TASK_TONGQI_AWARD).."<color> l莕, m鏸 ngi c� th� nh薾 t鎛g c閚g 1000 l莕. ");
			else
				ModifyExp(nExp);
				SetTask(TASK_TONGQI_AWARD,GetTask(TASK_TONGQI_AWARD)+nNum);
				Talk(1,"guwan_change_award","Ch骳 m鮪g ngi  i th祅h c玭g m秐h ng c蕄 1, hi謓  i <color=yellow>"..GetTask(TASK_TONGQI_AWARD).."<color> l莕, m鏸 ngi c� th� nh薾 t鎛g c閚g 1000 l莕. ");
			end
		end
	end
end

function change_sijiding()
	if GetItemCount(2,1,3216) < 1 then
		Talk(1,"","Ngi kh玭g  Thanh уng nh c蕄 4. ");
	else
		if Zgc_pub_goods_add_chk(1,1) ~= 1 then
			return
		end
		if GetTask(TASK_QTD_AWARD) >= 100 then
			Talk(1,"","M鏸 ngi c� th� nh薾 t鎛g c閚g 100 l莕, ngi  h誸 lt i.");
			return
		end
		if DelItem(2,1,3216,1) == 1 then
			  AddItem(2,1,3210,1);
				SetTask(TASK_QTD_AWARD,GetTask(TASK_QTD_AWARD)+1);
				Msg2Player("Ch骳 m鮪g ngi nh薾 頲 1 quy觧 Thi猲 Th阨 Ch� Gi秈.");
				Talk(1,"guwan_change_award","Ch骳 m鮪g ngi  i th祅h c玭g Thanh уng nh c蕄 4, hi謓 ngi  i <color=yellow>"..GetTask(TASK_QTD_AWARD).."<color> l莕, m鏸 ngi c� th� nh薾 t鎛g c閚g 100 l莕. ");
		end
	end	
end

function change_sanjiding()
	if GetItemCount(2,1,3215) < 1 then
		Talk(1,"","Ngi kh玭g  Thanh уng nh c蕄 3. ");
	else
		local strtab = {
			" 1 Nguy謙 Hoa/#confirm_change_sanjiding(1)",
			"Thi猲 � Ph� (s� d鬾g c蕄 79 may H� Gi竝 gi韎 h筺 t╪g n c蕄 99)/#confirm_change_sanjiding(2)",
			"Ch鴆 N� Kinh (s� d鬾g c蕄 79 may n鉵 gi韎 h筺 t╪g n c蕄 99)/#confirm_change_sanjiding(3)",
			"Luy T� T祄 Kinh (s� d鬾g c蕄 79 may h� y gi韎 h筺 t╪g n c蕄 99)/#confirm_change_sanjiding(4)",
			" D� T髖 Ch� Kinh (s� d鬾g c蕄 79 ch� t筼 v� kh� ng緉 gi韎 h筺 t╪g n c蕄 99)/#confirm_change_sanjiding(5)",
			"Can Tng Ch� Kinh (s� d鬾g c蕄 79 ch� t筼 binh kh� d礽 gi韎 h筺 t╪g n c蕄 99)/#confirm_change_sanjiding(6)",
			"Trang k�/change_sanjiding2",
			"T筸 th阨 kh玭g i. /nothing"					
					}
		Say("Xin m阨 ch鋘 ph莕 thng mu鑞 i. ",
			getn(strtab),
			strtab);
	end	
end

function change_sanjiding2()
	if GetItemCount(2,1,3215) < 1 then
		Talk(1,"","Ngi kh玭g  Thanh уng nh c蕄 3. ");
	else
		local strtab = {
			"M筩 T� Ch� Kinh (s� d鬾g c蕄 79 ch� t筼 binh kh� k� m玭 gi韎 h筺 t╪g n c蕄 99)/#confirm_change_sanjiding(7)",
			"V筺 M閏 у (s� d鬾g k� n╪g n g� c蕄 79 gi韎 h筺 t╪g n c蕄 99)/#confirm_change_sanjiding(8)",
			"V筺 Th� Ph� (s� d鬾g c蕄 79 k� n╪g Thu閏 da gi韎 h筺 t╪g n ca61p)/#confirm_change_sanjiding(9)",
			"Ng� T祅g S琻 Kinh (s� d鬾g c蕄 79 k� n╪g o kho竛g gi韎 h筺 t╪g n c蕄 99)/#confirm_change_sanjiding(10)",
			"M� M蓇 T祄 Kinh (s� d鬾g c蕄 79 k� n╪g k衞 t� gi韎 h筺 t╪g n c蕄 99)/#confirm_change_sanjiding(11)",
			"Trang trc/change_sanjiding",
			"T筸 th阨 kh玭g i. /nothing"					
					}
		Say("Xin m阨 ch鋘 ph莕 thng mu鑞 i. ",
			getn(strtab),
			strtab);
	end	
end

function confirm_change_sanjiding(nType)
	if GetItemCount(2,1,3215) < 1 then
		Talk(1,"","Ngi kh玭g  Thanh уng nh c蕄 3. ");
	else
		if Zgc_pub_goods_add_chk(1,1) ~= 1 then
			return
		end
		if DelItem(2,1,3215,1) == 1 then
			AddItem(tSanjiAward[nType][2],tSanjiAward[nType][3],tSanjiAward[nType][4],1);
			Msg2Player("Ch骳 m鮪g b筺 nh薾 頲 "..tSanjiAward[nType][1]);
			Talk(1,"guwan_change_award","Ch骳 m鮪g ngi i th祅h c玭g Thanh уng nh c蕄 3, nh薾 頲 "..tSanjiAward[nType][1]..".");
		end
	end		
end

function change_erjiding(nPage)	
	local nPageNum = 7;
	local nRemaidNum = getn(tErjiAward)-nPage*nPageNum;
	local strtab = {};
	local nThisNum = 7;
	if nRemaidNum < nThisNum then
		nThisNum = nRemaidNum;
	end
	for i=1,nThisNum do
		tinsert(strtab,tErjiAward[nPage*nPageNum+i][1].."/#confirm_change_erjiding("..(nPage*nPageNum+i)..")");
	end
	if nPage ~= 0 then
		tinsert(strtab,"Trang trc/#change_erjiding("..(nPage-1)..")");
	end
	if nRemaidNum > nPageNum	then
		tinsert(strtab,"Trang k�/#change_erjiding("..(nPage+1)..")");
	end  
	tinsert(strtab,"T筸 th阨 kh玭g i. /nothing");
	if GetItemCount(2,1,3214) < 1 then
		Talk(1,"","Ngi kh玭g  Thanh уng nh c蕄 2. ");
	else	
		Say("Xin m阨 ch鋘 ph莕 thng mu鑞 i. ",
			getn(strtab),
			strtab);
	end		
end

function confirm_change_erjiding(nType)
	if GetItemCount(2,1,3214) < 1 then
		Talk(1,"","Ngi kh玭g  Thanh уng nh c蕄 2. ");
	else
		if Zgc_pub_goods_add_chk(1,1) ~= 1 then
			return
		end	
		if DelItem(2,1,3214,1) == 1 then
			AddItem(tErjiAward[nType][2],tErjiAward[nType][3],tErjiAward[nType][4],1);
			Msg2Player("Ch骳 m鮪g b筺 nh薾 頲 "..tErjiAward[nType][1]);
			Talk(1,"guwan_change_award","Ch骳 m鮪g ngi i th祅h c玭g Thanh уng nh c蕄 2, nh薾 頲 "..tErjiAward[nType][1]);
		end
	end
end

function chang_yijiding()
	if GetItemCount(2,1,3213) < 1 then
		Talk(1,"","ngi kh玭g  Thanh уng nh c蕄 1. ");	
	else
		Say("Ngi mu鑞 i trang b� n祇? ",
			5,
			"Thi猲 мa Huy襫 Ho祅g Kh玦/#choose_tiandi_lingqi(1,0)",
			"Thi猲 мa Huy襫 Ho祅g Gi竝 /#choose_tiandi_lingqi(2,0)",
			"Gi莥 Thi猲 мa Huy襫 Ho祅g/#choose_tiandi_lingqi(3,0)",
			"V� kh� Thi猲 мa Huy襫 Ho祅g/choose_tiandi_weapon",
			"T筸 th阨 kh玭g i. /nothing")
	end
end

function choose_tiandi_weapon()
	local nRoute = GetPlayerRoute();
	if nRoute == 2 then 
		Say("Ngi mu鑞 i v� kh� n祇?",
			3,
			"Thi猲 мa Huy襫 Ho祅g Dao/#choose_tiandi_lingqi(4,1)",
			"Thi猲 мa Huy襫 Ho祅g C玭/#choose_tiandi_lingqi(4,2)",
			"T筸 th阨 kh玭g i. /nothing")
	else
		choose_tiandi_lingqi(4,0);
	end
end

function choose_tiandi_lingqi(nType,nWp)
	Say("H穣 ch鋘 甶觤 linh kh� c馻 trang b� n祔.",
		3,
		"119 linh kh� [C祅 Kh秏 Ch蕁 C蕁]/#ask_is_duihuan("..nType..","..nWp..",119)",
		"120 linh kh� [Kh玭 礽 Ly T鑞]/#ask_is_duihuan("..nType..","..nWp..",120)",
		"T筸 th阨 kh玭g i. /nothing")
end

function ask_is_duihuan(nType,nWp,nLingqi)
	local tTiandiName = {"Thi猲 мa Huy襫 Ho祅g Kh玦","Thi猲 мa Huy襫 Ho祅g Gi竝 ","Gi莥 Thi猲 мa Huy襫 Ho祅g","V� kh� Thi猲 мa Huy襫 Ho祅g"};
	Say("X竎 nh薾 s� d鬾g linh kh� Thanh уng nh c蕄 1 i <color=yellow>"..nLingqi.."-"..tTiandiName[nType].."<color> ch�?",
		3,
		"�, ta mu鑞 i./#confirm_change_yijiding("..nType..","..nWp..","..nLingqi..")",
		"Kh玭g, ta nh莔!/chang_yijiding",
		"T筸 th阨 kh玭g i. /nothing"
		)
end

function confirm_change_yijiding(nType,nWp,nLingqi)
	local nRoute = GetPlayerRoute();
	local nBody = GetBody();
	if GetItemCount(2,1,3213) < 1 then
		Talk(1,"","ngi kh玭g  Thanh уng nh c蕄 1. ");
		return
	end	
	if Zgc_pub_goods_add_chk(1,250) ~= 1 then
		return
	end	
	if nType == 4 then
		if nRoute == 2 then
			if DelItem(2,1,3213,1) == 1 then
				local add_flag,add_idx = AddItem(tTiandi[nType][nRoute][nWp][2],tTiandi[nType][nRoute][nWp][3],tTiandi[nType][nRoute][nWp][4],1,1,0,0,0,0,0,0,0,0,nLingqi);
				if add_flag == 1 then
					SetEquipCanChouQu(add_idx,1);
					Msg2Player("Ch骳 m鮪g i th祅h c玭g, nh薾 頲 "..tTiandi[nType][nRoute][nWp][1]);
					Talk(1,"","Ch骳 m鮪g i th祅h c玭g, nh薾 頲 "..tTiandi[nType][nRoute][nWp][1]);
					Msg2Global(GetName().."D飊g Thanh уng nh  i th祅h c玭g, nh薾 頲 "..tTiandi[nType][nRoute][nWp][1]);
					WriteLog(" Ho箃 ng xu﹏ 2008: ngi ch琲 "..GetName().."D飊g Thanh уng nh  i th祅h c玭g, nh薾 頲 "..tTiandi[nType][nRoute][nWp][1]);
				else
					WriteLog(" Ho箃 ng xu﹏ 2008: ngi ch琲 "..GetName().."S� d鬾g Thanh уng nh c蕄 1 th蕋 b筰, log:"..add_flag);
				end
			end
		else
			if DelItem(2,1,3213,1) == 1 then
				local nRand = random(1,getn(tTiandi[nType][nRoute]));
				local add_flag,add_idx = AddItem(tTiandi[nType][nRoute][nRand][2],tTiandi[nType][nRoute][nRand][3],tTiandi[nType][nRoute][nRand][4],1,1,0,0,0,0,0,0,0,0,nLingqi);
				if add_flag == 1 then
					SetEquipCanChouQu(add_idx,1);
					Msg2Player("Ch骳 m鮪g i th祅h c玭g, nh薾 頲 "..tTiandi[nType][nRoute][nRand][1]);
					Talk(1,"","Ch骳 m鮪g i th祅h c玭g, nh薾 頲 "..tTiandi[nType][nRoute][nRand][1]);
					Msg2Global(GetName().."D飊g Thanh уng nh  i th祅h c玭g, nh薾 頲 "..tTiandi[nType][nRoute][nRand][1]);
					WriteLog(" Ho箃 ng xu﹏ 2008: ngi ch琲 "..GetName().."D飊g Thanh уng nh  i th祅h c玭g, nh薾 頲 "..tTiandi[nType][nRoute][nRand][1]);
				else
					WriteLog(" Ho箃 ng xu﹏ 2008: ngi ch琲 "..GetName().."S� d鬾g Thanh уng nh c蕄 1 th蕋 b筰, log:"..add_flag);
				end	
			end				
		end
	elseif nType == 1 or nType ==2 or nType == 3 then
		if DelItem(2,1,3213,1) == 1 then
			local add_flag,add_idx = AddItem(tTiandi[nType][nBody][2],tTiandi[nType][nBody][3],tTiandi[nType][nBody][4],1,1,0,0,0,0,0,0,0,0,nLingqi);
			if add_flag == 1 then
			  SetEquipCanChouQu(add_idx,1);
				Msg2Player("Ch骳 m鮪g i th祅h c玭g, nh薾 頲 "..tTiandi[nType][nBody][1]);
				Talk(1,"","Ch骳 m鮪g i th祅h c玭g, nh薾 頲 "..tTiandi[nType][nBody][1]);
				Msg2Global(GetName().."D飊g Thanh уng nh  i th祅h c玭g, nh薾 頲 "..tTiandi[nType][nBody][1]);
				WriteLog(" Ho箃 ng xu﹏ 2008: ngi ch琲 "..GetName().."D飊g Thanh уng nh  i th祅h c玭g, nh薾 頲 "..tTiandi[nType][nBody][1]);
			else
				WriteLog(" Ho箃 ng xu﹏ 2008: ngi ch琲 "..GetName().."S� d鬾g Thanh уng nh c蕄 1 th蕋 b筰, log:"..add_flag);
			end	
		end
	end				
end

function chang_tongqisuipian()
	if GetItemCount(2,1,3217) < 2000 then
		Talk(1,"","<color=green>S� gi� n╩ m韎<color>: Tr猲 ngi ngi kh玭g  m秐h ng d飊g 頲 ");	
	else
		Say("Ngi mu鑞 i trang b� n祇? ",
			5,
			"Thi猲 мa Huy襫 Ho祅g Kh玦/#choose_tiandi_lingqi_suipian(1,0)",
			"Thi猲 мa Huy襫 Ho祅g Gi竝 /#choose_tiandi_lingqi_suipian(2,0)",
			"Gi莥 Thi猲 мa Huy襫 Ho祅g/#choose_tiandi_lingqi_suipian(3,0)",
			"V� kh� Thi猲 мa Huy襫 Ho祅g/choose_tiandi_weapon_suipian",
			"T筸 th阨 kh玭g i. /nothing")
	end	
end

function choose_tiandi_weapon_suipian()
	local nRoute = GetPlayerRoute();
	if nRoute == 2 then 
		Say("Ngi mu鑞 i v� kh� n祇?",
			3,
			"Thi猲 мa Huy襫 Ho祅g Dao/#choose_tiandi_lingqi_suipian(4,1)",
			"Thi猲 мa Huy襫 Ho祅g C玭/#choose_tiandi_lingqi_suipian(4,2)",
			"T筸 th阨 kh玭g i. /nothing")
	else
		choose_tiandi_lingqi_suipian(4,0);
	end
end

function choose_tiandi_lingqi_suipian(nType,nWp)
	Say("H穣 ch鋘 甶觤 linh kh� c馻 trang b� n祔.",
		3,
		"119 linh kh� [C祅 Kh秏 Ch蕁 C蕁]/#ask_is_duihuan_suipian("..nType..","..nWp..",119)",
		"120 linh kh� [Kh玭 礽 Ly T鑞]/#ask_is_duihuan_suipian("..nType..","..nWp..",120)",
		"T筸 th阨 kh玭g i. /nothing")
end

function ask_is_duihuan_suipian(nType,nWp,nLingqi)
	local tTiandiName = {"Thi猲 мa Huy襫 Ho祅g Kh玦","Thi猲 мa Huy襫 Ho祅g Gi竝 ","Gi莥 Thi猲 мa Huy襫 Ho祅g","V� kh� Thi猲 мa Huy襫 Ho祅g"};
	Say("<color=green>S� gi� n╩ m韎<color>: Mu鑞 s� d鬾g 2000 m秐h ng i Linh Kh� th祅h<color=yellow>"..nLingqi.."-"..tTiandiName[nType].."<color> ch�?",
		3,
		"�, ta mu鑞 i./#confirm_change_yijiding_suipian("..nType..","..nWp..","..nLingqi..")",
		"Kh玭g, ta nh莔!/chang_tongqisuipian",
		"T筸 th阨 kh玭g i. /nothing"
		)
end

function confirm_change_yijiding_suipian(nType,nWp,nLingqi)
	local nRoute = GetPlayerRoute();
	local nBody = GetBody();
	if GetItemCount(2,1,3217) < 2000 then
		Talk(1,"","<color=green>S� gi� n╩ m韎<color>: Tr猲 ngi ngi kh玭g c� 2000 m秐h ng d飊g 頲 ");
		return
	end	
	if Zgc_pub_goods_add_chk(1,250) ~= 1 then
		return
	end	
	if nType == 4 then
		if nRoute == 2 then
			if DelItem(2,1,3217,2000) == 1 then
				local add_flag,add_idx = AddItem(tTiandi[nType][nRoute][nWp][2],tTiandi[nType][nRoute][nWp][3],tTiandi[nType][nRoute][nWp][4],1,1,0,0,0,0,0,0,0,0,nLingqi);
				if add_flag == 1 then
					SetEquipCanChouQu(add_idx,1);
					Msg2Player("Ch骳 m鮪g ngi i th祅h c玭g 2000 m秐h ng h鱱 d鬾g, nh薾 頲 "..tTiandi[nType][nRoute][nWp][1]);
					Talk(1,"","<color=green>S� gi� n╩ m韎<color>: Ch骳 m鮪g ngi i th祅h c玭g 2000 m秐h ng h鱱 d鬾g, nh薾 頲 "..tTiandi[nType][nRoute][nWp][1]);
					Msg2Global(GetName().."фi th祅h c玭g 2000 m秐h ng h鱱 d鬾g, nh薾 頲 "..tTiandi[nType][nRoute][nWp][1]);
					WriteLog(" Ho箃 ng xu﹏ 2008: ngi ch琲 "..GetName().."фi th祅h c玭g 2000 m秐h ng h鱱 d鬾g, nh薾 頲 "..tTiandi[nType][nRoute][nWp][1]);
				else
					WriteLog(" Ho箃 ng xu﹏ 2008: ngi ch琲 "..GetName().."фi 2000 m秐h ng h鱱 d鬾g th蕋 b筰, ti猽 ch� th蕋 b筰: "..add_flag);
				end
			end
		else
			if DelItem(2,1,3217,2000) == 1 then
				local nRand = random(1,getn(tTiandi[nType][nRoute]));
				local add_flag,add_idx = AddItem(tTiandi[nType][nRoute][nRand][2],tTiandi[nType][nRoute][nRand][3],tTiandi[nType][nRoute][nRand][4],1,1,0,0,0,0,0,0,0,0,nLingqi);
				if add_flag == 1 then
					SetEquipCanChouQu(add_idx,1);
					Msg2Player("Ch骳 m鮪g ngi i th祅h c玭g 2000 m秐h ng h鱱 d鬾g, nh薾 頲 "..tTiandi[nType][nRoute][nRand][1]);
					Talk(1,"","<color=green>S� gi� n╩ m韎<color>: Ch骳 m鮪g ngi i th祅h c玭g 2000 m秐h ng h鱱 d鬾g, nh薾 頲 "..tTiandi[nType][nRoute][nRand][1]);
					Msg2Global(GetName().."фi th祅h c玭g 2000 m秐h ng h鱱 d鬾g, nh薾 頲 "..tTiandi[nType][nRoute][nRand][1]);
					WriteLog(" Ho箃 ng xu﹏ 2008: ngi ch琲 "..GetName().."фi th祅h c玭g 2000 m秐h ng h鱱 d鬾g, nh薾 頲 "..tTiandi[nType][nRoute][nRand][1]);
				else
					WriteLog(" Ho箃 ng xu﹏ 2008: ngi ch琲 "..GetName().."фi 2000 m秐h ng h鱱 d鬾g th蕋 b筰, ti猽 ch� th蕋 b筰: "..add_flag);
				end	
			end				
		end
	elseif nType == 1 or nType ==2 or nType == 3 then
		if DelItem(2,1,3217,2000) == 1 then
			local add_flag,add_idx = AddItem(tTiandi[nType][nBody][2],tTiandi[nType][nBody][3],tTiandi[nType][nBody][4],1,1,0,0,0,0,0,0,0,0,nLingqi);
			if add_flag == 1 then
				SetEquipCanChouQu(add_idx,1);
				Msg2Player("Ch骳 m鮪g ngi i th祅h c玭g 2000 m秐h ng h鱱 d鬾g, nh薾 頲 "..tTiandi[nType][nBody][1]);
				Talk(1,"","<color=green>S� gi� n╩ m韎<color>: Ch骳 m鮪g ngi i th祅h c玭g 2000 m秐h ng h鱱 d鬾g, nh薾 頲 "..tTiandi[nType][nBody][1]);
				Msg2Global(GetName().."фi th祅h c玭g 2000 m秐h ng h鱱 d鬾g, nh薾 頲 "..tTiandi[nType][nBody][1]);
				WriteLog(" Ho箃 ng xu﹏ 2008: ngi ch琲 "..GetName().."фi th祅h c玭g 2000 m秐h ng h鱱 d鬾g, nh薾 頲 "..tTiandi[nType][nBody][1]);
			else
				WriteLog(" Ho箃 ng xu﹏ 2008: ngi ch琲 "..GetName().."фi 2000 m秐h ng h鱱 d鬾g th蕋 b筰, ti猽 ch� th蕋 b筰: "..add_flag);
			end	
		end
	end				
end

function about_guwan_collect()
	Talk(1,"about_guwan_collect2","<color=green>S� gi� n╩ m韎<color>: \nTa nghe n鉯 g莕 y v� l﹎ nh﹏ s� khai qu藅 頲 nhi襲 Thanh уng m穘h kh�, b� m閠 s� d� th�, qu竔 v藅 v� cng o l蕐 甶. N誹 ngi t譵 頲 m秐h Thanh ng kh� v�, c� th� h頿 th祅h 1 Thanh уng nh giao cho ta.");
end

function about_guwan_collect2()
	Talk(1,"guwan_collect","<color=green>S� gi� n╩ m韎<color>: C莕 ch� �: cho d� ch璦 h頿 th祅h th祅h c玭g th� gi� tr� c馻 Thanh уng nh h醤g c騨g kh玭g ph秈 l� nh�, v蒼 c� th� i 頲 ph莕 thng ch� ta. \nNgo礽 ra nh qu竔 cao c蕄 ngo礽 th祅h u c� kh� n╪g l蕐 頲 Thanh уng kh� huy誸 cao c蕄, \nNg� C竎 c騨g c� b竛 1 s� m秐h уng kh�")
end

function about_hongbao()
	local nMapId = GetWorldPos();
	local nNum = GetMapTaskTemp(nMapId,MAP_HONGBAO_NUM);
	local nDate = tonumber(date("%Y%m%d"));
	local nLv = GetLevel();
	
	if GetTask(TASK_HONGBAO_DATE) >= nDate then
		Talk(1,"","<color=green>S� gi� n╩ m韎<color>: Ngi h玬 nay  nh薾 1 h錸g bao r錳, m鏸 ng祔 ch� nh薾 頲 1 l莕 th玦!");
		return
	end
	if Zgc_pub_goods_add_chk(1,1) ~= 1 then
		return
	end
	if nNum >= HONGBAO_TOTAL_NUM or (nNum < HONGBAO_TOTAL_NUM and nLv < 70)then
		Say("<color=green>S� gi� n╩ m韎<color>: Ch祇 n n╩ m韎, ta  chu萵 b� r蕋 nhi襲 h錸g bao t苙g cho nh﹏ s�. M鏸 ng祔 l骳 9h00, 13h00, 19h30, 21h30 s� ph竧 50 Чi h錸g bao, ai n trc nh薾 trc. Чi h錸g bao ch� ph竧 cho ai t� c蕄70. Nh鱪g th阨 gian c遪 l筰 m鋓 ngi u c� th� t髖 � n nh薾 Ti觰 h錸g bao, ai c騨g c� ph莕!",
			2,
			"Л頲/get_xiao_hongbao",
			"Ta s� quay l筰 sau!/nothing")
	elseif nNum < HONGBAO_TOTAL_NUM and nLv >= 70 then
		AddItem(2,1,212,1);
		SetTask(TASK_HONGBAO_DATE,nDate);
		SetMapTaskTemp(nMapId,MAP_HONGBAO_NUM,nNum+1);
		Msg2Player("Ch骳 m鮪g Ngi nh薾 頲 1 Чi h錸g bao");
		Talk(1,"","<color=green>S� gi� n╩ m韎<color>: N╩ m韎 n r錳, ta c� chu萵 b� bao l� x� cho m鋓 ngi, v祇 l骳 9:00, 13:00, 19:30, 21:30 gi� m鏸 ng祔 s� ph竧 50 Чi h錸g bao, n trc 頲 trc, ch� �, ngi l穘h Чi h錸g bao ph秈 t c蕄 70 tr� l猲. C� th� n ch� ta nh薾 Ti觰 h錸g bao b蕋 c� l骳 n祇. \nC莔 甶, Чi h錸g bao c馻 ngi y, ch骳 n╩ m韎 v筺 s� nh� �.");
	end
end

function get_xiao_hongbao()
	local nDate = tonumber(date("%Y%m%d"));
	if GetTask(TASK_HONGBAO_DATE) >= nDate then
		Talk(1,"","<color=green>S� gi� n╩ m韎<color>: Ngi h玬 nay  nh薾 1 h錸g bao r錳, m鏸 ng祔 ch� nh薾 頲 1 l莕 th玦!");
		return
	end	
	if Zgc_pub_goods_add_chk(1,1) ~= 1 then
		return
	end
	AddItem(2,1,213,1);
	SetTask(TASK_HONGBAO_DATE,nDate);
	Msg2Player("Ch骳 m鮪g Ngi nh薾 頲 1 Ti觰 h錸g bao. ");
end

function get_action_manual()
	if BigGetItemCount(2,1,3225) >= 1 then
		Talk(1,"","<color=green>S� gi� n╩ m韎<color>: Ch糿g ph秈 ngi  c� m閠 ch� nam ho箃 ng ng祔 xu﹏ r錳 sao?")
	else
		if Zgc_pub_goods_add_chk(1,1) ~= 1 then
			return
		end
		AddItem(2,1,3225,1);
	end		
end