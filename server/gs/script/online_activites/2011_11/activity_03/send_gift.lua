--by liubo
--圣诞节送礼活动脚本

Include("\\script\\lib\\globalfunctions.lua") --公共函数文件
Include("\\script\\misc\\taskmanager.lua") 
Include("\\script\\online\\zgc_public_fun.lua")
Include("\\script\\online_activites\\2011_11\\string.lua")
tSTRING_201111_ACTIVITY_TB = {
	[1] = "Ta mu鑞 t苙g qu� cho c竎 em nh� trong th祅h th�",
	[2] = "Nh﹏ v藅 c蕄 79 tr� l猲,  h鋍 k� n╪g c蕄 55 m韎 c� th� tham gia ho箃 ng",
	[3] = "C竎 h� ch� 頲 t苙g qu� t鑙 產 <color=green>%d<color> l莕 m鏸 ng祔",
	[4] = "H閜 qu� trong h祅h trang c竎 h� kh玭g  <color=green>%d<color>",
	[5] = "Thao t竎 th蕋 b筰, h穣 th� l筰",
	[6] = "Ta s� chuy觧 t蕀 l遪g th祅h c馻 thi誹 hi謕 n c竎 em nh� trong th祅h th� (L莕 %d)",
	[7] = "Чi hi謕  s� d鬾g h誸 甶觤 trong ng祔 h玬 nay, vui l遪g quay l筰 v祇 ng祔 mai!!!"
}

VET_201111_SHENGDANGIFT_AWARD = {
    {1, 25, "Tu Ch﹏ Y誹 Quy誸", {2, 0, 554, 1}, 7 * 24 * 3600},
    {1, 10, "C﹜ T� Linh", {2, 1, 30269, 1}, 7 * 24 * 3600},
    {1, 20, "C﹜ B竧 Nh� nh�", {2, 0, 504, 1}, 7 * 24 * 3600},
    {1, 10, "C﹜ B竧 Nh�", {2, 0, 398, 1}, 7 * 24 * 3600},
    {1, 10, " я", {2, 1, 30178, 12}, 0},
    {3, 25, 60000, 1},
};

VET_201111_SHENGDANGIFT_ID = 49 --活动ID
VET_201111_SHENGDANGIFT_MAXTIMES = 6 --最大次数
VET_201111_SHENGDANGIFT_EXP = 2500000 --经验数量
VET_201111_SHENGDANGIFT_DELNUM  = 10  --扣除数量
--任务变量组
VET_201111_SHENGDANGIFT = TaskManager:Create(4,13)
VET_201111_SHENGDANGIFT.DaySeq = 1
VET_201111_SHENGDANGIFT.Times = 2

function VET_201111_ShengdanGiftDialog(tbSayDialog, szSayHead)
	if gf_CheckEventDateEx(VET_201111_SHENGDANGIFT_ID) == 1 then
		tinsert(tbSayDialog, tSTRING_201111_ACTIVITY_TB[1].."/send_gift")
	end
    return tbSayDialog, szSayHead 
end

function send_gift()
	local nLevel = GetLevel()
	local nMax_Exp = 15000000
    if nLevel < 79  or gf_Check55HaveSkill() == 0 or GetPlayerFaction() == 0 then
		Talk(1,"",tSTRING_201111_ACTIVITY_TB[2])
		return 0
	end
	if VET_201111_SHENGDANGIFT:GetTask(VET_201111_SHENGDANGIFT.DaySeq) ~= zgc_pub_day_turn() then
		VET_201111_SHENGDANGIFT:SetTask(VET_201111_SHENGDANGIFT.DaySeq,zgc_pub_day_turn())
		VET_201111_SHENGDANGIFT:SetTask(VET_201111_SHENGDANGIFT.Times,0)
	end
	if VET_201111_SHENGDANGIFT:GetTask(VET_201111_SHENGDANGIFT.Times) >= VET_201111_SHENGDANGIFT_MAXTIMES then
		Talk(1,"",format(tSTRING_201111_ACTIVITY_TB[3],VET_201111_SHENGDANGIFT_MAXTIMES))
		return 0
	end
	if VET_201111_SHENGDANGIFT:GetTask(VET_201111_SHENGDANGIFT.Times) *  VET_201111_SHENGDANGIFT_EXP >= nMax_Exp then
		Talk(1,"",tSTRING_201111_ACTIVITY_TB[7])
		return 0
	end
	if GetItemCount(2,1,30349) < 10 then
		Talk(1,"",format(tSTRING_201111_ACTIVITY_TB[4],VET_201111_SHENGDANGIFT_DELNUM))
		return 0
	end
	if gf_Judge_Room_Weight(1,10," ") ~= 1 then
		Talk(1,"",tSTRING_MR_WHITE_NPC..tSTRING_201111_TABLE[3])
        return 0
	end
	if DelItem(2,1,30349,10) == 0 then
		Msg2Player(tSTRING_201111_ACTIVITY_TB[5])
		return 0
	end
	VET_201111_SHENGDANGIFT:SetTask(VET_201111_SHENGDANGIFT.Times,VET_201111_SHENGDANGIFT:GetTask(VET_201111_SHENGDANGIFT.Times)+1)
	ModifyExp(VET_201111_SHENGDANGIFT_EXP)
	Msg2Player("B筺 nh薾 頲 "..VET_201111_SHENGDANGIFT_EXP.." 甶觤 kinh nghi謒")
	gf_WriteLogEx("Tang qua noel" ,"nh薾 2500000 甶觤 kinh nghi謒")
	if VET_201111_SHENGDANGIFT:GetTask(VET_201111_SHENGDANGIFT.Times) == VET_201111_SHENGDANGIFT_MAXTIMES then
		gf_EventGiveRandAward(VET_201111_SHENGDANGIFT_AWARD,100,1,"Tang qua noel","T苙g qu� l莕 th� 6 nh薾 頲 ph莕 thng")
	end
	Msg2Player(format(tSTRING_201111_ACTIVITY_TB[6],VET_201111_SHENGDANGIFT:GetTask(VET_201111_SHENGDANGIFT.Times)))
end
