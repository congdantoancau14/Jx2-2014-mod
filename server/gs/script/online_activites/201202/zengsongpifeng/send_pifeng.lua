--by liubo 
--2012年3月国际妇女节副活动

Include("\\script\\lib\\globalfunctions.lua") --公共函数文件
Include("\\script\\misc\\taskmanager.lua") 
Include("\\script\\online\\zgc_public_fun.lua")

VET_201202_SENDPIFENG_ID = 57; 
VET_201202_SENDPIFENG_Exp1 = 2000000;
VET_201202_SENDPIFENG_Exp2 = 1000000;
VET_201202_SENDPIFENG_DelItemNum = 8;
VET_201202_SENDPIFENG_DelGold = 3; --消耗3J
VET_201202_SENDPIFENG_SendCount = 8;--8次

VET_201202_SENDPIFENG_TASK = TaskManager:Create(3,16);
VET_201202_SENDPIFENG_TASK.Num = 1;
VET_201202_SENDPIFENG_TASK.DaySeq = 2;

VET_201202_SENDPIFENG_AWARD1 = {
	  {1, 1850, "Nh﹏ S﹎ V筺 N╩", {2, 1, 30071, 1}, 0},
  	  {1, 1502, "u h錸", {2, 1, 1157, 1}, 7 * 24 * 3600},
    	  {1, 2929, "Qu﹏ C玭g Chng", {2, 1, 9999, 1}, 7 * 24 * 3600},
    	  {1, 1010, "Qu﹏ C玭g Чi", {2, 1, 9998, 1}, 7 * 24 * 3600},
	  {1, 51, "Qu﹏ C玭g Huy Ho祅g", {2, 1, 9977, 1}, 7 * 24 * 3600},
    	  {3, 2658, 830000, 1},
};

VET_201202_SENDPIFENG_AWARD2 = {
	{1, 18020, "Nh﹏ S﹎ V筺 N╩", {2, 1, 30071, 2}, 0},
    	{1, 15020, "u h錸", {2, 1, 1157, 1}, 7 * 24 * 3600},
	{1, 38410, "Qu﹏ C玭g Chng", {2, 1, 9999, 1}, 7 * 24 * 3600},
    	{1, 5218, "Qu﹏ C玭g Чi", {2, 1, 9998, 1}, 7 * 24 * 3600},
    	{1, 2000, "Qu﹏ C玭g Huy Ho祅g", {2, 1, 9977, 1}, 7 * 24 * 3600},
    	{1, 2, "M秐h B筩h Kim", {2, 1, 30346, 1}, 0},
    	{3, 20330, 830000, 1},
    	{3, 1000, 8300000, 1},
};

function main()
	local nDate =  tonumber(date("%y%m%d"))
	if nDate < 120312 or nDate > 120408 then
		Talk(1, "", "Х h誸 h筺 t苙g qu� cho ch� em Ph� N�!")
		return
	end
	local szName = "La Sa"
	local szHeader = "<color=green>"..szName.." :<color>Ch祇 m鮪g l� qu鑓 t� Ph� N� 8 - 3. B筺 h穣 t苙g qu� cho ch� em Ph� N�:"
	local tbSayDialog = {};
	local nSaySize = 0;

	tinsert(tbSayDialog, "Ta mu鑞 t苙g Phi Phong Ho祅g Kim cho ch� em Ph� N� (8 phi phong Ho祅g Kim + 3 v祅g/deal_send")
	tinsert(tbSayDialog, "Ta ch� gh� ngang/do_nothing")
	
	Say(szHeader, getn(tbSayDialog), tbSayDialog)		
	
end

function deal_send()
	local nLevel = GetLevel();
	if nLevel < 79 or gf_Check55HaveSkill() == 0 or GetPlayerFaction() == 0 then
		Talk(1,"","Nh﹏ v藅 c蕄 <color=green>79<color> tr� l猲,  gia nh藀 m玭 ph竔 v� h鋍 頲 <color=green>1<color> k� n╪g c蕄 <color=green>55<color> m韎 c� th� tham gia");
		return 0;
	end
	if VET_201202_SENDPIFENG_TASK:GetTask(VET_201202_SENDPIFENG_TASK.DaySeq) ~= zgc_pub_day_turn() then
		VET_201202_SENDPIFENG_TASK:SetTask(VET_201202_SENDPIFENG_TASK.DaySeq,zgc_pub_day_turn())
		VET_201202_SENDPIFENG_TASK:SetTask(VET_201202_SENDPIFENG_TASK.Num,0)
	end
	if VET_201202_SENDPIFENG_TASK:GetTask(VET_201202_SENDPIFENG_TASK.Num) >= VET_201202_SENDPIFENG_SendCount then
		Talk(1,"",format("M鏸 ng祔 gi韎 h筺 t苙g <color=green>%d<color> l莕 Ho祅g Kim Phi Phong",VET_201202_SENDPIFENG_SendCount));
		return 0;
	end
	if GetItemCount(2,1,30362) < VET_201202_SENDPIFENG_DelItemNum then 
		Talk(1,"",format("Phi Phong trong h祅h trang kh玭g  <color=green>%d<color>",VET_201202_SENDPIFENG_DelItemNum))
		return 0;
	end
	if GetCash() < VET_201202_SENDPIFENG_DelGold*10000 then
		Talk(1,"",format("Ti襫 v祅g trong h祅h trang kh玭g  <color=grenn>%d<color>",VET_201202_SENDPIFENG_DelGold))
		return 0;
	end
	if gf_Judge_Room_Weight(1,1," ") ~= 1 then
		Talk(1,"","Kh玭g gian h祅h trang kh玭g ")
    return 0
	end
	if DelItem(2,1,30362,VET_201202_SENDPIFENG_DelItemNum) ~= 1 then
		return 0
	end
	if Pay(VET_201202_SENDPIFENG_DelGold*10000) ~= 1 then
		return 0
	end
	VET_201202_SENDPIFENG_TASK:SetTask(VET_201202_SENDPIFENG_TASK.Num,VET_201202_SENDPIFENG_TASK:GetTask(VET_201202_SENDPIFENG_TASK.Num)+1);
	if VET_201202_SENDPIFENG_TASK:GetTask(VET_201202_SENDPIFENG_TASK.Num) == VET_201202_SENDPIFENG_SendCount then
		gf_Modify("Exp",VET_201202_SENDPIFENG_Exp2);
		--\script\misc\taskmanager.lua任务变量2783记录是否领取最终奖励
		if GetTask(2783) == 0 then
		 	gf_EventGiveRandAward(VET_201202_SENDPIFENG_AWARD1,10000,1,"QUOC TE PHU NU","Ph莕 thng t苙g qu� l莕 th� 8");
		else
			gf_EventGiveRandAward(VET_201202_SENDPIFENG_AWARD2,100000,1,"QUOC TE PHU NU","Ph莕 thng t苙g qu� l莕 th� 8");
		end		
	else
		gf_Modify("Exp",VET_201202_SENDPIFENG_Exp1);
	end
	Msg2Player(format("T蕋 c� ch� em ph� n� trong th祅h  nh薾 頲 qu� Qu鑓 T� Ph� N� c馻 b筺 r錳 (l莕 th� %d)",VET_201202_SENDPIFENG_TASK:GetTask(VET_201202_SENDPIFENG_TASK.Num)))
end
