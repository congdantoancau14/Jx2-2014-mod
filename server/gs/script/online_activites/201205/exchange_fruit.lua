--2012年6月切换水果活动
Include("\\script\\lib\\globalfunctions.lua")
Include("\\script\\misc\\taskmanager.lua") 
Include("\\script\\online\\zgc_public_fun.lua")

--	how to use
--	Include("\\script\\online_activites\\201205\\exchange_fruit.lua")
--	function main
--		local tbSay = {};
--		if gf_CheckEventDateEx(VET_201205_TMC_AcitivityID) == 1 then
--			for i=1,getn(VET_201205_TANGMINGCHENG_TABLE) do
--				tinsert(tbSay,VET_201205_TANGMINGCHENG_TABLE[i]);
--			end
--		end	
--		tinsert(tbSay,"以后再说/cancel");
--		Say("...",getn(tbSay),tbSay);
--	end

VET_201205_TMC_NPC = "<color=green>Л阯g Minh Th祅h: <color>";

VET_201205_TMC_AcitivityID = 65;

ZongZi_Num = 20;
Fruit_Num = 20;
Coin_Cost = 20;--金
Item_table1 = {2,1,30382,"B竛h � Tro"};
Item_table2 = {2,1,30383,"B竛h � Tro u п"};
Max_Exch_Num = 3;
AddItem_log1 = "Ho箃 ng th竛g 6 n╩ 2012";
AddItem_log2 = "фi Tr竔 C﹜";

VET_201205_TANGMINGCHENG_TABLE = {
	"T筰 h� mu鑞 i B竛h � Tro l蕐 ph莕 thng 20 Tr竔 C﹜ ng蓇 nhi猲  (ti猽 hao 20 B竛h � Tro +20 v祅g)/exchange_one",
	"T筰 h� mu鑞 i B竛h � Tro u п l蕐 ph莕 thng 20 Tr竔 C﹜ ng蓇 nhi猲  (ti猽 hao 20 B竛h � Tro u п +20 v祅g)/exchange_two",
}

VET_201205_TMC_TaskGroup = TaskManager:Create(1,22);
VET_201205_TMC_TaskGroup.DaySeq = 1;
VET_201205_TMC_TaskGroup.Times1 = 2;
VET_201205_TMC_TaskGroup.Times2 = 3;

VET_201205_TMC_AWARD1 = {
    {1, 5, "Nh穘", {2, 1, 30164, 1}, 0},
    {1, 5, "Ch玬 Ch玬", {2, 1, 30165, 1}, 0},
    {1, 15, "Cam", {2, 1, 30165, 1}, 0},
    {1, 5, "D鮝", {2, 1, 30167, 1}, 0},
    {1, 5, "M╪g C魌", {2, 1, 30168, 1}, 0},
    {1, 5, "M穘g c莡", {2, 1, 30179, 1}, 0},
    {1, 15, "Kh鉳", {2, 1, 30180, 1}, 0},
    {1, 15, "L�", {2, 1, 30181, 1}, 0},
    {1, 15, "B遪 Bon", {2, 1, 30182, 1}, 0},
    {1, 15, "Kh�", {2, 1, 30183, 1}, 0},
};

 
VET_201205_TMC_AWARD2 = {
    {1, 5, "Bi", {2, 1, 30169, 1}, 0},
    {1, 10, "D﹗", {2, 1, 30170, 1}, 0},
    {1, 15, "Chu鑙", {2, 1, 30171, 1}, 0},
    {1, 5, "Xo礽", {2, 1, 30172, 1}, 0},
    {1, 5, "Уo", {2, 1, 30173, 1}, 0},
    {1, 10, "M薾", {2, 1, 30174, 1}, 0},
    {1, 15, "V秈", {2, 1, 30175, 1}, 0},
    {1, 15, "T竜", {2, 1, 30176, 1}, 0},
    {1, 15, "B�", {2, 1, 30177, 1}, 0},
    {1, 5, " я", {2, 1, 30178, 1}, 0},
};


function condition_check()
	local nLevel = GetLevel();
	if nLevel < 79 or gf_Check55HaveSkill() == 0 or GetPlayerFaction() == 0 then
		Talk(1,"",VET_201205_TMC_NPC.."Nh﹏ v藅 c蕄 <color=green>79<color> tr� l猲,  gia nh藀 m玭 ph竔 v� h鋍 頲 <color=green>1<color> k� n╪g c蕄 <color=green>55<color> m韎 c� th� tham gia");
		return 0;
	end	
	--判断背包空间
	if gf_Judge_Room_Weight(10,20," ") ~= 1 then
			Talk(1,"",VET_201205_TMC_NPC.."Kh玭g gian h祅h trang kh玭g ")
	    return 0;
	end
	if VET_201205_TMC_TaskGroup:GetTask(VET_201205_TMC_TaskGroup.DaySeq) ~= zgc_pub_day_turn() then
		VET_201205_TMC_TaskGroup:SetTask(VET_201205_TMC_TaskGroup.DaySeq,zgc_pub_day_turn())
		VET_201205_TMC_TaskGroup:SetTask(VET_201205_TMC_TaskGroup.Times1,0)		
		VET_201205_TMC_TaskGroup:SetTask(VET_201205_TMC_TaskGroup.Times2,0)	
	end
	return 1;
end

function check_Item(Item_table)
	if Item_table == nil then return 0; end
	if GetItemCount(Item_table[1],Item_table[2],Item_table[3]) < ZongZi_Num then
		Talk(1,"",format("%s S� lng kh玭g  %d c竔",Item_table[4],ZongZi_Num));
		return 0;
	else
		if GetCash() < Coin_Cost*10000 then
			Talk(1,"",format("S� lng v祅g trong h祅h trang kh玭g %d",Coin_Cost))
			return 0;
		else
			if DelItem(Item_table[1],Item_table[2],Item_table[3],ZongZi_Num) ~= 1 then
				Msg2Player("Ch璦 r� nguy猲 nh﹏ thao t竎 kh玭g th� ho祅 th祅h")
				return 0;
			else
				if Pay(Coin_Cost*10000) ~= 1 then
					Msg2Player("Ch璦 r� nguy猲 nh﹏ thao t竎 kh玭g th� ho祅 th祅h")
					return 0;
				else
					return 1;
				end
			end
		end
	end
end

function exchange_one()
	if condition_check() == 0 then
		return 0;
	end
	if VET_201205_TMC_TaskGroup:GetTask(VET_201205_TMC_TaskGroup.Times1) >= Max_Exch_Num then
		Talk(1,"",VET_201205_TMC_NPC..format("M鏸 ng祔 m鏸 gamer ch� giao n閜 t鑙 產<color=green>%d<color>l莕",Max_Exch_Num));
		return 0;
	end
	if check_Item(Item_table1) ~= 1 then
		return 0;
	end
	VET_201205_TMC_TaskGroup:SetTask(VET_201205_TMC_TaskGroup.Times1,VET_201205_TMC_TaskGroup:GetTask(VET_201205_TMC_TaskGroup.Times1) + 1);
	for i = 1,Fruit_Num do 
		gf_EventGiveRandAward(VET_201205_TMC_AWARD1,100,1,AddItem_log1,AddItem_log2);
	end
	Msg2Player(format("C竎 h�  l莕 th� %d s� d鬾g %s i ph莕 thng r錳 ", VET_201205_TMC_TaskGroup:GetTask(VET_201205_TMC_TaskGroup.Times1),Item_table1[4]))
end

function exchange_two()
	if condition_check() == 0 then
		return 0;
	end
	if VET_201205_TMC_TaskGroup:GetTask(VET_201205_TMC_TaskGroup.Times2) >= Max_Exch_Num then
		Talk(1,"",VET_201205_TMC_NPC..format("M鏸 ng祔 m鏸 gamer ch� giao n閜 t鑙 產<color=green>%d<color>l莕",Max_Exch_Num));
		return 0;
	end
	if check_Item(Item_table2) ~= 1 then
		return 0;
	end
	VET_201205_TMC_TaskGroup:SetTask(VET_201205_TMC_TaskGroup.Times2,VET_201205_TMC_TaskGroup:GetTask(VET_201205_TMC_TaskGroup.Times2) + 1);
	for i = 1,Fruit_Num do 
		gf_EventGiveRandAward(VET_201205_TMC_AWARD2,100,1,AddItem_log1,AddItem_log2);
	end
	Msg2Player(format("C竎 h�  l莕 th� %d s� d鬾g %s i ph莕 thng r錳 ", VET_201205_TMC_TaskGroup:GetTask(VET_201205_TMC_TaskGroup.Times2),Item_table2[4]))
end