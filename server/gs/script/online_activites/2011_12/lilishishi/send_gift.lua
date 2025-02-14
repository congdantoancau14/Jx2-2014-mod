--by liubo
--新年利利是是活动脚本

Include("\\script\\lib\\globalfunctions.lua") --公共函数文件
Include("\\script\\misc\\taskmanager.lua")
Include("\\script\\online\\zgc_public_fun.lua")

VET_201112_LILISHISHI_ID = 52 --活动ID
VET_201112_LILISHISHI_MAXTIMES = 8 --最大次数
VET_201112_LILISHISHI_EXP = 2500000 --经验数量
VET_201112_LILISHISHI_DELNUM  = 10  --扣除数量
VET_201112_LILISHISHI_MAXEXP = 20000000
--任务变量组
VET_201112_LILISHISHI = TaskManager:Create(7,12)
VET_201112_LILISHISHI.DaySeq = 1
VET_201112_LILISHISHI.Times = 2

VET_201112_LILISHISHI_AWARD = {
	  {1, 1250, "C﹜ T� Linh", {2, 1, 30269, 1}, 7 * 24 * 3600},
    {1, 1250, "C﹜ B竧 Nh�", {2, 0, 398, 1}, 7 * 24 * 3600},
    {1, 2000, "C﹜ B竧 Nh� nh�", {2, 0, 504, 1}, 7 * 24 * 3600},
    {1, 1000, " я", {2, 1, 30178, 10}, 0},
    {1, 1000, "Xo礽", {2, 1, 30172, 10}, 0},
    {3, 3500, 680000, 1},
}

tSTRING_201112_ACTIVITY_TB = {
	[1] = "Ta mu鑞 t苙g l� x� cho c竎 em nh� trong th祅h",
	[2] = "Nh﹏ v藅 c蕄 79 tr� l猲,  gia nh藀 m玭 ph竔 v� h鋍 頲 1 k� n╪g c蕄 55 m韎 c� th� tham gia",
	[3] = "M鏸 ng祔 thi誹 hi謕 ch� c� th� t苙g <color=green>%d<color> l莕",
	[4] = "L� x� trong h祅h trang thi誹 hi謕 kh玭g  <color=green>%d<color>",
	[5] = "Thao t竎 th蕋 b筰, h穣 th� l筰",
	[6] = "Ta s� chuy觧 t蕀 l遪g th祅h c馻 thi誹 hi謕 n c竎 em nh� trong th祅h th� (L莕 %d)",
	[7] = "Kh玭g c莕 u",
}

----------------------------------------
--interface for vn
VET_201112_SENDGIFT_TABLE = tSTRING_201112_ACTIVITY_TB[1].."/send_gift";
VET_201112_SENDGIFT_EXIT = tSTRING_201112_ACTIVITY_TB[7].."/do_nothing";
--example:
--Include("this File")
function send_gift()
	local tbSay = {};
	local nSaySize = 0;
	local szSayHead = "L� X� n╩ m韎"
	local nDate = tonumber(date("%Y%m%d"))
 	if nDate >= 20120123 and nDate <= 20120201 then
		tinsert(tbSay,"уng �/send_gift_accept");
		tinsert(tbSay,VET_201112_SENDGIFT_EXIT);		--[Optional]
	end
	nSaySize = getn(tbSay);
	Say(szSayHead, nSaySize, tbSay);
end
----------------------------------------



function send_gift_accept()
	if gf_CheckEventDateEx(VET_201112_LILISHISHI_ID) ~= 1 then
		Talk(1,"","Event  h誸 h筺!")
		return 0;
	end
	local nLevel = GetLevel()
    if nLevel < 79  or gf_Check55HaveSkill() == 0 or GetPlayerFaction() == 0 then
		Talk(1,"",tSTRING_201112_ACTIVITY_TB[2])
		return 0
	end
	if VET_201112_LILISHISHI:GetTask(VET_201112_LILISHISHI.DaySeq) ~= zgc_pub_day_turn() then
		VET_201112_LILISHISHI:SetTask(VET_201112_LILISHISHI.DaySeq,zgc_pub_day_turn())
		VET_201112_LILISHISHI:SetTask(VET_201112_LILISHISHI.Times,0)
	end
	if VET_201112_LILISHISHI:GetTask(VET_201112_LILISHISHI.Times) * VET_201112_LILISHISHI_EXP >= VET_201112_LILISHISHI_MAXEXP then
		Talk(1,"","Thi誹 hi謕  nh薾  甶觤 L� X� trong ng祔 h玬 nay, vui l遪g quay l筰 v祇 ng祔 mai!")
		return 0
	end
	if VET_201112_LILISHISHI:GetTask(VET_201112_LILISHISHI.Times) >= VET_201112_LILISHISHI_MAXTIMES then
		Talk(1,"",format(tSTRING_201112_ACTIVITY_TB[3],VET_201112_LILISHISHI_MAXTIMES))
		return 0
	end
	if GetItemCount(2,1,30355) < 10 then
		Talk(1,"",format(tSTRING_201112_ACTIVITY_TB[4],VET_201112_LILISHISHI_DELNUM))
		return 0
	end
	if gf_Judge_Room_Weight(1,10," ") ~= 1 then
		Talk(1,"",tSTRING_MR_WHITE_NPC.."Kh玭g gian h祅h trang kh玭g ")
        return 0
	end
	if DelItem(2,1,30355,10) == 0 then
		Msg2Player(tSTRING_201112_ACTIVITY_TB[5])
		return 0
	end
	VET_201112_LILISHISHI:SetTask(VET_201112_LILISHISHI.Times,VET_201112_LILISHISHI:GetTask(VET_201112_LILISHISHI.Times)+1)
	gf_Modify("Exp",VET_201112_LILISHISHI_EXP)
	if VET_201112_LILISHISHI:GetTask(VET_201112_LILISHISHI.Times) == VET_201112_LILISHISHI_MAXTIMES then
		gf_EventGiveRandAward(VET_201112_LILISHISHI_AWARD,10000,1,"Hoat dong thang 1 nam 2012","L莕 t苙g qu� th� 8 nh薾 頲 ph莕 thng")
	end
	Msg2Player(format(tSTRING_201112_ACTIVITY_TB[6],VET_201112_LILISHISHI:GetTask(VET_201112_LILISHISHI.Times)))
end

function do_nothing()
end