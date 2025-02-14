--文件说明
--NPC：范仲淹
--created by lizhi
--2005-8-12 14:57

Include("\\script\\task\\world\\task_var_id.lua");
Include("\\script\\task\\world\\lizhi_成都\\task_main.lua");

function main()
    local nStep = 0;
    
    if GetTask(1) < 25 or GetTask(1) == 100 then
        local tTalk = {}
		if random(2) == 1 then
			tinsert(tTalk,"T竔 h� thu lai phong c秐h d�, H祅h dng nh筺 kh� v� l璾 齾");
		else
			tinsert(tTalk,"Чi Ng璾 l� a ch竨 ng鑓 c馻 ta, thng giao du v韎 m l璾 manh nh璶g b秐 t輓h hi襫 l祅h, kh玭g ph秈 ngi x蕌. N誹 ngi c� g苝 h緉 th� xin ng b総 n箃 h緉.");
		end;
		
        TalkEx("", tTalk);
        return
    end;
    
    nStep = GetTask(TASK_CD_FOUR);
    if nStep == 6 or nStep == 7 then
        task_four_0607();
        return
    elseif nStep == 8 then
        task_four_08();
        return
    end;
    
    nStep = GetTask(TASK_CD_THREE);
    if nStep == 1 then
        task_three_01();
        return
    elseif nStep == 2 then
        task_three_02();
        return
    elseif nStep == 3 then
        task_three_03();
        return
    elseif nStep == 4 then
        task_three_04();
        return
    end;
    
    nStep = GetTask(TASK_CD_ONE);
    if nStep == 0 then
        task_one_00();
        SetTask(132,2);
        if GetTask(130) == 2 and GetTask(131) == 2 then
            SetTask(1, 26); --如果完成新手任务的送信任务(最后一步)，则关闭任务面板
        end;
        return
    elseif nStep == 1 then
        task_one_01_00();
        return
    end;

    TalkEx("", szTalk);
end;