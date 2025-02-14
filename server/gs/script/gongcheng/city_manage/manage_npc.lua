-- 攻城战城市管理NPC

Include("\\script\\online\\zgc_public_fun.lua")
Include("\\script\\gongcheng\\city_manage\\manage_head.lua")
Include("\\script\\lib\\writelog.lua");

function get_tong_sex_name()
	local sex_name = ""
	if GetSex() == 1 then
		sex_name = "Th祅h Ch�"
	else
		sex_name = "Qu薾 Ch骯 "
	end
	return sex_name
end

function deal_abnormal()
	-- 去Relay上看看有没有
	local nMapID = GetWorldPos()
	ApplyRelayShareData("_TongCityWar", 0, nMapID, "\\script\\gongcheng\\city_manage\\manage_npc.lua", "cb_citywar")
end

function cb_citywar(szKey, nKey1, nKey2, nCount)
	if szKey == "_TongCityWar" then
		-- Relay上有数据的,那么就直接构建城市信息吧
		BuildCityWarData(szKey, nKey1, nKey2)
		main()
	else
		-- Relay上没有了就真的没有了
		Say("Th祅h n祔 hi謓 ch璦 c� bang h閕 chi誱 l躰h", 
			3, 
			"Gi韎 thi謚 Qu秐 l� th祅h th�/jieshao_city", 
			"\nNhi謒 v� H錳 Phong tr筰/tongcitywar_task", 
--			"Thu h錳 trang b� x璶g hi謚/shou_zhuang", 
			"R阨 kh醝/no_say")
	end
end

function main()
	local nMapID = GetWorldPos()
	local szTongName, nCessBuysell, nCessStore, nTime = GetCityWarInfo(nMapID, "base")
	local nCount, szBoss = GetCityWarInfo(nMapID, "boss")
	local _, szManager = GetCityWarInfo(nMapID, "manager")
	if szTongName == nil then
		deal_abnormal()
		return
	end
	if szTongName == "" then
		Say("Th祅h n祔 hi謓 ch璦 c� bang h閕 chi誱 l躰h", 
			3, 
			"Gi韎 thi謚 Qu秐 l� th祅h th�/jieshao_city", 
			"\nNhi謒 v� H錳 Phong tr筰/tongcitywar_task", 
--			"Thu h錳 trang b� x璶g hi謚/shou_zhuang", 
			"R阨 kh醝/no_say")
		return
	end
	if GetTongName() ~= szTongName then		-- 不是占领城市的帮派对话
		local szTongViewName = szTongName
		szTongViewName = replace(szTongViewName, "/" ,"-")
		szTongViewName = replace(szTongViewName, "|" ,"-")
		szTongViewName = replace(szTongViewName, ":" ,"-")
		Say("Th祅h n祔 do <color=yellow>"..szTongViewName.."<color> chi誱 l躰h", 
			3, 
			"Gi韎 thi謚 Qu秐 l� th祅h th�/jieshao_city", 
			"\nNhi謒 v� H錳 Phong tr筰/tongcitywar_task", 
--			"Thu h錳 trang b� x璶g hi謚/shou_zhuang", 
			"R阨 kh醝/no_say")
		return
	end
	Say("Th祅h n祔 do qu� bang chi誱 l躰h",
		7,
		"Gi韎 thi謚 Qu秐 l� th祅h th�/jieshao_city",
		"Qu秐 l� th祅h th�/manage_city",
		"X璶g hi謚 trang b�/fuli_city",
		"Ta ch璦 c� x璶g hi謚, ph秈 l蕐 l筰 x璶g hi謚/get_title_again",
		"Nhi謒 v� H錳 Phong tr筰/tongcitywar_task",
		"Ph鬰 v� c bi謙 th祅h vi猲 bang h閕/#tongcitywar_service(0)",
--		"Thu h錳 trang b� x璶g hi謚/shou_zhuang",
		"R阨 kh醝/no_say")
end

function tongcitywar_service(nParam)
	if GetLevel() < 70 then
		Say("B筺 ch璦  c蕄 70, kh玭g 頲 ph鬰 v� c bi謙",0)
		return
	end
	local nMapID = GetWorldPos()
	local szTongName, nCessBuysell, nCessStore, nTime = GetCityWarInfo(nMapID, "base")
	if GetTongName() ~= szTongName then
		return
	end
	
	if nParam == 0 then
		Say("<color=green>Qu秐 l� th祅h th�<color>: T蕋 c� th祅h vi猲 trong bang th祅h ch� ph秈 gia nh藀 bang tr猲 7 ng祔 v� c蕄 70 tr� l猲 n NPC ch� nh nh薾 8 gi� 駓 th竎 b筩h c﹗ ho祅 ho芻 4 ti課g th莕 n玭g n ho芻 8 ti課g l鬰 th莕 ho祅 ho芻 8 ti課g tam th祅h ho祅. M鏸 tu莕 ch� 頲 nh薾 1 l莕",
			5,
			"Nh薾 8 gi� 駓 th竎 B筩h C﹗ Ho祅/#tongcitywar_service(1)",
			"L穘h Th莕 n玭g n 4 gi� /#tongcitywar_service(2)",
			"Nh薾 8 gi� 駓 th竎 L鬰 Th莕 Ho祅/#tongcitywar_service(3)",
			"Nh薾 8 gi� 駓 th竎 Tam Thanh Ho祅/#tongcitywar_service(4)",
			"K誸 th骳 i tho筰/no_say")
	elseif nParam == 1 then		
		local nJoinTime = GetTime() - GetJoinTongTime()
		if nJoinTime <= 604800 then
			Say("th阨 gian nh藀 bang ch璦 頲 7 ng祔, kh玭g nh薾 頲 ph鬰 v� c bi謙", 0)
			return
		end
		local nBodyTime = GetTask(447)
		if nBodyTime >= nTime then
			Say(" Tu莕 n祔 b筺  l穘h h琻 1 l莕 ph鬰 v� c bi謙.",0)
			return
		end
		SetTask(2501, GetTask(2501) + 8 * 60)
		SetTask(447, nTime)
		Msg2Player("Чi hi謕 thu 頲 8 gi� 駓 th竎 B筩h C﹗ Ho祅")
		WriteLog("[C玭g th祅h chi課-ph鬰 v� c bi謙]:"..GetName().."Thu 頲 8 gi� 駓 th竎 B筩h C﹗ Ho祅")
	elseif nParam == 2 then
		local nJoinTime = GetTime() - GetJoinTongTime()
		if nJoinTime <= 604800 then
			Say("th阨 gian nh藀 bang ch璦 頲 7 ng祔, kh玭g nh薾 頲 ph鬰 v� c bi謙", 0)
			return
		end
		local nBodyTime = GetTask(447)
		if nBodyTime >= nTime then
			Say(" Tu莕 n祔 b筺  l穘h h琻 1 l莕 ph鬰 v� c bi謙.",0)
			return
		end
		SetTask(2502, GetTask(2502) + 4 * 60)
		SetTask(447, nTime)
		Msg2Player("Чi hi謕 thu 頲 8 gi� 駓 th竎 Th莕 N玭g Кn")
		WriteLog("[C玭g th祅h chi課-ph鬰 v� c bi謙]:"..GetName().."Thu 頲 8 gi� 駓 th竎 Th莕 N玭g Кn")
	elseif nParam == 3 then
		local nJoinTime = GetTime() - GetJoinTongTime()
		if nJoinTime <= 604800 then
			Say("th阨 gian nh藀 bang ch璦 頲 7 ng祔, kh玭g nh薾 頲 ph鬰 v� c bi謙", 0)
			return
		end
		local nBodyTime = GetTask(447)
		if nBodyTime >= nTime then
			Say(" Tu莕 n祔 b筺  l穘h h琻 1 l莕 ph鬰 v� c bi謙.",0)
			return
		end
		--SetTask(2296, GetTask(2296) + 8 * 60)
		EatLiushen(1, 8 * 60);
		SetTask(447, nTime)
		Msg2Player("Чi hi謕 thu 頲 8 gi� 駓 th竎 L鬰 Th莕 Ho祅")
		WriteLog("[C玭g th祅h chi課-ph鬰 v� c bi謙]:"..GetName().."Thu 頲 8 gi� 駓 th竎 L鬰 Th莕 Ho祅")
	elseif nParam == 4 then
		local nJoinTime = GetTime() - GetJoinTongTime()
		if nJoinTime <= 604800 then
			Say("th阨 gian nh藀 bang ch璦 頲 7 ng祔, kh玭g nh薾 頲 ph鬰 v� c bi謙", 0)
			return
		end
		local nBodyTime = GetTask(447)
		if nBodyTime >= nTime then
			Say(" Tu莕 n祔 b筺  l穘h h琻 1 l莕 ph鬰 v� c bi謙.",0)
			return
		end
		EatSanqin(1, 8 * 60)
		SetTask(447, nTime)
		Msg2Player("Чi hi謕 thu 頲 8 gi� 駓 th竎 Tam Thanh Ho祅")
		WriteLog("[C玭g th祅h chi課-ph鬰 v� c bi謙]:"..GetName().."Thu 頲 8 gi� 駓 th竎 Tam Thanh Ho祅")
	end
end

function tongcitywar_task()
	Talk(1,"","Nhi謒 v� n祔 hi謓 t筰 ch璦 m�!")
	do return end
	local nMapID = GetWorldPos()
	local szTongName = GetCityWarInfo(nMapID, "base")
	local szMsg = " Th祅h Й Th竔 th� ph竧 hi謓 t礽 ch輓h Th祅h Й b� th蕋 tho竧 l韓卌h綾 ch綾  c� k� th玭g ng v韎 ch�"
	if szTongName == nil then
		local tSay =
		{
			"\nHuy chng Th祅h th� i gi秈 thng/task_jiangli",
			"\nC� h醝/no_say",
		}
		Say(szMsg,getn(tSay),tSay)
	elseif GetTongName() ~= szTongName then
		local tSay =
		{
			"\nChi課 s�/task_zhankuang",
			"Ta ph秈 n H錳 Phong tr筰/task_huifeng",
			"мch binh H� gi竝/task_hujia",
			"Huy chng th祅h th� i gi秈 thng/task_jiangli",
			"C� h醝/no_say",
		}
		Say(szMsg,getn(tSay),tSay)
	else
		local _1, szBoss = GetCityWarInfo(nMapID, "boss")
		local _1, szManager = GetCityWarInfo(nMapID, "manager")
		local szName = GetName()
		local tSay =
		{
			"\nChi課 s�/task_zhankuang",
			"Ta ph秈 n H錳 Phong tr筰/task_huifeng",
			"мch binh H� gi竝/task_hujia",
			"Huy chng th祅h th� i gi秈 thng/task_jiangli",
			"C� h醝/no_say",
		}
		if szName == szBoss or szName == szManager then
			tinsert(tSay, 2, "Lo筺 trong gi芻 ngo礽/task_youhuan")
		end
		Say(szMsg,getn(tSay),tSay)
	end
end

function task_huifeng()
	if GetPlayerRoute() == 0 then
		Say("V� danh ti觰 t鑤 c遪 kh玭g n猲 v祇 H錳 Phong tr筰! Ngi n猲 gia nh藀 m玭 ph竔 r蘮 luy謓 trc ",0)
		return
	end
	
	if GetLevel() < 75 then
		Say(" Ngi ch璦 t c蕄 75, n H錳 Phong tr筰 r蕋 nguy hi觤",0)
		return
	end
	CleanInteractive()
	LeaveTeam()
	local nIsExist = CustomDataRead("tongcitywar_person_map_task")	-- 初始化每日任务
	if nIsExist == nil then
		CustomDataSave("tongcitywar_person_map_task", "ddddddd", 0,0,0,0,0,0,0)
	end
	nIsExist = CustomDataRead("tongcitywar_person_task")
	if nIsExist == nil then
		CustomDataSave("tongcitywar_person_task", "dddd", 0, 0, 0, 0)
	end
	
	CreateTrigger(2, 1811, 267)
	NewWorld(889,1764,3808)
end

function task_youhuan()
	Say("Th竔 th� c秏 th蕐 Tr筰 ch� L� Thu薾 lo ng筰 , g莕 y d﹏ ch髇g Th祅h Й l莔 than kh� c鵦, L� Thu薾 m韎 t藀 h頿 m璾 ph秐... ng l骳 d莡 s玦 l鯽 b醤g, tri襲 nh c� m藅 ch� n sai Th祅h Й Th竔 th� t蕁 c玭g H錳 Phong tr筰�",
	2,
	"Tuy猲 chi課/task_xuanzhan",
	"K誸 th骳 i tho筰/no_say")
end

tTaskInfo =
{
	{30000, "Tu莕 n祔 thu 頲 30000 ch binh H� gi竝 - Gi秈 thng:", "500 lng"},
	{45000, "Tu莕 n祔 thu 頲 45000 ch binh H� gi竝 - Gi秈 thng:", "1200 lng"},
	{60000, "Tu莕 n祔 thu 頲 60000 ch binh H� gi竝 - Gi秈 thng:", "2000 lng"},
	{90000, "Tu莕 n祔 thu 頲 90000 ch binh H� gi竝 - Gi秈 thng:", "2 t骾 huy chng, 1 t骾 50 huy chng"},
	{150000, "Tu莕 n祔 thu 頲 150000 ch binh H� gi竝 - Gi秈 thng:", "4 t骾 huy chng, 1 t骾 50 huy chng"},
	{210000, "Tu莕 n祔 thu 頲 210000 ch binh H� gi竝 - Gi秈 thng:", "6 t骾 huy chng, 1 t骾 50 huy chng"},
	{300000, "Tu莕 n祔 thu 頲 300000 ch binh H� gi竝 - Gi秈 thng:", "1 m鉵 v� kh� Ho祅g kim B� Phi Y猲 t飝 �"},
}

function task_xuanzhan()
	local nMapID = GetWorldPos()
	local nTaskType, nItemCount = GetCityWarInfo(nMapID, "task")
	if nTaskType > 0 then
		Say(" Bang h閕  tuy猲 chi課 v韎 H錳 Phong tr筰.",0)
	else
		Say(" Tuy猲 chi課 kh玭g ph秈 vi謈 t飝 ti謓, ngi ph秈 huy ng m鋓 ngi, ti猽 di謙 ch s� l蕐 頲 l穘h H� gi竝 c馻 ch髇g, ngi t� nh ra m鬰 ti猽, trc th� b秠 ho祅 th祅h s� thng c玭g h藆 h躰h",
			8,
			tTaskInfo[1][2]..tTaskInfo[1][3].."/#task_shouji(1)",
			tTaskInfo[2][2]..tTaskInfo[2][3].."/#task_shouji(2)",
			tTaskInfo[3][2]..tTaskInfo[3][3].."/#task_shouji(3)",
			tTaskInfo[4][2]..tTaskInfo[4][3].."/#task_shouji(4)",
			tTaskInfo[5][2]..tTaskInfo[5][3].."/#task_shouji(5)",
			tTaskInfo[6][2]..tTaskInfo[6][3].."/#task_shouji(6)",
			tTaskInfo[7][2]..tTaskInfo[7][3].."/#task_shouji(7)",
			"Kh玭g nh薾 nhi謒 v�/no_say")
	end
end

function task_shouji(nType)
	local nMapID = GetWorldPos()
	local nTaskType, nItemCount = GetCityWarInfo(nMapID, "task")
	if nTaskType > 0 then
		Say(" Bang h閕  tuy猲 chi課 v韎 H錳 Phong tr筰.",0)
		return
	end
	SetCityWarTask(nMapID, nType)
	Say(" Bang h閕 tuy猲 chi課 v韎 H錳 Phong tr筰, tu莕 n祔 nh m鬰 ti猽:"..tTaskInfo[nType][2]..tTaskInfo[nType][3], 0)
	SendTongMessage(GetName().."M� nhi謒 v� tuy猲 chi課 v韎 H錳 Phong tr筰.")
	SendTongMessage("M鬰 ti猽 tu莕 n祔:"..tTaskInfo[nType][2]..tTaskInfo[nType][3])
end

function task_zhankuang()
	local nMapID = GetWorldPos()
	local nType, nItemCount = GetCityWarInfo(nMapID, "task")
	if nType == 0 then
		Say(" Tu莕 n祔 Th祅h Ch� bang ph竔 kh玭g tuy猲 chi課 v韎 H錳 Phong tr筰.",0)
	else
		local _1, szBoss = GetCityWarInfo(nMapID, "boss")
		local _1, szManager = GetCityWarInfo(nMapID, "manager")
		local szName = GetName()
		if nItemCount < tTaskInfo[nType][1] then
			Say(" Tu莕 n祔  thu 頲 мch Binh H� Gi竝 <color=yellow>"..nItemCount.."/"..tTaskInfo[nType][1].."<color>, v蒼 ch璦 t 頲 m鬰 ti猽\nGi秈 thng chi誱 th祅h: <color=green>"..tTaskInfo[nType][3].."<color>",0)
			return
		end
		local szSay = " Tu莕 n祔  thu 頲 мch Binh H� Gi竝 <color=yellow>"..nItemCount.."/"..tTaskInfo[nType][1].."<color>, t m鬰 ti猽, c� th� l穘h thng.\nGi秈 thng chi誱 th祅h: <color=green>"..tTaskInfo[nType][3].."<color>"
		if szName == szBoss or szName == szManager then
			Say(szSay,3,"L穘h ph莕 thng bang h閕/task_tong_finish","Hu﹏ chng th祅h th� ng蓇 nhi猲/task_person_more","K誸 th骳 i tho筰/no_say")
		else
			Say(szSay,2,"Hu﹏ chng th祅h th� ng蓇 nhi猲/task_person_more","K誸 th骳 i tho筰/no_say")
		end
	end
end

function task_tong_finish()
	local nMapID = GetWorldPos()
	local nType, nItemCount, bGetAward = GetCityWarInfo(nMapID, "task")
	if bGetAward > 0 then
		Say("Bang h閕 c馻 ban  l穘h Ph莕 thng bang h閕 c馻 tu莕 n祔 r錳!",0)
		return
	end
	
	if nType == 0 then
		return
	elseif nType == 1 then
		Earn(5000000)
		SetCityWarTaskAwardFlag(nMapID, 1)
		SendTongMessage(GetName().."L穘h ph莕 thng bang h閕 tu莕 n祔: 500 lng")
		WriteLog(GetName().."L穘h ph莕 thng bang h閕 tu莕 n祔: 500 lng")
	elseif nType == 2 then
		Earn(12000000)
		SetCityWarTaskAwardFlag(nMapID, 1)
		SendTongMessage(GetName().."L穘h ph莕 thng bang h閕 tu莕 n祔: 1200 lng")
		WriteLog(GetName().."L穘h ph莕 thng bang h閕 tu莕 n祔: 1200 lng")
	elseif nType == 3 then
		Earn(20000000)
		SetCityWarTaskAwardFlag(nMapID, 1)
		SendTongMessage(GetName().."L穘h ph莕 thng bang h閕 tu莕 n祔: 2000 lng")
		WriteLog(GetName().."L穘h ph莕 thng bang h閕 tu莕 n祔: 2000 lng")
	elseif nType == 4 then
		if Zgc_pub_goods_add_chk(2,2) == 1 then
			if AddItem(2,0,766,2) == 1 then
				SetCityWarTaskAwardFlag(nMapID, 1)
				SendTongMessage(GetName().."L穘h ph莕 thng bang h閕 tu莕 n祔: 2 t骾 Hu﹏ chng th祅h th�")
				WriteLog(GetName().."Х nh薾 2 t骾 Hu﹏ chng th祅h th�")
			end
		end
	elseif nType == 5 then
		if Zgc_pub_goods_add_chk(4,4) == 1 then
			if AddItem(2,0,766,4) == 1 then
				SetCityWarTaskAwardFlag(nMapID, 1)
				SendTongMessage(GetName().."L穘h ph莕 thng bang h閕 tu莕 n祔: 4 t骾 Hu﹏ chng th祅h th�")
				WriteLog(GetName().."Х nh薾 4 t骾 Hu﹏ chng th祅h th�")
			end
		end
	elseif nType == 6 then	
		if Zgc_pub_goods_add_chk(6,6) == 1 then
			if AddItem(2,0,766,6) == 1 then
				SetCityWarTaskAwardFlag(nMapID, 1)
				SendTongMessage(GetName().."L穘h ph莕 thng bang h閕 tu莕 n祔: 6 t骾 Hu﹏ chng th祅h th�")
				WriteLog(GetName().."Х nh薾 6 t骾 Hu﹏ chng th祅h th�")
			end
		end
	elseif nType == 7 then
		sel_task_weapon(1)
	end
end

tTaskWeapon = 
{
	{0,3,6001,"Ph� Y猲 產o"},
	{0,5,6002,"Ph� Y猲 c玭"},
	{0,8,6003,"Ph� Y猲 trng"},
	{0,0,6004,"H祄 Y猲 th�"},
	{0,1,6005,"T祅g Y猲 ch﹎"},
	{0,2,6006,"Phi Y猲 ki誱"},
	{0,10,6007,"V薾 Y猲 c莔"},
	{0,0,6008,"V﹏ Y猲 th�"},
	{0,5,6009,"L璾 Y猲 c玭"},
	{0,2,6010,"Huy襫 Y猲 ki誱"},
	{0,9,6011,"V� Y猲 b髏"},
	{0,6,6012,"H� Ti猰 Thng"},
	{0,4,6013,"H祅h Y猲 Cung"},
	{0,7,6014,"Tr鋍 Y猲 nh蒼"},
	{0,11,6015,"Y猽 Y猲 tr秓"},
}

function sel_task_weapon(nStartIndex)
	local tSay = {}
	local nTabIndex = 1
	if nStartIndex > 6 then
		local n = nStartIndex - 6
		tSay[nTabIndex] = "Trang trc/#sel_task_weapon("..n..")"
		nTabIndex = nTabIndex + 1
	end
	
	local nEnd = nStartIndex + 5
	if nEnd > getn(tTaskWeapon) then
		nEnd = getn(tTaskWeapon)
	end

	for i=nStartIndex, nEnd do
		tSay[nTabIndex] = tTaskWeapon[i][4].."/#sel_task_weapon_one("..i..")"
		nTabIndex = nTabIndex + 1
	end
	
	if nEnd < getn(tTaskWeapon) then
		tSay[nTabIndex] = "Trang k�/#sel_task_weapon("..(nEnd + 1)..")"
		nTabIndex = nTabIndex + 1
	end
	tSay[nTabIndex] = "R阨 kh醝/no_say"
	
	Say("Xin ch鋘 V� Kh� B� Phi Y猲 mu鑞 nh薾!",getn(tSay),tSay)
end

function sel_task_weapon_one(nIndex)
	Say("Ngi  ch鋘 "..tTaskWeapon[nIndex][4]..", x竎 nh ch�?",
		3,
		"уng �/#sel_task_weapon_yes("..nIndex..")",
		"Ch鋘 l筰/#sel_task_weapon(1)",
		"K誸 th骳 i tho筰/no_say")
end

function sel_task_weapon_yes(nIndex)
	local nMapID = GetWorldPos()
	local nType, nItemCount, bGetAward = GetCityWarInfo(nMapID, "task")
	if bGetAward > 0 or nType ~= 7 then
		return
	end
	if Zgc_pub_goods_add_chk(1,50) == 1 then
		if AddItem(tTaskWeapon[nIndex][1],tTaskWeapon[nIndex][2],tTaskWeapon[nIndex][3],1,1,-1,-1,-1,-1,-1,-1) == 1 then
			SetCityWarTaskAwardFlag(nMapID, 1)
			SendTongMessage(GetName().."L穘h ph莕 thng bang h閕 tu莕 n祔: "..tTaskWeapon[nIndex][4].."_1")
			WriteLog("Ph莕 thng bang h閕 "..GetName().."i "..tTaskWeapon[nIndex][4])
		end
	end
end

function task_person_more()
	player_task_clear()
	local nMapID = GetWorldPos()
	local nType, nItemCount = GetCityWarInfo(nMapID, "task")
	if nType == 0 then
		Say(" Tu莕 n祔 Th祅h Ch� bang ph竔 kh玭g tuy猲 chi課 v韎 H錳 Phong tr筰.",0)
		return
	end
	
	local szMsg = "Bang ph竔 Th祅h Ch� ho祅 th祅h nhi謒 v� to祅 m竬 ch� xong. N閕 trong tu莕 ngi ch韎 c� 頲 s� c玭g hi課 s� ng蓇 nhi猲 nh薾 頲 Hu﹏ chng th祅h th�. M鏸 l莕 giao <color=yellow>60<color> ch binh H� gi竝 s� ng蓇 nhi猲 nh薾 th猰 頲 <color=yellow>1<color> Hu﹏ chng th祅h th�.? (T鑙 產 300 c竔)"

	if nItemCount < tTaskInfo[nType][1] then
		Say(szMsg.."\nTu莕 n祔 мch Binh H� Gi竝 thu 頲 "..nItemCount.."/"..tTaskInfo[nType][1]..", v蒼 ch璦 t m鬰 ti猽 ",0)
		return
	end

	local nDLCount, nSJCount, nJHCount, nSJCountView = CustomDataRead("tongcitywar_person_task")
	if nSJCount > 300 or nJHCount > 300 then
		WriteLog("[C玭g th祅h -qu秐 l齗 name="..GetName().." event=H� gi竝 ng蓇 nhi猲 error=data d� thng C="..nSJCount..";J="..nJHCount)
		return
	end
	
	if nDLCount == nil then
		Say(szMsg.."\nTu莕 n祔 b筺 ch璦 giao мch Binh H� Gi竝, kh玭g th� nh薾 ph莕 thng!",0)
		return
	end
	
	if nSJCount < 60 then
		Say(szMsg.."\nTu莕 n祔 b筺 ch璦 giao  60 мch Binh H� Gi竝, kh玭g th� nh薾 ph莕 thng!",0)
		return
	end
	
	if nSJCount - nJHCount < 60 then
		Say(szMsg.."\nTu莕 n祔 b筺 giao 頲 мch Binh H� Gi竝 <color=yellow>"..nSJCountView.."<color>, trong  s� lng c� th� i Hu﹏ chng th祅h th� l� <color=yellow>"..nSJCount.."<color>,  s� d鬾g <color=yellow>"..nJHCount.."<color> мch Binh H� Gi竝 i Hu﹏ chng th祅h th�, ph莕 c遪 d� kh玭g  i Hu﹏ chng th祅h th�, kh玭g th� nh薾 ph莕 thng!",0)
		return
	end
	
	if Zgc_pub_goods_add_chk(1,0) == 0 then
		return
	end
	
	local nCount = floor((nSJCount - nJHCount)/60)
	Say(szMsg.."\nTu莕 n祔 b筺 giao 頲 мch Binh H� Gi竝 <color=yellow>"..nSJCountView.."<color>, trong  s� lng c� th� i Hu﹏ chng th祅h th� l� <color=yellow>"..nSJCount.."<color>,  s� d鬾g <color=yellow>"..nJHCount.."<color>мch Binh H� Gi竝 i Hu﹏ chng th祅h th�, ph莕 c遪 d� c� th� i <color=yellow>"..nCount.."<color> Hu﹏ chng th祅h th�! фi b﹜ gi� ch�?",2,"фi Hu﹏ chng th祅h th�/#task_person_more_yes("..nCount..")","K誸 th骳 i tho筰/no_say")
end

function task_person_more_yes(nCount)
	if AddItem(2,0,765,nCount) == 1 then
		local nDLCount, nSJCount, nJHCount, nSJCountView = CustomDataRead("tongcitywar_person_task")
		nJHCount = nJHCount + nCount * 60
		CustomDataSave("tongcitywar_person_task", "dddd", nDLCount, nSJCount, nJHCount, nSJCountView)
		Msg2Player("B筺 nh薾 頲 "..nCount.." Hu﹏ chng th祅h th�")
		WriteLog(GetName().."i "..nCount.." Hu﹏ chng th祅h th� ng蓇 nhi猲")
	end
end

function task_hujia()
	player_task_clear()
	local nMapID = GetWorldPos()
	local nType, nItemCount = GetCityWarInfo(nMapID, "task")
	local szMsg = "M鏸 l莕 giao <color=yellow>10<color> ch binh H� gi竝 s� nh薾 頲 <color=yellow>1<color>Hu﹏ chng th祅h th�, <color=yellow>vt qu� 300<color> s� <color=yellow>kh玭g th� i<color> Hu﹏ chng th祅h th�. M鏸 ngi m鏸 tu莕 th玭g qua ti猽 di謙 ch c� th� thu 頲 t鑙 產 <color=yellow>600<color> мch Binh H� Gi竝 "
	if nType > 0 then
		szMsg = szMsg.."\nM鬰 ti猽 nhi謒 v� tu莕 n祔 l� thu th藀 мch Binh H� Gi竝 <color=yellow>"..nItemCount.."/"..tTaskInfo[nType][1].."<color>"
	end
	local nDLCount, nSJCount, nJHCount, nSJCountView = CustomDataRead("tongcitywar_person_task")
	if nSJCount >= 300 then
		szMsg = szMsg.."\nTu� n祔  giao ch binh H� gi竝 <color=yellow>"..nSJCountView.."/300<color>, vt qu� <color=yellow>300<color> b� s� kh玭g th� nh薾 頲 Hu﹏ chng th祅h th�, nh璶g s� 頲 t輈h l騳 qua cho nhi謒 v� tuy猲 chi課 bang h閕. Giao ch�?"
	else
		szMsg = szMsg.."\nTu� n祔  giao ch binh H� gi竝 <color=yellow>"..nSJCountView.."/300<color>, c� ph秈 mu鑞 giao мch Binh H� Gi竝. M鏸 l莕 giao 10 мch Binh H� Gi竝 s� nh薾 頲 1 Hu﹏ chng th祅h th�. (vt qu� <color=yellow>300<color> b� s� kh玭g th� nh薾 頲 Hu﹏ chng th祅h th�)"
	end
	Say(szMsg,3,
		"Giao 10 ch binh H� gi竝/#task_hujia_sj(10)",
		"Giao 100 ch binh H� gi竝/#task_hujia_sj(100)",
		"K誸 th骳 i tho筰/no_say")
end

function task_hujia_sj(nCount)
	local nMaxCount = GetItemCount(2,0,764)
	if nMaxCount < nCount then
		Say("Ngi kh玭g mang  ch binh H� gi竝 "..nCount..", c� ph秈  qu猲 trong rng r錳 kh玭g?",0)
		return
	end
	local nDLCount, nSJCount, nJHCount, nSJCountView = CustomDataRead("tongcitywar_person_task")
	if nSJCountView > 300 and nSJCount < 300 then
		WriteLog("[C玭g th祅h -qu秐 l齗 name="..GetName().." event=Giao h� gi竝 error=data d� thng CV="..nSJCountView..";C="..nSJCount)
		return
	elseif nSJCount > 300 then
		WriteLog("[C玭g th祅h -qu秐 l齗 name="..GetName().." event=Giao h� gi竝 error=data d� thng C="..nSJCount)
		return
	end

	if Zgc_pub_goods_add_chk(1,0) == 0 then
		return
	end

	local nDiff = nCount + nSJCount - 300
	local nGiveCount = floor(nCount / 10)
	if nDiff > 0 then
		nGiveCount = floor((nCount-nDiff)/10)
	end
	
	if DelItem(2,0,764,nCount) == 1 then
		local szMsg = "<color=green>Qu秐 th祅h s�<color>: "
		local szMsg2 = ""
		if nGiveCount > 0 then
			AddItem(2,0,765,nGiveCount)
			szMsg = "B筺 nh薾 頲 "..nGiveCount.." Hu﹏ chng th祅h th�."
			szMsg2 = "B筺 nh薾 頲 "..nGiveCount.." Hu﹏ chng th祅h th�."
		end
		CustomDataSave("tongcitywar_person_task", "dddd", nDLCount,(nGiveCount*10)+nSJCount,nJHCount,nSJCountView+nCount)
		
		szMsg = szMsg.."\nTu� n祔  giao ch binh H� gi竝 <color=yellow>"..(nSJCountView+nCount).."/300<color>."
		szMsg2 = szMsg2.."Tu莕 n祔  giao ch binh H� gi竝 "..(nSJCountView+nCount).."/300."
		
		local nMapID = GetWorldPos()
		local nType, nItemCount = GetCityWarInfo(nMapID, "task")
		if nType > 0 then			-- 如果有城市任务,把上交的敌兵护甲加到总计数里面
			SetCityWarTask(nMapID, nType, nCount)
			szMsg = szMsg.."\nM鬰 ti猽 nhi謒 v� tu莕 n祔 l� thu th藀 мch Binh H� Gi竝 <color=yellow>"..(nItemCount+nCount).."/"..tTaskInfo[nType][1].."<color>"
			szMsg2 = szMsg2.."M鬰 ti猽 nhi謒 v� tu莕 n祔 l� thu th藀 мch Binh H� Gi竝"..(nItemCount+nCount).."/"..tTaskInfo[nType][1]
		end
		Say(szMsg,2,"Ti誴 t鬰 giao ch binh H� gi竝 /task_hujia", "R阨 kh醝/no_say")
		Msg2Player(szMsg2)
	end
end

function task_jiangli()
	Say("C竎 h� c� th� d飊g Hu﹏ chng th祅h th� i c竎 ph莕 thng sau: ",
		3,
		"\nM藅 t辌h trang b轡n/#task_jiangli_zm(0,0,0)",
		"\nHi謚 qu� cng h鉧\n/#task_jiangli_xg(1)",
		"\nK誸 th骳 i tho筰/no_say")
end

tRoute2Weapon = 
{
	[2] = {{0,3,6001,"Ph� Y猲 產o"}, {0,5,6002,"Ph� Y猲 c玭"}},
	[3] = {{0,8,6003,"Ph� Y猲 trng"},},
	[4] = {{0,0,6004,"H祄 Y猲 th�"}},
	[6] = {{0,1,6005,"T祅g Y猲 ch﹎"}},
	[8] = {{0,2,6006,"Phi Y猲 ki誱"}},
	[9] = {{0,10,6007,"V薾 Y猲 c莔"}},
	[11] = {{0,0,6008,"V﹏ Y猲 th�"}},
	[12] = {{0,5,6009,"L璾 Y猲 c玭"}},
	[14] = {{0,2,6010,"Huy襫 Y猲 ki誱"}},
	[15] = {{0,9,6011,"V� Y猲 b髏"}},
	[17] = {{0,6,6012,"H� Ti猰 Thng"}},
	[18] = {{0,4,6013,"H祅h Y猲 Cung"}},
	[20] = {{0,7,6014,"Tr鋍 Y猲 nh蒼"}},
	[21] = {{0,11,6015,"Y猽 Y猲 tr秓"}},
}

function task_jiangli_zm(nType,nParam1,nParam2)
	if nType == 0 then
		Say("Ngi c� th� ch鋘 c竎 ph莕 thng sau",
			4,
			"Khu蕋 Nguy猲 B閕 (C莕 600 Hu﹏ chng th祅h th�)/#task_jiangli_zm(1,0,0)",
			"Чi L鵦 Th莕 H筺g Li猲 (C莕 750 Hu﹏ chng th祅h th�)/#task_jiangli_zm(2,0,0)",
			--"对应门派步非烟黄金武器（需要500城市奖章）/#task_jiangli_zm(3,0,0)",
			"L╪g Ba Vi B� (C莕 600 Hu﹏ chng th祅h th�)/#task_jiangli_zm(4,0,0)",
			"K誸 th骳 i tho筰/no_say")
	elseif nType == 1 then
		Say("фi Khu蕋 Nguy猲 B閕 c莕 600 Hu﹏ chng th祅h th�, i ch�?",2,"уng �/#task_jiangli_zm(11,0,0)","в ta suy ngh�!/no_say")
	elseif nType == 2 then
		Say("фi Чi L鵦 Th莕 H筺g Li猲 c莕 750 Hu﹏ chng th祅h th�, i ch�?",2,"уng �/#task_jiangli_zm(12,0,0)","в ta suy ngh�!/no_say")
	elseif nType == 3 then
		local nRoute = GetPlayerRoute()
		if tRoute2Weapon[nRoute] == nil then
			Say("Ngi v蒼 ch璦 gia nh藀 L璾 ph竔 n祇, ch璦 th� nh薾 V� Kh� B� Phi Y猲.",0)
			return
		end
		if getn(tRoute2Weapon[nRoute]) > 1 then
			local tSay = {}
			for index, value in tRoute2Weapon[nRoute] do
				tSay[index] = value[4].."/#task_jiangli_zm(10,"..nRoute..","..index..")"
			end
			Say("Ngi c� th� ch鋘 1 m鉵 v� kh� Ho祅g Kim t髖 �",getn(tSay),tSay)
		else
			Say("фi "..tRoute2Weapon[nRoute][1][4].." c莕 500 Hu﹏ chng th祅h th�, i ch�?",2,"уng �/#task_jiangli_zm(13,"..nRoute..",1)", "в ta suy ngh�!/no_say")
		end
	elseif nType == 4 then
		Say("фi L╪g Ba Vi B� c莕 600 Hu﹏ chng th祅h th�, i ch�?",2,"уng �/#task_jiangli_zm(14,0,0)","в ta suy ngh�!/no_say")
	elseif nType == 10 then
		Say("фi "..tRoute2Weapon[nParam1][nParam2][4].." c莕 900 Hu﹏ chng th祅h th�, i ch�?",2,"уng �/#task_jiangli_zm(13,"..nParam1..","..nParam2..")", "в ta suy ngh�!/no_say")
	elseif nType == 11 then
		if Zgc_pub_goods_add_chk(1,1) == 1 then
			if DelItem(2,0,765,600) == 1 then
				AddItem(0,102,27,1,1,-1,-1,-1,-1,-1,-1)
				Msg2Player("B筺  i 1 Khu蕋 Nguy猲 B閕 ")
				WriteLog(GetName().."  i 1 Khu蕋 Nguy猲 B閕 ")
			else
				Say("C竎 h� kh玭g c�  Hu﹏ chng th祅h th�.",0)
			end
		end
	elseif nType == 12 then
		if Zgc_pub_goods_add_chk(1,1) == 1 then
			if DelItem(2,0,765,750) == 1 then
				AddItem(0,102,28,1,1,-1,-1,-1,-1,-1,-1)
				Msg2Player("B筺  i Чi L鵦 Th莕 h筺g li猲")
				WriteLog(GetName().." i Чi L鵦 Th莕 h筺g li猲")
			else
				Say("C竎 h� kh玭g c�  Hu﹏ chng th祅h th�.",0)
			end
		end
	elseif nType == 13 then
		if tRoute2Weapon[nParam1][nParam2] == nil then
			return
		end
		if Zgc_pub_goods_add_chk(1,50) == 1 then
			if DelItem(2,0,765,500) == 1 then
				AddItem(tRoute2Weapon[nParam1][nParam2][1],tRoute2Weapon[nParam1][nParam2][2],tRoute2Weapon[nParam1][nParam2][3],1,1,-1,-1,-1,-1,-1,-1)
				Msg2Player("B筺  i "..tRoute2Weapon[nParam1][nParam2][4])
				WriteLog(GetName().."i "..tRoute2Weapon[nParam1][nParam2][4])
			else
				Say("C竎 h� kh玭g c�  Hu﹏ chng th祅h th�.",0)
			end
		end
	elseif nType == 14 then
		if Zgc_pub_goods_add_chk(1,1) == 1 then
			if DelItem(2,0,765,600) == 1 then
				AddItem(0,112,78,1,1,-1,-1,-1,-1,-1,-1)
				Msg2Player("B筺  i L╪g Ba Vi B�")
				WriteLog(GetName().." i L╪g Ba Vi B�")
			else
				Say("C竎 h� kh玭g c�  Hu﹏ chng th祅h th�.",0)
			end
		end
	end
end

tMagicAttr=
{
	{"state_add_vitality",				30, 194400,"G﹏ c鑤 t╪g 30 (C莕 5 Hu﹏ chng th祅h th� ho芻 мch Binh H� Gi竝 75)",5,75},
	{"state_add_strength", 				30, 194400,"S鴆 m筺h t╪g 30 (C莕 5 Hu﹏ chng th祅h th� ho芻 мch Binh H� Gi竝 75)",5,75},
	{"state_add_dexterity", 			30, 194400,"Th﹏ ph竝 t╪g 30 (C莕 5 Hu﹏ chng th祅h th� ho芻 мch Binh H� Gi竝 75)",5,75},
	{"state_add_observe",				30, 194400,"Linh ho箃 t╪g 30 (C莕 5 Hu﹏ chng th祅h th� ho芻 мch Binh H� Gi竝 75)",5,75},
	{"state_add_energy",				30, 194400,"N閕 c玭g t╪g 30 (C莕 5 Hu﹏ chng th祅h th� ho芻 мch Binh H� Gi竝 75)",5,75},
	{"state_add_allability",			20, 194400,"To祅 b� thu閏 t輓h t╪g 20 (C莕 10 Hu﹏ chng th祅h th� ho芻 мch Binh H� Gi竝 150)",10,150},
	{"state_life_max_percent_add",		10,	194400,"Sinh l鵦 t╪g 10% (C莕 5 Hu﹏ chng th祅h th� ho芻 мch Binh H� Gi竝 75)",5,75},
	{"state_receive_half_damage", 		10, 194400,"Gi秏 s竧 thng khi th� thng 10% (C莕 5 Hu﹏ chng th祅h th� ho芻 мch Binh H� Gi竝 75)",5,75},
	{"state_inc_exp_gain", 				5,  194400,"Kinh nghi謒 nh薾 頲 t╪g 5% (C莕 5 Hu﹏ chng th祅h th� ho芻 мch Binh H� Gi竝 75)",5,75},
	{"state_paralysis_time_dec",		30, 194400,"Gi秏 th阨 gian t� li謙 30% (C莕 5 Hu﹏ chng th祅h th� ho芻 мch Binh H� Gi竝 75)",5,75},
	{"state_vertigo_time_dec",          30, 194400,"R髏 ng緉 th阨 gian h玭 m� 30% (C莕 5 Hu﹏ chng th祅h th� ho芻 мch Binh H� Gi竝 75)",5,75},
	{"state_fetter_time_dec",           30, 194400,"R髏 ng緉 th阨 gian nh th﹏ 30% (C莕 5 Hu﹏ chng th祅h th� ho芻 мch Binh H� Gi竝 75)",5,75},
	{"state_confusion_time_dec",        30, 194400,"R髏 ng緉 th阨 gian h鏽 lo筺 30% (C莕 5 Hu﹏ chng th祅h th� ho芻 мch Binh H� Gi竝 75)",5,75},
	{"state_sleep_time_dec",            30, 194400,"R髏 ng緉 th阨 gian ng� m� 30% (C莕 5 Hu﹏ chng th祅h th� ho芻 мch Binh H� Gi竝 75)",5,75},
	{"state_attack_burst_dec_time_dec", 30, 194400,"Gi秏 th阨 gian l祄 ch薽 30% (C莕 5 Hu﹏ chng th祅h th� ho芻 мch Binh H� Gi竝 75)",5,75},
	{"state_slow_time_dec",             30, 194400,"R髏 ng緉 th阨 gian gi秏 t鑓 30% (C莕 5 Hu﹏ chng th祅h th� ho芻 мch Binh H� Gi竝 75)",5,75},
	{"state_p_attack_percent_add",		8, 194400,"T╪g ngo筰 c玭g 8% (C莕 6 Hu﹏ chng th祅h th� ho芻 мch Binh H� Gi竝 90)",6,90},
	{"state_m_attack_percent_add",		8, 194400,"T╪g N閕 c玭g 8% (C莕 6 Hu﹏ chng th祅h th� ho芻 мch Binh H� Gi竝 90)",6,90},
	{"state_damage_point",				30, 194400,"T╪g s竧 thng 30 (C莕 6 Hu﹏ chng th祅h th� ho芻 мch Binh H� Gi竝 90)",6,90},
	{"state_move_speed_percent_add", 	10, 194400,"T╪g t鑓  di chuy觧 10% (C莕 10 Hu﹏ chng th祅h th� ho芻 мch Binh H� Gi竝 150)",10,150},
}

function task_jiangli_xg(nStartIndex)
	local tSay = {}
	local nTabIndex = 1
	if nStartIndex > 6 then
		local n = nStartIndex - 6
		tSay[nTabIndex] = "Trang trc/#task_jiangli_xg("..n..")"
		nTabIndex = nTabIndex + 1
	end
	
	local nEnd = nStartIndex + 5
	if nEnd > getn(tMagicAttr) then
		nEnd = getn(tMagicAttr)
	end

	for i=nStartIndex, nEnd do
		tSay[nTabIndex] = tMagicAttr[i][4].."/#task_jiangli_xg_buy("..i..",0)"
		nTabIndex = nTabIndex + 1
	end
	
	if nEnd < getn(tMagicAttr) then
		tSay[nTabIndex] = "Trang k�/#task_jiangli_xg("..(nEnd + 1)..")"
		nTabIndex = nTabIndex + 1
	end
	tSay[nTabIndex] = "R阨 kh醝/no_say"
	
	Say("Hi謚 qu� n祔 kh玭g th� d飊g chung v韎 lo筰 kh竎, duy tr� 3 gi�, r阨 m筺g ho芻 t� vong u b秓 l璾, nh璶g trong m閠 v礽 trng h頿 c bi謙 s� b� cng ch� h駓 b�",getn(tSay),tSay)
end

function task_jiangli_xg_buy(nIndex,nParam)
	if nParam == 0 then
		Say("фi "..tMagicAttr[nIndex][4].."C莕"..tMagicAttr[nIndex][5].." Hu﹏ chng th祅h th� ho芻 c莕 "..tMagicAttr[nIndex][6].." мch Binh H� Gi竝, i ch�?\n<color=red>N誹 hi謚 qu� lo筰 n祔  t錸 t筰, i lo筰 m韎 s� c� hi謚 qu� <color>",
			4,
			"D飊g Hu﹏ chng th祅h th� i /#task_jiangli_xg_buy("..nIndex..",1)",
			"D飊g мch Binh H� Gi竝 i /#task_jiangli_xg_buy("..nIndex..",2)",
			"V� trang trc/#task_jiangli_xg(1)",
			"в ta suy ngh�!/no_say")
	elseif nParam == 1 then
		if DelItem(2,0,765,tMagicAttr[nIndex][5]) == 1 then
			CastState(tMagicAttr[nIndex][1], tMagicAttr[nIndex][2], tMagicAttr[nIndex][3],1,9900,1)
			SyncCustomState(1, 9900, 0, nIndex-1)
		else
			Say("Ngi kh玭g mang theo  Hu﹏ chng th祅h th�",0)
		end
	elseif nParam == 2 then
		if DelItem(2,0,764,tMagicAttr[nIndex][6]) == 1 then
			CastState(tMagicAttr[nIndex][1], tMagicAttr[nIndex][2], tMagicAttr[nIndex][3],1,9900,1)
			SyncCustomState(1, 9900, 0, nIndex-1)
		else
			Say("Ngi kh玭g mang theo  мch Binh H� Gi竝 ",0)
		end
	end
end

function get_title_again()
	local nMapID = GetWorldPos()
	local szTongName, _2, _3, nTime = GetCityWarInfo(nMapID, "base")
	local szName = GetName()
	local n, szBoss = GetCityWarInfo(nMapID, "boss")
	if szBoss == szName then
		local tBossTitle =
		{
			[100] = {5},
			[300] = {1},
			[350] = {9},
		}
		AddTitle(51, tBossTitle[nMapID][1] + GetSex() - 1)
		SetCurTitle(51, tBossTitle[nMapID][1] + GetSex() - 1)
		Say("Ta  gi髉 ngi ph鬰 h錳 l筰 X璶g hi謚 r錳!", 0)
		return
	end
	
	local n, szManager = GetCityWarInfo(nMapID, "manager")
	if szManager == szName then
		local tManagerTitle =
		{
			[100] = {7},
			[300] = {3},
			[350] = {11},
		}
		AddTitle(51, tManagerTitle[nMapID][1])
		SetCurTitle(51, tManagerTitle[nMapID][1])
		Say("Ta  gi髉 ngi ph鬰 h錳 l筰 X璶g hi謚 r錳!", 0)
		return
	end
	
	local n, szF1, szF2, szF3, szF4 = GetCityWarInfo(nMapID, "fighter")
	if szName == szF1 or szName == szF2 or szName == szF3 or szName == szF4 then
		local tFighterTitle =
		{
			[100] = {8},
			[300] = {4},
			[350] = {12},
		}
		AddTitle(51, tFighterTitle[nMapID][1])
		SetCurTitle(51, tFighterTitle[nMapID][1])
		Say("Ta  gi髉 ngi ph鬰 h錳 l筰 X璶g hi謚 r錳!", 0)
		return
	end
	Say("Ngi kh玭g c� ch鴆 v� g� � th祅h n祔, kh玭g th� ph鬰 h錳 X璶g hi謚!", 0)
end

function shou_zhuang()
	Say("N誹 c竎 h� kh玭g mu鑞 s� d鬾g Trang b� X璶g hi謚, ta s� thu h錳 l筰 rang b� n祔. Xin t l筰 c竎 trang b� mu鑞 thu h錳 v祇 hang trang!",
		5,
		"Thu h錳 trang b� Th祅h Ch�/hui_taishou",
		"Thu h錳 trang b� Qu﹏ S�/hui_shiye",
		"Thu h錳 trang b� Danh B�/hui_tixia",
		"Thu h錳 Trang b� V� binh/hui_weibin",
		"R阨 kh醝/no_say")
end

function hui_taishou()
	Say("<color=green>Qu秐 l� th祅h th�<color>: C竎 h� x竎 nh薾 mu鑞 thu h錳 trang b� Th祅h Ch� trong h祅h trang?", 2, "уng �/yes_hui_taishou", "в ta suy ngh�!/no_say")
end

function yes_hui_taishou()
	local nBeDelete = 0
	for i=8013, 8016 do
		if DelItem(0,100,i,1) == 1 then
			WriteLog("[C玭g th祅h chi課-Thu h錳 trang b� Th祅h Ch馷: "..GetName()..";100,"..i)
			nBeDelete = 1
		end
		if DelItem(0,101,i,1) == 1 then
			WriteLog("[C玭g th祅h chi課-Thu h錳 trang b� Th祅h Ch馷: "..GetName()..";101,"..i)
			nBeDelete = 1
		end
		if DelItem(0,103,i,1) == 1 then
			WriteLog("[C玭g th祅h chi課-Thu h錳 trang b� Th祅h Ch馷: "..GetName()..";103,"..i)
			nBeDelete = 1
		end
	end
	
	for i=8013,8020 do
		if DelItem(0,102,i,1) == 1 then
			WriteLog("[C玭g th祅h chi課-Thu h錳 trang b� Th祅h Ch馷: "..GetName()..";102,"..i)
			nBeDelete = 1
		end
	end
	if nBeDelete == 1 then
		Say("<color=green>Qu秐 l� th祅h th�<color>: Х thu h錳 trang b� Th祅h Ch� trong h祅h trang th祅h c玭g", 0)
	else
		Say("<color=green>Qu秐 l� th祅h th�<color>: Trong h祅h trang c竎 h� kh玭g c� trang b� Th祅h Ch�.", 0)
	end
end

function hui_shiye()
	Say("<color=green>Qu秐 l� th祅h th�<color>: C竎 h� x竎 nh薾 mu鑞 thu h錳 trang b� Qu﹏ S� trong h祅h trang? ", 2, "уng �/yes_hui_shiye", "в ta suy ngh�!/no_say")
end

function yes_hui_shiye()
	local nBeDelete = 0
	if DelItem(0,102,8021,1) == 1 then
		WriteLog("[C玭g th祅h chi課-Thu h錳 trang b� Qu﹏ S璢: "..GetName()..";102,8021")
		nBeDelete = 1
	end
	if DelItem(0,102,8022,1) == 1 then
		WriteLog("[C玭g th祅h chi課-Thu h錳 trang b� Qu﹏ S璢: "..GetName()..";102,8022")
		nBeDelete = 1
	end
	if nBeDelete == 1 then
		Say("<color=green>Qu秐 l� th祅h th�<color>:  thu h錳 th祅h c玭g trang b� Qu﹏ S�", 0)
	else
		Say("<color=green>Qu秐 l� th祅h th�<color>: Trong h祅h trang kh玭g c� trang b� Qu﹏ S�", 0)
	end
end

function hui_tixia()
	Say("<color=green>Qu秐 l� th祅h th�<color>: C竎 h� x竎 nh薾 mu鑞 thu h錳 trang b� Danh B� trong h祅h trang?", 2, "уng �/yes_hui_tixia", "в ta suy ngh�!/no_say")
end

function yes_hui_tixia()
	local nBeDelete = 0
	for i=8005, 8008 do
		if DelItem(0,100,i,1) == 1 then
			WriteLog("[C玭g th祅h chi課-Thu h錳 trang b� Danh B閉: "..GetName()..";100,"..i)
			nBeDelete = 1
		end
		if DelItem(0,101,i,1) == 1 then
			WriteLog("[C玭g th祅h chi課-Thu h錳 trang b� Danh B閉: "..GetName()..";101,"..i)
			nBeDelete = 1
		end
		if DelItem(0,102,i,1) == 1 then
			WriteLog("[C玭g th祅h chi課-Thu h錳 trang b� Danh B閉: "..GetName()..";102,"..i)
			nBeDelete = 1
		end
		if DelItem(0,103,i,1) == 1 then
			WriteLog("[C玭g th祅h chi課-Thu h錳 trang b� Danh B閉: "..GetName()..";103,"..i)
			nBeDelete = 1
		end
	end
	
	for i=8023,8026 do
		if DelItem(0,102,i,1) == 1 then
			WriteLog("[C玭g th祅h chi課-Thu h錳 trang b� Danh B閉: "..GetName()..";102,"..i)
			nBeDelete = 1
		end
	end
	if nBeDelete == 1 then
		Say("<color=green>Qu秐 l� th祅h th�<color>:  thu h錳 th祅h c玭g trang b� Danh B�.", 0)
	else
		Say("<color=green>Qu秐 l� th祅h th�<color>: Trong h祅h trang kh玭g c� trang b� Danh B�.", 0)
	end
end

function hui_weibin()
	Say("C竎 h� x竎 nh mu鑞 thu h錳 Trang b� V� binh trong h祅h trang?", 2, "уng �/yes_hui_weibin", "в ta suy ngh�!/no_say")
end

function yes_hui_weibin()
	local nBeDelete = 0
	for i=8009, 8012 do
		if DelItem(0,100,i,1) == 1 then
			WriteLog("[C玭g th祅h chi課-thu h錳 Trang b� V� binh]: "..GetName()..";100,"..i)
			nBeDelete = 1
		end
		if DelItem(0,101,i,1) == 1 then
			WriteLog("[C玭g th祅h chi課-thu h錳 Trang b� V� binh]: "..GetName()..";101,"..i)
			nBeDelete = 1
		end
		if DelItem(0,102,i,1) == 1 then
			WriteLog("[C玭g th祅h chi課-thu h錳 Trang b� V� binh]: "..GetName()..";102,"..i)
			nBeDelete = 1
		end
		if DelItem(0,103,i,1) == 1 then
			WriteLog("[C玭g th祅h chi課-thu h錳 Trang b� V� binh]: "..GetName()..";103,"..i)
			nBeDelete = 1
		end
	end
	for i=0,3 do
		if DelItem(0,110,221+i,1) == 1 then
			WriteLog("[C玭g th祅h chi課-thu h錳 V� Binh trangThu h錳 ]:"..GetName()..";110,"..(224+i))
			nBeDelete = 1
		end
		if DelItem(0,108,481+i,1) == 1 then
			WriteLog("[C玭g th祅h chi課-thu h錳 V� Binh trangThu h錳 ]:"..GetName()..";108,"..(481+i))
			nBeDelete = 1
		end
		if DelItem(0,109,491+i,1) == 1 then
			WriteLog("[C玭g th祅h chi課-thu h錳 V� Binh trangThu h錳 ]:"..GetName()..";109,"..(491+i))
			nBeDelete = 1
		end
	end
	
	if nBeDelete == 1 then
		Say("Х thu h錳 th祅h c玭g Trang b� V� binh trong h祅h trang!", 0)
	else
		Say("H祅h trang c馻 ngi kh玭g c� Trang b� V� binh", 0)
	end
end

function fuli_city()
	Say("Ngi ch琲 c� X璶g hi謚 c bi謙 c� th� l穘h ho芻 ch� t筼 trang b� c bi謙, to祅 b� th祅h vi猲 trong bang h閕 u c� th� l穘h V� binh Kh玦 gi竝",
		6,
		"Ch� t筼 trang b� Th祅h Ch�/mk_taishou_equip",
		"Ch� t筼 trang b� Danh B�/mk_tixia_equip",
		"Ch� t筼 trang b� Qu﹏ S�/get_shiye_equip",
		"L穘h Trang b� V� binh/get_weibing_suit",
		"фi trang b� Th祅h Ch� m韎/#change_old_taishou_equip(0)",
		"Ta ch� gh� ch琲/no_say")
end

function change_old_taishou_equip(nParam)
	local nWhen = 1196028000			-- 2007-11-26 6:00 AM
	local nBody = GetBody() - 1
	if nParam == 0 then
		Say("<color=green>Qu秐 l� th祅h th�<color>: Ta c� th� l蕐 trang b� Th祅h Ch� (qu薾 ch�) c� i th祅h trang b� m韎 m筺h h琻.",
			3,
			--"换取新的城主(郡主)战盔/#change_old_taishou_equip(1)",
			"фi Th祅h Ch� (qu薾 ch�) chi課 gi竝/#change_old_taishou_equip(2)",
			"фi Th祅h Ch� (qu薾 ch�) chi課 trang/#change_old_taishou_equip(3)",
			--"换取新的城主(郡主)金印/#change_old_taishou_equip(4)",
			--"换取新的城主(郡主)环佩/#change_old_taishou_equip(5)",
			"K誸 th骳 i tho筰/no_say")
	elseif nParam == 1 then
		local nRightIdx = 0
		local nIdx = GetPlayerEquipIndex(0)
		local nParticular
		if nIdx > 0 then
			n1, n2, nParticular = GetItemInfoByIndex(nIdx)
		end
		if nParticular == 8013 + nBody then
			nRightIdx = nIdx
		end
		if nRightIdx > 0 then
			local nGenTime = GetItemCreateTime(nRightIdx)
			if nGenTime > nWhen then
				Say("<color=green>Qu秐 l� th祅h th�<color>: Th祅h Ch� (qu薾 ch�) chi課 kh玦 c馻 c竎 h� l� m韎, kh玭g c莕 ph秈 i l筰.",0)
				return
			end
			local nEnhance = GetEquipAttr(nRightIdx,2)
			local nIsDing7 = GetItemSpecialAttr(nRightIdx,"DING7")
			if DelItemByIndex(nRightIdx, -1) == 1 then
				local nRet, nAddIdx = AddItem(0,103,8013+nBody,1,1,-1,-1,-1,-1,-1,-1,0,nEnhance)
				if nRet == 1 and nAddIdx > 0 then
					SetItemSpecialAttr(nAddIdx, "DING7", nIsDing7)
					WriteLog(GetName().."фi Th祅h Ch� chi課 kh玦;"..(8013+nBody))
				end
			end
		else
			Say("<color=green>Qu秐 l� th祅h th�<color>: H穣 mang tr猲 ngi Th祅h Ch� (qu薾 ch�) chi課 kh玦 r錳 quay l筰 y.",0)
		end
	elseif nParam == 2 then
		local nRightIdx = 0
		local nIdx = GetPlayerEquipIndex(1)
		local nParticular
		if nIdx > 0 then
			n1, n2, nParticular = GetItemInfoByIndex(nIdx)
		end
		if nParticular == 8013 + nBody then
			nRightIdx = nIdx
		end
		if nRightIdx > 0 then
			local nGenTime = GetItemCreateTime(nRightIdx)
			if nGenTime > nWhen then
				Say("<color=green>Qu秐 l� th祅h th�<color>: Th祅h Ch� (qu薾 ch�) chi課 gi竝 c馻 c竎 h� l� m韎, kh玭g c莕 ph秈 i l筰.",0)
				return
			end
			local nEnhance = GetEquipAttr(nRightIdx,2)
			local nIsDing7 = GetItemSpecialAttr(nRightIdx,"DING7")
			if DelItemByIndex(nRightIdx, -1) == 1 then
				local nRet, nAddIdx = AddItem(0,100,8013+nBody,1,1,-1,-1,-1,-1,-1,-1,0,nEnhance)
				if nRet == 1 and nAddIdx > 0 then
					SetItemSpecialAttr(nAddIdx, "DING7", nIsDing7)
					WriteLog(GetName().."фi Th祅h Ch� chi課 gi竝;"..(8013+nBody))
				end
			end
		else
			Say("<color=green>Qu秐 l� th祅h th�<color>: H穣 mang tr猲 ngi Th祅h Ch� (qu薾 ch�) chi課 gi竝 r錳 quay l筰 y.",0)
		end
	elseif nParam == 3 then
		local nRightIdx = 0
		local nIdx = GetPlayerEquipIndex(3)
		local nParticular
		if nIdx > 0 then
			n1, n2, nParticular = GetItemInfoByIndex(nIdx)
		end
		if nParticular == 8013 + nBody then
			nRightIdx = nIdx
		end
		if nRightIdx > 0 then
			local nGenTime = GetItemCreateTime(nRightIdx)
			if nGenTime > nWhen then
				Say("<color=green>Qu秐 l� th祅h th�<color>: Th祅h Ch� qu薾 ch�) chi課 trang c馻 c竎 h�  i m韎, kh玭g c莕 ph秈 i l筰.",0)
				return
			end
			local nEnhance = GetEquipAttr(nRightIdx,2)
			local nIsDing7 = GetItemSpecialAttr(nRightIdx,"DING7")
			if DelItemByIndex(nRightIdx, -1) == 1 then
				local nRet, nAddIdx = AddItem(0,101,8013+nBody,1,1,-1,-1,-1,-1,-1,-1,0,nEnhance)
				if nRet == 1 and nAddIdx > 0 then
					SetItemSpecialAttr(nAddIdx, "DING7", nIsDing7)
					WriteLog(GetName().."фi Th祅h Ch� chi課 gi竝;"..(8013+nBody))
				end
			end
		else
			Say("<color=green>Qu秐 l� th祅h th�<color>: H穣 mang tr猲 ngi Th祅h Ch� (qu薾 ch�) chi課 trang r錳 quay l筰 y",0)
		end
	elseif nParam == 4 then
		local nRightIdx = 0
		local nIdx = GetPlayerEquipIndex(4)
		local nParticular
		if nIdx > 0 then
			n1, n2, nParticular = GetItemInfoByIndex(nIdx)
		end
		if nParticular == 8013 + nBody then
			nRightIdx = nIdx
		end
		
		if nRightIdx == 0 then
			nIdx = GetPlayerEquipIndex(5)
			if nIdx > 0 then
				n1, n2, nParticular = GetItemInfoByIndex(nIdx)
			end
			if nParticular == 8013 + nBody then
				nRightIdx = nIdx
			end
		end
		
		if nRightIdx > 0 then
			local nGenTime = GetItemCreateTime(nRightIdx)
			if nGenTime > nWhen then
				Say("<color=green>Qu秐 l� th祅h th�<color>: Th祅h Ch� (Qu薾 Ch骯) kim 蕁 c馻 c竎 h�  i m韎, kh玭g c莕 ph秈 i l筰.",0)
				return
			end
			local nEnhance = GetEquipAttr(nRightIdx,2)
			local nIsDing7 = GetItemSpecialAttr(nRightIdx,"DING7")
			if DelItemByIndex(nRightIdx, -1) == 1 then
				local nRet, nAddIdx = AddItem(0,102,8013+nBody,1,1,-1,-1,-1,-1,-1,-1,0,nEnhance)
				if nRet == 1 and nAddIdx > 0 then
					SetItemSpecialAttr(nAddIdx, "DING7", nIsDing7)
					WriteLog(GetName().."фi Th祅h Ch� kim 蕁;"..(8013+nBody))
				end
			end
		else
			Say("<color=green>Qu秐 l� th祅h th�<color>: H穣 mang Th祅h Ch� (Qu薾 Ch骯) kim 蕁 r錳 l筰 y.",0)
		end
	elseif nParam == 5 then
		local nRightIdx = 0
		local nIdx = GetPlayerEquipIndex(4)
		local nParticular
		if nIdx > 0 then
			n1, n2, nParticular = GetItemInfoByIndex(nIdx)
		end
		if nParticular == 8017 + nBody then
			nRightIdx = nIdx
		end
		
		if nRightIdx == 0 then
			nIdx = GetPlayerEquipIndex(5)
			if nIdx > 0 then
				n1, n2, nParticular = GetItemInfoByIndex(nIdx)
			end
			if nParticular == 8017 + nBody then
				nRightIdx = nIdx
			end
		end
		
		if nRightIdx > 0 then
			local nGenTime = GetItemCreateTime(nRightIdx)
			if nGenTime > nWhen then
				Say("<color=green>Qu秐 l� th祅h th�<color>: Th祅h Ch� (Qu薾 Ch骯) ng鋍 b閕 c馻 c竎 h�  i m韎, kh玭g c莕 ph秈 i th猰",0)
				return
			end
			local nEnhance = GetEquipAttr(nRightIdx,2)
			local nIsDing7 = GetItemSpecialAttr(nRightIdx,"DING7")
			if DelItemByIndex(nRightIdx, -1) == 1 then
				local nRet, nAddIdx = AddItem(0,102,8017+nBody,1,1,-1,-1,-1,-1,-1,-1,0,nEnhance)
				if nRet == 1 and nAddIdx > 0 then
					SetItemSpecialAttr(nAddIdx, "DING7", nIsDing7)
					WriteLog(GetName().."фi Th祅h Ch� ng鋍 b閕;"..(8013+nBody))
				end
			end
		else
			Say("<color=green>Qu秐 l� th祅h th�<color>: Xin h穣 mang Th祅h Ch� (Qu薾 Ch骯) ng鋍 b閕 r錳 n y l筰.",0)
		end
	end
end

function manage_city()
	local nMapID = GetWorldPos()
	local szTongName, nCessBuysell, nCessStore, nTime = GetCityWarInfo(nMapID, "base")
	local nCount, szBoss = GetCityWarInfo(nMapID, "boss")
	local _, szManager = GetCityWarInfo(nMapID, "manager")

	local ldiff = nTime - GetTime()
	local nDay = floor(ldiff / 86400)
	local nHour = floor(mod(ldiff, 86400) / 3600)
	local nMin = floor(mod(ldiff, 3600) / 60)
	local nSec = mod(ldiff, 60)
	
	if nCount == 0 then
		if GetTongName() ~= szTongName then		-- 不是占领城市的帮派对话
			local szTongViewName = szTongName
			szTongViewName = replace(szTongViewName, "/" ,"-")
			szTongViewName = replace(szTongViewName, "|" ,"-")
			szTongViewName = replace(szTongViewName, ":" ,"-")			
			Say("Th祅h n祔 do <color=yellow>"..szTongViewName.."<color> chi誱 l躰h", 0)
		else										-- 是占领城市的帮派对话
			if IsTongMaster() == 1 then				-- 是帮主
				yes_get_boss()
			else
				Say("Th祅h n祔 do Qu� bang chi誱 l躰h", 0)
			end
		end
	else
		local szSelfName = GetName()
		if szBoss == szSelfName or szManager == szSelfName then		-- 城主或军师
			local tTab = 
			{
				"Nh薾 Th祅h Й 蕁/manager_getarchivebox",
				--"领取帮会基金/manager_getmoney",
				--"设置税率/manager_setcess",
				"L穘h B秓 rng t礽 nguy猲/res_box_add",
				"K誸 th骳 i tho筰/no_say"
			}
			Say("Th祅h n祔 do Qu� bang chi誱 l躰h", getn(tTab), tTab)
		elseif GetTongName() == szTongName then
			Say("Th祅h n祔 do Qu� bang chi誱 l躰h", 1, "R阨 kh醝/no_say")
		else
			local szTongViewName = szTongName
			szTongViewName = replace(szTongViewName, "/" ,"-")
			szTongViewName = replace(szTongViewName, "|" ,"-")
			szTongViewName = replace(szTongViewName, ":" ,"-")
			Say("Th祅h n祔 do <color=yellow>"..szTongViewName.."<color> chi誱 l躰h", 0)
		end
	end
end

function mk_taishou_equip()
	Say("<color=green>Qu秐 l� th祅h th�<color>: Trang b� Th祅h Ch� c� th阨 h筺 v躰h c鰑, nh璶g m閠 khi m蕋 甶 danh hi謚 Th祅h Ch� th� s� kh玭g mang 頲, v� cho d� mang l猲 頲 th� c騨g kh玭g c� b蕋 k� hi謚 鴑g n祇.",
		7,
		"Ch� t筼 Th祅h Ch� (Qu薾 Ch骯) chi課 kh玦 (8 h遖 th� b輈h + 15 ho祅g kim i h錸g bao)/#mk_taishou_ep(10,103,8013)",  --0，103，8013--0，103，8016
		"Ch� t筼 Th祅h Ch� (Qu薾 Ch骯) chi課 gi竝 (8 h遖 th� b輈h + 15 ho祅g kim i h錸g bao)/#mk_taishou_ep(10,100,8013)",   --0，100，8013--0，100，8016
		"Ch� t筼 Th祅h Ch� (Qu薾 Ch骯) chi課 trang (8 h遖 th� b輈h + 15 ho祅g kim i h錸g bao)/#mk_taishou_ep(12,101,8013)",   --0，101，8013--0，101，8016
		"Ch� t筼 Th祅h Ch� (Qu薾 Ch骯) ng鋍 b閕 (8 h遖 th� b輈h + 15 ho祅g kim i h錸g bao)/#mk_taishou_ep(8,102,8017)", --0，102，8017--0，102，8020
		"Ch� t筼 Th祅h Ch� (Qu薾 Ch骯) kim 蕁 (8 h遖 th� b輈h + 15 ho祅g kim i h錸g bao)/#mk_taishou_ep(0,102,8013)", --0，102，8013--0，102，8016
		"Nh薾 Th祅h Ch� (Qu薾 Ch骯) ngo筰 trang/#mk_taishou_ep_3(0,109,300)",  --0，109，300 --0，109，303
		"R阨 kh醝/no_say")
end

function mk_taishou_ep(nNeed, nDetail, nParticular)
	local nBody = GetBody() - 1
	if BigGetItemCount(0,nDetail,nParticular + nBody) > 0 then
		Say("B筺  c� v藅 ph萴 n祔 r錳!", 0)
		return
	end
	
	if GetItemCount(2, 1, 1001) < 8 or GetItemCount(2, 1, 539) < 15 then
		Talk(1, "", "H祅h trang kh玭g  h遖 th� b輈h ho芻 ho祅g kim i h錸g bao.");
		return
	end
	local tTitle = 
	{
		[100] = {5},
		[300] = {1},
		[350] = {9},
	}
	local nMapID = GetWorldPos()
	local nNeedTitle = tTitle[nMapID][1] + GetSex() - 1
	local szTongName, nCessBuysell, nCessStore, nTime = GetCityWarInfo(nMapID, "base")
	if szTongName ~= GetTongName() or IsTitleExist(51, nNeedTitle) == 0 then
		Say("Kh玭g ph秈 l� Th祅h Ch� c馻 th祅h n祔, kh玭g th� nh薾 頲 lo筰 trang b� n祔.", 0)
		return
	end
	if Zgc_pub_goods_add_chk(1, 50) == 0 then
		return
	end
	
	if nNeed > 0 then
		if DelItem(2,1,1001,8) == 1 and DelItem(2, 1, 539, 15) == 1 then
			AddItem(0,nDetail,nParticular+nBody,1,1,-1,-1,-1,-1,-1,-1)
			WriteLog("[C玭g th祅h chi課]:"..GetName().."Ch� ra 1 trang b� Th祅h Ch� (0,"..nDetail..","..(nParticular+nBody)..")")
		end
	elseif nNeed == 0 then
		if DelItem(2,1,1001,8) == 1 and DelItem(2, 1, 539, 15) == 1 then
			if nDetail == 109 then
				local nRet, nIndex = AddItem(0,nDetail,nParticular+nBody,1,1)
				SetItemExpireTime(nIndex, nTime - GetTime())
			else
				AddItem(0,nDetail,nParticular+nBody,1,1,-1,-1,-1,-1,-1,-1)
			end
			WriteLog("[C玭g th祅h chi課]:"..GetName().."Ch� ra 1 trang b� Th祅h Ch� (0,"..nDetail..","..(nParticular+nBody)..")")
		end
	end
end

function mk_taishou_ep_1(nNeed)
	local nBody = GetBody() - 1
	if BigGetItemCount(0,100,8013 + nBody) > 0 then
		Say("B筺  c� v藅 ph萴 n祔 r錳!", 0)
		return
	end
	
	if GetItemCount(2,1,504) < nNeed then
		Say("Ban kh玭g mang theo  N� Oa Tinh Th筩h"..nNeed..".", 0)
		return
	end
	local tTitle = 
	{
		[100] = {5},
		[300] = {1},
		[350] = {9},
	}
	local nMapID = GetWorldPos()
	local nNeedTitle = tTitle[nMapID][1] + GetSex() - 1
	local szTongName, nCessBuysell, nCessStore, nTime = GetCityWarInfo(nMapID, "base")
	if szTongName ~= GetTongName() or IsTitleExist(51, nNeedTitle) == 0 then
		Say("Kh玭g ph秈 l� Th祅h Ch� c馻 th祅h n祔, kh玭g th� nh薾 頲 lo筰 trang b� n祔.", 0)
		return
	end
	if Zgc_pub_goods_add_chk(1, 50) == 0 then
		return
	end
	if DelItem(2,1,504,nNeed) == 1 then
		AddItem(0,100,8013+nBody,1,1,4,394,-1,-1,-1,-1)
		WriteLog("[C玭g th祅h chi課]:"..GetName().."Ch� ra 1 trang b� Th祅h Ch�+ s竧 thng(0,100"..(8013+nBody)..")")
	end
end

function mk_taishou_ep_3(nNeed, nDetail, nParticular)
	local nBody = GetBody() - 1
	if BigGetItemCount(0,nDetail,nParticular + nBody) > 0 then
		Say("B筺  c� v藅 ph萴 n祔 r錳!", 0)
		return
	end
	
	local tTitle = 
	{
		[100] = {5},
		[300] = {1},
		[350] = {9},
	}
	local nMapID = GetWorldPos()
	local nNeedTitle = tTitle[nMapID][1] + GetSex() - 1
	local szTongName, nCessBuysell, nCessStore, nTime = GetCityWarInfo(nMapID, "base")
	if szTongName ~= GetTongName() or IsTitleExist(51, nNeedTitle) == 0 then
		Say("Kh玭g ph秈 l� Th祅h Ch� c馻 th祅h n祔, kh玭g th� nh薾 頲 lo筰 trang b� n祔.", 0)
		return
	end
	if Zgc_pub_goods_add_chk(1, 50) == 0 then
		return
	end	

	if nDetail == 109 then
			local nRet, nIndex = AddItem(0,nDetail,nParticular+nBody,1,1)
			SetItemExpireTime(nIndex, nTime - GetTime())
	end
end

function mk_taishou_ep_2(nNeed)
	local nBody = GetBody() - 1
	if BigGetItemCount(0,101,8013 + nBody) > 0 then
		Say("B筺  c� v藅 ph萴 n祔 r錳!", 0)
		return
	end
	
	if GetItemCount(2,1,504) < nNeed then
		Say("Ban kh玭g mang theo  N� Oa Tinh Th筩h"..nNeed..".", 0)
		return
	end
	local tTitle = 
	{
		[100] = {5},
		[300] = {1},
		[350] = {9},
	}
	local nMapID = GetWorldPos()
	local nNeedTitle = tTitle[nMapID][1] + GetSex() - 1
	local szTongName, nCessBuysell, nCessStore, nTime = GetCityWarInfo(nMapID, "base")
	if szTongName ~= GetTongName() or IsTitleExist(51, nNeedTitle) == 0 then
		Say("Kh玭g ph秈 l� Th祅h Ch� c馻 th祅h n祔, kh玭g th� nh薾 頲 lo筰 trang b� n祔.", 0)
		return
	end
	if Zgc_pub_goods_add_chk(1, 50) == 0 then
		return
	end
	if DelItem(2,1,504,nNeed) == 1 then
		AddItem(0,101,8013+nBody,1,1,2,268,-1,-1,-1,-1)
		WriteLog("[C玭g th祅h chi課]:"..GetName().."Ch� ra 1 trang b� Th祅h Ch�+ s竧 thng(0,101"..(8013+nBody)..")")
	end
end

function mk_tixia_equip()
	Say("<color=green>Qu秐 l� th祅h th�<color>: Trang b� Danh B� c� th阨 h筺 v躰h c鰑, nh璶g m閠 khi m蕋 甶 danh hi謚 Th祅h Ch� th� s� kh玭g mang 頲 v� cho d� mang l猲 頲 th� c騨g kh玭g c� b蕋 k� hi謚 鴑g n祇.",
		7,
		"Ch� t筼 Danh B� chi課 kh玦 (4 h遖 th� b輈h + 6 ho祅g kim i h錸g bao)/#mk_tixia_ep(0,103,8005)",  	--0，103，8005--0，103，8008
		"Ch� t筼 Danh B� chi課 gi竝 (4 h遖 th� b輈h + 6 ho祅g kim i h錸g bao)/#mk_tixia_ep(0,100,8005)",  	--0，100，8005--0，100，8008
		"Ch� t筼 Danh B� chi課 trang (4 h遖 th� b輈h + 6 ho祅g kim i h錸g bao)/#mk_tixia_ep(0,101,8005)",  	--0，101，8005 -0，101，8008
		"Ch� t筼 Danh B� li猲 kh秓  (4 h遖 th� b輈h + 6 ho祅g kim i h錸g bao)/#mk_tixia_ep(0,102,8005)",						--0，102，8005--0，102，8008
		"Ch� t筼 Danh B� l謓h (4 h遖 th� b輈h + 6 ho祅g kim i h錸g bao)/#mk_tixia_ep(0,102,8023)",                    	--0，102，8023--0，102，8026
		"Nh薾 Danh B� ngo筰 trang/mk_tixia_wai",
		"R阨 kh醝/no_say")
end

function mk_tixia_ep(nNeed, nDetail, nParticular)
	local nBody = GetBody() - 1
	if BigGetItemCount(0,nDetail,nParticular + nBody) > 0 then
		Say("B筺  c� v藅 ph萴 n祔 r錳!", 0)
		return
	end
	
	if GetItemCount(2, 1, 1001) < 4 or GetItemCount(2, 1, 539) < 6 then
		Talk(1, "", "H祅h trang kh玭g  h遖 th� b輈h ho芻 ho祅g kim i h錸g bao.");
		return
	end
	local tTitle = 
	{
		[100] = {8},
		[300] = {4},
		[350] = {12},
	}
	local nMapID = GetWorldPos()
	local nNeedTitle = tTitle[nMapID][1]
	local szTongName, nCessBuysell, nCessStore, nTime = GetCityWarInfo(nMapID, "base")
	if szTongName ~= GetTongName() or IsTitleExist(51, nNeedTitle) == 0 then
		Say("C竎 h� kh玭g ph秈 l� Danh B� th祅h n祔, kh玭g th� nh薾 lo筰 trang b� n祔.", 0)
		return
	end
	if Zgc_pub_goods_add_chk(1, 50) == 0 then
		return
	end
	
	if nNeed > 0 then
		if DelItem(2,1,1001,4) == 1 and DelItem(2, 1, 539, 6) == 1 then
			AddItem(0,nDetail,nParticular+nBody,1,1,-1,-1,-1,-1,-1,-1)
			Msg2Player("C竎 h� nh薾 頲 1 trang b� Danh B�")
			WriteLog("[C玭g th祅h chi課]:"..GetName().."Ch� t筼 1 trang b� Danh B� (0,"..nDetail..","..(nParticular+nBody)..")")
		end
	elseif nNeed == 0 then
		if DelItem(2,1,1001,4) == 1 and DelItem(2, 1, 539, 6) == 1 then
			AddItem(0,nDetail,nParticular+nBody,1,1,-1,-1,-1,-1,-1,-1)
			WriteLog("[C玭g th祅h chi課]:"..GetName().."Ch� t筼 1 trang b� Danh B� (0,"..nDetail..","..(nParticular+nBody)..")")
			Msg2Player("C竎 h� nh薾 頲 1 trang b� Danh B�")
		end
	end
end

function mk_tixia_wai()
	local nBody = GetBody() - 1
	if BigGetItemCount(0,109,308+nBody) > 0 and BigGetItemCount(0,108,300+nBody) > 0 and
	 	BigGetItemCount(0,110,300+nBody) > 0 then
		Say("C竎 h�  c�  b� trang b� Danh B� r錳.", 0)
		return
	end
	
	local tTitle = 
	{
		[100] = {8},
		[300] = {4},
		[350] = {12},
	}
	local nMapID = GetWorldPos()
	local nNeedTitle = tTitle[nMapID][1]
	local szTongName, nCessBuysell, nCessStore, nTime = GetCityWarInfo(nMapID, "base")
	if szTongName ~= GetTongName() or IsTitleExist(51, nNeedTitle) == 0 then
		Say("C竎 h� kh玭g ph秈 l� Danh B� th祅h n祔, kh玭g th� nh薾 lo筰 trang b� n祔.", 0)
		return
	end
	if Zgc_pub_goods_add_chk(3, 150) == 0 then
		return
	end
	
	if BigGetItemCount(0,109,308+nBody) < 1 then
		local nResult, nIndex = AddItem(0,109,308+nBody, 1, 1)
		SetItemExpireTime(nIndex, nTime - GetTime())
	end
	
	if BigGetItemCount(0,108,300+nBody) < 1 then
		local nResult, nIndex = AddItem(0,108,300+nBody, 1, 1)
		SetItemExpireTime(nIndex, nTime - GetTime())
	end
	
	if BigGetItemCount(0,110,300+nBody) < 1 then
		local nResult, nIndex = AddItem(0,110,300+nBody, 1, 1)
		SetItemExpireTime(nIndex, nTime - GetTime())
	end
	Msg2Player("C竎 h�  c�  1 b� ngo筰 trang Danh B� r錳.")
end

function get_shiye_equip()
	Say("<color=green>Qu秐 l� th祅h th�<color>: Trang b� Qu﹏ S� 頲 h頿 b雐 ngo筰 trang Qu﹏ S� v� 1 b� trang s鴆 Qu﹏ S�",
		4,
		"Ch� t筼 trang s鴆 Tr� Gi� C萴 Nang (5 h遖 th� b輈h + 7 ho祅g kim i h錸g bao)/mk_shiye_ring_1",
		"Ch� t筼 trang s鴆 Th竛h Hi襫 Ng鋍 B閕 (5 h遖 th� b輈h + 7 ho祅g kim i h錸g bao)/mk_shiye_ring_2",
		"Nh薾 ngo筰 trang Qu﹏ S�/mk_shiye_wai",
		"R阨 kh醝/no_say")
end

function mk_shiye_ring_1()
	if BigGetItemCount(0,102,8021) > 0 then
		Say("C竎 h�  c� Tr� Gi� C萴 Nang r錳.", 0)
		return
	end
	if GetItemCount(2, 1, 1001) < 5 or GetItemCount(2, 1, 539) < 7 then
		Talk(1, "", "H祅h trang kh玭g  h遖 th� b輈h ho芻 ho祅g kim i h錸g bao.");
		return
	end
	local tTitle = 
	{
		[100] = {7},
		[300] = {3},
		[350] = {11},
	}
	local nMapID = GetWorldPos()
	local nNeedTitle = tTitle[nMapID][1]
	local szTongName, nCessBuysell, nCessStore, nTime = GetCityWarInfo(nMapID, "base")
	if szTongName ~= GetTongName() or IsTitleExist(51, nNeedTitle) == 0 then
		Say("Чi hi謕 kh玭g ph秈 l� Qu﹏ S� th祅h n祔.", 0)
		return
	end
	if Zgc_pub_goods_add_chk(1, 100) == 0 then
		return
	end
	
	if DelItem(2,1,1001,4) == 1 and DelItem(2, 1, 539, 6) == 1 then
		if BigGetItemCount(0,102,8021) < 1 then
			local nResult, nIndex = AddItem(0,102,8021, 1, 1,-1,-1,-1,-1,-1,-1)
		end
		Msg2Player("Чi hi謕 nh薾 頲 1 Tr� Gi� C萴 Nang")
	end
end

function mk_shiye_ring_2()
	if BigGetItemCount(0,102,8022) > 0 then
		Say("C竎 h�  c� Th竛h Hi襫 Ng鋍 B閕 r錳.", 0)
		return
	end
	if GetItemCount(2, 1, 1001) < 5 or GetItemCount(2, 1, 539) < 7 then
		Talk(1, "", "H祅h trang kh玭g  h遖 th� b輈h ho芻 ho祅g kim i h錸g bao.");
		return
	end
	local tTitle = 
	{
		[100] = {7},
		[300] = {3},
		[350] = {11},
	}
	local nMapID = GetWorldPos()
	local nNeedTitle = tTitle[nMapID][1]
	local szTongName, nCessBuysell, nCessStore, nTime = GetCityWarInfo(nMapID, "base")
	if szTongName ~= GetTongName() or IsTitleExist(51, nNeedTitle) == 0 then
		Say("Чi hi謕 kh玭g ph秈 l� Qu﹏ S� th祅h n祔.", 0)
		return
	end
	if Zgc_pub_goods_add_chk(1, 100) == 0 then
		return
	end
	
	if DelItem(2,1,1001,4) == 1 and DelItem(2, 1, 539, 6) == 1 then
		if BigGetItemCount(0,102,8022) < 1 then
			local nResult, nIndex = AddItem(0,102,8022, 1, 1,-1,-1,-1,-1,-1,-1)
		end
		Msg2Player("Чi hi謕 nh薾 頲 1 Th竛h Hi襫 Ng鋍 B閕.")
	end
end

function mk_shiye_wai()
	local nBody = GetBody() - 1
	if BigGetItemCount(0,109,304+nBody) > 0 then
		Say("Чi hi謕   1 b� ngo筰 trang Qu﹏ S�", 0)
		return
	end
	local tTitle = 
	{
		[100] = {7},
		[300] = {3},
		[350] = {11},
	}
	local nMapID = GetWorldPos()
	local nNeedTitle = tTitle[nMapID][1]
	local szTongName, nCessBuysell, nCessStore, nTime = GetCityWarInfo(nMapID, "base")
	if szTongName ~= GetTongName() or IsTitleExist(51, nNeedTitle) == 0 then
		Say("Чi hi謕 kh玭g ph秈 l� Qu﹏ S� th祅h n祔.", 0)
		return
	end
	if Zgc_pub_goods_add_chk(1, 50) == 0 then
		return
	end
	if BigGetItemCount(0,109,304+nBody) < 1 then
		local nResult, nIndex = AddItem(0,109,304+nBody, 1, 1)
		SetItemExpireTime(nIndex, nTime - GetTime())
	end
	Msg2Player("Чi hi謕 thu 頲 ngo筰 trang Qu﹏ S�.")
end

function get_weibing_suit()
	local nBody = GetBody() - 1
	if BigGetItemCount(0,100,8009+nBody) > 0 and BigGetItemCount(0,101,8009+nBody) > 0 and
		BigGetItemCount(0,103,8009+nBody) > 0 and BigGetItemCount(0,102,8009+nBody) > 0 and
		BigGetItemCount(0,110,221+nBody) > 0 and BigGetItemCount(0,108,481+nBody) > 0 and
		BigGetItemCount(0,109,491+nBody) > 0 then
		
		Say("B筺  c� 1 b� V� binh Kh玦 gi竝!", 0)
		return
	end
	
	if Zgc_pub_goods_add_chk(6, 250) == 0 then
		return
	end
	local nMapID = GetWorldPos()
	local szTongName, nCessBuysell, nCessStore, nTime = GetCityWarInfo(nMapID, "base")
	
	if BigGetItemCount(0,100,8009+nBody) < 1 then
		local nResult, nIndex = AddItem(0,100,8009+nBody,1,1,-1,-1,-1,-1,-1,-1,0,0)
		SetItemExpireTime(nIndex, nTime - GetTime())
	end
	
	if BigGetItemCount(0,101,8009+nBody) < 1 then
		local nResult, nIndex = AddItem(0,101,8009+nBody,1,1,-1,-1,-1,-1,-1,-1,0,0)
		SetItemExpireTime(nIndex, nTime - GetTime())
	end
	
	if BigGetItemCount(0,103,8009+nBody) < 1 then
		local nResult, nIndex = AddItem(0,103,8009+nBody,1,1,-1,-1,-1,-1,-1,-1,0,0)
		SetItemExpireTime(nIndex, nTime - GetTime())
	end
	
	if BigGetItemCount(0,102,8009+nBody) < 1 then
		local nResult, nIndex = AddItem(0,102,8009+nBody,1,1,-1,-1,-1,-1,-1,-1)
		SetItemExpireTime(nIndex, nTime - GetTime())
	end
	
	if BigGetItemCount(0,110,221+nBody) < 1 then
		local nResult, nIndex = AddItem(0,110,221+nBody,1,1)
		SetItemExpireTime(nIndex, nTime - GetTime())
	end
	
	if BigGetItemCount(0,108,481+nBody) < 1 then
		local nResult, nIndex = AddItem(0,108,481+nBody,1,1)
		SetItemExpireTime(nIndex, nTime - GetTime())
	end
	
	if BigGetItemCount(0,109,491+nBody) < 1 then
		local nResult, nIndex = AddItem(0,109,491+nBody,1,1)
		SetItemExpireTime(nIndex, nTime - GetTime())
	end
	
	Msg2Player("B筺 nh薾 頲 1 b� V� binh Kh玦 gi竝")
end

function yes_get_boss()
	local nMapID = GetWorldPos()
	local tMapTitleID =
	{
		[300] = {51, 1},
		[100] = {51, 5},
		[350] = {51, 9},
	}
	if tMapTitleID[nMapID] == nil then		-- 出错了
		Talk(1,"","<color=red>S� d鬾g script [C玭g th祅h chi課] b� nhi謒 Th祅h Ch� l鏸! Xin h穣 b竜 l筰 cho nh� ph竧 h祅h!!<color>")
		return
	end
	
	local nRet = SetCityWarPlayerDuty(nMapID, 0)
	if nRet == -1 then
		Say("Th祅h n祔 hi謓 ch璦 c� bang h閕 chi誱 l躰h", 0)
	elseif nRet == 1 then
		Say("Th祅h th� n穣  c� 1 Th祅h Ch� ho芻 ngi  c� m閠 ch鴆 v� kh竎, kh玭g th� nh薾 th猰 ch鴆 tc.", 0)
	elseif nRet == 0 then
		local szTongName, _2, _3, nTime = GetCityWarInfo(nMapID, "base")
		local nDetail = tMapTitleID[nMapID][2] + GetSex() - 1
		AddTitle(tMapTitleID[nMapID][1], nDetail)
		SetCurTitle(tMapTitleID[nMapID][1], nDetail)
		SaveNow()
		Say("B筺 m nh薾 ch鴆 "..get_tong_sex_name(), 2, "V祇 Qu秐 l� th祅h th�/manage_city", "R阨 kh醝/no_say")
		WriteLog("C玭g th祅h chi課-Qu秐 l�:"..GetTongName().."-"..GetName().." tr� th祅h Th祅h Ch�")
	end
end

function manager_getarchivebox()
	if Zgc_pub_goods_add_chk(1, 1) == 0 then		-- 这个判断要先做，因为CanGetArchiveBox操作成功就认为领取成功了
		return
	end
	local nMapID = GetWorldPos()
	local nRet = CanGetArchiveBox(nMapID)
	if nRet == -1 then
		Say("Th祅h n祔 hi謓 ch璦 c� bang h閕 chi誱 l躰h", 0)
	elseif nRet == 7 then
		Say("Qu� bang  nh薾 Th祅h Й 蕁 r錳", 0)
	elseif nRet == 5 or nRet == 6 then
		Say("Ch� c� Th祅h Ch� m韎 c� th� nh薾 頲 Th祅h Й 蕁", 0)
	elseif nRet == 0 then
		local _, nIdx = AddItem(2 ,1 ,1207 ,1 , 1)
		local nMapID = GetWorldPos()
		local szTongName, _2, _3, nTime = GetCityWarInfo(nMapID, "base")
		local nExpireTime = nTime - GetTime() - 64800
		if nExpireTime < 0 then								-- 出错了，至少给玩家3天时间吧
			nExpireTime = 3 * 24 * 3600
		end
		SetItemParam(nIdx, 0, nMapID)						-- 哪个城市的
		SetItemParam(nIdx, 1, 0)							-- 军师的数量
		SetItemParam(nIdx, 2, 0)							-- 名捕的数量
		SetItemExpireTime(nIdx, nExpireTime)				-- 物品到时间消失
		SaveNow()
		Msg2Player("Thu 頲 1 Th祅h Й 蕁")
		SendTongMessage(GetName().."Х nh薾 頲 Th祅h Й 蕁")
		WriteLog("C玭g th祅h chi課-Qu秐 l�:"..GetTongName().."-"..GetName().."R髏 頲 1 Th祅h Й 蕁")
	end
end

function manager_getmoney()
	
end

function yes_get_money(nGold)
	local nMapID = GetWorldPos()
	local nCD = GetCityWarOpCD(nMapID, 0)
	if nCD == -1 then
		Say("Th祅h n祔 hi謓 ch璦 c� bang h閕 chi誱 l躰h", 0)
	elseif nCD > 2100000000 then
		print("Kh玭g c� thao t竎 n祔 ")
	elseif nCD > 0 then
		local nHour = floor(nCD / 3600)
		local nMin = floor(mod(nCD, 3600) / 60)
		local nSec = mod(nCD, 60)
		Say("C遪 c莕 "..nHour.."h "..nMin.." Ph髏 "..nSec.." gi﹜ n鱝 m韎 ti課 h祅h 頲 thao t竎 n祔!", 0)
	elseif nCD == 0 then
		local _1, _2, _3, _4, nMoney = GetCityWarInfo(nMapID, "base")
		local nGetMaxMoney = (1000000 + (GetLevel() - 1) * 500000) * 2
		
		local nMax = 0
		if nGold < nGetMaxMoney then
			nMax = nGold
		else
			nMax = nGetMaxMoney
		end
		if nGold <= nMax then
			-- 经过前面层层检测还出错就不需要给提示了..直接封杀
			local nMapID = GetWorldPos()
			local nRet = GetCityWarMoney(nMapID, nMax)
		end
	end
end

function manager_setcess()
	local nMapID = GetWorldPos()
	local szTongName, nCessBuysell, nCessStore = GetCityWarInfo(nMapID, "base")
	if szTongName == nil then
		Say("Th祅h n祔 hi謓 ch璦 c� bang h閕 chi誱 l躰h", 0)
		return
	end
	Say("Qu� bang  thi誸 l藀 thu� su蕋 bu鑞 b竛 l� <color=yellow>"..(nCessBuysell / 10).."%<color>, thu� b祔 b竛 l� <color=yellow>"..(nCessStore / 10).."%<color>. C� ph秈 mu鑞 thay i?",
		2, --"更改买卖税/change_mai_cess", 
		"Thay i thu� b祔 b竛/change_bai_cess",
		"R阨 kh醝/no_say")
end

function change_mai_cess()
	local nMapID = GetWorldPos()
	local nCD = GetCityWarOpCD(nMapID, 1)
	if nCD == -1 then
		Say("Th祅h n祔 hi謓 ch璦 c� bang h閕 chi誱 l躰h", 0)
	elseif nCD > 2100000000 then
		print("Kh玭g c� thao t竎 n祔 ")
	elseif nCD > 0 then
		local nHour = floor(nCD / 3600)
		local nMin = floor(mod(nCD, 3600) / 60)
		local nSec = mod(nCD, 60)
		Say("C遪 c莕 "..nHour.."h "..nMin.." Ph髏 "..nSec.." gi﹜ n鱝 m韎 ti課 h祅h 頲 thao t竎 n祔!", 0)
	elseif nCD == 0 then
		AskClientForNumber("yes_change_mai_cess", 0, 100, "Кn v�: ph莕 ng祅")
	end
end

function change_bai_cess()
	local nMapID = GetWorldPos()
	local nCD = GetCityWarOpCD(nMapID, 2)
	if nCD == -1 then
		Say("Th祅h n祔 hi謓 ch璦 c� bang h閕 chi誱 l躰h", 0)
	elseif nCD > 2100000000 then
		print("Kh玭g c� thao t竎 n祔 ")
	elseif nCD > 0 then
		local nHour = floor(nCD / 3600)
		local nMin = floor(mod(nCD, 3600) / 60)
		local nSec = mod(nCD, 60)
		Say("C遪 c莕 "..nHour.."h "..nMin.." Ph髏 "..nSec.." gi﹜ n鱝 m韎 ti課 h祅h 頲 thao t竎 n祔!", 0)
	elseif nCD == 0 then
		AskClientForNumber("yes_change_bai_cess", 0, 100, "Кn v�: ph莕 ng祅")
	end
end

function yes_change_mai_cess(n)
	local nMapID = GetWorldPos()
	if n >= 0 and n <= 100 then
		local nRet = SetCityWarCess(nMapID, 0, n)
		if nRet == 0 then
			Msg2Player("B筺  thi誸 l藀 thu� mua b竛 l�: "..(n / 10).."%")
		end
	end
end

function yes_change_bai_cess(n)
	local nMapID = GetWorldPos()
	if n >= 0 and n <= 100 then
		local nRet = SetCityWarCess(nMapID, 1, n)
		if nRet == 0 then
			Msg2Player("B筺  thi誸 l藀 thu� b祔 b竛 l�: "..(n / 10).."%")
		end
	end
end

function res_box_add()
	--领取权限判断
	local nMapID, nDuty = GetCityWarDutyFlag()
	local Map_ID_player = GetWorldPos()
	if Map_ID_player ~= nMapID or (nDuty ~= 1 and nDuty ~= 0 )then
		Talk(1,"","<color=yellow>Qu秐 l� th祅h th�<color>: Ch� c� b鎛 <color=yellow> Th祅h Ch� <color>v� <color=yellow>Qu﹏ S�<color> m韎 c� th� nh薾 頲 <color=yellow> b秓 rng t礽 nguy猲<color>?")
		return
	end
	--时间端判断
	local szTongName, _2, _3, nTime = GetCityWarInfo(nMapID, "base")
	local nDay = tonumber(date("%w"))
	local nHour = tonumber(date("%H"))
	if (nDay == 3 and nHour < 21) or nDay == 0 or nDay == 1 or nDay == 2 or nDay == 6 or nDay == 5 then
		Talk(1,"","Th阨 gian  l穘h <color=yellow>B秓 rng t礽 nguy猲<color> l� gi鱝 th阨 gian <color=yellow>B秓 h� t礽 nguy猲 chi課 (m鏸 t鑙 th� T� t� 19h-20h)<color> v� <color=yellow>th� N╩<color> m鏸 tu莕")
		return
	end
	--=============
--	if gf_JudgeRoomWeight(25,100,"") == 0 then
--		return 0;
--	end;	
---	if gf_GetTaskByte(TSK_BAORUONG_TAINGUYEN,2) == 1 then	
--		Talk(1, "", "Th祅h ch�  nh薾 thng r錳 !!!!")
--		return 0
--	end
--	gf_SetTaskByte(TSK_BAORUONG_TAINGUYEN,2,1)
--	AddItem(2,1,1210,25)
--	WriteLogEx("Cong Thanh Chien","B秓 v� t礽 nguy猲",1,"Rng t礽 nguy猲","",GetTongName())
--	do return 0 end
--	---==========畂筺 di t筸 ng ng祔 13/1/2015
	--对话
	local box_num = GetCityBoxCount(Map_ID_player) - 10	
	if box_num <= 0 then
		Talk(1,"","Hi謓 kh玭g c� <color=yellow>B秓 rng t礽 nguy猲<color> n祇  l穘h!")
		return
	else
		Say("Tu莕 n祔 qu� bang c遪 <color=yellow>"..box_num.."<color> <color=yellow>B秓 rng t礽 nguy猲<color> c� th� l穘h! B﹜ gi� l穘h ch�?",
		2,
		"L穘h thng/res_box_get",
		"в ta suy ngh� l筰/end_dialog"
		)
	end
end
--资源宝箱的获取
function res_box_get()
	local Map_ID_player = GetWorldPos()
	local box_num = GetCityBoxCount(Map_ID_player) - 10
	--数量检测，方式几个人同时点
	if box_num <= 0 then
		return
	end
	--空间负重检测
	if Zgc_pub_goods_add_chk(box_num+2,box_num) ~= 1 then
		return
	end
	--增加
		--先减少数量
	if AddCityBoxCount(Map_ID_player,-(box_num + 10)) > 0 then			
		local nRet, nItemIdx = 0,0
		for i=1,box_num do
			nRet, nItemIdx = AddItem(2,1,1210,1)
			if nRet ==1 then
				SetItemExpireTime(nItemIdx,24*60*60)
			end
		end
		SendTongMessage(GetName().." Х nh薾 cho bang m譶h "..box_num.." Rng t礽 nguy猲!")
		WriteLogEx("Cong Thanh Chien","B秓 v� t礽 nguy猲",box_num,"Rng t礽 nguy猲","",GetTongName())
		Talk(1,"","Ngi  nh薾 "..box_num.." <color=yellow>B秓 rng t礽 nguy猲<color>, nh蕄 chu閠 ph秈 ph秈 nh薾 頲 t礽 nguy猲 trong !")
		if box_num >= 20 then
			nRet, nItemIdx = AddItem(2,1,1067,1,1)
			if nRet == 1 then
				SetItemExpireTime(nItemIdx,7*24*60*60)
				SendTongMessage(GetName().." Х nh薾 cho bang m譶h 1 мnh H錸 Thi猲 Th筩h Th莕 Th筩h")
				WriteLogEx("Cong Thanh Chien","B秓 v� t礽 nguy猲",1,"мnh H錸 Thi猲 Th筩h Th莕 Th筩h","",GetTongName())
			end
		elseif box_num >= 15 then
			nRet, nItemIdx = AddItem(2,1,1068,1,1)
			if nRet == 1 then
				SetItemExpireTime(nItemIdx,7*24*60*60)
				SendTongMessage(GetName().." Х nh薾 cho bang m譶h 1 Thi猲 Th筩h Linh Th筩h")
				WriteLogEx("Cong Thanh Chien","B秓 v� t礽 nguy猲",1,"Thi猲 Th筩h Linh Th筩h","",GetTongName())
			end
		elseif box_num >= 10 then
			nRet, nItemIdx = AddItem(2,1,1001,1,1)
			if nRet == 1 then
				SetItemExpireTime(nItemIdx,7*24*60*60)
				SendTongMessage(GetName().." Х nh薾 cho bang m譶h 1 H遖 Th� B輈h")
				WriteLogEx("Cong Thanh Chien","B秓 v� t礽 nguy猲",1,"H遖 Th� B輈h","",GetTongName())
			end
		end			
	end
end

function jieshao_city()
	Say("Thuy誸 minh qu秐 l� th祅h th�", 3, "Thuy誸 minh X璶g hi謚/chenghao_shuoming", "Thuy誸 minh X璶g hi謚 Trang b�/fuli_shuoming", "K誸 th骳 i tho筰/no_say")
end

function chenghao_shuoming()
	Say("Danh hi謚: Sau khi k誸 th骳 c玭g th祅h chi課 v� bang ch� s� n NPC qu秐 l� th祅h th� nh薾 danh hi謚 Th祅h Ch� v� b� nhi謒 th�. Ngi ch琲 c莕 ph秈 k輈h ho箃 danh hi謚 Th祅h Ch� m韎 c� th� th鵦 thi c竎 quy襫 l鵦 Th祅h Ch�. C竎 lo筰 danh hi謚 c玭g th祅h chi課 kh玭g th� nhng ho芻 i cho ngi kh竎\nB� nhi謒 th�: Th祅h Ch� n qu秐 l� th祅h th�  nh薾 1 ti課 c� Qu﹏ S� v� 4 ti課 c� b� u. Th祅h Ch� ph秈 ti課 h祅h t� i v韎 ngi c莕 b� nhi謒 r錳 tra quy襫 l鵦 tng 鴑g, khi ngi ch琲 s� d鬾g b� nhi謒 th� s� thu 頲 danh hi謚 tng 鴑g.\nH筺 ch� s� d鬾g b� nhi謒 th�: Ngi ch琲  c� c竎 danh hi謚 (Th祅h Ch�, Th祅h Ch�, Danh B�) th� kh玭g th� s� d鬾g th猰 b� nhi謒 th�, t蕋 c� c竎 lo筰 b� nhi謒 th� s� bi課 m蕋 v祇 s竛g th� 7, danh hi謚 s� bi課 m蕋 sau khi k誸 th骳 c玭g th祅h.", 3, "Thuy誸 minh ch鴆 v�/zhiwu_shuoming", "tr� l筰/jieshao_city", "K誸 th骳 i tho筰/no_say")
end

function zhiwu_shuoming()
	Say("Ch� th輈h ch鴆 v�:", 2, "tr� l筰/jieshao_city", "K誸 th骳 i tho筰/no_say")
end

function ziyuan_shuoming()
	Say("B秓 h� T礽 nguy猲: C鑞g ph萴 cho tri襲 nh s� do Bang ph竔 Th祅h Ch� chuy觧 甶. S� t礽 nguy猲 n祔 c� 4 ph莕 s� 頲 tr鵦 ti誴 a v祇 th祅h, 6 ph莕 c遪 l筰 s� b� l璾 l筰 � 2 th祅h th� l﹏ c薾 trong v遪g 2 canh gi�, c莕 c� Bang ph竔 Th祅h Ch� t� b秓 v�. C竎 t礽 nguy猲 kh玭g b� cp v� c竎 t礽 nguy猲 頲 a tr鵦 ti誴 v祇 th祅h s� 頲 b秓 qu秐 t筰 ch� Qu秐 th祅h s�.", 3, "Xem c竎 a 甶觤 b秓 h� T礽 nguy猲/wuzi_didian", "tr� l筰/jieshao_city", "K誸 th骳 i tho筰/no_say")
end

function wuzi_didian()
	Say("мa 甶觤 t礽 nguy猲: \nTh祅h Й: Nam m玭 (189.191); (192.186); (188. 186)\n B綾 m玭 (181.198); (186.194); (178.191)",  2, "tr� l筰/jieshao_city", "K誸 th骳 i tho筰/no_say")
	--\n	泉州：泉州府北 （189，191）（184，195）（192，195）\n      泉州府西 （195，196）（190，196）（184，194）\n	襄阳：灵宝山   （207，221）（214，220）（221，221）\n      武陵山   （195，177）（192，183）（187，180）", 2, "返回/jieshao_city", "结束对话/no_say")
end

function fuli_shuoming()
	Say("Thuy誸 minh X璶g hi謚 Trang b�: Ngi ch琲 c� X璶g hi謚 c bi謙 c� th� l穘h ho芻 ch� t筼 trang b� c bi謙, to祅 b� th祅h vi猲 trong bang h閕 u c� th� l穘h V� binh Kh玦 gi竝 v� ngo筰 trang th祅h th�", 2, "tr� l筰/jieshao_city", "K誸 th骳 i tho筰/no_say")
end

function no_say()
end
