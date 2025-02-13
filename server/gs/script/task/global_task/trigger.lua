
Include("\\script\\lib\\globalfunctions.lua");
Include("\\script\\lib\\sdb.lua");
--Include("\\script\\lib\\talktmp.lua");
Include("\\script\\task\\global_task\\gtask_head.lua");
Include("\\script\\task\\world\\task_trigger_list.lua");
Include("\\script\\task\\world\\task_head.lua");
Include("\\script\\task\\global_task\\gtask_tsdl.lua");
Include("\\script\\task\\global_task\\task_id.lua")
Include("\\script\\tmp_task_id_def.lua")
----------------------------------------------------------------------------
--特殊说话
--概率表 {10, 20, 30}
--对话 {{...}, {...}, {...}}
--返回值{0,1,1}
function DoTSTalkTask(tRand, tTalk, tRet)
	--if type(tRand) ~= "table" and type(tTalk) ~= "table" and type(tRet) ~= "table" then
		local nMax = 0
		for i = 1, getn(tRand) do
			nMax = nMax + tRand[i]
		end
		
		local nRand = random(1, nMax);
		local nTemp = 0;
		for i = 1, getn(tRand) do
			nTemp = nTemp + tRand[i]
			if nRand <= nTemp then
				nTemp = i
				break
			end
		end
		
		if tTalk[nTemp] ~= nil then
			--local strDiag = tGtNpcMain:dialog_string_deal(tTalk[nTemp]);
			TalkEx("", tTalk[nTemp]);
		end
		
		return tRet[nTemp];
	--else
		--return -1
	--end
end

----------------------------------------------------------------------------
--特殊掉落 玩家身上所有的特殊掉落任务列表
--返回值 列表 [1] TaskID [2] TSDLIdx
function tGTaskTSDL:GetPlayerTSDLList()
	local tTaskID = tGtTask:GetAllTask();
	if getn(tTaskID) == 0 or tTaskID == nil then
		return nil 
	end
	return tGTaskTSDL:ExtractTSDLList(tTaskID);
end

--特殊掉落 玩家身上未完成的特殊掉落列表
function tGTaskTSDL:GetPlayerLiveTSDLList()
	local tTaskID = tGtTask:GetAllTask();
	if getn(tTaskID) == 0 or tTaskID == nil then
		return nil 
	end
	return tGTaskTSDL:ExtractLiveTSDLList(tTaskID)
end

--特殊掉落 玩家身上是否存在未完成的特殊掉落
--返回值
	--1、有
	--0、无
function tGTaskTSDL:IsPlayerHaveLiveTSDL()
	local tTaskID = tGtTask:GetAllTask();
	if getn(tTaskID) == 0 or tTaskID == nil then
		return 0
	end
	return tGTaskTSDL:IsLiveTSDL(tTaskID)
end

--特殊掉落的怪
--1、玩家身上所有的任务
--2、现在打死的怪的名字
--3、地图
--返回值
	--1、成功掉落，不需要处理触发器
	--2、无需要特殊掉落的任务，移除触发器
	--3、成功掉落，需要处理触发器
	--4、特殊掉落不成功
function DoTSDLTask(szNpcName, nMapID)
	local tTaskID = tGtTask:GetAllTask();
	local nRet = 2;
	if tTaskID == nil or getn(tTaskID) == 0 then
		return nRet;
	end
	
	local tTaskIDList = {};
	local tTSDLList = {};
	tTaskIDList, tTSDLList = tGTaskTSDL:GetPlayerLiveTSDLList(tTaskID);
	
	for i = 1, getn(tTSDLList) do
		nRet = 4
		if tGTaskTSDL:IsMatch(tTSDLList[i], szNpcName, nMapID) == 1 then
			--print("TSDL:"..tTaskIDList[i]..tTSDLList[i]..szNpcName..nMapID);
			local nRand = random(1, 100);
			if nRand <= tonumber(TABLE_GT_TSDL:getCell(tTSDLList[i], 6)) then	--随机成功
				--给予物品
				dostring("gf_AddItemEx({"..TABLE_GT_TSDL:getCell(tTSDLList[i], 5).."},\""..TABLE_GT_TSDL:getCell(tTSDLList[i], 4).."\")");
				
				--是否完成掉落
				if tGTaskTSDL:IsTSDLEnd(tTSDLList[i]) == 1 and tGTaskTSDL:IsPlayerHaveLiveTSDL() == 0 then
					return 3
				end
				return 1
			end
		end
	end
	
	return nRet
end

KILL_JZJZ_TSDL = 4001
function TSDL_Trigger()	--特殊掉落	
	local nNpcIdx, szNpc, szNpcName = GetTriggeringUnit();	
	--local nMapID, nMapX, nMapY = GetWorldPos();
	local _, nMapID = SubWorldIdx2ID(SubWorld);
	
	local nCreateTrigger = 1;
	if nNpcIdx ~= 0 then
		local nRet = DoTSDLTask(szNpcName, nMapID);
		if nRet == 3 or nRet == 2 then	--需要处理触发器
			nCreateTrigger = 0
		end
	end
	
	RemoveTrigger(GetRunningTrigger());
	
	if nCreateTrigger == 1 and GetTrigger(KILL_JZJZ_TSDL) == 0 then
		CreateTrigger(0, 1245, KILL_JZJZ_TSDL, 1);
	end
end

function OnTrigger()
	gt_trigger_callback();
end

--2杀怪触发器
function xiaotulang()
	local nNpcIdx = CreateNpc("Th� Lang Vng", "Th� Lang Vng", GetWorldPos());
	SetNpcDeathScript(nNpcIdx,"\\script\\task\\global_task\\gtask_npc.lua");
	gt_trigger_callback();
end

--2杀怪触发器
function xiaoqinglang()
	local nNpcIdx = CreateNpc("Thanh Lang Vng", "Thanh Lang Vng", GetWorldPos());
	SetNpcDeathScript(nNpcIdx,"\\script\\task\\global_task\\gtask_npc.lua");
	gt_trigger_callback();	
end

--43 杀怪触发器
function heixingxing()
	gt_trigger_callback();
	SetTask(Task_id_005,GetTask(Task_id_005)+1);
end

function dushe()
	gt_trigger_callback();
	SetTask(Task_id_005,GetTask(Task_id_005)+1);
end

function yanjingshe()
	gt_trigger_callback();
	SetTask(Task_id_005,GetTask(Task_id_005)+1);
end

function danianshou()
	gt_trigger_callback();
	SetTask(Task_id_005,GetTask(Task_id_005)+1);
end

--121
function youhun_121()
	gt_trigger_callback();
	local tbTask = {
		"Зy ch輓h l� dng l鬰 c馻 <Qu� Hoa B秓 觧> sao?! Haha, cu鑙 c飊g  t譵 頲 r錳.",
		"Qu� nhi猲 l� m閠 quy觧 m藅 t辌h v� c玭g th莕 b�, luy謓 xong c� th�  th玭g k� kinh b竧 m筩h tr猲 ngi, 鎛 v薾 ch﹏ kh�. Ta ph秈 luy謓 th� m韎 頲. \n<color=green>(c m藅 t辌h...)<color>",
		"M藅 t辌h n祔 qu� nhi猲 k� di謚 \n<color=green>(luy謓 c玭g厖厖)<color>",
		"�!!! trong ngi nh� c� m閠 lu錸 ch﹏ kh� d﹏g tr祇\n<color=green>(luy謓 c玭g厖厖)<color> (t nhi猲 sau l璶g n鎖 gi�)",
		"L� ai?!!! \n ( C秏 gi竎 m閠 lu錸g nhi謙 kh� t� ph輆 sau 藀 t韎, ng蕋 甶,  trong l骳 m� h� nh譶 th蕐 m閠 g� m芻 竜 m祏 甧n 畂箃 l蕐 << Qu� Hoa B秓 觧>>  trong tay m譶h, ngi n祔 l� ai? nh譶 th﹏ h譶h c� v� h琲 quen.)",
	}
	Talk(getn(tbTask),"youhun_121_deal",tbTask[1],tbTask[2],tbTask[3],tbTask[4],tbTask[5]);
end

function youhun_121_deal()
	NewWorld(6018,1618,2901);
	SetFightState(0);
end

function yemaoxiang()
	gt_trigger_callback();
	if GetTaskTemp(TMP_TASK_ID_TAG_101) == 1 then
		if GetItemCount(2, 0, 30056) < 1 then
			local npcIndex = CreateNpc("yunbangzhu", "V﹏ Bang Ch�", GetWorldPos());
			SetNpcDeathScript(npcIndex, "\\script\\task\\npc\\yunbangzhu.lua");
			SetNpcLifeTime(npcIndex, 10*60);
		end
	end
	SetTaskTemp(TMP_TASK_ID_TAG_101, GetTaskTemp(TMP_TASK_ID_TAG_101) + 1);
end

function heixingxing_101()
	gt_trigger_callback();
	if GetTaskTemp(TMP_TASK_ID_TAG_101) == 1 then
		if GetItemCount(2, 0, 30056) < 1 then
			local npcIndex = CreateNpc("yunbangzhu", "V﹏ Bang Ch�", GetWorldPos());
			SetNpcDeathScript(npcIndex, "\\script\\task\\npc\\yunbangzhu.lua");
			SetNpcLifeTime(npcIndex, 10*60);
		end
	end
	SetTaskTemp(TMP_TASK_ID_TAG_101, GetTaskTemp(TMP_TASK_ID_TAG_101) + 1);
end

function huoqilin()
	gt_trigger_callback();
	local npcIndex = CreateNpc("lubangzhu", "L鬰 bang ch�", GetWorldPos());
	SetNpcDeathScript(npcIndex, "\\script\\task\\npc\\lubangzhu.lua");
	SetNpcLifeTime(npcIndex, 10*60);
end

function ck_zhangweigang()
	gt_trigger_callback()
	SendScript2VM("\\script\\function\\cdkey\\ck_head.lua", "_ck_BZBD_Kill_Set()")
end

function ck_shangguhuoqiling()
	gt_trigger_callback()
	SendScript2VM("\\script\\function\\cdkey\\ck_head.lua", "_ck_BZBD_Kill_Set()")
end

function ck_yuguaitoumu()
	gt_trigger_callback()
	SendScript2VM("\\script\\function\\cdkey\\ck_head.lua", "_ck_BZBD_Kill_Set()")
end

function ck_lili()
	gt_trigger_callback()
	SendScript2VM("\\script\\function\\cdkey\\ck_head.lua", "_ck_BZBD_Kill_Set()")
end

function ck_funiushandawang()
	gt_trigger_callback()
	SendScript2VM("\\script\\function\\cdkey\\ck_head.lua", "_ck_BZBD_Kill_Set()")
end

function ck_xixiajianglin()
	gt_trigger_callback()
	SendScript2VM("\\script\\function\\cdkey\\ck_head.lua", "_ck_BZBD_Kill_Set()")
end

function ck_chihuoyaofu()
	gt_trigger_callback()
	SendScript2VM("\\script\\function\\cdkey\\ck_head.lua", "_ck_BZBD_Kill_Set()")
end

function ck_boduyingji()
	gt_trigger_callback()
	SendScript2VM("\\script\\function\\cdkey\\ck_head.lua", "_ck_BZBD_Kill_Set()")
end

function ck_chihuosengwu()
	gt_trigger_callback()
	SendScript2VM("\\script\\function\\cdkey\\ck_head.lua", "_ck_BZBD_Kill_Set()")
end

function ck_chihuozhanglao()
	gt_trigger_callback()
	SendScript2VM("\\script\\function\\cdkey\\ck_head.lua", "_ck_BZBD_Kill_Set()")
end

function ck_axiuluo()
	gt_trigger_callback()
	SendScript2VM("\\script\\function\\cdkey\\ck_head.lua", "_ck_BZBD_Kill_Set()")
end

function ck_mohuluojia()
	gt_trigger_callback()
	SendScript2VM("\\script\\function\\cdkey\\ck_head.lua", "_ck_BZBD_Kill_Set()")
end

function ck_duanchengen()
	gt_trigger_callback()
	SendScript2VM("\\script\\function\\cdkey\\ck_head.lua", "_ck_BZBD_Kill_Set()")
end

function ck_chunshisanniang()
	gt_trigger_callback()
	SendScript2VM("\\script\\function\\cdkey\\ck_head.lua", "_ck_BZBD_Kill_Set()")
end

function ck_zaxusahan()
	gt_trigger_callback()
	SendScript2VM("\\script\\function\\cdkey\\ck_head.lua", "_ck_BZBD_Kill_Set()")
end

function chihuodaoke2()
	gt_trigger_callback()
	Msg2Player("Xi H醓 o Kh竎h: C鴘 t玦 v韎, xin i hi謕 h穣 tha cho ti觰 nh﹏, Thng g 產ng b� giam � nh� lao c馻 Long Nh穘 чng 1!")
end

function huofeng_task_huanghuoliujin()
	SendScript2VM("\\script\\task\\huofengtask\\kill_trigger.lua", "kill_fenghuoliujin_call_back()")
end

function dongzhengmujiangjun()
	gt_trigger_callback();
	Talk(1, "", "<sex> qu� nhi猲 l頸 h筰, ch� ti誧 r籲g Thi猲 Ma T� Tinh  b� мa Huy襫 Cung Ch� 畂箃 甶 r錳, ngi  n tr� m閠 bc.")
end

function huofeng_task_daomuren()
	gt_trigger_callback();
	if random(1,10000) <= 100 then --1%
		Talk(1, "", "Xin i hi謕 tha m筺g,H祅 Tinh Thi誸  b� L﹎ Xung Lng S琻 cp 甶")
	end
end

function yp_call_guse()
	gt_trigger_callback();
	Talk(1,"yp_call_guse_cb","C� d蕌 v誸 c馻 <color=red>C� X�<color>, h穣 mau nh b筰 n�!")
end

function yp_call_guse_cb()
	local nNpcIdx = CreateNpc("C� X�", "C� X�", GetWorldPos());
	SetNpcDeathScript(nNpcIdx,"\\script\\task\\global_task\\gtask_npc.lua");
end

function reborn3task_tysmr()
	gt_trigger_callback();
	if gf_GetTeamSize() == 1 or GetCaptainName() == GetName() then
		local nNpcIdx = CreateNpc("fs_hongyinjiaozhu", "H錸g 蕁 Gi竜 Ch�", GetWorldPos());
		SetNpcLifeTime(nNpcIdx, 3600*4);
	end
end