--奖励
Include("\\script\\missions\\yp\\yp_head.lua")
Include("\\script\\class\\clause3.lua");
--Include("\\script\\task\\faction\\faction_item.lua");
Include("\\script\\lib\\itemfunctions.lua");

CUSTOM_AWARD_GIVE_ALL=1
--给势力贡献物
--function yp_aw_giveGXW(nNum)
--	nNum = nNum or 1;
--	local nType = GetTask(TASK_FIELD_PVP_CAMP);
--	if nType == 0 then
--		return 0;
--	end
--	local nTbIDX = 0;
--	if nType == 1 then
--		nTbIDX = 20;
--	elseif nType == 2 then
--		nTbIDX = 21;
--	elseif nType == 3 then
--		nTbIDX = 19;
--	end
--	if nTbIDX ~= 0 then
--		gf_AddItemEx({tPVPItemInfo[nTbIDX][2],tPVPItemInfo[nTbIDX][3],tPVPItemInfo[nTbIDX][4],nNum},tPVPItemInfo[nTbIDX][1])
--	end
--end

--世界秘籍
--function yp_aw_addBook(nType,nLock)
--	nLock = nLock or 1;
--	local tWorldBook = {
--		{"长拳谱",{0,107,51,1}},
--		{"象形谱",{0,107,52,1}},
--		{"中平谱",{0,107,53,1}},
--		{"开山谱",{0,107,54,1}},
--		{"气疗术",{0,107,55,1}},
--		{"碎叶谱",{0,107,56,1}},
--		{"聚元功谱",{0,107,57,1}},
--		{"玄石功谱",{0,107,58,1}},
--		{"金蝉谱",{0,107,59,1}},
--		{"修罗秘籍",{0,107,60,1}},
--		{"天霞秘籍",{0,107,64,1}},
--		{"紫霞秘籍",{0,107,65,1}},
--		{"沾衣谱",{0,107,66,1}},
--	};
--	local tWorldBook2 = {
--		{"四灵战意谱", {0,107,159,1}},
--		{"四灵天衣谱", {0,107,160,1}},
--		{"四灵紫衣谱", {0,107,161,1}},
--	};
--	local tBookTemp = {};
--	if nType == 1 then
--		tBookTemp = tWorldBook;
--	else
--		tBookTemp = tWorldBook2;
--	end
--	local nRand = random(1,getn(tBookTemp));
--	gf_AddItemEx({tBookTemp[nRand][2][1],tBookTemp[nRand][2][2],tBookTemp[nRand][2][3],1,nLock},tBookTemp[nRand][1]);
--end

--给经验
--function yp_aw_addExp(nArg)
--	local nLv = GetLevel();
--	local nExp = floor(nLv*nLv*nArg);
--	gf_Modify("Exp",nExp);
--end

--tWSItem = {
--	[1] = {
--		{{2,95,586,1,4},"龙纹刻板【头部1级】"},
--		{{2,95,589,1,4},"凤纹刻板【衣服1级】"},
--		{{2,95,592,1,4},"虎纹刻板【下装1级】"},
--		{{2,95,595,1,4},"花纹刻板【首饰1级】"},
--	},
--	[2] = {
--		{{2,95,587,1},"龙纹刻板【头部2级】"},
--		{{2,95,590,1},"凤纹刻板【衣服2级】"},
--		{{2,95,593,1},"虎纹刻板【下装2级】"},
--		{{2,95,596,1},"花纹刻板【首饰2级】"},
--	},
--	[3] = {
--		{{2,95,588,1},"龙纹刻板【头部3级】"},
--		{{2,95,591,1},"凤纹刻板【衣服3级】"},
--		{{2,95,594,1},"虎纹刻板【下装3级】"},
--		{{2,95,597,1},"花纹刻板【首饰3级】"},
--	},	
--}
--
--function yp_aw_wenshi(nItemLv,nRand,nNum,strType)
--	strType = strType or "";
--	gf_SetLogCaption("fieldPVP");
--	gf_AddItemEx(tWSItem[nItemLv][nRand][1],tWSItem[nItemLv][nRand][2],nNum);
--	gf_SetLogCaption("");
--end

--tAllAward = {
--	[1] = { --圣物（ok）
--		subclauses = {
--			{{"经验";giveClause =function() yp_aw_addExp(20*2) end},7000},
--			{{"精炼金犀", {2,1,533,1},}, 200},
--			{{"金陵酒", {2,95,822,1},}, 500},
--			{{"藏剑秘传心经", {2,95,823,1},}, 500},
--			{{"皓月碎片", {2,95,740,1,4},}, 700},
----			{{"玄石金精", {2,201,3,1},}, 40},
----			{{"翡翠木精", {2,201,5,1},}, 40},
----			{{"月华水精", {2,201,7,1},}, 40},
----			{{"九幽火精", {2,201,9,1},}, 40},
----			{{"凝玉土精", {2,201,11,1},},40},
--			{{"武林盟信物", {2,95,935,1},}, 1000},	
--			{{"武林盟表彰信", {2,95,936,1}}, 100},
--		},
--		giveClause = ClauseRandom.giveClause,
--	},
--	[2] = {--藏剑秘传心经(ok)
--		subclauses = {
--			{{"皓月碎片", {2,95,740,5,4},}, 2500},
----			{{"玄石金精", {2,201,3,1},}, 1500},
----			{{"翡翠木精", {2,201,5,1},}, 1500},
----			{{"月华水精", {2,201,7,1},}, 1500},
----			{{"九幽火精", {2,201,9,1},}, 1500},
----			{{"凝玉土精", {2,201,11,1},},1500},	
--			{{"金陵酒", {2,95,822,1},}, 7500},
--		},
--		giveClause = ClauseRandom.giveClause,
--	},
--	[3] = { --百晓生秘法(ok)
--		maxRand = 10000,
--		subclauses = {
--			{{"高级秘籍";giveClause =function() giveFactionBook(1,4) end},300},
--			{{"师门真卷";giveClause =function() giveFactionBook(4,4) end},20},
----			{{"世界秘籍";giveClause =function() yp_aw_addBook(1,4) end},3990},
----			{{"武林盟信物", {2,95,935,1},}, 700},	
--		},
--		giveClause = ClauseRandomAll.giveClause,
--	},
--	[4] = { --神秘树种(ok)
--		subclauses = {
--			{{"师门真卷";giveClause =function() giveFactionBook(4,4) end,}, 10},
--			{{"高级秘籍";giveClause =function() giveFactionBook(1,4) end}, 500},
--			{{"四灵战意谱", {0,107,159,1,4},"恭喜$n在领取神秘古树奖励时，获得$i！"}, 3},
--			{{"四灵天衣谱", {0,107,160,1,4},"恭喜$n在领取神秘古树奖励时，获得$i！"}, 4},
--			{{"四灵紫衣谱", {0,107,161,1,4},"恭喜$n在领取神秘古树奖励时，获得$i！"}, 3},
--			{{"玄石金精", {2,201,3,1},}, 400},
--			{{"翡翠木精", {2,201,5,1},}, 400},
--			{{"月华水精", {2,201,7,1},}, 400},
--			{{"九幽火精", {2,201,9,1},}, 400},
--			{{"凝玉土精", {2,201,11,1},},400},	
--			{{"武林盟信物", {2,95,935,1},}, 3000},	
--			{{"武林盟表彰信", {2,95,936,3}}, 1000},
--			{{"凤精丹", {2,95,916,1}}, 480},
--			{{"对战经验";giveClause =function() yp_setValue(4,20) end},1000},
--			{{"PVP点数";giveClause =function() yp_setValue(2,20) end},1000},
--			{{"武林盟声望";giveClause =function() yp_setValue(5,10) end},1000},
--		},
--		giveClause = ClauseRandom.giveClause,		
--	},
--};

--圣物奖励(ok)
function yp_aw_giveAward_1()
	if gf_Judge_Room_Weight(1,10,"") ~= 1 then
		return 0;
	end
	CustomAwardGiveGroup("preach_relic", 0)
	--任务触发
	Include("\\script\\global\\events.lua")
	EventOnTrigger(7, {name="Thu th藀 Ng� H祅h T﹎ H錸 Кn", category=random(5)});
end

--藏剑秘传心经(ok)
function yp_aw_giveAward_2()
	if gf_Judge_Room_Weight(3,30,"") ~= 1 then
		return 0;
	end
	CustomAwardGiveGroup("preach_HeartSutra99", 0)
--	yp_setValue(4,10);
--	yp_aw_giveGXW(2);
--	gf_AddItemEx({2,95,925,2},"义气酒");
--	tAllAward[2]:giveClause();
--	Observer:onEvent(OE_FILED_PVP_DATA,{5,1});
end

--百晓生秘法(ok)
function yp_aw_giveAward_3()
	if gf_Judge_Room_Weight(3,30,"") ~= 1 then
		return 0;
	end
	CustomAwardGiveGroup("preach_arcane99", 0)
--	yp_setValue(2,10);
--	yp_aw_giveGXW(3);
--	gf_AddItemEx({2,95,925,2},"义气酒");
--	tAllAward[3]:giveClause();
----	Observer:onEvent(OE_FILED_PVP_DATA,{5,2});
end

--Npc军团消失
function yp_aw_giveAward_4()
	if gf_Judge_Room_Weight(2,10,"") ~= 1 then
		return 0;
	end
	CustomAwardGiveGroup("npc_legion_disappear", CUSTOM_AWARD_GIVE_ALL)
--	yp_aw_addExp(80*10);
--	yp_setValue(4,20);
----	MP_MasterAddPoint(5000);
----	yp_aw_giveGXW(3);
--	gf_AddItemEx({2,95,740,2,4},"皓月碎片");
--	gf_AddItemEx({2,95,936,10},'武林盟表彰信');
end

--Npc军团包裹
function yp_aw_giveAward_5()
	if gf_Judge_Room_Weight(2,20,"") ~= 1 then
		return 0;
	end
	CustomAwardGiveGroup("npc_legion_package", CUSTOM_AWARD_GIVE_ALL)
--	local nMapID = GetWorldPos();
--	local tBossName = {[6000] = "大理天龙寺住持",[6100] = "吐蕃化生寺赤巴",[6200] = "西夏征南将军",}
--	local nRand = random(1,100);
--	if nRand <= 10 then
--		local nRoute = GetPlayerRoute();
--		local nBody = GetBody();
--		local nRet,nIDX = ef_AddShineSunEquip(nRoute,nBody,1,4);
--		if nRet == 1 then
--			local strName = GetItemName(nIDX);
--			Msg2Global(format("%s开启击败%s后留下的物品，获得%s！",GetName(),tBossName[nMapID],strName));
--		end
--	else
--		gf_AddItemEx({tPVPItemInfo[7][2],tPVPItemInfo[7][3],tPVPItemInfo[7][4],1},tPVPItemInfo[7][1]);
--	end
--	yp_setValue(2,20);
end

--偷经书任务(ok)
function yp_aw_giveAward_6()
	if gf_Judge_Room_Weight(3,30,"") ~= 1 then
		return 0;
	end
	local nStep = gf_GetTaskByte(TASK_FIELD_PVP_STEAL_STEP,1);
	local nFinish = gf_GetTaskByte(TASK_FIELD_PVP_STEAL_STEP,2);
	if nStep < 0 or nStep > 6 then
		nStep = 6;
	end
	local tAward = {
		"StealingBooks_a",
    "StealingBooks_b",
    "StealingBooks_c",
    "StealingBooks_d",
    "StealingBooks_e",
    "StealingBooks_f",
    "StealingBooks_g",
	}
	local szAward = tAward[nStep+1]
	if szAward then
		CustomAwardGiveGroup(szAward, CUSTOM_AWARD_GIVE_ALL)
	end
	gf_SetTaskByte(TASK_FIELD_PVP_STEAL_STEP,2,nFinish+1);	
	--任务触发
	Include("\\script\\global\\events.lua")
	EventOnTrigger(7, {name="Thu th藀 N閕 C玭g T﹎ Kinh", category=nStep+1});
end

--种子浇水奖励(ok)
function yp_aw_giveAward_7(nLevel, nIdx)
	if gf_Judge_Room_Weight(2,20,"") ~= 1 then
		return 0;
	end
	if not tSeedName[nLevel] or not tSeedName[nLevel][nIdx] then
		return 0
	end
	local szAward = tSeedName[nLevel][nIdx][4]
	if szAward then
		CustomAwardGiveGroup(szAward, CUSTOM_AWARD_GIVE_ALL)
	end
end

--玉魄奖励
function yp_aw_giveAward_8(nType)
	if gf_Judge_Room_Weight(2,10,"") ~= 1 then
		return 0;
	end
	if nType > 4 or nType <= 0 then 
		return 0;
	end	
	local tAward = {
		"JadeSoul0",
        "JadeSoul1",
        "JadeSoul2",
        "JadeSoul3",
	}
	local szAward = tAward[nType]
	if szAward then
		CustomAwardGiveGroup(szAward, CUSTOM_AWARD_GIVE_ALL)
	end
--	local tTemp = {
--		[1] = {
----			"yp_aw_addExp(80*5)",
----			"yp_aw_addBook(2,4)",
--		},
--		[2] = {
----			"yp_aw_addExp(80*3)",
--			"gf_AddItemEx({2,95,936,5},'武林盟表彰信')",
--		},
--		[3] = {
----			"yp_aw_addExp(80*2)",
--			"giveFactionBook(1,4)",
--			"gf_AddItemEx({2,95,936,4},'武林盟表彰信')",
--		},
--		[4] = {
----			"yp_aw_addExp(80)",
--			"yp_aw_wenshi(1,random(1,4),1)",
--			"gf_AddItemEx({2,95,936,3},'武林盟表彰信')",
--		},		
--	}
--	for i = 1,getn(tTemp[nType]) do
--		dostring(tTemp[nType][i]);
--	end
end

--完成种植任务
function yp_aw_giveAward_9()
	if gf_Judge_Room_Weight(2,20,"") ~= 1 then
		return 0;
	end
	SetTask(TASK_FIELD_PVP_SEED_SUR,0);
	CustomAwardGiveGroup("tree_mission", CUSTOM_AWARD_GIVE_ALL)
--	yp_aw_giveGXW(4);
--	local nRand = random(1,1000);
--	if nRand <= 500 then
--		gf_AddItemEx({2,95,925,1},"义气酒");
--	end
--	yp_setValue(5,10);
----	MP_MasterAddPoint(500);
--	local nCamp = GetTask(TASK_FIELD_PVP_CAMP);
--	if nCamp ~= 0 then
--		yp_addCharm(nCamp,5);
--	end	
--	Observer:onEvent(OE_FILED_PVP_DATA,{3});
--	ds_PVP:AddStatValue(1,8,1);
end

--完成偷取果实任务(ok)
function yp_aw_giveAward_10()
	if gf_Judge_Room_Weight(2,20,"") ~= 1 then
		return 0;
	end
	SetTask(TASK_FIELD_PVP_SEED_STEAL,0);
	CustomAwardGiveGroup("tree_steal", CUSTOM_AWARD_GIVE_ALL)
	
--	yp_aw_addExp(40);
--	yp_setValue(2,20);
--	yp_aw_giveGXW(4);
----	MP_MasterAddPoint(500);
--	yp_setValue(5,10);
--	local nRand = random(1,1000);
--	if nRand <= 499 then
--		gf_AddItemEx({2,95,935,1},"武林盟信物");
--	elseif nRand <= 500 then
--		giveFactionBook(4,4);
--	else
--		ModifyPopur(200, 0);
--		Msg2Player("您获得了200点修为！");
--	end
--	local nCamp = GetTask(TASK_FIELD_PVP_CAMP);
--	if nCamp ~= 0 then
--		yp_addCharm(nCamp,5);
--	end	
----	Observer:onEvent(OE_FILED_PVP_DATA,{4});
end

--种植本人奖励(ok)
function yp_aw_giveAward_11()
	if gf_Judge_Room_Weight(3,30,"") ~= 1 then
		return 0;
	end
	CustomAwardGiveGroup("tree_mature1", 0)
--	yp_aw_addExp(80*4);
--	gf_AddItemEx({2,95,935,3},"武林盟信物");
--	gf_AddItemEx({2,95,936,10},"武林盟表彰信");
--	yp_setValue(2,20);
--	yp_setValue(4,20);
--	yp_setValue(5,20);
--	a[4]:giveClause();
end

--种植其它人奖励(ok)
function yp_aw_giveAward_12()
	if gf_Judge_Room_Weight(1,10,"") ~= 1 then
		return 0;
	end
	CustomAwardGiveGroup("tree_mature3", 0)
--	tAllAward[4]:giveClause();
--	MP_MasterAddPoint(1000);
end

--宝藏任务(ok)
function yp_aw_giveAward_13()
	if gf_Judge_Room_Weight(5,200,"") ~= 1 then
		return 0;
	end
	CustomAwardGiveGroup("treasure_mission1", CUSTOM_AWARD_GIVE_ALL)
	return 1
	
--	yp_aw_addExp(40*2);
--	yp_setValue(2,20);
--	yp_setValue(5,10);
--	yp_aw_giveGXW(3);
----	MP_MasterAddPoint(500);
--	local nRand = random(1,1000);
--	if nRand <= 450 then
--		gf_AddItemEx({2,95,935,1},"武林盟信物");
--	elseif nRand <= 460 then
--		gf_AddItemEx({2,100,45,1},"天门金文虎符");
--	elseif nRand <= 500 then
--		gf_AddItemEx({2,95,925,1},"义气酒");
--	else
--		ModifyPopur(200, 0);
--		Msg2Player("您获得了200点修为！");
--	end
--	local nCamp = GetTask(TASK_FIELD_PVP_CAMP);
--	if nCamp ~= 0 then
--		yp_addCharm(nCamp,8);
--	end	
----	ds_PVP:AddStatValue(1,11,1);
end

--运镖成功(ok)
function yp_aw_giveAward_14(nType,nDouble)
	nDouble = nDouble or 1;
	if gf_Judge_Room_Weight(1,10,"") ~= 1 then
		return 0;
	end
	local tAward = {
		"ChargeDart_a",
        "ChargeDart_b",
        "ChargeDart_c",
        "ChargeDart_d",
        "ChargeDart_e",
	}
	local szAward = tAward[nType]
	if szAward then
		CustomAwardGiveGroup(szAward, CUSTOM_AWARD_GIVE_ALL)
	end
	--任务触发
	Include("\\script\\global\\events.lua")
	EventOnTrigger(7, {name="T苙g qu�"});
end

--抢镖任务(ok)
function yp_aw_giveAward_15(nType)
	if gf_Judge_Room_Weight(1,10,"") ~= 1 then
		return 0;
	end	
	local tAward = {
		"robbery_a",
        "robbery_b",
        "robbery_c",
        "robbery_d",
        "robbery_e",
	}
	local szAward = tAward[nType]
	if szAward then
		CustomAwardGiveGroup(szAward, CUSTOM_AWARD_GIVE_ALL)
	end
end

--投保返回(ok)
function yp_aw_giveAward_16(nType)
--	if gf_Judge_Room_Weight(1,10,"") ~= 1 then
--		return 0;
--	end	
--	local tExpArg = {63,84,105,147,210};
--	local tMoney = {8800,9200,9600,10000,10400};
--	local nExp = tExpArg[nType];
--	local nMoney = tMoney[nType];
--	yp_aw_addExp(nExp);
--	Earn(nMoney);
--	ds_PVP:AddStatValue(1,18,1);
end

--赏金奖励(ok)
function yp_aw_giveAward_17(nNum)
	if gf_Judge_Room_Weight(4,40,"") ~= 1 then
		return 0;
	end
	local nType = 0;
	local tNum = {17,9,1,0};
	for i = 1,getn(tNum) do
		if nNum >= tNum[i] then
			nType = i;
			break;
		end
	end
	local tAward = {
		"hunter_a",
        "hunter_b",
        "hunter_c",
        "hunter_d",
	}
	local szAward = tAward[getn(tAward)-nType+1]
	if szAward then
		CustomAwardGiveGroup(szAward, CUSTOM_AWARD_GIVE_ALL)
		--yp_setValue(5,30)--声望
	end
	--任务触发
	Include("\\script\\global\\events.lua")
	EventOnTrigger(7, {name="Thi猲  L謓h B礽", category=getn(tAward)-nType+1});
end

--贡献度奖励
function yp_aw_giveAward_18(nNum)
	if gf_Judge_Room_Weight(4,30,"") ~= 1 then
		return 0;
	end
	local nType = 0;
	local tNum = {5000,2100,1500,1200,900};
	local tAward = {
		"Contribute_Point_5000",
		"Contribute_Point_2100",
		"Contribute_Point_1500",
		"Contribute_Point_1200",
		"Contribute_Point_900",
	}
	for i = 1,getn(tNum) do
		if nNum >= tNum[i] then
			nType = i;
			break;
		end
	end
	if nType == 0 then
		return 0;
	end
--	local tTemp = {
--		[1] = {
--			"gf_AddItemEx({2,95,935,70},'武林盟信物')",
--		},		
--		[2] = {
--			"gf_AddItemEx({2,95,935,30},'武林盟信物')",
--			"gf_AddItemEx({2,95,936,5},'武林盟表彰信')",
--			"gf_AddItemEx({2,95,925,5},'义气酒')",
--			"gf_AddItemEx({2,95,916,1},'凤精丹')",
--			"yp_setValue(2,100)",
--		},
--		[3] = {
--			"gf_AddItemEx({2,95,905,1},'二等黄檀仙种')",
--			"gf_AddItemEx({2,95,822,1},'金陵酒')",
--		},
--		[4] = {
--			"gf_Modify('Popur', 500)",
--		},
--		[5] = {
--			"yp_aw_addExp(80*10)",
--		},		
--	}
	local szAward = tAward[nType]
	if CustomAwardCheckCondition(szAward) == 1 then
		SetTask(TASK_FIELD_PVP_GXD_WARD,1);
		CustomAwardGiveGroup(szAward, CUSTOM_AWARD_GIVE_ALL)
	end
end

--宝藏奖励
function yp_aw_giveAward_19(nType)
	if gf_Judge_Room_Weight(3,100,"") ~= 1 then
		return 0;
	end
	local tAward = {
		"treasure_d",
        "treasure_e",
        "treasure_f",
        "treasure_g",
	}
	local szAward = tAward[nType]
	if szAward then
		CustomAwardGiveGroup(szAward, CUSTOM_AWARD_GIVE_ALL)
	end
--	if nType == 1 then
--			Earn(1000);
--	elseif nType == 2 then
--		gf_AddItemEx({2,95,740,1,4},"皓月碎片");
--	elseif nType == 3 then
--		yp_setValue(2,5);
--	else
--		local nRand = random(1,100);
--		if nRand <= 50 then
--			local nRand2 = random(638,643);
--			local tName = {
--				[638] = "标准豪杰套",
--				[639] = "魁梧豪杰套",
--				[640] = "性感豪杰套",
--				[641] = "娇小豪杰套",
--				[642] = "标准打虎套",
--				[643] = "魁梧龙翔套",
--			};
--			AddItem(0,108,nRand2,1,5);--换成外装
--			AddItem(0,109,nRand2,1,5);--换成外装
--			AddItem(0,110,nRand2,1,5);--换成外装
--			Msg2Global(format("%s打开惊世宝藏获得%s！",GetName(),tName[nRand2]))
--			WriteLog(format("[%s] [Sucess] [AddItem] [role:%s(acc:%s)] [%s]",
--				strLog, GetName(), GetAccount(), tName[nRand2]));			
--		else
--			gf_AddItemEx({2,95,918,50,4},"镇远换镖令");
--		end
--	end
end

--xx宝藏
function yp_aw_giveAward_20(nType)
	if gf_Judge_Room_Weight(1,30,"") ~= 1 then
		return 0;
	end
	if nType <= 0 or nType > 3 then
		return 0;
	end
	local tAward = {
		"treasure_a",
        "treasure_b",
        "treasure_c",
	}
	local szAward = tAward[nType]
	if szAward then
		CustomAwardGiveGroup(szAward, CUSTOM_AWARD_GIVE_ALL)
	end
--	local tTemp = {
--		[1] = {
----			"MP_MasterAddPoint(500)",
--			"yp_setValue(4,200)",
--		},		
--		[2] = {
--			"gf_AddItemEx({2,95,936,10},'武林盟表彰信')",
----			"MP_MasterAddPoint(500)",
--		},
--		[3] = {
----			"MP_MasterAddPoint(500)",
--			"yp_setValue(2,200)",
--		}		
--	}
--	for i = 1,getn(tTemp[nType]) do
--		dostring(tTemp[nType][i]);
--	end
end