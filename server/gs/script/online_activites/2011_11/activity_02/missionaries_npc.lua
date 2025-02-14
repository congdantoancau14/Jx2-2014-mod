--by liubo
--西洋传教士脚本
Include("\\script\\lib\\globalfunctions.lua")
Include("\\script\\online_activites\\head\\activity_normal_head_string.lua")
Include("\\script\\online_activites\\2011_11\\string.lua")
Include("\\script\\misc\\taskmanager.lua")
ACTIVIY_GOODS_NUM = 100 --物品数量
--externds old taskid
--don't to modify this value by SetTask
VET_201111_GET_TAG_TASKID = 2783
VET_201111_USED_NUM_TASKID = 2784
--server globle value
g_Globle_Value = 2011
-------------------------------------
--Relay 共享数据库记录结构
Record_Struct = {
	szKey = "activity_shengdan",
	nKey1 = 0,
	nKey2 = 0,
	nSortType = 0,
	itemkey = "missionaries",
}
thisFilePath = "\\script\\online_activites\\2011_11\\activity_02\\missionaries_npc.lua"
-------------------------------------
--奖励表
VET_201111_SHENGDAN_AWARD = {
	{1, 39, "Tu莕 L閏", {0, 105, 35, 1, 1, -1, -1, -1, -1, -1, -1}, 60 * 24 * 3600},
	{1, 58, "Trang tr� Gi竛g sinh",{{{"N鉵 gi竛g sinh chu萵", {0,108,109,1}},{"N鉵 gi竛g sinh kh玦 ng�", {0,108,110,1}},{"N鉵 gi竛g sinh g頸 c秏", {0,108,112,1}},{"N鉵 gi竛g sinh nh�", {0,108,111,1}}},
						{{"Thng y gi竛g sinh chu萵", {0,109,109,1}},{"Gi竛g sinh kh玦 ng�", {0,109,110,1}},{"Thng y gi竛g sinh g頸 c秏", {0,109,112,1}},{"Thng y gi竛g sinh Ki襲 n�", {0,109,111,1}}},
						{{"H� y Gi竛g sinh chu萵", {0,110,73,1}},{"Trang ph鬰 gi竛g sinh kh玦 ng�", {0,110,74,1}},{"H� y gi竛g sinh n� g頸 c秏", {0,110,76,1}},{"Gi竛g sinh Ki襲 n�", {0,110,75,1}}},
						},60 * 24 * 3600, 1},
	{1, 3, "Trang tr� Gi竛g sinh",{{{"N鉵 gi竛g sinh chu萵", {0,108,109,1}},{"N鉵 gi竛g sinh kh玦 ng�", {0,108,110,1}},{"N鉵 gi竛g sinh g頸 c秏", {0,108,112,1}},{"N鉵 gi竛g sinh nh�", {0,108,111,1}}},
						{{"Thng y gi竛g sinh chu萵", {0,109,109,1}},{"Gi竛g sinh kh玦 ng�", {0,109,110,1}},{"Thng y gi竛g sinh g頸 c秏", {0,109,112,1}},{"Thng y gi竛g sinh Ki襲 n�", {0,109,111,1}}},
						{{"H� y Gi竛g sinh chu萵", {0,110,73,1}},{"Trang ph鬰 gi竛g sinh kh玦 ng�", {0,110,74,1}},{"H� y gi竛g sinh n� g頸 c秏", {0,110,76,1}},{"Gi竛g sinh Ki襲 n�", {0,110,75,1}}},
						},0, 1},
}

VET_201111_NISSIONARIES_TASK = TaskManager:Create(3,16)
VET_201111_NISSIONARIES_TASK.FLAG = 1

function main()
	--是否开启活动判断
	if gf_CheckEventDateEx(48) ~= 1 then
		Say(tSTRING_MISSIONARIES_NPC..tSTRING_MISSIONARIES_TABLE[4],1,tSTRING_MISSIONARIES_TABLE[5].."/do_nothing")
		return 0
		--ClearRelayShareData(Record_Struct.szKey,Record_Struct.nKey1,Record_Struct.nKey2, thisFilePath, "")
	end
	local nDate = tonumber(date("%Y%m%d"))
 	if nDate >= 20111216 and nDate <= 20411218 then
		Say(tSTRING_MISSIONARIES_NPC..format(tSTRING_MISSIONARIES_TABLE[1],ACTIVIY_GOODS_NUM),3,tSTRING_MISSIONARIES_TABLE[2].."/get_final_award",tSTRING_MISSIONARIES_TABLE[3].."/get_usable_num",tSTRING_MISSIONARIES_TABLE[5].."/do_nothing")
	elseif nDate >= 20111223 and nDate <= 20411231 then
		Say(tSTRING_MISSIONARIES_NPC,3,"Ta mu鑞 mua 1 b� ngo筰 trang Noel gi� 100 v祅g /buy_ngoaitrang","Ta mu鑞 mua 1 th� ci Tu莕 L閏 gi� 100 v祅g /buy_thucuoi",tSTRING_MISSIONARIES_TABLE[5].."/do_nothing")
	else
		Say(tSTRING_MISSIONARIES_NPC..tSTRING_MISSIONARIES_TABLE[4],1,tSTRING_MISSIONARIES_TABLE[5].."/do_nothing")
	end
	
end

function get_final_award()
	--访问共享数据库
	if GetGlbValue(g_Globle_Value) == 0 then
		ApplyRelayShareData(Record_Struct.szKey,Record_Struct.nKey1,Record_Struct.nKey2,thisFilePath,"callback_modifydata")
	end
	-----------------
	local nPoint = GetGlbValue(g_Globle_Value)
	if nPoint == 0 then return 0 end
	--是否超出了奖励数量
	if nPoint >= ACTIVIY_GOODS_NUM + 1 then
		Talk(1,"",tSTRING_MISSIONARIES_NPC..format(tSTRING_MISSIONARIES_TABLE[6],ACTIVIY_GOODS_NUM))
		return 0
	end
	--是否已领取终极奖励
	if GetTask(VET_201111_GET_TAG_TASKID) ~= 1 then
		Talk(1,"",tSTRING_MISSIONARIES_NPC..format(tSTRING_MISSIONARIES_TABLE[7],GetTask(VET_201111_USED_NUM_TASKID),CLASS_ACTIVITY.tbPrizeItemInfo[1].nItemUseTimesMax))
		return 0
	end
	--是否已经领取过
	if VET_201111_NISSIONARIES_TASK:GetTask(VET_201111_NISSIONARIES_TASK.FLAG) == 1 then
		Talk(1,"",tSTRING_MISSIONARIES_NPC..tSTRING_MISSIONARIES_TABLE[11])
		return 0
	end
	--背包空间
	if gf_Judge_Room_Weight(3,30," ") ~= 1 then
        Talk(1,"",tSTRING_MISSIONARIES_NPC..tSTRING_201111_TABLE[3])
		return 0
    end
	--给奖励
	gf_EventGiveRandAward(VET_201111_SHENGDAN_AWARD,100,1,"Ho箃 ng ph� event noel","a ph莕 thng c飊g g Gi� Noel")
	SetGlbValue(g_Globle_Value,nPoint+1)
	AddRelayShareData(Record_Struct.szKey,Record_Struct.nKey1,Record_Struct.nKey2, thisFilePath,"do_nothing",Record_Struct.nSortType,Record_Struct.itemkey,"d",nPoint+1)
	Msg2Global(format(tSTRING_MISSIONARIES_TABLE[10],GetName(),nPoint,ACTIVIY_GOODS_NUM))
	VET_201111_NISSIONARIES_TASK:SetTask(VET_201111_NISSIONARIES_TASK.FLAG,1)
end

function get_usable_num()
	--访问共享数据库
	if GetGlbValue(g_Globle_Value) == 0 then
		ApplyRelayShareData(Record_Struct.szKey,Record_Struct.nKey1,Record_Struct.nKey2,thisFilePath,"callback_modifydata")
	end
	-----------------
	local nPoint = GetGlbValue(g_Globle_Value)
	if nPoint == 0 then return 0 end
	Talk(1,"",tSTRING_MISSIONARIES_NPC..format(tSTRING_MISSIONARIES_TABLE[9],nPoint-1,ACTIVIY_GOODS_NUM))
end

function callback_modifydata(szKey, nKey1, nKey2, nCount, _szkey, _nkey1, _nkey2)
	if szKey == "" then
		szKey, nKey1, nKey2 = _szkey, _nkey1, _nkey2
	end	
	if nCount == 0 then
		-- 没有记录
		AddRelayShareData(szKey, nKey1, nKey2, thisFilePath, "do_nothing",Record_Struct.nSortType,Record_Struct.itemkey,"d",1)
	end	
	local nPoint, nRank = GetRelayShareDataByKey(szKey, nKey1, nKey2, Record_Struct.itemkey)
	SetGlbValue(g_Globle_Value,nPoint)
	--这里的Relay数据是随时变化的，所以要删除Gamesvr这边的副本记录
	DelRelayShareDataCopy(szKey, nKey1, nKey2)
end

function do_nothing()
end

function buy_ngoaitrang()
	if gf_Judge_Room_Weight(3, 100, "") == 0 then
		Talk(1, "","H祅h trang kh玭g  ch� tr鑞g!");
        	return 0;
     end
     if GetCash() < 1000000 then
		Talk(1, "", "B筺 kh玭g  ti襫  mua ngo筰 trang Noel")
		return 0
	end
	if Pay(1000000) == 1 then
		local nbody = GetBody()
		local nNon = VET_201111_SHENGDAN_AWARD[2][4][1][nbody][2]
		local nAo = VET_201111_SHENGDAN_AWARD[2][4][2][nbody][2]
		local nQuan = VET_201111_SHENGDAN_AWARD[2][4][3][nbody][2]
		gf_AddItemEx2(nNon, "N鉵 Gi竛g Sinh","ITEM NOEL", "mua th祅h c玭g 1 n鉵 gi竛g sinh", 7 * 24 * 3600 )
		gf_AddItemEx2(nAo, "A� Gi竛g Sinh","ITEM NOEL", "mua th祅h c玭g 1 竜 gi竛g sinh", 7 * 24 * 3600 )		
		gf_AddItemEx2(nQuan, "Qu莕 Gi竛g Sinh","ITEM NOEL", "mua th祅h c玭g 1 qu莕 gi竛g sinh", 7 * 24 * 3600 )
	end 
end

function buy_thucuoi()
	if gf_Judge_Room_Weight(1, 100, "") == 0 then
		Talk(1, "","H祅h trang kh玭g  ch� tr鑞g!");
        	return 0;
     end
     if GetCash() < 1000000 then
		Talk(1, "", "B筺 kh玭g  ti襫  mua Th� ci Tu莕 L閏")
		return 0
	end
	if Pay(1000000) == 1 then
		gf_AddItemEx2({0, 105, 35, 1, 1, -1, -1, -1, -1, -1, -1}, "Tu莕 L閏","ITEM NOEL", "mua th祅h c玭g 1 tu莕 l閏", 7 * 24 * 3600 )
	end   
end