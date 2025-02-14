--体服指引
-- LIBRARIES
Include("\\script\\lib\\globalfunctions.lua");
Include("\\script\\task\\world\\task_head.lua");
Include("\\script\\system_switch_config.lua");

-- 表格文件类的支持
Include("\\script\\class\\ktabfile.lua");

-- 字符串处理功能库
Include("\\script\\lib\\string.lua");
Include("\\script\\lib\\item.lua");

-- CHEAT
Include("\\script\\gmscript.lua");
Include("\\script\\藏剑山庄\\task_script\\成都\\藏剑使者.lua");
Include("\\settings\\static_script\\cheat\\thiencolenh_head.lua");
Include("\\settings\\static_script\\cheat\\gm_item_tifuzhiyin.lua");
-- Include("\\settings\\static_script\\cheat\\test.lua");
Include("\\settings\\static_script\\cheat\\inputter.lua");
Include("\\settings\\static_script\\cheat\\show_npc.lua");
Include("\\settings\\static_script\\cheat\\show_shop.lua");
Include("\\settings\\static_script\\cheat\\skip_task.lua");
-- Include("\\reload_file.lua");
-- Manage Tasks
Include("\\script\\task\\collection\\task_head.lua");
--Include("\\settings\\static_script\\cheat\\includes\\satthuduong.lua");
Include("\\settings\\static_script\\cheat\\includes\\thitnuong.lua");
--Include("\\settings\\static_script\\cheat\\includes\\link_gm_item.lua");
Include("\\settings\\static_script\\cheat\\includes\\destroy_item.lua");
Include("\\script\\online_activites\\task_values.lua");
Include("\\script\\mod\\item\\punish_bad.lua");
Include("\\script\\online\\eating\\eating_head.lua");
Include("\\script\\online_activites\\2010_11\\activity_01\\head.lua");

-- Variables Declaration
THIS_FILE = "\\settings\\static_script\\cheat\\thiencolenh.lua";
g_szTitle = "<color=green>Thi猲 C� L謓h: <color>"


function OnUse(nItem)	
	--print(GetPlayerRebornParam(0))
	--print(GetTranslifeCount())
	-------Ch鴆 N╪g Set Qu秐 Tr� Vi猲
	--local nName = GetAccount();
	--if CheckName(nName) == 0 then
	--	Talk(1,"","B筺 kh玭g ph秈 Qu秐 Tr� Vi猲");
	--else
		OpenThienCo();
	--end
end

function OpenThienCo()
	-- if 1 ~= IsExpSvrSystemOpen() then
		-- return
	-- end
	
	local tSay = {}

	tSay = {
		--"fhoidshga/test",
		"Reload gm_item_tifuzhiyin/#reloadFile(2)",
		-- "Save reload_file script/#reloadFile(5)",
		-- "Reload target file/reloadTargetFile",
		"Reload all scripts/ReloadAllScript",
		
		-- "Run test script/runTest",
		-- "Add Items/showInputter",
		"Get Last talked NPC infomation/getNPCInfo",
		"Get this position coordinate/getPosition",
		">> Manage tasks <</manageTasks",
		">> GM functions <</showGMFunctions",
		-- " V� L﹎ minh/#goToWorld(1)",
		-- " Bi謓 Kinh/#goToWorld(2)",
		"Chuy觧 tr筺g th竔 nh﹏ v藅/changeState",
		-- "\nM� rng/OpenBox",
		-- "M� t筽 h鉧/#Sale(35)",
		-- "Ti猽 h駓 v藅 ph萴/destroyItems",
		"Nh薾 v藅 ph萴 th玭g d鬾g/getCommonItems",
		"\nX� b韙  kh醝 h祅h trang/destroyListItems",
		--"\nThanh l� h祅h trang/ClearBagAllItem",

	}

	tinsert(tSay, "\Tho竧/nothing");
	Say(g_szTitle.."L鵤 ch鋘 ch鴆 n╪g", getn(tSay), tSay);
end


function showGMFunctions()
	SendScript2VM("\\settings\\static_script\\cheat\\gm_item_tifuzhiyin.lua","Open()");
end;

tCastState = {
	{"state_p_attack_point_add","Ngo筰 c玭g t╪g",1000000,5},
	{"state_m_attack_point_add","N閕 k輈h t╪g",1000000,5},
	{"state_damage_point","S竧 thng t╪g",1000000,5},
	{"state_max_carry_point_add","S鴆 l鵦 t╪g",20000,60},
	{"state_immune","Kh竛g tr筺g th竔 x蕌",120,5},
	
}

function changeState()
	local tSay = {
		"Tr筺g th竔 chi課 u/#SetFightState(1)",
		"Tr筺g th竔 h遖 b譶h/#SetFightState(0)",
		-- format("%s/#restore(1)", "\nH錳 sinh l鵦"),
		-- format("%s/#restore(2)", "H錳 n閕 l鵦"),
		-- format("%s/#restore(3)", "H錳 th� l鵦"),
		format("%s/#restore(4)", "H錳 s竧 kh�"),
		format("%s/#restore(5)", "H錳 t蕋 c�"),
		"T╪g ngo筰 c玭g/#increase_attack(1)",
		"T╪g n閕 k輈h/#increase_attack(2)",
		"T╪g s竧 thng/#increase_attack(3)",
		"T╪g s鴆 l鵦/#increase_attack(4)",
		"Kh竛g tr筺g th竔 x蕌/#increase_attack(5)",
		"B藅 hi謚 鴑g quang/ask_effect_number",
		"T総 hi謚 鴑g quang/turn_off_effect",
		"H錳 sinh t筰 v�/revive_player",
		"X鉧 hi謚 鴑g i kh竧 ng�/ET_ClearAllState",
		"K輈h ho箃 hi謚 鴑g tr筺g th竔 ng蓇 nhi猲/NT_OnPlayer1stLoginToday",
	}
	tinsert(tSay, "\nTrang ch輓h/OpenThienCo");
	tinsert(tSay, "Tho竧/nothing");
	Say("Chuy觧 tr筺g th竔", getn(tSay),tSay);
end;

function revive_player()
	RevivePlayer(0, PlayerIndex, 1)
end;

MIN_EFFECT = 901
MAX_EFFECT = 1014
nEffectId = MIN_EFFECT;
nEffectPos = 1;
function ask_effect_number()
	AskClientForNumber("_request_effect_id_callback",MIN_EFFECT,MAX_EFFECT,"Nh藀 m� hi謚 鴑g");
end;

function _request_effect_id_callback(effect_id)
	if effect_id == 0 then 
		set_effect_position(effect_id,1);
		return 0;
	end
	nEffectId = effect_id;
	turn_on_effect(effect_id);
end;

function show_effect_navigation()
	
	local tbSay = {
		"Next effect/#navigate_effect(1)",
		"Prev effect/#navigate_effect(-1)",
		"Input effect id/ask_effect_number",
		format("Change position/#set_effect_position(%d,1)",nEffectId),
		format("Add position/#set_effect_position(%d,0)",nEffectId),
		"\nClose/nothing",
	}
	Say(format("Effect navigation. The current effect id: <color=gold>%d<color>. Position: %d",nEffectId,nEffectPos),getn(tbSay),tbSay);
	
end;

function navigate_effect(nNav)
	if nNav ~= 0 then 
		nEffectId = nEffectId+nNav;
	end
	turn_on_effect(nEffectId);
end;

function set_effect_position(effect_id,change_pos)
	-- if effect_id == nil then effect_id = nEffectId end
	if change_pos == 1 then 
		turn_off_effect();
	end
	local tbSay = {
		format("Ch﹏/#turn_on_effect(%d,1)",effect_id),
		format("Xung/#turn_on_effect(%d,2)",effect_id),
		format("Tr竔/#turn_on_effect(%d,3)",effect_id),
		format("Ph秈/#turn_on_effect(%d,4)",effect_id),
		format("u/#turn_on_effect(%d,5)",effect_id),
	}
	tinsert(tbSay,"\nTh玦/nothing");
	Say("Ch鋘 v� tr�",getn(tbSay),tbSay);
end;

function turn_on_effect(nEffectId,nPos)
	if nEffectId >=1 and nEffectId <= 5 then 
		nPos = nEffectId;
	end
	if nPos == nil or nPos == 0 then nPos = nEffectPos end
	nEffectPos = nPos;
	SetCurrentNpcSFX(PIdx2NpcIdx(PlayerIndex),nEffectId,nPos,1);
	show_effect_navigation();
end;

function turn_off_effect()
	for i=1,5 do 
		SetCurrentNpcSFX(PIdx2NpcIdx(),917,i,1)
	end
end;

function increase_attack(nIndex)
	local nTime = 60*tCastState[nIndex][4];
	CastState(tCastState[nIndex][1],tCastState[nIndex][3],18*nTime)
	StartTimeGuage(tCastState[nIndex][2],nTime)
	SyncCustomState(1,9908,1,tCastState[nIndex][3]);
end;

function reloadFile(id)
	local tScriptPath = {
		{"thien co lenh","\\settings\\static_script\\cheat\\thiencolenh.lua"},
		{"gm item","\\settings\\static_script\\cheat\\gm_item_tifuzhiyin.lua"},
		{"tieu ngao luc","\\script\\online_activites\\xinshouzhiyin\\item\\item_xiaoaojianghulu.lua"},
		-- {"test","\\settings\\static_script\\cheat\\test.lua"},
	}
		
	if id == 5 then
		Msg2Player("Saved reload_file!");
		LoadScript("\\settings\\static_script\\cheat\\reload_file.lua");
		return
	end
	
	LoadScript(tScriptPath[id][2]);
	Msg2Player("Reloaded File: "..tScriptPath[id][1])
	PlaySound("\\sound\\sound_i016.wav");
	SetCurrentNpcSFX(PIdx2NpcIdx(),905,0,0)
end

function reloadDynamic()
	AskClientForString("_request_string_call_back_thiencolenh","Input file path...",1,32,"Input string");
end;

function _request_string_call_back_thiencolenh(str)
	reloadFileByPath(str);
end;

function reloadFileByPath(szFilePath)
	LoadScript(szFilePath);
end;

function goToWorld(nMapIndex)
	NewWorld(tMaps[nMapIndex][2],tMaps[nMapIndex][3],tMaps[nMapIndex][4]);
end;

function getCommonItems()
	local tSay = {}
	tinsert(tSay, "\nGet consum items/getConsumItems")
	tinsert(tSay, "\nGet debug items/getDebugItems")
	tinsert(tSay, "\nTrang ch輓h/OpenThienCo")
	tinsert(tSay, "Tho竧/nothing")
	Say(g_szTitle.."L鵤 ch鋘 ch鴆 n╪g", getn(tSay), tSay);
end;


function getConsumItems()
	local tSay = {}
	for i=1, getn(tTieuHao) do
		tinsert(tSay, format("Nh薾 %d %s/#addItem(1,%d)",tTieuHao[i][3],tTieuHao[i][1],i));
	end
	tinsert(tSay, "\nTrang trc/getCommonItems")
	tinsert(tSay, "Tho竧/nothing")
	Say(g_szTitle.."L鵤 ch鋘 ch鴆 n╪g", getn(tSay), tSay);
end;

function getDebugItems()
	local tSay = {}
	for i=1, getn(tDebugs) do
		tinsert(tSay, format("Nh薾 %d %s/#addItem(2,%d)",tDebugs[i][3],tDebugs[i][1],i));
	end
	tinsert(tSay, "\nTrang trc/getCommonItems")
	tinsert(tSay, "Tho竧/nothing")
	Say(g_szTitle.."L鵤 ch鋘 ch鴆 n╪g", getn(tSay), tSay);
end;

function addItem(nTableIndex, nItemIndex)
	local t = {}
	if nTableIndex == 1 then
		t = tTieuHao;
	elseif nTableIndex == 2 then
		t = tDebugs;
	end
	local id = nItemIndex;
	print(id);
	AddItem(t[id][2][1],t[id][2][2],t[id][2][3],t[id][3]);
end;

function manageTasks()
	local tSay = {
		"Show npcs/main_show_npc",
		"Show shops/showShops",
		"Show activities/showActivities",
		"Show missions/showMissions",
		-- "Skip tasks/main_task_skipper",
		"\nTrang trc/OpenThienCo",
		}
	tinsert(tSay, "Tho竧/nothing")
	Say(g_szTitle.."L鵤 ch鋘 ch鴆 n╪g", getn(tSay), tSay);
end;


function showActivities()
	local tSay = {
		
		"Ti課 v祇 T祅g Ki誱 s琻 trang/goTangKiem",
		"Kh雐 ng l� nng/showlistLoNuong",
		"Kh雐 ng T� linh nh/startTiaozhanSiling",
		format("Th猰 %d Уn Hng m閏 v祇 T� Linh nh/#addTanXiangMu(%d)",100,100),
		"Kh雐 ng nhi謒 v� h祅h cc/createCollecEvent",
		"Kh雐 ng S竧 th� 阯g/startKillerHall",
		"Kh雐 ng Cao th� s� m玭/#call_faction_bt_boss(0,0,0,1)",
		"Kh雐 ng Boss Ho祅g Kim/callGoldenBoss",
		"Kh雐 ng u trng tuy誸/startSnowWar",
		"Kh雐 ng C玭g th祅h chi課/startGongCheng",
		--"Kh雐 ng B秓 h� t礽 nguy猲/conf_res_protect_info",
		"Kh雐 ng Чi h閕 t� v� Tuy襫 Ch﹗/biwudahuiqianzou_init",
		

		"\nTrang trc/manageTasks",
		}
	tinsert(tSay, "Tho竧/nothing")
	Say(g_szTitle.."L鵤 ch鋘 ch鴆 n╪g", getn(tSay), tSay);
end;


function showMissions()
	local tSay = {
		"Nh薾 nhi謒 v� gia nh藀 s� m玭/interfaction",
		"B� qua nhi謒 v� t﹏ th�/skipXinShou",
		"M� kh鉧 rng t﹏ th�/unlockBox",
		"M� r閚g rng/expandBox",
		"Ho祅 th祅h nhi謒 v� T﹜ B綾/skipXiBei",
		"Ho祅 th祅h nhi謒 v� k� n╪g s鑞g/skipTaskLifeSkill",
		"B� qua nhi謒 v� hi謓 t筰/main_task_skipper",
		
		"\nTrang trc/manageTasks",
		}
	tinsert(tSay, "Tho竧/nothing")
	Say(g_szTitle.."L鵤 ch鋘 ch鴆 n╪g", getn(tSay), tSay);
end;



function interfaction()
	TB_FACTION_TASKID_LIST = {1001,1002,1003,1004,1005,1031,1032,1033,1017,1018,1019}
	TB_FACTION_INFO = {
		"Thi誹 L﹎","V� ng","Nga My","C竔 Bang","Л阯g M玭","Dng M玭","Ng� чc","C玭 L玭","Minh gi竜","Th髖 Y猲",
	}
	local tSay = {}
	for i=1,getn(TB_FACTION_INFO) do
		tinsert(tSay,format("%s/#SetTask(%d,1)",TB_FACTION_INFO[i],TB_FACTION_TASKID_LIST[i]));
	end
	tinsert(tSay,"\nTrang trc/manageTasks")
	tinsert(tSay, "Tho竧/nothing")
	Say(g_szTitle.."Nh薾 nhi謒 v� gia nh藀 s� m玭", getn(tSay), tSay);
	SendScript2Client("Open([[tasknote]])")
end;

function startTiaozhanSiling()
	local nRandom = random(1,5)
	local VET_201008_02_STR_SILINGDING_CITY_NAME = {
		[0] = "T� linh nh  xu蕋 hi謓 t筰 %s, ch� v� i hi謕 h穣 chu萵 b� khi猽 chi課 BOSS t� linh",
		[1] = "Long Tuy襫 Th玭",
		[2] = "V﹏ M閚g Tr筩h",
		[3] = "Йng Bi謓 Kinh",
		[4] = "T﹜ Tuy襫 Ch﹗",
		[5] = "B綾 Tuy襫 Ch﹗",
	};
	msg = format(VET_201008_02_STR_SILINGDING_CITY_NAME[0],VET_201008_02_STR_SILINGDING_CITY_NAME[nRandom])
    --OutputMsg(format(msg));
	AddGlobalNews(msg,1)
    tianzhansilingboss(nRandom);
	
	SendScript2VM("script\\online_activites\\tiaozhansilingboss\\mission_head.lua","MS_InitMission()")
	SendScript2VM("script\\online_activites\\tiaozhansilingboss\\mission_head.lua","MS_StartMission()")
	
	SendScript2VM("script\\online_activites\\tiaozhansilingboss\\mission_head.lua","MS_ProcessReadyTimer()")
	SendScript2VM("script\\online_activites\\tiaozhansilingboss\\mission_head.lua","MS_ProcessStartedTimer()")
	
end;

function callGoldenBoss()
	local Random1 = random(8)
          Random2 = random(5)
          Random3 = random(2)
	
	  world1 = Random1+1
	  world2 = Random2+101
	  world3 = Random3+201
	  
	  createBoss(world1,world2,world3);
end;

function addTanXiangMu(nQuantity)
	local nNpcIndex = GetGlbValue(1032);
	local nNpcState = GetUnitCurStates(nNpcIndex,1)-1;
	AddUnitStates(nNpcIndex,1,nQuantity);
	Msg2Player("Х th猰 "..nQuantity.." n hng m閏 v祇 T� Linh nh");
end;

function expandBox()
	SetStoreBoxPageCount(5);
end;



function startKillerHall()
	SendScript2VM("\\script\\task\\killer_hall\\mission\\init_killer_hall.lua","main()");
end;

function showlistLoNuong()
	local tSay = {}
	for i=0, getn(t_denglong_sets) do
		tinsert(tSay, "* Kh雐 ng l� nng t筰 "..t_denglong_sets[i][1]..format("/#khoidongLonuong(%d)",i))
	end
	tinsert(tSay, "Tho竧/nothing");
	Say(g_szTitle.."L鵤 ch鋘 l� nng", getn(tSay), tSay);
end;

function khoidongLonuong(nDay)
	SendScript2VM("\\script\\online\\viet_event\\200909\\2\\init_denglong.lua",format("create_npcs(%d)",nDay));
end;

function startSnowWar()
	SendScript2VM("\\script\\online_activites\\2010_12\\activity_05\\head.lua","SB_Start()");
end;

function startGongCheng()
	SendScript2VM("\\script\\missions\\bw\\siege\\siege_arena_mission_start.lua","start_mission()");
end;

function skipTaskLifeSkill()
	SetTask(1925,15);
	TaskTip("B筺 c� th� n g苝 c竎 NPC h鋍 k� n╪g s鑞g")
end;

function unlockBox()
	SetTask(805,2);
	Say("Rng ch鴄   l祄 xong! Y猲 t﹎ s� d鬾g nh�!",1,"T鑤 l緈! Xin 產 t�!/nothing")
	Msg2Player("Rng ch鴄   l祄 xong! Y猲 t﹎ s� d鬾g nh�!");
end;

function skipXiBei()
	SetTask(2031,71);
end;

function skipXinShou()
	SetTask(1,25);
end;

function goTangKiem()

	local szHeader = "------- Ch鋘 秈 -------";
	local tSay = {};
	for i=0, 9 do
		tinsert(tSay,format("Ti課 v祇 秈 %d/#GM_NextStageInit(1,%d)",i,i));
	end
	tinsert(tSay,"Trang trc/manageTasks");
	tinsert(tSay,"Th玦 kh醝/nothing");
	Say(szHeader,getn(tSay),tSay);
end;


function getPosition()
	local map_ID,att_X,att_Y = GetWorldPos();
	local szCoordinate = map_ID..","..att_X..","..att_Y;
	local sMessage = "V� tr� 產ng ng\n"..szCoordinate
		.."\n- Map id: "..map_ID.."\n- CoorX: "..att_X.."\n- CoorY: "..att_Y
		.."\n_________________________\n";
	Msg2Player(sMessage)
	print(szCoordinate);
	local file = openfile("position.lua", "a+")
	write(file,sMessage)
	closefile(file)
	PlaySound("\\sound\\sound_i016.wav");
	SetCurrentNpcSFX(PIdx2NpcIdx(),905,0,0)
end

function ClearBagAllItem(bTag)
	if not bTag or tonumber(bTag) ~= 1 then
		Say(g_szTitle.."Ngi mu鑞 thanh l� t骾?", 2, "уng �/#ClearBagAllItem(1)", "\n\n\nKh玭g! Nh莔 l蒼 th玦/nothing")
		return
	end
	ClearItemInPos();
	if GetItemCount(2,1,1) < 1 and GetFreeItemRoom() > 0 then
		AddItem(2,1,1,1)
	end
	if GetItemCount(2,1,30045) < 1 and GetFreeItemRoom() > 0 then
		AddItem(2,1,30045,1)
	end
end

function restore(nType)
	if nType == 1 then
		Restore();
	elseif nType == 2 then
		RestoreNeili();
	elseif nType == 3 then
		RestoreStamina();
	elseif nType == 4 then
		SetMomentum(10);
	elseif nType == 5 then
		RestoreAll();
		SetMomentum(10);
	end
	PlaySound("\\sound\\sound_i016.wav");
	SetCurrentNpcSFX(PIdx2NpcIdx(),905,0,0)
end

function isEmpty(s)
  return s == nil or s == ''
end

function getNPCInfo()
	local nNpcIndex = GetTargetNpc()
	local name = GetNpcName(nNpcIndex)
	local m,x,y = GetNpcWorldPos(nNpcIndex);
	--local IdNpc = GetNpcSettingIdx(nNpcIndex)
	local script = GetNpcScript(nNpcIndex)
	if isEmpty(nNpcIndex) or isEmpty(script) or isEmpty(name) then
		Msg2Player("Kh玭g th� do th竚 th玭g tin. C竎 h� ch璦 i tho筰 v韎 npc n祇!")
	else
		local sMessage = "\n* NPC Index: "..nNpcIndex
			.."\n* NPC Name: [ "..name.." ]"
			..format("\n* Coordinate: %d,%d,%d",m,x,y)
			.."\n* NPC Script path: "..script
			.."\n_________________________\n";
		Msg2Player(sMessage)
		local file = openfile("npcinfo.lua", "a+")
		write(file,sMessage)
		closefile(file)
		print(sMessage);
		PlaySound("\\sound\\sound_i016.wav");
		SetCurrentNpcSFX(PIdx2NpcIdx(),905,0,0)
	end
end 



function LM_StartTimeGuage(szInfo, nDuration, bRepeat, nCustomID, tbPlayer)
	if tbPlayer == nil then --默认是所有玩家
		tbPlayer = mf_GetMSPlayerIndex(MISSION_ID, ALL_CAMP);
	end;
	local funTimeGuage = function(tbArg)
		StartTimeGuage(%szInfo,%nDuration,%bRepeat,%nCustomID);
	end;
	gf_OperatePlayers(tbPlayer,funTimeGuage,{})
end;