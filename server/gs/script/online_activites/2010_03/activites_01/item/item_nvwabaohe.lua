--=============================================
--create by baiyun 2010.2.24
--describe:越南版2010年3月活动1 女娲宝盒脚本文件
--=============================================

Include("\\script\\online_activites\\2010_03\\activites_01\\head.lua");--活动头文件
Include("\\script\\online\\viet_event\\vng_task_control.lua");
Include("\\script\\online\\viet_event\\award\\award_head.lua");
Include("\\script\\online_activites\\reborn\\tongban\\head.lua");
Include("\\script\\online\\chuyen_sinh\\translife_npc.lua");
Include ("\\script\\meridian\\meridian_script_api.lua")
Include("\\script\\vng\\config\\vng_feature.lua")
Include("\\script\\vng\\award\\feature_award.lua")


function OnUse(nItemIdx)
--    if gf_CheckEventDateEx(VET_201003_01_EVENT_NUMBER) == 0 then
--        return 0;
--    end
	local nDate = tonumber(date("%y%m%d"))
	
	if nDate > 251231 then
		Talk(1,"","N� Oa b秓 h筽  h誸 h筺 s� d鬾g!")
		do	return	end
	end
	
    if GetLevel() < 73 then
       Talk(1,"", "Ъng c蕄 73 tr� l猲 m韎 s� d鬾g 頲 v藅 ph萴 n祔." )
    	  return
    end
    if GetPlayerRoute() == 0 then
       Talk(1,"", "Gia nh藀 m玭 ph竔 m韎 s� d鬾g 頲 v藅 ph萴 n祔." )
    	  return
    end
   	if gf_Judge_Room_Weight(9, 100) ~= 1 then
		Talk(1,"","Kh玭g gian h祅h trang kh玭g ");
		return
	end 
 --   if gf_Judge_Room_Weight(1, 10, "") ~= 1 then return end
    local nLastGetDate = GetTask(VET_201003_01_TASK_GET_BAOHE_DATE);
--    if nDate > 100704 then
--		return
--    end    
    if nLastGetDate ~= nDate then
    	   SetTask(VET_201003_01_TASK_GET_BAOHE_DATE,nDate)
        SetTask(VET_201003_01_TASK_GET_BAOHE_COUNT, 0);
        SetTask(VET_201003_01_TASK_USE_BAOHE_COUNT, 0);               
    end
    
    local nUse = 100
    -- VBonus ver 2
	if CheckVbonus() == 1 then
		nUse = 200
	end
--     if nDate >= 120210 and nDate <= 120229 then
--    		nUse = 400
--    end
    
    --local nNation = GetGlbValue(GLB_TSK_SERVER_ID)
    
--    local nWeek = tonumber(date("%w"))
--	if nWeek == 2 or nWeek == 3 then
--		nUse = 64
--	elseif nWeek == 4 or nWeek == 5 then
--		nUse = 88
--	end
--    if nDate <= 100905 then
--    		nUse = 64
--    end
--    if nDate >= 100909 and nDate <= 100912 then
--    		nUse = 128
--    end
    if GetTask(VET_201003_01_TASK_USE_BAOHE_COUNT) >= nUse then
    	  Talk(1,"", "B筺  s� d鬾g t鑙 產 s� N� Oa B秓 H筽 trong ng祔, kh玭g th� s� d鬾g th猰!")
    	  return
    end
    if DelItemByIndex(nItemIdx, 1) == 1 then
   	   SetTask(VET_201003_01_TASK_USE_BAOHE_COUNT,GetTask(VET_201003_01_TASK_USE_BAOHE_COUNT) + 1)
--    	  if GetTask(VET_201003_01_TASK_USE_BAOHE_COUNT) == 100 and mod(GetTask(TASK_VNG_PET), 100) >= 2 then
--    	  	Pet_AddGP(1)
--    	  end

    	  -- Nhi謒 v� chuy觧 sinh 5
    	  if GetTask(TRANSLIFE_MISSION_ID) == 34 and GetTask(TRANSLIFE_TASK_5_2) < 2000 then
    	  	SetTask(TRANSLIFE_TASK_5_2, GetTask(TRANSLIFE_TASK_5_2) + 1)
    	  	if GetTask(TRANSLIFE_TASK_5_2) == 2000 then
    	  		TaskTip("Ho祅 th祅h y猽 c莡 c馻 B筩h Ti猲 Sinh s� d鬾g 2000 N� Oa B秓 H筽")
    	  	end 
    	  end
    	 
--	  gf_EventGiveCustomAward(1, nExp, 0, "Nu Oa Bao Hap")
--   	  gf_EventGiveRandAward(VET_201003_01_NVWABAOHE_AWARD_LIST, 100, 3, VET_201003_01_STR_LOG_TITLE, VET_201003_01_TB_ITEM_LIST[9][1]);
 	 --- 觤 V薾 May
 --	  	local nExp = 1000000
--		local nPointVM = gf_GetTaskByte(TSK_LUCKY_DAOHUU_NEW_THANG4, BYTE_POINT_LUCKY)	
--		local nExpVM = (nPointVM - 100)/100*nExp
--		ModifyExp(nExpVM)
--		if nExpVM > 0 then
--			Msg2Player("B筺 nh薾 th猰 ".. nExpVM.." 甶觤 kinh nghi謒 t� v薾 may!")
--		else
--			Msg2Player("B筺 b� t鎛 th蕋 ".. nExpVM.." 甶觤 kinh nghi謒 do kh玭g may m緉. H穣 甶 gi秈 v薾 xui � Th莥 B鉯 Si猽 H筺g!")
--		end   	
	-----------	  
--        if GetTask(VET_201003_01_TASK_USE_BAOHE_COUNT) == 400 then
--    	  		gf_AddItemEx2({2,1,30130,1}, "Phi Y猲 Th筩h", VET_201003_01_STR_LOG_TITLE, "nh薾 Phi Y猲 Th筩h" )
--    	  		Msg2Player("B筺 nh薾 頲 1 Phi Y猲 Th筩h")
--    	  end
		gf_WriteLogEx("DA THONG KINH MACH", "i th祅h c玭g", nExpChanKhi, "甶觤 ch﹏ kh� N� Oa")		
		VietWaBaoHe(); --th猰 nguy猲 li謚 event h祅g th竛g
        	Use_Award_NuOa() --ph莕 thng khi s� d鬾g N� Oa
    		if GetTask(VET_201003_01_TASK_USE_BAOHE_COUNT) == nUse then        
    			Use_Award_NuOa_100()
    		end
        ----------- Chu鏸 nhi謒 v� Chuy觧 Sinh 6
       	local nCS6_BH =  floor(GetTask(TSK_CS6_GET1TIME)/1000)
		local nCS6_BH_Num = mod(GetTask(TSK_CS6_GET1TIME),1000)
		if mod(nCS6_BH,10000) < 1000 and GetTask(TSK_CS6_TULINH) < 2 then
			nCS6_BH = (nCS6_BH + 1) * 1000 + nCS6_BH_Num
			SetTask(TSK_CS6_GET1TIME, nCS6_BH)
		end
    --nhi謒 v� l祄 gi祏
     if CFG_NhiemVuLamGiau == 1 then
	     if GetTask(VET_201003_01_TASK_USE_BAOHE_COUNT) >= 5 and gf_GetTaskBit(TSK_LAMGIAU, 12) == 1 and gf_GetTaskBit(TSK_LAMGIAU, 1) == 0 then
	     		gf_SetTaskBit(TSK_LAMGIAU, 1, 1, 0)
	     		TaskTip("Ho祅 th祅h nhi謒 v� l祄 gi祏: S� d鬾g 05 n� oa b秓 h筽.")
	     end
	end

     if GetTask(VET_201003_01_TASK_USE_BAOHE_COUNT) == 100 and nDate <= 130120 then
  		gf_AddItemEx2({2,1,30030, 50}, "Ti觰 Nh� Y1", "NIEN THU NHU Y", "ho祅 th祅h 100 N� oa ")
     end 		
        --cdkey
        SendScript2VM("\\script\\function\\cdkey\\ck_head.lua", "_ck_UseItemNvWa()");
    end
end
