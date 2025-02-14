--2012年8月素食盘活动
Include("\\script\\lib\\globalfunctions.lua")
Include("\\script\\misc\\taskmanager.lua") 
Include("\\script\\online\\zgc_public_fun.lua")
Include("\\script\\meridian\\meridian_script_api.lua")

VET_201209_ACITIVITY_ID = 73;

VET_201209_NPC = "<color=green>Ch� T鰑 L莡:<color>";

VET_201209_Say_Tb = {
	"T筰 h� mu鑞 ng g鉷 Nc Hoa Kh� 1 cho ch� em Ph� N� (ti猽 hao 25 Nc Hoa Kh� 1 + 25 V祅g)/send_one_201209",
	"T筰 h� mu鑞 ng g鉷 Nc Hoa Kh� 2 cho ch� em Ph� N� (ti猽 hao 25 Nc Hoa Kh� 2 + 25 V祅g)/send_two_201209",
	"T筰 h� mu鑞 ng g鉷 Nc Hoa Kh� 1 + Nc Hoa Kh� 2 cho ch� em Ph� N� (ti猽 hao 25 Nc Hoa Kh� 1 + 25 Nc Hoa Kh�  2 + 25 V祅g)/send_both_201209",
};

VET_201209_ExcAw_TaskGroup = TaskManager:Create(10,13);
VET_201209_ExcAw_TaskGroup.DaySeq = 1;
VET_201209_ExcAw_TaskGroup.Times1 = 2;
VET_201209_ExcAw_TaskGroup.Times2 = 3;
VET_201209_ExcAw_TaskGroup.Times3 = 4;

Max_Count_201209 = 8; --每天单项最多8次
Exp_Award_Normal1_201209 = 6500000;
Exp_Award_Normal2_201209 = 12000000;
Zhenqi_Award1_201209 = 10;
Zhenqi_Award2_201209 = 30;
Item_Count1_201209 = 25;
Item_Count2_201209 = 25;
Coin_Consume_201209 = 25;
Item_table1_201209 = {2,1,30444,"Nc Hoa Kh� 1"};
Item_table2_201209 = {2,1,30445,"Nc Hoa Kh� 2"};
Acitivity_log1_201209 = "Ho箃 ng ph� T誸 Ph� N�";
Acitivity_log2_201209 = "T苙g Nc Hoa Kh�";

strMsg2Player1_201209 = "T苙g Nc Hoa Kh� 1 %d/%d";
strMsg2Player2_201209 = "T苙g Nc Hoa Kh�2 %d/%d";
strMsg2Player3_201209 = "T╪g Nc Hoa Kh� 1 v� Nc Hoa Kh� 2 %d/%d";


--奖励表
Vet_201209_Award  = {
    {1, 1919, "Nh﹏ S﹎ V筺 N╩", {2, 1, 30071, 1}, 0},
    {1, 1502, "u h錸", {2, 1, 1157, 1}, 7 * 24 * 3600},
    {1, 2918, "Qu﹏ C玭g Chng", {2, 1, 9999, 1}, 7 * 24 * 3600},
    {1, 888, "Qu﹏ C玭g Чi", {2, 1, 9998, 1}, 7 * 24 * 3600},
    {1, 111, "Qu﹏ C玭g Huy Ho祅g", {2, 1, 9977, 1}, 7 * 24 * 3600},
    {1, 4, "M秐h B筩h Kim", {2, 1, 30346, 1}, 0},
    {3, 2658, 990000, 1},
};
Vet_201209_Award_Special  = {
    {1, 1919, "Nh﹏ S﹎ V筺 N╩", {2, 1, 30071, 2}, 0},
    {1, 1838, "u h錸", {2, 1, 1157, 1}, 7 * 24 * 3600},
    {1, 2525, "Qu﹏ C玭g Chng", {2, 1, 9999, 1}, 7 * 24 * 3600},
    {1, 522, "Qu﹏ C玭g Чi", {2, 1, 9998, 1}, 7 * 24 * 3600},
    {1, 200, "Qu﹏ C玭g Huy Ho祅g", {2, 1, 9977, 1}, 7 * 24 * 3600},
    {1, 333, "M秐h B筩h Kim", {2, 1, 30346, 1}, 0},
    {1, 15, "Чi мnh H錸 ", {2, 1, 1113, 1}, 7 * 24 * 3600},
    {3, 2525, 990000, 1},
    {3, 123, 9990000, 1},
};

function send_one_201209()
	if condition_check() == 0 then
		return 0;
	end

	if VET_201209_ExcAw_TaskGroup:GetTask(VET_201209_ExcAw_TaskGroup.Times1) >= Max_Count_201209 then
		Talk(1,"",VET_201209_NPC..format("M鏸 ng祔 m鏸 nh﹏ v藅 t鑙 產 ch� c� th� ho祅 th祅h<color=green>%d<color>l莕",Max_Count_201209));
		return 0;
	end

	if GetItemCount(Item_table1_201209[1],Item_table1_201209[2],Item_table1_201209[3]) < Item_Count1_201209 then
		Talk(1,"",VET_201209_NPC..format("S� lng %s trong h祅h trang kh玭g  <color=green>%d c竔 <color>",Item_table1_201209[4],Item_Count1_201209));
		return 0;
	end
	if GetCash() < Coin_Consume_201209*10000 then
		Talk(1,"",VET_201209_NPC..format("Trong h祅h trang kh玭g  s� lng v祅g<color=green>%d c竔 <color>",Coin_Consume_201209));
		return 0;
	end
	
	if DelItem(Item_table1_201209[1],Item_table1_201209[2],Item_table1_201209[3],Item_Count1_201209) ~= 1 then return 0; end
	if Pay(Coin_Consume_201209 * 10000) ~= 1 then return 0; end
	
	VET_201209_ExcAw_TaskGroup:SetTask(VET_201209_ExcAw_TaskGroup.Times1,VET_201209_ExcAw_TaskGroup:GetTask(VET_201209_ExcAw_TaskGroup.Times1)+1);
	
	if VET_201209_ExcAw_TaskGroup:GetTask(VET_201209_ExcAw_TaskGroup.Times1) == Max_Count_201209 then
		if MeridianGetLevel() < 1 then
			gf_Modify("Exp",Exp_Award_Normal1_201209 + 1000000);
			if GetTask(3052) < 2000 then
				gf_EventGiveRandAward(Vet_201209_Award,10000,1,Acitivity_log1_201209,Acitivity_log2_201209)
			else
				gf_EventGiveRandAward(Vet_201209_Award_Special,10000,1,Acitivity_log1_201209,Acitivity_log2_201209)
			end
		else
			gf_Modify("Exp",Exp_Award_Normal1_201209 - 1500000);
			AwardGenuineQi(Zhenqi_Award1_201209);
			if GetTask(3052) < 2000 then
				gf_EventGiveRandAward(Vet_201209_Award,10000,1,Acitivity_log1_201209,Acitivity_log2_201209)
			else
				gf_EventGiveRandAward(Vet_201209_Award_Special,10000,1,Acitivity_log1_201209,Acitivity_log2_201209)
			end
		end
	else
		gf_Modify("Exp",Exp_Award_Normal1_201209);
		if GetTask(3052) < 2000 then
		--	gf_EventGiveRandAward(Vet_201209_Award,10000,1,Acitivity_log1_201209,Acitivity_log2_201209)
		else
		--	gf_EventGiveRandAward(Vet_201209_Award_Special,10000,1,Acitivity_log1_201209,Acitivity_log2_201209)
		end
	end
	gf_WriteLogEx("HOAT DONG PHU THANG 10", "nh薾 th祅h c玭g", 1, "Ph莕 thng d遪g 1")
	Msg2Player(format(strMsg2Player1_201209, VET_201209_ExcAw_TaskGroup:GetTask(VET_201209_ExcAw_TaskGroup.Times1),Max_Count_201209));
end


function send_two_201209()
	if condition_check() == 0 then
		return 0;
	end

	if VET_201209_ExcAw_TaskGroup:GetTask(VET_201209_ExcAw_TaskGroup.Times2) >= Max_Count_201209 then
		Talk(1,"",VET_201209_NPC..format("M鏸 ng祔 m鏸 nh﹏ v藅 t鑙 產 ch� c� th� ho祅 th祅h<color=green>%d<color>l莕",Max_Count_201209));
		return 0;
	end

	if GetItemCount(Item_table2_201209[1],Item_table2_201209[2],Item_table2_201209[3]) < Item_Count2_201209 then
		Talk(1,"",VET_201209_NPC..format("S� lng %s trong h祅h trang kh玭g  <color=green>%d c竔 <color>",Item_table2_201209[4],Item_Count2_201209));
		return 0;
	end
	if GetCash() < Coin_Consume_201209*10000 then
		Talk(1,"",VET_201209_NPC..format("Trong h祅h trang kh玭g  s� lng v祅g<color=green>%d c竔 <color>",Coin_Consume_201209));
		return 0;
	end
	
	if DelItem(Item_table2_201209[1],Item_table2_201209[2],Item_table2_201209[3],Item_Count2_201209) ~= 1 then return 0; end
	if Pay(Coin_Consume_201209 * 10000) ~= 1 then return 0; end
	
	VET_201209_ExcAw_TaskGroup:SetTask(VET_201209_ExcAw_TaskGroup.Times2,VET_201209_ExcAw_TaskGroup:GetTask(VET_201209_ExcAw_TaskGroup.Times2)+1);
	
	if VET_201209_ExcAw_TaskGroup:GetTask(VET_201209_ExcAw_TaskGroup.Times2) == Max_Count_201209 then
		if MeridianGetLevel() < 1 then
			gf_Modify("Exp",Exp_Award_Normal1_201209 + 1000000);
			if GetTask(3053) < 2000 then
				gf_EventGiveRandAward(Vet_201209_Award,10000,1,Acitivity_log1_201209,Acitivity_log2_201209)
			else
				gf_EventGiveRandAward(Vet_201209_Award_Special,10000,1,Acitivity_log1_201209,Acitivity_log2_201209)
			end
		else
			gf_Modify("Exp",Exp_Award_Normal1_201209 - 1500000);
			AwardGenuineQi(Zhenqi_Award1_201209);
			if GetTask(3053) < 2000 then
				gf_EventGiveRandAward(Vet_201209_Award,10000,1,Acitivity_log1_201209,Acitivity_log2_201209)
			else
				gf_EventGiveRandAward(Vet_201209_Award_Special,10000,1,Acitivity_log1_201209,Acitivity_log2_201209)
			end
		end
	else
		gf_Modify("Exp",Exp_Award_Normal1_201209);
		if GetTask(3053) < 2000 then
		--	gf_EventGiveRandAward(Vet_201209_Award,10000,1,Acitivity_log1_201209,Acitivity_log2_201209)
		else
		--	gf_EventGiveRandAward(Vet_201209_Award_Special,10000,1,Acitivity_log1_201209,Acitivity_log2_201209)
		end
	end
	gf_WriteLogEx("HOAT DONG PHU THANG 10", "nh薾 th祅h c玭g", 1, "Ph莕 thng d遪g 2")
	Msg2Player(format(strMsg2Player2_201209, VET_201209_ExcAw_TaskGroup:GetTask(VET_201209_ExcAw_TaskGroup.Times2),Max_Count_201209));
end


function send_both_201209()
		if condition_check() == 0 then
		return 0;
	end

	if VET_201209_ExcAw_TaskGroup:GetTask(VET_201209_ExcAw_TaskGroup.Times3) >= Max_Count_201209 then
		Talk(1,"",VET_201209_NPC..format("M鏸 ng祔 m鏸 nh﹏ v藅 t鑙 產 ch� c� th� ho祅 th祅h<color=green>%d<color>l莕",Max_Count_201209));
		return 0;
	end
	
	if GetItemCount(Item_table1_201209[1],Item_table1_201209[2],Item_table1_201209[3]) < Item_Count1_201209 then
		Talk(1,"",VET_201209_NPC..format("S� lng %s trong h祅h trang kh玭g  <color=green>%d c竔 <color>",Item_table1_201209[4],Item_Count1_201209));
		return 0;
	end
	
	if GetItemCount(Item_table2_201209[1],Item_table2_201209[2],Item_table2_201209[3]) < Item_Count2_201209 then
		Talk(1,"",VET_201209_NPC..format("S� lng %s trong h祅h trang kh玭g  <color=green>%d c竔 <color>",Item_table2_201209[4],Item_Count2_201209));
		return 0;
	end
	
	if GetCash() < Coin_Consume_201209*10000 then
		Talk(1,"",VET_201209_NPC..format("Trong h祅h trang kh玭g  s� lng v祅g<color=green>%d c竔 <color>",Coin_Consume_201209));
		return 0;
	end
	
	if DelItem(Item_table1_201209[1],Item_table1_201209[2],Item_table1_201209[3],Item_Count1_201209) ~= 1 then return 0; end
	if DelItem(Item_table2_201209[1],Item_table2_201209[2],Item_table2_201209[3],Item_Count2_201209) ~= 1 then return 0; end
	if Pay(Coin_Consume_201209 * 10000) ~= 1 then return 0; end
	
	VET_201209_ExcAw_TaskGroup:SetTask(VET_201209_ExcAw_TaskGroup.Times3,VET_201209_ExcAw_TaskGroup:GetTask(VET_201209_ExcAw_TaskGroup.Times3)+1);
	
	if VET_201209_ExcAw_TaskGroup:GetTask(VET_201209_ExcAw_TaskGroup.Times3) == Max_Count_201209 then
		if MeridianGetLevel() < 1 then
			gf_Modify("Exp",Exp_Award_Normal2_201209 + 5500000);
			if GetTask(3052) < 2000 or GetTask(3053) < 2000 then
				gf_EventGiveRandAward(Vet_201209_Award,10000,1,Acitivity_log1_201209,Acitivity_log2_201209)
			else
				gf_EventGiveRandAward(Vet_201209_Award_Special,10000,1,Acitivity_log1_201209,Acitivity_log2_201209)
			end
		else
			gf_Modify("Exp",Exp_Award_Normal2_201209 - 2000000);
			AwardGenuineQi(Zhenqi_Award2_201209);
			if GetTask(3052) < 2000 or GetTask(3053) < 2000 then
				gf_EventGiveRandAward(Vet_201209_Award,10000,1,Acitivity_log1_201209,Acitivity_log2_201209)
			else
				gf_EventGiveRandAward(Vet_201209_Award_Special,10000,1,Acitivity_log1_201209,Acitivity_log2_201209)
			end
		end
	else
		gf_Modify("Exp",Exp_Award_Normal2_201209);
		if GetTask(3052) < 2000 or GetTask(3053) < 2000 then
		--	gf_EventGiveRandAward(Vet_201209_Award,10000,1,Acitivity_log1_201209,Acitivity_log2_201209)
		else
		--	gf_EventGiveRandAward(Vet_201209_Award_Special,10000,1,Acitivity_log1_201209,Acitivity_log2_201209)
		end
	end
	gf_WriteLogEx("HOAT DONG PHU THANG 10", "nh薾 th祅h c玭g", 1, "Ph莕 thng d遪g 3")	
	Msg2Player(format(strMsg2Player3_201209, VET_201209_ExcAw_TaskGroup:GetTask(VET_201209_ExcAw_TaskGroup.Times3),Max_Count_201209));
end

function condition_check()
	local nLevel = GetLevel();
	if nLevel < 79 or gf_Check55FullSkill() == 0 or GetPlayerFaction() == 0 then
		Talk(1,"",VET_201209_NPC.."Nh﹏ v藅 c蕄 <color=green>79<color> tr� l猲,  gia nh藀 m玭 ph竔 v� h鋍 頲 <color=green>1<color> k� n╪g c蕄 <color=green>55<color> m韎 c� th� tham gia");
		return 0;
	end	
	--判断背包空间
	if gf_Judge_Room_Weight(3,100," ") ~= 1 then
			Talk(1,"",VET_201209_NPC.."Kh玭g gian h祅h trang kh玭g ")
	    return 0
	end
	if VET_201209_ExcAw_TaskGroup:GetTask(VET_201209_ExcAw_TaskGroup.DaySeq) ~= zgc_pub_day_turn() then
		VET_201209_ExcAw_TaskGroup:SetTask(VET_201209_ExcAw_TaskGroup.DaySeq,zgc_pub_day_turn())
		VET_201209_ExcAw_TaskGroup:SetTask(VET_201209_ExcAw_TaskGroup.Times1,0)		
		VET_201209_ExcAw_TaskGroup:SetTask(VET_201209_ExcAw_TaskGroup.Times2,0)	
		VET_201209_ExcAw_TaskGroup:SetTask(VET_201209_ExcAw_TaskGroup.Times3,0)
	end
	return 1;
end