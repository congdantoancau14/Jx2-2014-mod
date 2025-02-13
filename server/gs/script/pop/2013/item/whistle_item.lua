--初探重明
Include("\\script\\task\\global_task\\gtask_head.lua");
Include("\\script\\lib\\globalfunctions.lua");

--需要去的点
sOtherMapMsg = "H秈 Йng Thanh nghe th蕐 ti課g hu齮 sao li襫 hng v� ngi ra hi謚, khu v鵦 n祔 kh玭g c� t譶h b竜, b秓 ngi n <color=red>Ng鋋 Long чng 1<color>, <color=red>Ng鋋 Long чng 2<color>, <color=red>Ng鋋 Long чng 3<color> t譵 th�."
sAllMapFindMsg = "T蕋 c� t譶h b竜 u b� ph竧 hi謓.";
g_tMapName = {" <color=red>Ng鋋 Long чng 1<color> "," <color=red>Ng鋋 Long чng 2<color> "," <color=red>Ng鋋 Long чng 3<color> "};

g_tGTaskId = {1325,1339};  --涉及到的任务id 查看gtask_main

g_nMapId1 = 610;
g_nMapId2 = 611;
g_nMapId3 = 612;

tTreasureTable = {
	[g_nMapId1] = {			--卧龙洞一层情报
		{610,2163,4244,},
		{610,2169,4204,},
		{610,2244,4354,},
		{610,1835,4317,},
		{610,2074,4065,},
	},
	[g_nMapId2] = {			--卧龙洞二层情报
		{611,2163,4244,},
		{611,2169,4204,},
		{611,2244,4354,},
		{611,1835,4317,},
		{611,2074,4065,},
	},
	[g_nMapId3] = {			--卧龙洞三层情报
		{612,2163,4244,},
		{612,2169,4204,},
		{612,2244,4354,},
		{612,1835,4317,},
		{612,2074,4065,},
	},
}
	
tBitIdx = {
	[g_nMapId1] = 1, [g_nMapId2] = 2,[g_nMapId3] = 3,
	}	
	
tAward = {
	[g_nMapId1] = {"T譶h B竜 Ng鋋 Long чng 1", {2, 111,3,1}, },
	[g_nMapId2] = {"T譶h B竜 Ng鋋 Long чng 2", {2, 111,4,1}, },
	[g_nMapId3] = {"T譶h B竜 Ng鋋 Long чng 3", {2, 111,5,1}, },
};

--TASKID_2013_NEW_TASK_SEARCH  bit_1 bit_2 bit_3 记录3个地图的宝藏是否找到，byte_2 记录随到的地图坐标的Idx
function OnUse(nItemIndex)
		--判断有没有接任务
	local nHasTask = 0;
	for i = 1,getn(g_tGTaskId) do
		if 1 == tGtTask:check_cur_task(g_tGTaskId[i])  then
			nHasTask = 1
			break;
		end
	end
	if nHasTask ~= 1 then
		Talk(1, "", "<color=green>Nhan Th� T輓 Ti猽<color>: Ngi ch璦 nh薾 nhi謒 v�!");
		return 0;
	end
	local nMapID, nMapX, nMapY = GetWorldPos();
	--地图错误
	local nIdx1 = gf_GetTaskByte(TASKID_2013_NEW_TASK_SEARCH,2);
	if nIdx1 == 0 then 
			nIdx1 = random(1,getn(tTreasureTable[g_nMapId1]));
			gf_SetTaskByte(TASKID_2013_NEW_TASK_SEARCH,2,nIdx1);
	end	
	if not tTreasureTable[nMapID] then
		Talk(1,"",sOtherMapMsg);
		return 0;
	end
	local sMapMsg = "H秈 Йng Thanh nghe th蕐 ti課g hu齮 sao li襫 hng v� ngi ra hi謚, khu v鵦 n祔 kh玭g c� t譶h b竜, b秓 ngi n ";
--	local tMapNum = {"找寻。","找寻。"};
	if  gf_GetTaskBit(TASKID_2013_NEW_TASK_SEARCH,tBitIdx[nMapID]) == 1 then --这个地图的情报已经被发现了。
		local nUnfindMap = 0;
		for i = 1,3 do
			if gf_GetTaskBit(TASKID_2013_NEW_TASK_SEARCH,i) == 0 then
				nUnfindMap = nUnfindMap + 1;
				sMapMsg = sMapMsg .. g_tMapName[i];
			end
		end
		if nUnfindMap == 0 then
			Talk(1,"",sAllMapFindMsg);
			return 0;
		else
			sMapMsg = sMapMsg .. " t譵 th�.";
			Talk(1,"",sMapMsg);
			return 0;
		end
	end

	local tSet = tTreasureTable[nMapID][nIdx1];
	--挖宝成功
	if nMapID == tSet[1] and nMapX > tSet[2] - 50 and nMapX < tSet[2] + 50 and nMapY > tSet[3] - 50 and nMapY < tSet[3] + 50 then
		if gf_Judge_Room_Weight(1, 0, "") ~= 1 then
			return
		end
		gf_AddItemEx(tAward[nMapID][2], tAward[nMapID][1]);
		gf_SetTaskBit(TASKID_2013_NEW_TASK_SEARCH,tBitIdx[nMapID],1);
		Talk(1, "", "H秈 Йng Thanh nghe th蕐 ti課g hu齮 sao li襫 hng v� ngi ra hi謚, v藅 n祔 ch綾 l� t譶h b竜 r錳.");
		return 0;
	end

	--东边
	if tSet[2] - nMapX > 50 and abs(tSet[2] - nMapX) > abs(tSet[3] - nMapY) then
		Talk(1, "", "H秈 Йng Thanh nghe th蕐 ti課g hu齮 sao li襫 hng v� ngi ra hi謚, ch綾 l� t譶h b竜 � ph輆 ng c竎h ngi kh玭g xa.");
		return
	end

	--西边
	if nMapX - tSet[2] > 50 and abs(tSet[2] - nMapX) > abs(tSet[3] - nMapY) then
		Talk(1, "", "H秈 Йng Thanh nghe th蕐 ti課g hu齮 sao li襫 hng v� ngi ra hi謚, ch綾 l� t譶h b竜 � ph輆 t﹜ c竎h ngi kh玭g xa.");
		return
	end

	--北边
	if nMapY - tSet[3] > 50 and abs(tSet[3] - nMapY) > abs(tSet[2] - nMapX) then
		Talk(1, "", "H秈 Йng Thanh nghe th蕐 ti課g hu齮 sao li襫 hng v� ngi ra hi謚, ch綾 l� t譶h b竜 � ph輆 b綾 c竎h ngi kh玭g xa.");
		return
	end

	--西边
	if tSet[3] - nMapY > 50 and abs(tSet[3] - nMapY) > abs(tSet[2] - nMapX) then
		Talk(1, "", "H秈 Йng Thanh nghe th蕐 ti課g hu齮 sao li襫 hng v� ngi ra hi謚, ch綾 l� t譶h b竜 � ph輆 nam c竎h ngi kh玭g xa.");
		return
	end
end
