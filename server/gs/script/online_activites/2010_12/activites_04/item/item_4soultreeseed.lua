--=============================================
--create by xiongyizhi 2010.11.5
--describe:越南版2010年12月四灵树活动 四灵树苗脚本
--=============================================
Include("\\script\\online_activites\\2010_12\\activites_04\\head.lua");--活动字符串
Include ("\\script\\meridian\\meridian_script_api.lua")
Include("\\script\\vng\\award\\feature_award.lua");
Include("\\script\\vng\\config\\vng_feature.lua")
Include("\\script\\online_activites\\head\\activity_normal_head.lua")


--S� Ki謓
Include("\\settings\\static_script\\cheat\\event\\event_init.lua");

function OnUse(nItemIdx)
    if gf_CheckEventDateEx2(VET_4_SOUL_TREE_BEGIN_TIME, VET_4_SOUL_TREE_END_TIME) ~= 1 then
        return 0;
    end
    if base_check() == 0 then
        return 0;
    end
	if gf_Judge_Room_Weight(2, 100) ~= 1 then
		Talk(1,"","Kh玭g gian h祅h trang kh玭g ");
		return
	end    
    local nMax4SouldTree = VET_4_SOUL_MAX_PLANT_TIMES
    local nPetLevel = mod(GetTask(TASK_VNG_PET), 100)
--    if nPetLevel == 2 then
--    		nMax4SouldTree = 5
--    elseif nPetLevel >= 3 then
--    		nMax4SouldTree = 6
--    end
    local nDate = tonumber(date("%y%m%d"))
    local nUsedDay = floor(GetTask(VET_201012_04_PLANT_4_SOUL_TREE_COUNT) / 100)
    if nDate ~= nUsedDay then
    		SetTask(VET_201012_04_PLANT_4_SOUL_TREE_COUNT, nDate * 100)
    end
    local nUsed = mod(GetTask(VET_201012_04_PLANT_4_SOUL_TREE_COUNT), 100)
    if nUsed >= nMax4SouldTree then
        Talk(1, "", VET_201012_04_NPC_TALK_STRINGS[19]);
        return 0;
    end

    local nTreeLife = 0
    for i = 1, getn(VET_201012_04_TB_TREE_GROW) do
        nTreeLife = nTreeLife + VET_201012_04_TB_TREE_GROW[i][4];
    end
    local ntime = nTreeLife - (GetTime() - GetTask(VET_201012_04_PLANT_4_SOUL_TREE_TIME));
    if ntime >= 0 then
        Talk(1, "", format(VET_201012_04_NPC_TALK_STRINGS[16], ntime))
        return 0;
    end

    local bInMap = 0
    for i = 1, getn(VET_4_TB_PLANT_MAP) do
        if GetWorldPos() == VET_4_TB_PLANT_MAP[i] then
            bInMap = 1;
            break;
        end
    end
    if bInMap == 0 then
        Talk(1, "", VET_201012_04_NPC_TALK_STRINGS[14]);
        return 0;
    end
    if DelItemByIndex(nItemIdx, 1) == 1 then
    	----------------------- Chu鏸 nhi謒 v?Chuy觧 Sinh Кn, l璾 s?th?6 v?7 u b猲 ph秈
		local nCSD_TL = floor(GetTask(TSK_CSD_COUNT_C) / 100000)
		local nNumBK = mod(GetTask(TSK_CSD_COUNT_C),100000)
		if mod(nCSD_TL, 100) < 99 and GetTask(TSK_CSD) == 1 then
			nCSD_TL = (nCSD_TL + 1) * 100000 + nNumBK
			SetTask(TSK_CSD_COUNT_C, nCSD_TL)
		end
		----------------------Chu鏸 nhi謒 v?Chuy觧 Sinh 6
		local nCS6_TL =  floor(GetTask(TSK_CS6_COUNTB)/10000)
		local nCS6_TL_Num = mod(GetTask(TSK_CS6_COUNTB),10000)
		if mod(nCS6_TL,1000) < 150 and GetTask(TSK_CS6_TULINH) < 2 then
			nCS6_TL = (nCS6_TL + 1) * 10000 + nCS6_TL_Num
			SetTask(TSK_CS6_COUNTB, nCS6_TL)
		end
    	----------------------
    	 KichHoatCayTuLinh()-- ph莕 thu雗g khi k輈h ho箃
    	
	--- 觤 V薾 May
--	    	local nBonusExp = 3600000
--		local nPointVM = gf_GetTaskByte(TSK_LUCKY_DAOHUU_NEW_THANG4, BYTE_POINT_LUCKY)	
--		local nExpVM = (nPointVM - 100)/100*nBonusExp
--		ModifyExp(nExpVM)
--		if nExpVM > 0 then
--			Msg2Player("B筺 nh薾 th猰 ".. nExpVM.." 甶觤 kinh nghi謒 t?v薾 may!")
--		else
--			Msg2Player("B筺 b?t鎛 th蕋 ".. nExpVM.." 甶觤 kinh nghi謒 do kh玭g may m緉. H穣 甶 gi秈 v薾 xui ?Th莥 B鉯 Si猽 H筺g!")
--		end
			----------		
        local nNpcIndex = CreateNpc(VET_201012_04_TB_TREE_GROW[1][2], 
                                    GetName()..VET_201012_04_NPC_TALK_STRINGS[17]..VET_201012_04_NPC_TB[2][2], 
                                    GetWorldPos());
        SetNpcScript(nNpcIndex, VET_201012_04_TREE_SCRIPT);
        AddUnitStates(nNpcIndex, 5, 1);--默认一阶段不消耗东西，否则要修改该行和下面一行
        local nLifeTime = VET_201012_04_TB_TREE_GROW[1][4] + VET_201012_04_TB_TREE_GROW[2][4] 
        SetNpcLifeTime(nNpcIndex, nLifeTime);
        gf_WriteLogEx(VET_201012_04_STR_LOG_TITLE,VET_201012_04_TB_LOG_ACTION_LIST[2]);
        SetTask(VET_201012_04_PLANT_4_SOUL_TREE_TIME, GetTime());
        SetTask(VET_201012_04_PLANT_4_SOUL_TREE_COUNT, GetTask(VET_201012_04_PLANT_4_SOUL_TREE_COUNT) + 1);
	--Say("H玬 nay, y l?l莕 th?<color=yellow>"..GetTask(VET_201012_04_PLANT_4_SOUL_TREE_COUNT).."<color> b筺 tr錸g c﹜ T?Linh,  h玬 nay b筺 v蒼 c?th?tr錸g <color=yellow>"..(VET_4_SOUL_MAX_PLANT_TIMES-GetTask(VET_201012_04_PLANT_4_SOUL_TREE_COUNT)).."<color> c﹜ T?Linh.",0);		        
    		--------------   
    	--	if mod(GetTask(VET_201012_04_PLANT_4_SOUL_TREE_COUNT), 100) == 16 and nDate <= 130120 then   			
    	if nDate >= 130214 and nDate <= 130228 then	
			gf_AddItemEx2({2,1,30357, 200}, "H箃 Ca Cao", "VALENTINE 2013", "H箃 ca cao")
			--gf_AddItemEx2({2,1,30030, 60}, "Ti觰 Nh?Y1", "NIEN THU NHU Y", "ho祅 th祅h 16 c﹜ T?Linh")
		end	
		
		EventAddPhoBan(500);
		
        vaf_award_api("tPlant4LingTree") --2XU活动
    end
end
