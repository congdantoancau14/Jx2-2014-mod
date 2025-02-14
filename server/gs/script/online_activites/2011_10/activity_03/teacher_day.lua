--by liubo
--教师节活动

Include("\\script\\lib\\globalfunctions.lua") --公共函数文件
Include("\\script\\misc\\taskmanager.lua") 

VET_201111_TEACHER_DAY = TaskManager:Create(3,16)
VET_201111_TEACHER_DAY.LoginInTime = 1 --登录的时间  
VET_201111_TEACHER_DAY.Times = 2 --领取碎片的次数 
VET_201111_TEACHER_DAY.DaySeq = 3 --天次
VET_201111_TEACHER_DAY.TriggerIndex = 4 --触发器索引 
VET_201111_TEACHER_DAY.SpaceTime = 5 --累计在线时间 

VET_201111_MaxUsedCount = 10 --最大使用次数 -- 
VET_201111_LimitTime = 60*60 --领取时间  --

--登录触发器
VET_201111_TEACHER_DAY_TBID = 3004 --表内ID 
VET_201111_TEACHER_DAY_UFID = 2557 --自定义ID -
--时间触发器 -- 
VET_201111_TEACHER_DAY_TBID1 = 1515 
VET_201111_TEACHER_DAY_UFID1 = 2550

VET_201111_TEACHER_DAY_STRING = {
	[1] = "Th阨 gian online c馻 c竎 h� l� <color=green>%d<color>gi�<color=green>%d<color> ph髏<color=green>%d<color> gi﹜.",
	[2] = "Th阨 gian online c馻 c竎 h� l�<color=green>%d<color> gi�<color=green>%d<color> ph髏<color=green>%d<color> gi﹜. \nTh阨 gian online c� th� s� d鬾g c遪 l筰<color=green>%d<color> gi�<color=green>%d<color> ph髏<color=green>%d<color> gi﹜.",
	[3] = "Nh﹏ v藅 t c蕄<color=green>79<color> tr� l猲,  gia nh藀 m玭 ph竔 v� h鋍 頲 k� n╪g c蕄 55 m韎 c� th� tham gia event.",
	[4] = "M鏸 ng祔 m鏸 ngi ch琲 gi韎 h筺 nh薾 頲 M秐h Gh衟 l� <color=green>10<color> m秐h.",
	[5] = "Th阨 gian tich l?y c遪 l筰 c馻 c竎 h� ch璦  1 gi�, t筸 th阨 ch璦 th� nh薾 th猰.",
	[6] = "H祅h trang c馻 i hi謕 kh玭g  ch� tr鑞g ho芻 s鴆 l鵦 kh玭g , xin h穣 s緋 x誴 l筰 h祅h trang!",
	[7] = "[Event]: evnet nh� gi竜 th竛g 11 n╩ 2011 s� m秐h gh衟 ng蓇 nhi猲 d� thng.",
	[8] = "S� lng m秐h 慣玭� kh玭g ",
	[9] = "S� lng m秐h 慡瓛 kh玭g ",
	[10] = "S� lng m秐h 慣r鋘g� kh玭g ",
	[11] = "S� lng m秐h 懅筼� kh玭g ",
	[12] = "[Event]: B秓 Rng Tri  gia t╪g th蕋 b筰",
}

--11月教师节活动，尊师重道 -- 
function check_onlinetime()
	local nTime = GetTime()
	--不累计跨天在线时间
	if VET_201111_TEACHER_DAY:GetTask(VET_201111_TEACHER_DAY.DaySeq) ~= zgc_pub_day_turn() then
		VET_201111_TEACHER_DAY:SetTask(VET_201111_TEACHER_DAY.LoginInTime,nTime)
		VET_201111_TEACHER_DAY:SetTask(VET_201111_TEACHER_DAY.DaySeq,zgc_pub_day_turn())
		VET_201111_TEACHER_DAY:SetTask(VET_201111_TEACHER_DAY.Times,0)
		VET_201111_TEACHER_DAY:SetTask(VET_201111_TEACHER_DAY.SpaceTime,0)
	end	
	local nLoginTime = VET_201111_TEACHER_DAY:GetTask(VET_201111_TEACHER_DAY.LoginInTime)
	local nOnlineTime = VET_201111_TEACHER_DAY:GetTask(VET_201111_TEACHER_DAY.SpaceTime)
	local nUseTime = VET_201111_TEACHER_DAY:GetTask(VET_201111_TEACHER_DAY.Times) * VET_201111_LimitTime
	local hour1,minute1,second1 = format_time(nTime - nLoginTime + nOnlineTime)
	local hour2,minute2,second2 = format_time(nTime - nLoginTime + nOnlineTime - nUseTime)
	local nLevel = GetLevel()
	if nLevel < 79 or gf_Check55MaxSkill() == 0 or GetPlayerFaction() == 0 then
		Talk(1,"",format(VET_201111_TEACHER_DAY_STRING[1],hour1,minute1,second1))
	else
		Talk(1,"",format(VET_201111_TEACHER_DAY_STRING[2],hour1,minute1,second1,hour2,minute2,second2))
	end
end

function exchang_chip()
	local nTime = GetTime()
	--对象限制
	local nLevel = GetLevel()
	if nLevel < 79 or gf_Check55MaxSkill() == 0  or GetPlayerFaction() == 0 then
		Talk(1,"",VET_201111_TEACHER_DAY_STRING[3])
		return 0
	end
	--领取次数限制
	if VET_201111_TEACHER_DAY:GetTask(VET_201111_TEACHER_DAY.DaySeq) ~= zgc_pub_day_turn() then
		VET_201111_TEACHER_DAY:SetTask(VET_201111_TEACHER_DAY.LoginInTime,nTime)
		VET_201111_TEACHER_DAY:SetTask(VET_201111_TEACHER_DAY.DaySeq,zgc_pub_day_turn())
		VET_201111_TEACHER_DAY:SetTask(VET_201111_TEACHER_DAY.Times,0)
		VET_201111_TEACHER_DAY:SetTask(VET_201111_TEACHER_DAY.SpaceTime,0)
	end
	if VET_201111_TEACHER_DAY:GetTask(VET_201111_TEACHER_DAY.Times) >= VET_201111_MaxUsedCount then
		Talk(1,"",VET_201111_TEACHER_DAY_STRING[4])
		return 0
	end
	--时间是否满足
	if nTime - VET_201111_TEACHER_DAY:GetTask(VET_201111_TEACHER_DAY.LoginInTime) + VET_201111_TEACHER_DAY:GetTask(VET_201111_TEACHER_DAY.SpaceTime) - VET_201111_TEACHER_DAY:GetTask(VET_201111_TEACHER_DAY.Times) * VET_201111_LimitTime < VET_201111_LimitTime then
		Talk(1,"",VET_201111_TEACHER_DAY_STRING[5])
		return 0
	end
	--背包空间
	if gf_Judge_Room_Weight(1,1,"") == 0 then
		Talk(1,"",VET_201111_TEACHER_DAY_STRING[6])
		return 0
	end
	--领取次数加1
	VET_201111_TEACHER_DAY:SetTask(VET_201111_TEACHER_DAY.Times,VET_201111_TEACHER_DAY:GetTask(VET_201111_TEACHER_DAY.Times)+1)
	--随机给碎片
	local num = random(400)
	if mod(num,4) == 1 then
		--gf_AddItemEx({2,1,30335,1},"T玭",1)
		gf_AddItemEx2({2,1,30335,1},"T玭", "Ton Su Trong Dao", "nhan Ton")
	elseif mod(num,4) == 2 then
		--gf_AddItemEx({2,1,30336,1},"S�",1)
		gf_AddItemEx2({2,1,30336,1},"S�", "Ton Su Trong Dao", "nhan Su")
	elseif mod(num,4) == 3 then
		--gf_AddItemEx({2,1,30337,1},"Tr鋘g",1)
		gf_AddItemEx2({2,1,30337,1},"Tr鋘g", "Ton Su Trong Dao", "nhan Trong")
	elseif mod(num,4) == 0 then
		--gf_AddItemEx({2,1,30338,1},"Чo",1)
		gf_AddItemEx2({2,1,30338,1},"Чo", "Ton Su Trong Dao", "nhan Dao")
	else
		WriteLog(VET_201111_TEACHER_DAY_STRING[7])
	end
end

function exchang_zhienbaoxiang()
	--对象限制
	local nLevel = GetLevel()
	if nLevel < 79 or gf_Check55MaxSkill() == 0  or GetPlayerFaction() == 0 then
		Talk(1,"",VET_201111_TEACHER_DAY_STRING[3])
		return 0
	end
	if BigGetItemCount(2,1,30335) < 1 then
		Talk(1,"",VET_201111_TEACHER_DAY_STRING[8])
		return 0
	end
	if BigGetItemCount(2,1,30336) < 1 then
		Talk(1,"",VET_201111_TEACHER_DAY_STRING[9])
		return 0
	end
	if BigGetItemCount(2,1,30337) < 1 then
		Talk(1,"",VET_201111_TEACHER_DAY_STRING[10])
		return 0
	end
	if BigGetItemCount(2,1,30338) < 1 then
		Talk(1,"",VET_201111_TEACHER_DAY_STRING[11])
		return 0
	end
	BigDelItem(2,1,30335,1)
	BigDelItem(2,1,30336,1)
	BigDelItem(2,1,30337,1)
	BigDelItem(2,1,30338,1)
	local res,index = gf_AddItemEx2({2,1,30339,1},"B秓 Rng Tri ", "Ton Su Trong Dao", "nhan Bao Ruong") --gf_AddItemEx({2,1,30339,1},"B秓 Rng Tri ",1)
	if res == 0 then
	--	print("writelog")
		WriteLog(VET_201111_TEACHER_DAY_STRING[12])
	end
end

function format_time(nSecond)
	if nSecond < 0 then
		return 0,0,0
	end
	local hour,minute,second
	hour = floor(nSecond / 3600)
	minute = floor((nSecond - hour*3600)/ 60)
	second = nSecond - minute*60 - hour*3600
	return hour,minute,second
end

--返回天数
function zgc_pub_day_turn(day_num)
	day_num = day_num or 1
	local time_return = floor((GetTime()-57600)/(86400*day_num))
	return time_return
end

--登出
function Leave_Game()
	local nTime = GetTime()
	VET_201111_TEACHER_DAY:SetTask(VET_201111_TEACHER_DAY.SpaceTime,VET_201111_TEACHER_DAY:GetTask(VET_201111_TEACHER_DAY.SpaceTime)+(nTime-VET_201111_TEACHER_DAY:GetTask(VET_201111_TEACHER_DAY.LoginInTime)))
	local nIndex1 = VET_201111_TEACHER_DAY:GetTask(VET_201111_TEACHER_DAY.TriggerIndex)
	if nIndex1 ~= 0 then
		RemoveTrigger(nIndex1)
	end
	local nIndex2 = GetTrigger(VET_201111_TEACHER_DAY_UFID1)
	if nIndex2 ~= 0 then
		RemoveTrigger(nIndex2)
	end
end

function OnTimer()
	--do return end
	if VET_201111_TEACHER_DAY:GetTask(VET_201111_TEACHER_DAY.DaySeq) ~= zgc_pub_day_turn() then
		local nTime = GetTime()
		VET_201111_TEACHER_DAY:SetTask(VET_201111_TEACHER_DAY.SpaceTime,VET_201111_TEACHER_DAY:GetTask(VET_201111_TEACHER_DAY.SpaceTime)+(nTime-VET_201111_TEACHER_DAY:GetTask(VET_201111_TEACHER_DAY.LoginInTime)))
		VET_201111_TEACHER_DAY:SetTask(VET_201111_TEACHER_DAY.LoginInTime,nTime)
		VET_201111_TEACHER_DAY:SetTask(VET_201111_TEACHER_DAY.DaySeq,zgc_pub_day_turn())
		VET_201111_TEACHER_DAY:SetTask(VET_201111_TEACHER_DAY.Times,0)
		VET_201111_TEACHER_DAY:SetTask(VET_201111_TEACHER_DAY.SpaceTime,0)
	end
end