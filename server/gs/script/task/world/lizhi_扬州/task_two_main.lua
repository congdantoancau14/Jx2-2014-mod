--扬州任务分支
--created by lizhi
--2005-9-1 10:21

Include("\\script\\task\\world\\task_var_id.lua");
Include("\\script\\task\\world\\task_head.lua");
Include("\\script\\task\\world\\task_award.lua");
Include("\\script\\task\\world\\task_trigger_list.lua");

--------------------------------------------扬州分支二--------------------------------------

function task_01_00()
    local szTalk = {
        "V穘 b鑙 v蕁 an l穙 l穙.",
        "Ta v韎 ngi kh玭g quen bi誸, c� chuy謓 g� kh玭g?",
        "T筰 h� c� m閠 ngi b筺 b� gi誸, tr猲 thi th� t譵 頲 {Phi B閏 kim ch﹎}, thi誸 ngh� y l� v藅 ph萴 c馻 Л阯g M玭, t筰 h� mu鑞 nh� L穙 L穙 甶襲 tra xem ai l� hung th�.",
        "M閠 ng祔 ta c遪 ng trong Л阯g M玭 s� tu﹏ th� theo gia ph竝, kh玭g c莕 <sex> ra tay.",
        "T筰 h� t� xa n mong L穙 L穙 gi髉 .",
        "Ta c� th� gi髉 ngi, nh璶g trc ti猲 ph秈 n V﹏ M閚g Tr筩h l蕐 20 c竔 畊玦 b� c筽 v� y!",
        "Kh玭g th祅h v蕁 !"
    };
    TalkEx("task_01_01", szTalk);
end;

function task_01_01()
    RemoveTrigger(GetTrigger(TALK_YZ_TC));
    DelItem(2,0,100,1);
    SetTask(TASK_YZ_TWO, 2);
    CreateTrigger(0,536,KILL_YZ_TX);
    Msg2Player("дn V﹏ M閚g Tr筩h l蕐 20 c竔 畊玦 b� c筽 v� cho Л阯g Xu﹏");
    TaskTip("дn V﹏ M閚g Tr筩h l蕐 20 c竔 畊玦 b� c筽 v� cho Л阯g Xu﹏");
    GivePlayerAward("Level_36", "easy");
	GivePlayerExp(SkeyYZxiahouqin,"zuichaanqi1")		--追查暗器1
end;

function task_02_00()
    local szTalk = {
        "ng th� n祔 r錳! Ta s� gi髉 ngi 甶襲 tra nh璶g c莕 kho秐g th阨 gian, l竧 quay l筰 甶!"
    };
    local szNot = {
        "N誹 nh� th蕐 kh� t譵 畊玦 b� c筽 th� c� n鉯 v韎 ta nh�!"
    };
    if GetItemCount(2,0,102) >= 20 then
        TalkEx("task_02_01", szTalk);
    else
        TalkEx("task_02_02", szNot);
    end;
end;

function task_02_02()
    if GetTrigger(KILL_YZ_TX) == 0 then
        CreateTrigger(0,536,KILL_YZ_TX);
    end;
end;

function task_02_01()
    RemoveTrigger(GetTrigger(TALK_YZ_TC));
    DelItem(2,0,102,20);
    SetTask(TASK_YZ_TWO, 3);
    SetTask(TASK_YZ_THREE, 1);  --开启扬州分支三
    Msg2Player("Л阯g Xu﹏ b秓 b筺 m閠 th阨 gian sau m韎 c� th� tr� l阨");
    TaskTip("Л阯g Xu﹏ b秓 b筺 m閠 th阨 gian sau m韎 c� th� tr� l阨");
    GivePlayerAward("Level_36", "hard", "chest", "Level_36");
	GivePlayerExp(SkeyYZxiahouqin,"zuichaanqi2")		--追查暗器2
end;

function task_04_00()
    local szTalk = {
        "<sex> n ng l骳 l緈! T蕋 c� 竚 kh� v� c dc u c� l祄 d蕌, ch� c� Л阯g Ninh kh玭g b� kh鑞g ch� do h緉  tinh th玭g thu藅 ch� t筼 竚 kh�, hi謓 ta kh玭g bi誸 h緉 tr鑞 � u.",
        "Sao tr飊g h頿 v藋? T筰 h� c� g苝 qua ngi n祔."
    };
    TalkEx("task_04_01", szTalk);
end;

function task_04_01()
    RemoveTrigger(GetTrigger(TALK_YZ_TC));
    SetTask(TASK_YZ_TWO, 5);
    Msg2Player("T譵 Л阯g Ninh h醝 th╩");
    TaskTip("T譵 Л阯g Ninh h醝 th╩");
    GivePlayerAward("Level_50", "easy");
	GivePlayerExp(SkeyYZxiahouqin,"zuichaanqi3")		--追查暗器3
end;

function two_05_00()
    local szTalk = {
        "<sex> qu� nhi猲 n t譵 ta, c� ph秈 H� H莡 C莔 ph竔 t韎?",
        "N鉯 mau! Sao ngi gi誸 L玦 Th緉g?",
        "Ngi qu� th藅 th玭g minh t� Phi B閏 kim ch﹎ 甶襲 tra 頲 n y, ng ti誧 ta ch薽 h琻 ngi m閠 bc.",
        "Phu qu﹏ {Th竔 H錸g Tuy謙} l� ngi Xi H醓 gi竜 n猲 con 阯g s竧 th� c馻 ta c騨g b総 u t� , kh玭g may ch祅g  ch誸 di tay h醓 k� l﹏, ta v� Xi H醓 gi竜 c騨g c総 t quan h�."
    };
    TalkEx("two_05_01", szTalk);
end;

function two_05_01()
    local szTalk = {
        "C� nng l� ngi th玭g minh sao l筰 ra n玭g n鎖 v藋?",
        "Th� sao n祇?",
        "Xi H醓 gi竜 產ng s� d鬾g t蕀 b秐  S琻 H� l� b秓 v藅 th莕 b� m� H� H莡 C莔 b秓 ngi mang t韎. L骳  m閠 ngi ph� n� t猲 Hng Ty Thanhra l謓h ta ph秈 gi誸 L玦 Th緉g, 畂箃 l蕐 m秐h b秐  S琻 H� X� T綾, ti誧 thay ta kh玭g t譵 頲.",
        "Ch輓h v� v藋 ngi m韎 t譵 頲 竚 kh� c馻 ta nh璶g ta v蒼 kh玭g hi觰 v� sao {H� H莡 C莔} b秓 ngi mang m秐h S琻 H� X� T綾 n, ngi v� h醝 l筰 xem!",
        " t� c� nng!"
    };
    TalkEx("two_05_02", szTalk);
end;

function two_05_02()
    SetTask(TASK_YZ_TWO, 6);
    Msg2Player("дn Dng Ch﹗ t譵 H� H莡 C莔");
    TaskTip("дn Dng Ch﹗ t譵 H� H莡 C莔");
    GivePlayerAward("Level_50", "easy");
	GivePlayerExp(SkeyYZxiahouqin,"dezhizhenxiang1")		--得知真相1
end;

function two_06_00()
    local szTalk = {
        "Sao ngi ph秐 b閕 Trng Ca M玭? m m秐h S琻 H� X� T綾 cho Xi H醓 gi竜.",
        "Ngi 甶襲 tra ra r錳 �? Chuy謓 n祔 l祄 ta day d鴗 b蕐 l﹗, c� l� n鉯 ra c騨g l� c竎h gi秈 quy誸.....",
        "Ngi n b� Hng Ty Thanh b� tr鑞 c飊g phu qu﹏ Ta, � c遪 c� � nh cp Anh Nhi 甶. ng r錳, Anh Nhi v� Li猲 Nhi l� con c馻 ta, 產 t� <sex> ch╩ s鉩.",
        "Tr猲 i c遪 c� lo筰 n b� c 竎 n祔 n鱝 sao!",
        "Kh玭g bi誸 <sex> c遪 nh� chuy謓 Li猲 Nhi b� tr髇g c kh玭g? Ch輓h �  ra tay, � n鉯 n誹 kh玭g giao Anh Nhi s� c ch誸 Li猲 Nhi, v� sau kh玭g bi誸 sao l筰 i �."
    };
    TalkEx("two_06_01", szTalk);
end;

function two_06_01()
    local szTalk = {
        "Ch輓h c� ta a cao Thi猲 Thi襪 H鉧 чc m�! Kh玭g l� c� ta  h鑙 c穒?",
        "H鮩! {H鉧 c cao} ng l� thu鑓 gi秈 nh璶g c� th猰 {Thi襪 T珆 v� s� l� lo筰 c nh k� ph竧 t竎, n誹 kh玭g c� thu鑓 gi秈 k辮 s� 產u n m� ch誸, �  uy hi誴 ta l祄 nhi襲 甶襲 c� l鏸 v韎 lng t﹎.",
        "Kh玭g th� tr竎h c� nng, v藋 c� c� bi誸 m秐h S琻 H� X� T綾 c馻 Xi H醓 gi竜 甧m 甶 u kh玭g?",
        "H譶h nh� Xi H醓 gi竜 產ng ﹎ m璾 l韓 � {Йng H秈 H秈 T﹏}, ngi th� n  xem th�!",
        "Л頲! T筰 h� l猲 阯g ngay!"
    };
    TalkEx("two_06_02", szTalk);
end;

function two_06_02()
    SetTask(TASK_YZ_TWO, 7);
    GivePlayerAward("Level_50", "hard");
	GivePlayerExp(SkeyYZxiahouqin,"dezhizhenxiang2")		--得知真相2
end;

function two_07_00()
    local szSay = {
        "<sex> t譵 ta c� chuy謓 g� kh玭g?",
        "Li猲 quan Xi H醓 gi竜/about_chj",
        "Li猲 quan H� H莡 Li猲/about_xhl"
    };
    SelectSay(szSay);
end;

function about_chj()
    local szTalk = {
        "Xi H醓 gi竜 產ng t� t藀 � Йng H秈 H秈 T﹏. <sex> mau 甶 ng╪ c秐 ch髇g!"
    };
    TalkEx("", szTalk);
end;

function about_xhl()
    local szSay = {
        "Ch蕋 c trong ngi Li猲 Nhi ch� c� m竨 c馻 {H醓 k� l﹏} trong truy襫 thuy誸 m韎 gi秈 頲.",
        "M竨 c馻 h醓 k� l﹏ y/have_one",
        "Ta ch璦 th蕐 qua b秓 v藅 n祔/have_none"
    };
    SelectSay(szSay);
end;

function have_one()
    local szTalk = {
        " t� <sex> mang b秓 v藅 ra c鴘 Li猲 Nhi.",
        "Kh玭g c鴘 ngi b秓 v藅 n祔  l祄 g�!"
    };
    TalkEx("task_07_01", szTalk);
end;

function task_07_01()
    SetTask(TASK_YZ_TWO, 8);
    DelItem(2,0,150,1);
end;

function have_none()

end;