Include("\\script\\lib\\define.lua");
Include("\\script\\task\\global_task\\gtask_head.lua");
Include("\\script\\lib\\globalfunctions.lua");

--把一些数据上的东西丢到这里来 方便测试
g_tGTaskId = {1322,1338};  --涉及到的任务id 查看gtask_main
--需要对话的npc
g_tNpcName = {["Ng﹏ Thu藅 Kh�"] = 1, ["A Li"] = 2, ["Ho祅 Nhan L﹗ Th蕋"] = 3,};
g_szModelName = "Ho祅 Nhan T玭g H祅";

g_tNpcMsg = {
	[[
	<color=green>银术可<color>：宗翰，这是上次抓来的辽国密探，严刑逼供，恐怕时日不多了。要不要使用点非常手段？
	\p<color=green>Playername<color>：………………
	\p<color=green>银术可<color>：哈哈哈，放心宗翰，他就算是死，也会从他嘴里撬出话来的。
	]],
	[[
	<color=green>阿离<color>：呼噜………………
	\p<color=green>阿离<color>：谁啊……宗翰将军！
	\p<color=green>Playername<color>：………………
	\p<color=green>阿离<color>：将军，将军！我，我只是一时，啊，不不不，下次一定不会再犯了。
	\p<color=green>Playername<color>：………………
	\p<color=green>阿离<color>：我明白的，将军，论军法渎职者应处四十军棍。我自去军法处领罪。
	\p<color=green>Playername<color>：………………（不料女真大营竟如此军纪严明）
	]],
	[[
	<color=green>完颜娄室<color>：将军，操练已毕。
	\p<color=green>Playername<color>：………………
	\p<color=green>完颜娄室<color>：………………
	\p<color=green>Playername<color>：………………
	\p<color=green>完颜娄室<color>：将军？
	\p<color=green>Playername<color>：………………（完颜娄室看来也是个沉默寡言的人，我还是离开吧。）
	\p<color=green>完颜娄室<color>：恭送将军。
	]],
}

g_tNpcNormalMsg = {
	"<color=green>Ng﹏ Thu藅 Kh�<color>: Li猽 Qu鑓 鴆 hi誴 t閏 N� Ch﹏ c馻 ta, hi謓 t筰 ch骯 Li猽 hoang d﹎ v� , y ch輓h l� th阨 c�  ph秐 c玭g!",
	"<color=green>A Li<color>: Hu Hu",
	"<color=green>Ho祅 Nhan L﹗ Th蕋<color>: 厖厖厖",
}

function main()
	local nNpcIdx = GetTargetNpc()
	local szNpcName = GetNpcName(nNpcIdx);
	if g_tNpcName[szNpcName] == nil then return 0; end
	
	local nBitFlag = g_tNpcName[szNpcName]
	
	
	--判断有没有接任务
	local nHasTask = 0;
	for i = 1,getn(g_tGTaskId) do
		if 1 == tGtTask:check_cur_task(g_tGTaskId[i])  then
			nHasTask = 1
			break;
		end
	end
	
	if nHasTask ~= 1 then
		talk_normal(nBitFlag);
		return 0;
	end

	--判断是不是已经说过话了
	local nHasTalked = gf_GetTaskBit(TASKID_2013_NEW_TASK_LURK, nBitFlag);
	if nHasTalked == 1 then
		talk_normal(nBitFlag);
		return 0;
	end
	
	--判断是不是处于变身状态
	local nRet, szModelName = IsChangeModel();
	print(nRet, szModelName);
	if nRet ~= 1 or szModelName ~= g_szModelName then
		talk_normal(nBitFlag)
		return 0;
	end
	
	--终于可以说话了
	success_get_message(nBitFlag)
end

function talk_normal(nBitFlag)
	Talk(1, "", g_tNpcNormalMsg[nBitFlag]);
end

function success_get_message(nIdx)
	gf_SetTaskBit(TASKID_2013_NEW_TASK_LURK, nIdx, 1);
	local szMsg = gsub(g_tNpcMsg[nIdx], "Playername", GetName());
	suTalk("nothing", szMsg, 1);
end

function change_model_OnTimer()
	RemoveTrigger(GetTrigger(TRIGGER_TASK_GBMZ_ID));
	ChangeModel();
	UnLimitSkill(20);
end