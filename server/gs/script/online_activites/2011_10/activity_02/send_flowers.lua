--by liubo
--送花活动脚本

Include("\\script\\lib\\globalfunctions.lua") --公共函数文件
Include("\\script\\misc\\taskmanager.lua") 

tSTRING_201111_ACTIVITY_TWO = {
	[1] = "T苙g hoa n c竎 v� s� ph� trong thi猲 h�",
	[2] = "Nh﹏ v藅 c蕄 77 tr� l猲,  h鋍 k� n╪g c蕄 55 m韎 c� th� tham gia ho箃 ng",
	[3] = "Thi誹 hi謕 ch� c� th� t苙g hoa <color=green>%d<color> l莕",
	[4] = "Hoa S琻 Tr� thi誹 hi謕 mang theo kh玭g  <color=green>%d<color> hoa",
	[5] = "Thao t竎 th蕋 b筰, h穣 th� l筰",
	[6] = "C竎 v� trng m玭  nh薾 頲 t蕀 l遪g th祅h c馻 c竎 h� r錳 (t╪g hoa l莕 %d)",
}

VET_201111_SENDFLOWER_ID = 43 --活动ID
VET_201111_SENDFLOWER_MAXTIMES = 6 --最大次数
VET_201111_SENDFLOWER_EXP = 2500000 --经验数量
VET_201111_SENDFLOWER_DELNUM  = 10  --扣除数量
--任务变量组
VET_201111_SEND_FLOWER = TaskManager:Create(2,21)
VET_201111_SEND_FLOWER.DaySeq = 1
VET_201111_SEND_FLOWER.Times = 2

function VET_201111_SendFlowerDialog(tbSayDialog, szSayHead)
	if gf_CheckEventDateEx(VET_201111_SENDFLOWER_ID) == 1 then
		tinsert(tbSayDialog, tSTRING_201111_ACTIVITY_TWO[1].."/send_flower")
	end
    return tbSayDialog, szSayHead 
end

function send_flower()
	local nLevel = GetLevel()
    if nLevel < 77  or gf_Check55HaveSkill() == 0 or GetPlayerFaction() == 0 then
		Talk(1,"",tSTRING_201111_ACTIVITY_TWO[2])
		return 0
	end
	if VET_201111_SEND_FLOWER:GetTask(VET_201111_SEND_FLOWER.DaySeq) ~= zgc_pub_day_turn() then
		VET_201111_SEND_FLOWER:SetTask(VET_201111_SEND_FLOWER.DaySeq,zgc_pub_day_turn())
		VET_201111_SEND_FLOWER:SetTask(VET_201111_SEND_FLOWER.Times,0)
	end
	if VET_201111_SEND_FLOWER:GetTask(VET_201111_SEND_FLOWER.Times) >= VET_201111_SENDFLOWER_MAXTIMES then
		Talk(1,"",format(tSTRING_201111_ACTIVITY_TWO[3],VET_201111_SENDFLOWER_MAXTIMES))
		return 0
	end
	if BigGetItemCount(2,1,30334) < 10 then
		Talk(1,"",format(tSTRING_201111_ACTIVITY_TWO[4],VET_201111_SENDFLOWER_DELNUM))
		return 0
	end
	if BigDelItem(2,1,30334,10) == 0 then
		Msg2Player(tSTRING_201111_ACTIVITY_TWO[5])
		return 0
	end
	VET_201111_SEND_FLOWER:SetTask(VET_201111_SEND_FLOWER.Times,VET_201111_SEND_FLOWER:GetTask(VET_201111_SEND_FLOWER.Times)+1)
	--gf_Modify("Exp",VET_201111_SENDFLOWER_EXP)
	ModifyExp(VET_201111_SENDFLOWER_EXP)
	WriteLogEx("Tang hoa Thay Co", " nh薾 頲 "..VET_201111_SENDFLOWER_EXP.."  甶觤 kinh nghi謒")
	Msg2Player("B筺 nh薾 頲 "..VET_201111_SENDFLOWER_EXP.."  甶觤 kinh nghi謒")
	Msg2Player(format(tSTRING_201111_ACTIVITY_TWO[6],VET_201111_SEND_FLOWER:GetTask(VET_201111_SEND_FLOWER.Times)))
end

--返回天数
function zgc_pub_day_turn(day_num)
	day_num = day_num or 1
	local time_return = floor((GetTime()-57600)/(86400*day_num))
	return time_return
end