--=========================================
--=============================================
--create by xiongyizhi 2010.11.2
--describe:越南版2010年12月活动1 头文件
--related files: 
--============================================
Include("\\script\\online_activites\\2010_12\\activites_04\\head.lua");

function main()
    if gf_CheckEventDateEx2(VET_4_SOUL_TREE_BEGIN_TIME, VET_4_SOUL_TREE_END_TIME) ~= 1 then
        return 0;
    end
    Say(VET_201012_04_NPC_TALK_TITLE, 3, 
            VET_201012_04_NPC_TALK_STRINGS[1],
            VET_201012_04_NPC_TALK_STRINGS[2],
            VET_201012_04_NPC_TALK_STRINGS[5].."/gf_DoNothing");
    return 0;
end

function ExChange_4_soul_award()
    if base_check() == 0 then
        return 0;
    end
    local tbSayDialog = {};
    tinsert(tbSayDialog, format(VET_201012_04_NPC_TALK_STRINGS[4].."/#exchange_fruit_award(1)", Judge_fruit_cost(1)));
    tinsert(tbSayDialog, format(VET_201012_04_NPC_TALK_STRINGS[4].."/#exchange_fruit_award(2)", Judge_fruit_cost(2)));
    tinsert(tbSayDialog, format(VET_201012_04_NPC_TALK_STRINGS[4].."/#exchange_fruit_award(3)", Judge_fruit_cost(3)));
    tinsert(tbSayDialog, format(VET_201012_04_NPC_TALK_STRINGS[4].."/#exchange_fruit_award(4)", Judge_fruit_cost(4)));
    tinsert(tbSayDialog, format(VET_201012_04_NPC_TALK_STRINGS[4].."/#exchange_fruit_award(5)", Judge_fruit_cost(5)));
    tinsert(tbSayDialog, VET_201012_04_NPC_TALK_STRINGS[5].."/gf_DoNothing");
    Say(VET_201012_04_NPC_TALK_TITLE, 6, tbSayDialog);
    return 0;
end

--返回VET_201012_04_TB_AWARD指定行的上交要求字符串 如第五行是 "青龙果*15 火风花*15 白虎叶*15 玄武根*15 "
function Judge_fruit_cost(nNum)
    local szCost = "";
    for nCostCount = 1,getn(VET_201012_04_TB_AWARD[nNum][1]) do
        if VET_201012_04_TB_AWARD[nNum][1][nCostCount] ~= 0 then
            szCost = szCost..format(VET_201012_04_TB_ITEM[nCostCount][1].."*%d ", VET_201012_04_TB_AWARD[nNum][1][nCostCount]); 
                                                                                                        --记录下材料消耗的字符串用于对话，
        end                                                                                             --格式 "青龙果*1 火风花*2 白虎叶*3 "
    end
    return "["..szCost.."]";
end

--
function exchange_fruit_award(nNum)
    for i = 1, getn(VET_201012_04_TB_AWARD[nNum][1]) do
        if VET_201012_04_TB_AWARD[nNum][1][i] ~= 0 then
            if GetItemCount(gf_UnPack(VET_201012_04_TB_ITEM[i][2])) < VET_201012_04_TB_AWARD[nNum][1][i] then
                Talk(1, "", VET_201012_04_NPC_TALK_STRINGS[6]);
                return 0;
            end
        end
    end
    give_4_soul_award(nNum);
end

function give_4_soul_award(nNum)
    local nDate = tonumber(date("%y%m%d"))
    local nUsedDate = GetTask(TSK_AWARD_4SOUL_DATE)
    if nDate ~= nUsedDate then
    		SetTask(TSK_AWARD_4SOUL_DATE, nDate)
    		SetTask(TSK_AWARD_4SOUL, 0)
    		SetTask(VET_201012_04_AWRAD_4_SOUL_FRUIT_COUNT, 0)
    end
    local tbLineExchange =
    {
    		[1] = 1,
    		[2] = 10,
    		[3] = 100,
    		[4] = 1000,
    		[5] = 10000,
    }
    local nLineExchange = floor(mod(GetTask(TSK_AWARD_4SOUL), (tbLineExchange[nNum] * 10)) / tbLineExchange[nNum])
    local nMaxExchange = VET_4_SOUL_MAX_EXCHANGE_TIMES
    local nPetLevel = mod(GetTask(TASK_VNG_PET), 100)
    if nPetLevel == 2 then
    		nMaxExchange = 2
    elseif nPetLevel >= 3 then
    		nMaxExchange = 3
    end
    if nLineExchange >= nMaxExchange then
        Talk(1, "", "Чi hi謕  nh薾 i ph莕 thng n祔 qu� s� l莕 gi韎 h筺, kh玭g th� i th猰!")
        return 0
    end
    local nReceivedExp = GetTask(VET_201012_04_AWRAD_4_SOUL_FRUIT_COUNT)
    if nReceivedExp >= VET_4_SOUL_MAX_EXCHANGE_EXP then
    		Talk(1, "", "Чi hi謕  nh薾  甶觤 kinh nghi謒 h玬 nay r錳, kh玭g th� i th猰!")
    		return 0
    end
    SetTask(TSK_AWARD_4SOUL, GetTask(TSK_AWARD_4SOUL) + tbLineExchange[nNum])
    local g, d, p;
    for i = 1, getn(VET_201012_04_TB_AWARD[nNum][1]) do
        if VET_201012_04_TB_AWARD[nNum][1][i] ~= 0 then
            g, d, p = gf_UnPack(VET_201012_04_TB_ITEM[i][2]);--只在放最后一个参数时函数才会接受全部返回值,否则只接受最后一个值
            if DelItem(g, d, p, VET_201012_04_TB_AWARD[nNum][1][i]) == 0 then
                return 0;
            end
        end
    end
    
    local nExpReward = VET_201012_04_TB_AWARD[nNum][2]
    if nReceivedExp + nExpReward > VET_4_SOUL_MAX_EXCHANGE_EXP then
    		nExpReward = VET_4_SOUL_MAX_EXCHANGE_EXP - nReceivedExp
    end
    SetTask(VET_201012_04_AWRAD_4_SOUL_FRUIT_COUNT, GetTask(VET_201012_04_AWRAD_4_SOUL_FRUIT_COUNT) + nExpReward)
    gf_EventGiveCustomAward(1, nExpReward, 1, VET_201012_04_STR_LOG_TITLE, VET_201012_04_TB_LOG_ACTION_LIST[1]);
end

function buy_item_for_plant_4_soul()
    if gf_Judge_Room_Weight(2, 0, "") ~= 1 then
        return 0;
    end
    Say(VET_201012_04_NPC_TALK_STRINGS[21], 5,
            VET_201012_04_NPC_TALK_STRINGS[22].."/buy_4_soul_tree",
            VET_201012_04_NPC_TALK_STRINGS[23].."/buy_4_soul_xianlu",
            VET_201012_04_NPC_TALK_STRINGS[24].."/buy_4_soul_feiliao",
            VET_201012_04_NPC_TALK_STRINGS[25].."/buy_4_soul_shachong",
            VET_201012_04_NPC_TALK_STRINGS[5].."/gf_DoNothing");
end

function buy_4_soul_tree()
    local nMaxNum = GetFreeItemRoom()
    if nMaxNum ~= 0 then
        AskClientForNumber("give_4_soul_tree", 1, nMaxNum, VET_201012_04_NPC_TALK_STRINGS[26]);
    end
end

function give_4_soul_tree(nCount)
    if gf_Judge_Room_Weight(2, 0, "") ~= 1 then
        return 0;
    end
    if GetItemCount(2, 1, 30230) < 15 * nCount then
        Talk(1, "", VET_201012_04_NPC_TALK_STRINGS[27]);
        return 0;
    end
    if DelItem(2, 1, 30230, 15 * nCount) == 1 then
        gf_AddItemEx2({2, 1, 30269, nCount}, 
                        VET_201012_04_NPC_TALK_STRINGS[28], 
                        VET_201012_04_STR_LOG_TITLE, 
                        VET_201012_04_TB_LOG_ACTION_LIST[6], 7 * 24 * 3600);
    end
    WriteLogEx("LOG XU VAT PHAM","Mua c﹜ T� Linh 15 xu")
end

function buy_4_soul_xianlu()
    AskClientForNumber("give_4_soul_xianlu", 1, 999, VET_201012_04_NPC_TALK_STRINGS[26]);
end

function give_4_soul_xianlu(nCount)
    if gf_Judge_Room_Weight(2, 0, "") ~= 1 then
        return 0;
    end
    if GetCash() < 2000 * nCount then
        Talk(1, "", VET_201012_04_NPC_TALK_STRINGS[27]);
        return 0;
    end
    Pay(2000 * nCount)
    gf_AddItemEx2({2, 1, 30274, nCount}, 
                  VET_201012_04_TREE_ITEM_TO_ACTION[1][1], 
                  VET_201012_04_STR_LOG_TITLE, 
                  VET_201012_04_TB_LOG_ACTION_LIST[6]);
	buy_item_for_plant_4_soul();
end

function buy_4_soul_feiliao()
    AskClientForNumber("give_4_soul_feiliao", 1, 999, VET_201012_04_NPC_TALK_STRINGS[26]);
end

function give_4_soul_feiliao(nCount)
    if gf_Judge_Room_Weight(2, 0, "") ~= 1 then
        return 0;
    end
    if GetCash() < 2000 * nCount then
        Talk(1, "", VET_201012_04_NPC_TALK_STRINGS[27]);
        return 0;
    end
    Pay(2000 * nCount)
    gf_AddItemEx2({2, 1, 30275, nCount}, 
                  VET_201012_04_TREE_ITEM_TO_ACTION[2][1], 
                  VET_201012_04_STR_LOG_TITLE, 
                  VET_201012_04_TB_LOG_ACTION_LIST[6]);
	buy_item_for_plant_4_soul();
end

function buy_4_soul_shachong()
    AskClientForNumber("give_4_soul_shachong", 1, 999, VET_201012_04_NPC_TALK_STRINGS[26]);
end

function give_4_soul_shachong(nCount)
    if gf_Judge_Room_Weight(2, 0, "") ~= 1 then
        return 0;
    end
    if GetCash() < 2000 * nCount then
        Talk(1, "", VET_201012_04_NPC_TALK_STRINGS[27]);
        return 0;
    end
    Pay(2000 * nCount)
    gf_AddItemEx2({2, 1, 30276, nCount}, 
                  VET_201012_04_TREE_ITEM_TO_ACTION[3][1], 
                  VET_201012_04_STR_LOG_TITLE, 
                  VET_201012_04_TB_LOG_ACTION_LIST[6]);
	buy_item_for_plant_4_soul();
end
