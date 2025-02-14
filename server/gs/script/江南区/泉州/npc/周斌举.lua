--  文件说明
--  对应NPC名称：周斌举
--  created by lizhi
--  2005-8-4 15:14

Include("\\script\\task\\world\\lizhi_泉州\\14级\\task_main.lua");
Include("\\script\\online\\activity_ambassador.lua");
tColor = {"red","green","yellow"};
tRecovers = {
	[1] = {
		["mater"] = {
			{"Bi' ph� cu~ n竧",{2,1,30088},1},
			{"Ph鬰 nguy猲 thu藅",{2,1,30089},1,1}
		},
		["target_item"] = {
			{"Trng sinh ph�",{2,1,30090},1}
		}
	},
	[2] = {
		["mater"] = {
			{"Hoa",{2,1,30447},1},
			{"H秓",{2,1,30448},1},
			{"Nguy謙",{2,1,30449},1},
			{"Vi猲",{2,1,30450},1,},
			{"B髏 l玭g",{2,1,30451},1,1},
			{"M鵦 T祏",{2,1,30473},1,1},
		},
		["target_item"] = {
			{"Ph� thi猲 ng kh竛h",{2,1,30446},1}
		}
	},
}

tChoosen = {}

function main()
    
    local nLevel = 0;
    local nStep = 0;
    local szTalk = {
        "Chu B﹏ C�: Giai kh玭g tr� l藀, t骳 甶觰 quy phi c蕄. H� x� th� quy tr譶h? Trng nh li猲 畂秐 nh."
    };

    nStep = GetTask(TASK_LEV_14_ID);
    if (nStep == 1) then
        task_001_02();
    elseif (nStep == 2) then
        task_002_01();
    elseif (nStep == 3) then
        task_003_01();
    else
        --TalkEx("", szTalk);
		showActivities();
    end;	

end;

function showActivities()
	local tbSay = {};
	
	for i=1,getn(tRecovers) do
		tinsert(tbSay,"Kh玦 ph鬰 "..tRecovers[i]["target_item"][1][1]..format("/#recover(%d)",i));
	end
	tinsert(tbSay, "Ho箃 ng ch� vi誸 th蕋 l筩/showChuVietThatLac");
	tinsert(tbSay, "T竎h m閠 s� rang b� \/ v藅 ph萴/_equip_recycle");
	tinsert(tbSay, "\nTho竧/nothing");
	local szTitle = "<color=green>Chu B﹏ C�<color>: ".."M鋓 v藅 n�'u r竝 v祇 頲 th� `u co' c竎h ph� gi秈."
			.."Co' ch╪g l� m閠 s� v藅 頲 thi�'t k�' t� h駓 ho芻 thi�'t k�' 1 chi猔u, "
			.."ph� ra s� ph秈 chiu. m閠 s� t鎛 th蕋 nh蕋 甶.nh ho芻 v藅 s� kh玭g nguy猲 v裯 nh� ban u th玦.\n"
			.."Tng t�, m閠 v藅 bi. r竎h n竧 cu~ng co' th� kh玦 ph鬰. "
			.."Nguy猲 d筺g 頲 kh玦 ph鬰 bao nhi猽 ph莕 th� ph秈 xem duy猲 tr阨 r錳. "
			.."Tuy v藋, co' th� ngh� 'n vi謈 t筼 ra v藅 ph萴 tng t�.";
	Say(szTitle, getn(tbSay), tbSay);

end;

function recover(id)
	local tItem = tRecovers[id];
	tChoosen = tRecovers[id];
	local tCount = {}
	local nEnough = 1;
	local nMax = 2000;
	for i=1, getn(tItem["mater"]) do
		local nCount = GetItemCount(tItem["mater"][i][2][1],tItem["mater"][i][2][2],tItem["mater"][i][2][3]);
		if nCount < tItem["mater"][i][3] then
			nEnough = 0;
			nMax = 0;
			tCount[i] = {["count"] = nCount, ["enough"] = 0};
		else
			if tItem["mater"][i][4] ~=1 and  nCount < nMax then
				nMax = nCount;
			end
			tCount[i] = {["count"] = nCount, ["enough"] = 1};
		end
	end
	
	if nEnough == 0 then
		local szListCounter = "";
		local enter = "<enter>";
		local space = " ";
		for i=1, getn(tCount) do
			local nColor = tCount[i]["enough"]+1;
			local szColor = tColor[nColor];
			szListCounter = szListCounter.."* "
				..colorize(szColor,tItem["mater"][i][1])..space
				..colorize(tColor[3],tItem["mater"][i][3])..enter;
		end
		Talk(1,"","C竎 h� ch璦 chu萵 bi.  nguy猲 li謚, ta e kh玭g th� gi髉 b籲g h鱱 kh玦 ph鬰 "
			..colorize(tColor[3],tItem["target_item"][1][1])..enter
			..szListCounter
			);
	else
		AskClientForNumber("_request_number_call_back",1,nMax,"Nh藀 s� lng c莕 kh玦 ph鬰");
	end
end;

function colorize(color,any)
	any = tostring(any);
	return format("<color=%s>%s<color>",color,any);
end;

function _request_number_call_back(nNum)
	if nNum < 1 then
		return
	end
	
	local tDel = {}
	local nDelResult = 1;
	for i=1, getn(tChoosen["mater"]) do
		local item = tChoosen["mater"][i];
		if item[4] ~= 1 then
			local nDel = DelItem(item[2][1], item[2][2], item[2][3], item[3]*nNum);
			if nDel ~= 1 then
				nDelResult = 0;
			end
		end
	end
	
	local szMes = "";
	if nDelResult == 0 then
		Talk(1,"","Kh玦 ph鬰 th蕋 b筰. Co' th�  bi. t鎛 th蕋 m閠 s� v藅 ph萴 trong qu� tr譶h kh玦 ph鬰");
	else
		AddItem(
			tChoosen["target_item"][1][2][1],
			tChoosen["target_item"][1][2][2],
			tChoosen["target_item"][1][2][3],
			tChoosen["target_item"][1][3] * nNum
			)
		Msg2Player("Kh玦 ph鬰 th祅h c玭g "..nNum.." "..tChoosen["target_item"][1][1]);
	end
end;

function _equip_recycle()
	SendScript2Client("Open[[EquipRecycle]]");
end

function showChuVietThatLac()
	local g_Act_Count = 0;
	local g_Act_Dialog = {};
	local g_Act_Title = {};
	local g_Act_Select = {};
	
	
	--追回大字帖大作战
	if dzt_activity_isopen() == 1 then
		g_Act_Count = g_Act_Count + 1;
		g_Act_Dialog[g_Act_Count] = {};
		g_Act_Select[g_Act_Count] = "Kh玦 ph鬰 T� Thi誴";
		for i=1, getn(DZT_DIALOG_TABLE) do 
			tinsert(g_Act_Dialog[g_Act_Count], DZT_DIALOG_TABLE[i]);
		end
		g_Act_Title[g_Act_Count] = DZT_NPC..DZT_TITLE;
	end
	
	
	if g_Act_Count == 1 then
		if getn(g_Act_Dialog[g_Act_Count]) > 0 then
			tinsert(g_Act_Dialog[g_Act_Count], "\nTho竧/nothing");
			Say(g_Act_Title[g_Act_Count], getn(g_Act_Dialog[g_Act_Count]), g_Act_Dialog[g_Act_Count]);
		end
	else
		local tbSay = {};
		for i = 1, getn(g_Act_Select) do
			tinsert(tbSay, format("\n%s/#aa_SayDialog(%d)", g_Act_Select[i], i));
		end
		tinsert(tbSay, "\nTho竧/nothing");
		local szTitle = "Danh s竎h ho箃 ng";
		Say(szTitle, getn(tbSay), tbSay);
	end
end;