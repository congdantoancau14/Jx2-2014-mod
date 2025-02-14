--by liubo
--白先生脚本接口
--春节副活动
Include("\\script\\lib\\globalfunctions.lua")
Include("\\script\\online_activites\\head\\activity_normal_head_string.lua")
Include("\\script\\misc\\taskmanager.lua")

ACTIVIY_GOODS_NUM = 68 --物品数量
--externds old taskid
--don't to modify this value by SetTask
VET_201112_GET_TAG_TASKID = 2778
VET_201112_USED_NUM_TASKID = 2779
--server globle value
g_201112_Globle_Value = 2012
-------------------------------------
--Relay 共享数据库记录结构
Record_Struct = {
	szKey = "spring_festival",
	nKey1 = 0,
	nKey2 = 0,
	nSortType = 0,
	itemkey = "missionaries1",
}
thisFilePath = "\\script\\online_activites\\2011_12\\chunjie\\chunjie_interface.lua"
-------------------------------------
--奖励表
VET_201112_CHUNJIE_AWARD = {
	{3, 2345, 8880000, 1},
  {1, 6879, "Ngo筰 trang t誸 xu﹏",{
 			{{"Trang ph鬰 xu﹏ chu萵",{0,109,113,1}},{"Trang ph鬰 xu﹏ kh玦 ng�",{0,109,114,1}},{"Trang ph鬰 xu﹏ Ki襲 n�",{0,109,116,1}},{"Trang ph鬰 xu﹏ g頸 c秏",{0,109,115,1}},}, --1项
 			}, 30*24*3600, 1},
 	{1, 345, "Ngo筰 trang t誸 xu﹏",{
 			{{"Trang ph鬰 xu﹏ chu萵",{0,109,113,1}},{"Trang ph鬰 xu﹏ kh玦 ng�",{0,109,114,1}},{"Trang ph鬰 xu﹏ Ki襲 n�",{0,109,116,1}},{"Trang ph鬰 xu﹏ g頸 c秏",{0,109,115,1}},}, --1项
 			}, 0, 1},
 	{1, 345, "Ni猲 th�", {0, 105, 33, 1, 1, -1, -1, -1, -1, -1, -1}, 0},
  {1, 39, "Thi猲 Cang L謓h", {2, 95, 204, 1}, 0},
  {1, 47, "Йng Phng Long Ch﹗", {0, 102, 24, 1, 1, -1, -1, -1, -1, -1, -1}, 0},
}

tSTRING_NPC = "<color=green>B筩h ti猲 sinh: <color>"
tSTRING_TABLE = {
	[1] = "Trong th阨 gian event, ngi ch琲  nh薾 ph莕 thng cu鑙 trong ho箃 ng m鮪g t誸 xu﹏ c� th� nh薾 頲 ph莕 thng N╩ M韎 C竧 Tng t筰 B筩h Ti猲 Sinh. Ph莕 thng N╩ M韎 C竧 Tng ch� gi韎 h筺 trong <color=green>%d<color> ph莕.",
	[2] = "Nh薾 ph莕 thng n╩ m韎 c竧 tng",
	[3] = "Ki觤 tra s� qu� c遪 l筰",
	[4] = "L阨 ch骳 ph骳 t� thi猲 ch骯!",
	[5] = "Tho竧",
	[6] = "Ph莕 thng  ph竧 h誸 <color=green>%d<color> ph莕, th藅 ng ti誧, b筺  n tr�.",
	[7] = "Thi誹 hi謕 v蒼 ch璦 nh薾 ph莕 thng cu鑙 c馻 ho箃 ng t誸 xu﹏, s� lng hi謓 t筰  s� d鬾g 頲 <color=green>%d<color>/<color=green>%d<color>",
	[8] = "S� li謚 ghi nh薾 ch璦 n, h穣 quay l筰 sau.",
	[9] = "S� lng ph莕 thng c遪 l筰 <color=green>%d<color> ph莕.",
	[10] = "Xin ch骳 m鮪g <%s>  nh薾 頲 ph莕 qu� c bi謙 m颽 t誸 xu﹏, s� qu� c遪 l筰 <%d> ph莕.",
	[11] = "Thi誹 hi謕  nh薾 qu� t誸 xu﹏ c竧 tng n祔 r錳.",
}

VET_201112_CHUNJIE_TASK = TaskManager:Create(10,13)
VET_201112_CHUNJIE_TASK.FLAG = 1

---------------------------------
--interface table
--use "tinsert"
CHUNJIE_GETFINALAWARD = tSTRING_TABLE[2].."/get_201112_final_award";
CHUNJIE_GETUSENUM = tSTRING_TABLE[3].."/get_201112_usable_num";
CHUNJIE_EXIT = tSTRING_TABLE[5].."/do_nothing";
--for example :
--Include("this File")
function get_final_top()
	local tbSay = {};
	local nSaySize = 0;
	local szSayHead = "Ph骳 nh� Йng H秈 - Th� T� Nam S琻"
--	-----interface---------
--	local nStart = MkTime(2012,1,13,0,0,0);
--	local nEnd = MkTime(2012,1,16,0,0,0);
--	local nNowTime = GetTime();
--	if nNowTime >= nStart and nNowTime <= nEnd then
	local nDate = tonumber(date("%Y%m%d"))
 	if nDate >= 20120113 and nDate <= 20120115 then
		tinsert(tbSay,CHUNJIE_GETFINALAWARD);
		tinsert(tbSay,CHUNJIE_GETUSENUM);
		tinsert(tbSay,CHUNJIE_EXIT);
	else
		tinsert(tbSay,tSTRING_TABLE[4]);
	end

	nSaySize = getn(tbSay);
	Say(szSayHead, nSaySize, tbSay);
end
----------------------------------
function get_201112_final_award()
	if gf_CheckEventDateEx(51) ~= 1 then
		Talk(1,"","Event  h誸 h筺!")
		return 0;
	end
	local nStart = MkTime(2012,1,13,0,0,0);
	local nEnd = MkTime(2012,1,16,0,0,0);
	local nNowTime = GetTime();
	if nNowTime < nStart or nNowTime > nEnd then
		Talk(1,"","Event  h誸 h筺!")
		return 0;
	end	
	--访问共享数据库
	if GetGlbValue(g_201112_Globle_Value) == 0 then
		ApplyRelayShareData(Record_Struct.szKey,Record_Struct.nKey1,Record_Struct.nKey2,thisFilePath,"callback_modifydata")
	end
	-----------------
	local nPoint = GetGlbValue(g_201112_Globle_Value)
	if nPoint == 0 then return 0 end
	--是否超出了奖励数量
	if nPoint >= ACTIVIY_GOODS_NUM + 1 then
		Talk(1,"",tSTRING_NPC..format(tSTRING_TABLE[6],ACTIVIY_GOODS_NUM))
		return 0
	end
	--是否已领取终极奖励
	if GetTask(VET_201112_GET_TAG_TASKID) ~= 1 then
		Talk(1,"",tSTRING_NPC..format(tSTRING_TABLE[7],GetTask(VET_201112_USED_NUM_TASKID),CLASS_ACTIVITY.tbPrizeItemInfo[1].nItemUseTimesMax))
		return 0
	end
	--是否已经领取过
	if VET_201112_CHUNJIE_TASK:GetTask(VET_201112_CHUNJIE_TASK.FLAG) == 1 then
		Talk(1,"",tSTRING_NPC..tSTRING_TABLE[11])
		return 0
	end
	--背包空间
	if gf_Judge_Room_Weight(1,30," ") ~= 1 then
        Talk(1,"",tSTRING_NPC.."Kh玭g gian h祅h trang kh玭g ")
		return 0
  end
	--给奖励
	gf_EventGiveRandAward(VET_201112_CHUNJIE_AWARD,10000,1,"Hoat dong thang 1 nam 2012","a ph莕 thng T誸")
	SetGlbValue(g_201112_Globle_Value,nPoint+1)
	AddRelayShareData(Record_Struct.szKey,Record_Struct.nKey1,Record_Struct.nKey2, thisFilePath,"do_nothing",Record_Struct.nSortType,Record_Struct.itemkey,"d",nPoint+1)
	Msg2Global(format(tSTRING_TABLE[10],GetName(),ACTIVIY_GOODS_NUM-nPoint))
	VET_201112_CHUNJIE_TASK:SetTask(VET_201112_CHUNJIE_TASK.FLAG,1)
end

function get_201112_usable_num()
	if gf_CheckEventDateEx(51) ~= 1 then
		Talk(1,"","Event  h誸 h筺!")
		return 0;
	end
	local nStart = MkTime(2012,1,13,0,0,0);
	local nEnd = MkTime(2012,1,16,0,0,0);
	local nNowTime = GetTime();
	if nNowTime < nStart or nNowTime > nEnd then
		Talk(1,"","Event  h誸 h筺!")
		return 0;
	end
	--访问共享数据库
	if GetGlbValue(g_201112_Globle_Value) == 0 then
		ApplyRelayShareData(Record_Struct.szKey,Record_Struct.nKey1,Record_Struct.nKey2,thisFilePath,"callback_modifydata")
	end
	-----------------
	local nPoint = GetGlbValue(g_201112_Globle_Value)
	if nPoint == 0 then return 0 end
	Talk(1,"",tSTRING_NPC..format(tSTRING_TABLE[9],ACTIVIY_GOODS_NUM-nPoint+1))
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
	SetGlbValue(g_201112_Globle_Value,nPoint)
	--这里的Relay数据是随时变化的，所以要删除Gamesvr这边的副本记录
	DelRelayShareDataCopy(szKey, nKey1, nKey2)
end

function do_nothing()
end