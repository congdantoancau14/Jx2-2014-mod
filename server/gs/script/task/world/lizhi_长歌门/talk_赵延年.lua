--文件说明
--npc：赵延年
--created by lizhi
--2005-8-10 10:37

Include("\\script\\task\\world\\task_head.lua");
Include("\\script\\task\\world\\lizhi_长歌门\\task_head.lua");

function talk_one()
    
    local szTalk = {
        "M蕐 ng祔 kh玭g g苝 <sex> qu� nhi猲 ti課 b� h糿!",
        "Kh蕌 Chu萵 i nh﹏ c鉻h� g鰅 cho ti襫 b鑙!",
        "Th� g�? Лa ta xem.....",
        "[Tri謚 Di猲 Ni猲 m� th� ra xem xong suy ngh� h錳 l﹗]",
        "Kh玭g ng� s� vi謈 l筰 h� tr鋘g n v藋. Ngi ra s鴆 gi髉 Чi T鑞g, Tri謚 m� n祔 r蕋 kh﹎ ph鬰. Kh玭g gi蕌 g� ngi, ta ch輓h l� ngi li猲 l筩 v韎 {Trng Ca M玭}.",
        "Ra l� v藋! {Trng Ca M玭}, {Thi猲  gi竜} l祄 ta r鑙 c� l猲, ti襫 b鑙 gi秈 th輈h m閠 ch髏 頲 kh玭g?"
    };
    
    if GetTask(TASK_ONE) == 101 then
        TalkEx("task_002_00", szTalk);
    end;
end;

function talk_five()
    local szMsg = {
        "V穘 b鑙 頲 l謓h c馻 H� H莡 C莔 n th玭g b竜 v� m秐h S琻 H� X� T綾 g莕 Giang Nam c� kh� n╪g r琲 v祇 tay b鋘 Xi H醓 gi竜, h琻 n鱝 th﹏ ph薾 玭g ta b� b筰 l�, xin xem qua b鴆 th� s� r�!",
        " t� ngi!",
        "C遪 nhi襲 ngi c莕 ph秈 th玭g b竜 n鱝, v穘 b鑙 甶 y!"
    };
    nStep = GetTask(TASK_FIVE);
    if nStep >= 2 and nStep < 5 then
        RemoveTrigger(GetRunningTrigger());
        SetTask(TASK_FIVE, nStep + 1);
        SetTask(127,2);
        DelItem(2,0,43,1);
        TalkEx("", szMsg);
    end;
end;

function task_002_00()
    local szTalk = {
        "Lai l辌h Trng Ca M玭 b総 u t� ng祔 khai qu鑓. L骳  Th竔 T� b譶h nh giang s琻, c竎 v� tng nh� Th筩h Th� T輓, Cao Ho礽 c, Trng L謓h Phong, Tri謚 Ng筺 Huy u c竜 l穙 h錳 hng, an dng tu鎖 gi�. Цng ti誧 {Tri謚 Ng筺 Huy} i nh﹏ kh玭g ch辵 n鎖 s� c� n b蘮 li猲 l筩 m閠 s� b筺 b� giang h�, ng﹎ th�, t� v� ngh�.",
        "V� sau nh鱪g v� b籲g h鱱 n祔 th祅h l藀 th祅h m閠 m玭 ph竔. L骳  trong ph竔 nhi襲 ngi s竛g t竎 nh筩 l祄 th� cho n猲 m韎 c� t猲 {Trng Ca M玭}. Vi謈 c莕 l祄 l骳 n祔 l� th玭g b竜 cho nh鱪g huynh  蕐 bi誸.",
        "Hi謓 {4 ngi} u 產ng ph鬾g m謓h 甶襲 tra, ta ph秈 th玭g b竜 cho { Dng H鋋} trc. {H� H莡 C莔} � {Dng Ch﹗}, {C玭g T玭 Th瓆 � {Tng Dng}, {Gia C竧 K鷠� {Giang T﹏ Th玭}, kh玭g bi誸 <sex> c� th� gi髉 ta th玭g b竜 cho 3 v� kh玭g?",
        "V穘 b鑙 甶 ngay!"
    };
    TalkEx("task_002_000", szTalk);
end;

function task_002_000()
    local szTalk = {
        "C秏 琻 <sex>! Th鵦 ra B竎h Hi觰 Sinh c騨g l� ngi c馻 Trng Ca M玭, ngi i g鋓 玭g ta l� {Tr� hi謕}. <sex> mu鑞 bi誸 th猰 v� Trng Ca M玭 c� th� n .",
        "Ч ta ti襫 b鑙 ch� d蒼, sau khi th玭g b竜 cho xong 3 v� ti襫 b鑙 kia v穘 b鑙 s� t譵 {B竎h Hi觰 Sinh} th豱h gi竜."
    };
    TalkEx("task_002_01", szTalk);
end;

function task_002_01()
    --接受任务：限时找夏侯琴、诸葛棋、公孙书，在时间内完成得到全部奖励，超时则奖励折为1/3。
    SetTask(TASK_ONE, 102);
    RemoveTrigger(GetTrigger(90));
    
    CreateTrigger(1, 201, 90);
    ContinueTimer(GetTrigger(90));
    
    CreateTrigger(3, 203, 89);
    SetLogType(GetTrigger(89), 1);
    
    CreateTrigger(4, 201, 91);    --talk to 夏侯琴
    SetTask(124,1);
    CreateTrigger(4, 206, 96);    --talk to 诸葛棋
    SetTask(126,1);
    CreateTrigger(4, 207, 97);    --talk to 公孙书
    SetTask(125,1);
    
    Msg2Player("Li猲 l筩 3 v韎 3 ngi c遪 l筰 trong Trng Ca M玭");
    TaskTip("Li猲 l筩 3 v韎 3 ngi c遪 l筰 trong Trng Ca M玭");
    
    --接受任务：找百晓生
    SetTask(TASK_TWO, 1);
end;