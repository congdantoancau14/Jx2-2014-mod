--2012年5月畅快暑假活动
Include("\\script\\lib\\globalfunctions.lua")
Include("\\script\\misc\\taskmanager.lua") 
Include("\\script\\online\\zgc_public_fun.lua")

VET_CKSJ_ACITIVITY_ID = 62;

VET_CKSJ_NPC = "<color=green>Thng Nh﹏ Th莕 B� :   <color>";

Vet_CKSJ_Say_Tb = {
	"T筰 h� mu鑞 i 25 Cocktail 7 m祏 l蕐 ph莕 thng (t鑞 25 V祅g)/exchange_qcjwj",
	"T筰 h� mu鑞 i 25 Tr竔 C﹜ p l筺h l蕐 ph莕 thng (t鑞 25 V祅g)/exchange_bdsg",
	"T筰 h� mu鑞 i c� 2 th� tr猲 l蕐 ph莕 thng (t鑞 25 V祅g)/exchange_both",
};

VET_201204_CKSJ_TaskGroup = TaskManager:Create(8,14);
VET_201204_CKSJ_TaskGroup.DaySeq = 1;
VET_201204_CKSJ_TaskGroup.Times1 = 2;
VET_201204_CKSJ_TaskGroup.Times2 = 3;
VET_201204_CKSJ_TaskGroup.Times3 = 4;

--externs task eq 2000
--don't modify
Vet_201204_Final_Tag1 = 2813;
Vet_201204_Final_Tag2 = 2814;

Max_Count = 8; --每天单项最多8次
Exp_Award_Normal1 = 6500000;
Exp_Award_Normal2 = 12000000;
Exp_Award_Final1 = 5000000;
Exp_Award_Final2 = 10000000;
Item_QCJWJ = 25;
Item_BDSG = 25;
Coin_Consume = 25;
--奖励表
Vet_201204_Award  = {
    {1, 1850, "Nh﹏ S﹎ V筺 N╩", {2, 1, 30071, 1}, 0},
    {1, 1502, "u h錸", {2, 1, 1157, 1}, 7 * 24 * 3600},
    {1, 2929, "Qu﹏ C玭g Chng", {2, 1, 9999, 1}, 7 * 24 * 3600},
    {1, 1010, "Qu﹏ C玭g Чi", {2, 1, 9998, 1}, 7 * 24 * 3600},
    {1, 51, "Qu﹏ C玭g Huy Ho祅g", {2, 1, 9977, 1}, 7 * 24 * 3600},
    {3, 2658, 990000, 1},
};
Vet_201204_Award_Final  = {
    {1, 18020, "Nh﹏ S﹎ V筺 N╩", {2, 1, 30071, 2}, 0},
    {1, 15020, "u h錸", {2, 1, 1157, 1}, 7 * 24 * 3600},
    {1, 38410, "Qu﹏ C玭g Chng", {2, 1, 9999, 1}, 7 * 24 * 3600},
    {1, 5218, "Qu﹏ C玭g Чi", {2, 1, 9998, 1}, 7 * 24 * 3600},
    {1, 2000, "Qu﹏ C玭g Huy Ho祅g", {2, 1, 9977, 1}, 7 * 24 * 3600},
    {1, 2, "M秐h B筩h Kim", {2, 1, 30346, 1}, 0},
    {3, 20330, 990000, 1},
    {3, 1000, 9990000, 1},
};

function exchange_qcjwj()
	local nLevel = GetLevel();
	if nLevel < 79 or gf_Check55HaveSkill() == 0 or GetPlayerFaction() == 0 then
		Talk(1,"",VET_CKSJ_NPC.."Nh﹏ v藅 c蕄 <color=green>79<color> tr� l猲,  gia nh藀 m玭 ph竔 v� h鋍 頲 <color=green>1<color> k� n╪g c蕄 <color=green>55<color> m韎 c� th� tham gia");
		return 0;
	end	
	--判断背包空间
	if IsPlayerDeath() ~= 0 then 
		Talk(1, "", "Hi謓 t筰 kh玭g th� nh薾 thng!!!")
		return 0
	end
	if gf_Judge_Room_Weight(2,100," ") ~= 1 then
			Talk(1,"",VET_CKSJ_NPC.."Kh玭g gian h祅h trang kh玭g ")
	    return 0
	end
	if VET_201204_CKSJ_TaskGroup:GetTask(VET_201204_CKSJ_TaskGroup.DaySeq) ~= zgc_pub_day_turn() then
		VET_201204_CKSJ_TaskGroup:SetTask(VET_201204_CKSJ_TaskGroup.DaySeq,zgc_pub_day_turn())
		VET_201204_CKSJ_TaskGroup:SetTask(VET_201204_CKSJ_TaskGroup.Times1,0)		
		VET_201204_CKSJ_TaskGroup:SetTask(VET_201204_CKSJ_TaskGroup.Times2,0)	
		VET_201204_CKSJ_TaskGroup:SetTask(VET_201204_CKSJ_TaskGroup.Times3,0)
	end
	if VET_201204_CKSJ_TaskGroup:GetTask(VET_201204_CKSJ_TaskGroup.Times1) >= 8 then
		Talk(1,"",VET_CKSJ_NPC..format("M鏸 ng祔 m鏸 gamer ch� giao n閜 t鑙 產 <color=green>%d<color>l莕",Max_Count));
		return 0;
	end
	if GetItemCount(2,1,30377) < Item_QCJWJ then
		Talk(1,"",VET_CKSJ_NPC..format("S� lng Cocktail 7 m祏 trong h祅h trang kh玭g <color=green>%d ly <color>",Item_QCJWJ));
		return 0;
	end
	if GetCash() < Coin_Consume*10000 then
		Talk(1,"",VET_CKSJ_NPC..format("Trong h祅h trang kh玭g  s� lng v祅g<color=green>%d c竔 <color>",Coin_Consume));
		return 0;
	end
	
	if DelItem(2,1,30377,Item_QCJWJ) ~= 1 then return 0; end
	if Pay(Coin_Consume*10000) ~= 1 then return 0; end
	
	VET_201204_CKSJ_TaskGroup:SetTask(VET_201204_CKSJ_TaskGroup.Times1,VET_201204_CKSJ_TaskGroup:GetTask(VET_201204_CKSJ_TaskGroup.Times1)+1);
	if VET_201204_CKSJ_TaskGroup:GetTask(VET_201204_CKSJ_TaskGroup.Times1) ~= 8 then
		gf_Modify("Exp",Exp_Award_Normal1);
	else
		gf_Modify("Exp",Exp_Award_Final1);
		if GetTask(Vet_201204_Final_Tag1) == 2000 then
			gf_EventGiveRandAward(Vet_201204_Award_Final,100000,1,"Ph莕 thng t鑙 產 M颽 H� S秐g Kho竔","Nh﹏ v藅 ch璦 s� d鬾g t鑙 產 ho箃 ng M颽 H� S秐g Kho竔")
		else
			gf_EventGiveRandAward(Vet_201204_Award,10000,1,"Ph莕 thng t鑙 產 M颽 H� S秐g Kho竔","Nh﹏ v藅 ch璦 s� d鬾g t鑙 產 ho箃 ng M颽 H� S秐g Kho竔")
		end
	end
	Msg2Player(format("Зy l� l莕 th� %d  b筺 s� d飊g Cocktail 7 m祏 l蕐 ph莕 thng",VET_201204_CKSJ_TaskGroup:GetTask(VET_201204_CKSJ_TaskGroup.Times1)))
end


function exchange_bdsg()
	local nLevel = GetLevel();
	if nLevel < 79 or gf_Check55HaveSkill() == 0 or GetPlayerFaction() == 0 then
		Talk(1,"",VET_CKSJ_NPC.."Nh﹏ v藅 c蕄 <color=green>79<color> tr� l猲,  gia nh藀 m玭 ph竔 v� h鋍 頲 <color=green>1<color> k� n╪g c蕄 <color=green>55<color> m韎 c� th� tham gia");
		return 0;
	end	
	--判断背包空间
	if IsPlayerDeath() ~= 0 then 
		Talk(1, "", "Hi謓 t筰 kh玭g th� nh薾 thng!!!")
		return 0
	end
	if gf_Judge_Room_Weight(2,100," ") ~= 1 then
			Talk(1,"",VET_CKSJ_NPC.."Kh玭g gian h祅h trang kh玭g ")
	    return 0
	end
	if VET_201204_CKSJ_TaskGroup:GetTask(VET_201204_CKSJ_TaskGroup.DaySeq) ~= zgc_pub_day_turn() then
		VET_201204_CKSJ_TaskGroup:SetTask(VET_201204_CKSJ_TaskGroup.DaySeq,zgc_pub_day_turn())
		VET_201204_CKSJ_TaskGroup:SetTask(VET_201204_CKSJ_TaskGroup.Times1,0)		
		VET_201204_CKSJ_TaskGroup:SetTask(VET_201204_CKSJ_TaskGroup.Times2,0)	
		VET_201204_CKSJ_TaskGroup:SetTask(VET_201204_CKSJ_TaskGroup.Times3,0)
	end
	if VET_201204_CKSJ_TaskGroup:GetTask(VET_201204_CKSJ_TaskGroup.Times2) >= 8 then
		Talk(1,"",VET_CKSJ_NPC..format("M鏸 ng祔 m鏸 gamer ch� giao n閜 t鑙 產 <color=green>%d<color>l莕",Max_Count));
		return 0;
	end
	if GetItemCount(2,1,30378) < Item_BDSG then
		Talk(1,"",VET_CKSJ_NPC..format("S� lng Tr竔 C﹜ p l筺h trong h祅h trang kh玭g  <color=green>%d tr竔 <color>",Item_BDSG));
		return 0;
	end
	if GetCash() < Coin_Consume*10000 then
		Talk(1,"",VET_CKSJ_NPC..format("Trong h祅h trang kh玭g  s� lng v祅g: <color=green>%d v祅g <color>",Coin_Consume));
		return 0;
	end
	
	if DelItem(2,1,30378,Item_BDSG) ~= 1 then return 0; end
	if Pay(Coin_Consume*10000) ~= 1 then return 0; end
	
	VET_201204_CKSJ_TaskGroup:SetTask(VET_201204_CKSJ_TaskGroup.Times2,VET_201204_CKSJ_TaskGroup:GetTask(VET_201204_CKSJ_TaskGroup.Times2)+1);
	if VET_201204_CKSJ_TaskGroup:GetTask(VET_201204_CKSJ_TaskGroup.Times2) ~= 8 then
		gf_Modify("Exp",Exp_Award_Normal1);
	else
		gf_Modify("Exp",Exp_Award_Final1);
		if GetTask(Vet_201204_Final_Tag2) == 2000 then
			gf_EventGiveRandAward(Vet_201204_Award_Final,100000,1,"Ph莕 thng t鑙 產 M颽 H� S秐g Kho竔","Nh﹏ v藅 ch璦 s� d鬾g t鑙 產 ho箃 ng M颽 H� S秐g Kho竔")
		else
			gf_EventGiveRandAward(Vet_201204_Award,10000,1,"Ph莕 thng t鑙 產 M颽 H� S秐g Kho竔","Nh﹏ v藅 ch璦 s� d鬾g t鑙 產 ho箃 ng M颽 H� S秐g Kho竔")
		end
	end
	Msg2Player(format("Зy l� l莕 th� %d  b筺 s� d飊g Tr竔 c﹜ p l筺h l蕐 ph莕 thng",VET_201204_CKSJ_TaskGroup:GetTask(VET_201204_CKSJ_TaskGroup.Times2)))
end


function exchange_both()
	local nLevel = GetLevel();
	if nLevel < 79 or gf_Check55HaveSkill() == 0 or GetPlayerFaction() == 0 then
		Talk(1,"",VET_CKSJ_NPC.."Nh﹏ v藅 c蕄 <color=green>79<color> tr� l猲,  gia nh藀 m玭 ph竔 v� h鋍 頲 <color=green>1<color> k� n╪g c蕄 <color=green>55<color> m韎 c� th� tham gia");
		return 0;
	end	
	--判断背包空间
	if IsPlayerDeath() ~= 0 then 
		Talk(1, "", "Hi謓 t筰 kh玭g th� nh薾 thng!!!")
		return
	end
	if gf_Judge_Room_Weight(2,100," ") ~= 1 then
			Talk(1,"",VET_CKSJ_NPC.."Kh玭g gian h祅h trang kh玭g ")
	    return 0
	end
	if VET_201204_CKSJ_TaskGroup:GetTask(VET_201204_CKSJ_TaskGroup.DaySeq) ~= zgc_pub_day_turn() then
		VET_201204_CKSJ_TaskGroup:SetTask(VET_201204_CKSJ_TaskGroup.DaySeq,zgc_pub_day_turn())
		VET_201204_CKSJ_TaskGroup:SetTask(VET_201204_CKSJ_TaskGroup.Times1,0)		
		VET_201204_CKSJ_TaskGroup:SetTask(VET_201204_CKSJ_TaskGroup.Times2,0)	
		VET_201204_CKSJ_TaskGroup:SetTask(VET_201204_CKSJ_TaskGroup.Times3,0)		
	end
	if VET_201204_CKSJ_TaskGroup:GetTask(VET_201204_CKSJ_TaskGroup.Times3) >= 8 then
		Talk(1,"",format("M鏸 ng祔 m鏸 gamer ch� giao n閜 t鑙 產<color=green>%d<color>l莕",Max_Count));
		return 0;
	end
	if GetItemCount(2,1,30377) < Item_QCJWJ then
		Talk(1,"",VET_CKSJ_NPC..format("S� lng Cocktail 7 m祏 trong h祅h trang kh玭g  <color=green>%d ly <color>",Item_QCJWJ));
		return 0;
	end
	if GetItemCount(2,1,30378) < Item_BDSG then
		Talk(1,"",VET_CKSJ_NPC..format("S� lng Tr竔 C﹜ p l筺h trong h祅h trang kh玭g  <color=green>%d tr竔 <color>",Item_BDSG));
		return 0;
	end
	if GetCash() < Coin_Consume*10000 then
		Talk(1,"",VET_CKSJ_NPC..format("Trong h祅h trang kh玭g  s� lng v祅g: <color=green>%d v祅g <color>",Coin_Consume));
		return 0;
	end
	
	if DelItem(2,1,30377,Item_QCJWJ) ~= 1 then return 0; end
	if DelItem(2,1,30378,Item_BDSG) ~= 1 then return 0; end
	if Pay(Coin_Consume*10000) ~= 1 then return 0; end
	
	VET_201204_CKSJ_TaskGroup:SetTask(VET_201204_CKSJ_TaskGroup.Times3,VET_201204_CKSJ_TaskGroup:GetTask(VET_201204_CKSJ_TaskGroup.Times3)+1);
	if VET_201204_CKSJ_TaskGroup:GetTask(VET_201204_CKSJ_TaskGroup.Times3) ~= 8 then
		gf_Modify("Exp",Exp_Award_Normal2);
	else
		gf_Modify("Exp",Exp_Award_Final2);
		if GetTask(Vet_201204_Final_Tag1) == 2000 and GetTask(Vet_201204_Final_Tag2) == 2000 then
			gf_EventGiveRandAward(Vet_201204_Award_Final,100000,1,"Ph莕 thng t鑙 產 M颽 H� S秐g Kho竔","Nh﹏ v藅 ch璦 s� d鬾g t鑙 產 ho箃 ng M颽 H� S秐g Kho竔")
		else
			gf_EventGiveRandAward(Vet_201204_Award,10000,1,"Ph莕 thng t鑙 產 M颽 H� S秐g Kho竔","Nh﹏ v藅 ch璦 s� d鬾g t鑙 產 ho箃 ng M颽 H� S秐g Kho竔")
		end
	end
	Msg2Player(format("Зy l� l莕 th� %d  b筺 s� d飊g Cocktail 7 m祏 v� Tr竔 c﹜ p l筺h l蕐 ph莕 thng",VET_201204_CKSJ_TaskGroup:GetTask(VET_201204_CKSJ_TaskGroup.Times3)))
end

