--=============================================
--create by baiyun 2009.8.25
--describe:越南版8月份调整 武林使者脚本
--=============================================
Include("\\script\\task\\plant_tuoguan\\head.lua");
Include("\\script\\vng\\lib\\vnglib_award.lua")

--日常任务头文件
Include("\\script\\task\\richangrenwu\\head.lua");
g_strNpc = "<color=green>V� l﹎ s� gi�: <color>";
function main()
	local tbSayDialog = {};
	local nSaySize = 0;
	local szSayHead = g_strNpc.."Hi謓 t筰 ch� c馻 ta c� v礽 vi謈 c莕 Thi誹 hi謕 gi髉 , Ch糿g hay thi誹 hi謕 c� s絥 l遪g hay kh玭g?"
	local nDate = tonumber(date("%Y%m%d"))	
	if   nDate <= 20420229 then
		tinsert(tbSayDialog,"Ta mu鑞 mua v藅 ph萴 V� L﹎ Ho祅g Kim L謓h/buy_HKL")
	end
	tinsert(tbSayDialog,"Nh薾 ph莕 thng tr錸g c﹜ b竧 nh�/get_tuanguan_award")
	tinsert(tbSayDialog,"T筰 h� mu鑞 tr錸g c﹜ gi髉 ngi kh竎/#plant_tuoguan(2, 0,0)")
	tinsert(tbSayDialog,"T筰 h� n nh薾 ph莕 thng gi髉 tr錸g c﹜./get_help_tuoguan_award")
	tinsert(tbSayDialog,"H玬 nay  n閜  16 B竧 Nh� Ch鴑g Th� /already_give_16_banruozhengshu")
	
	tinsert(tbSayDialog,"Nh薾 ph莕 thng theo c竎 n蔯 甶觤 t輈h l騳 tr錸g c﹜/#get_award(1)")	

	tinsert(tbSayDialog,"Ki觤 tra s� 甶觤 t輈h l騳 nh薾 tr錸g c﹜ gi髉 ngi kh竎 th祅h c玭g./see_point")
	tinsert(tbSayDialog,"T筰 h� ch� gh� ngang!/nothing")
	
	if DAILY_TASK_0912_SWITCH == 1 then
		tinsert(tbSayDialog, 1, "Nhi謒 v� thng nh藅/DaliyTask0912About");
	end
	Say(szSayHead, getn(tbSayDialog), tbSayDialog);
end

function buy_HKL()
	local tbSayDialog = {};
	local nSaySize = 0;
	local szSayHead = g_strNpc.."Hi謓 t筰 ch� c馻 ta c� b竛 V� L﹎ Ho祅g Kim L謓h"
	
	tinsert(tbSayDialog,"Ta mu鑞 mua 10 V� L﹎ Ho祅g Kim L謓h (20 Xu v藅 ph萴)/#confirm_buy_HKL(1)")
	tinsert(tbSayDialog,"Ta mu鑞 mua 100 V� L﹎ Ho祅g Kim L謓h (200 Xu v藅 ph萴)/#confirm_buy_HKL(2)")	
	tinsert(tbSayDialog,"Ta mu鑞 mua 1000 V� L﹎ Ho祅g Kim L謓h(2000 Xu v藅 ph萴)/#confirm_buy_HKL(3)")
	tinsert(tbSayDialog,"T筰 h� ch� gh� ngang!/main")
	
	Say(szSayHead, getn(tbSayDialog), tbSayDialog);
end

local tNum = {10, 100, 1000}
function confirm_buy_HKL(nSelected)
	if nSelected == 1 then
		if GetItemCount(2,1,30230) < 20  then
			Talk(1, "", "B筺 kh玭g mang theo  Xu v藅 ph萴!")
			return
		end
		if DelItem(2,1,30230,20) == 1 then
			gf_AddItemEx2({2,1,30284,10}, "Ho祅g Kim L謓h", "MUA HOANG KIM LENH", "th祅h c玭g")
		end
	end
	if nSelected == 2 then
		if GetItemCount(2,1,30230) < 200  then
			Talk(1, "", "B筺 kh玭g mang theo  Xu v藅 ph萴!")
			return
		end
		if DelItem(2,1,30230,200) == 1 then
			gf_AddItemEx2({2,1,30284,100}, "Ho祅g Kim L謓h", "MUA HOANG KIM LENH", "th祅h c玭g")
		end
	end	
	if nSelected == 3 then
		if GetItemCount(2,1,30230) < 2000  then
			Talk(1, "", "B筺 kh玭g mang theo  Xu v藅 ph萴!")
			return
		end
		if DelItem(2,1,30230,2000) == 1 then
			gf_AddItemEx2({2,1,30284,1000}, "Ho祅g Kim L謓h", "MUA HOANG KIM LENH", "th祅h c玭g")
		end
	end	
end

function get_token()
	local nDate = tonumber(date("%Y%m%d"))
	if nDate >= 20090922 and nDate <= 20490927 then
		if GetLevel() < 99 then
			Say(g_strNpc.."Ch� c� cao th� ng c蕄 99 m韎 s� h鱱 頲 蕁 t輓! Thi誹 hi謕 h穣 r蘮 luy謓 th猰!",0)
			return
		end
		local nExtVal = GetExtPoint(4)
		if nExtVal < 1 then
			Say(g_strNpc.."Thi誹 hi謕 kh玭g c� trong danh s竎h nh薾 thng!",0)
			return
		elseif  nExtVal == 2 then
			Say(g_strNpc.."Ch糿g ph秈 i hi謕  nh薾 蕁 t輓 r錳 sao?",0)
			return
		end
		if GetFreeItemRoom() <1  then
			Say(g_strNpc.."H祅h trang c馻 i hi謕 kh玭g  � tr鑞g. H穣 s緋 x誴 l筰!",0)
			return
		end		
		if nExtVal == 1 then
			AddExtPoint(4,1)
		end	
	end
end

function get_tuanguan_award()
	if GetTask(TASK_TUOGUAN_PLANT_HAS_ACTIVE) == 0 or GetTask(TASK_TUOGUAN_PLANT_TYPE) ~= 1 then
		Say(g_strNpc.."Thi誹 hi謕 th藅 kh衞 a, thi誹 hi謕  c� 駓 th竎 tr錸g c﹜ B竧 Nh� ch璦 m� i nh薾 thng.", 1, "Th藅 ng筰 qu�! T筰 h� s� quay l筰 sau./nothing");
		return 0;
	end
	local nDiff = GetTime() - GetTask(TASK_TUOGUAN_PLANT_ACTIVE_TIME)
	if nDiff < 900 then
		Say(g_strNpc.."Thi誹 hi謕 c莕"..(900 - nDiff).." gi﹜ sau m韎 c� th� nh薾 ph莕 thng 駓 th竎 tr錸g c﹜", 1, "K誸 th骳 i tho筰/nothing");
		return 0;
	end
	if gf_JudgeRoomWeight(5, 50, g_strNpc) == 0 then
		return 0;
	end
	--给经验
	local nRand = gf_GetRandItemByTable(t_TUOGUAN_EXP[1], 100, 1);
	local nExp = t_TUOGUAN_EXP[1][nRand][1];
	ModifyExp(nExp);
	Msg2Player("B筺 nh薾 頲 "..nExp.." 甶觤 kinh nghi謒");
	--给物品
	nRand = gf_GetRandItemByTable(t_TUOGUAN_AWARD, 1000, 2);
	nName = t_TUOGUAN_AWARD[nRand][1];
	if nRand >=1 and nRand <= 5 then
		nName = "V遪g Th竔 H� B竧 Qu竔";
	end
	local nRet, nIndex = gf_AddItemEx(t_TUOGUAN_AWARD[nRand][3], nName);
	if nRet == 1 then
		WriteLogEx("Uy thac trong cay", "Phan Thuong Uy Thac", 1, t_TUOGUAN_AWARD[nRand][1]);
		if nRand == 10 then
			SetItemExpireTime(nIndex, 15 * 24 * 60 * 60);
		end
	end
	SetTask(TASK_TUOGUAN_PLANT_HAS_ACTIVE, 0);
	SetTask(TASK_TUOGUAN_PLANT_TYPE, 0);
end

function get_help_tuoguan_award()
	if GetTask(TASK_TUOGUAN_PLANT_HAS_ACTIVE) == 0 or GetTask(TASK_TUOGUAN_PLANT_TYPE) ~= 2 then
		Say(g_strNpc.."Thi誹 hi謕 th藅 kh衞 a, thi誹 hi謕  c� nh薾 tr錸g c﹜ B竧 Nh� gi髉 ai ch璦 m� i nh薾 thng.", 1, "Th藅 ng筰 qu�! T筰 h� s� quay l筰 sau./nothing");
		return 0;
	end
	local nDiff = GetTime() - GetTask(TASK_TUOGUAN_PLANT_ACTIVE_TIME)
	if nDiff < 360 then
		Say(g_strNpc.."Thi誹 hi謕 c莕"..(360 - nDiff).." gi﹜ sau m韎 c� th� nh薾 thng gi髉 ngi kh竎 tr錸g c﹜", 1, "K誸 th骳 i tho筰/nothing");
		return 0;
	end
	if gf_JudgeRoomWeight(5, 50, g_strNpc) == 0 then
		return 0;
	end
	--给积分
	local nRand = gf_GetRandItemByTable(t_TUOGUAN_HELP_POINT, 100, 1);
	local nPoint = t_TUOGUAN_HELP_POINT[nRand][1];
	SetTask(TASK_TUOGUAN_PLANT_POINT, GetTask(TASK_TUOGUAN_PLANT_POINT) + nPoint);
	Msg2Player("B筺 nh薾 頲 "..nPoint.." 甶觤 tr錸g c﹜");
	WriteLogEx("Uy thac trong cay", "nh薾", nPoint, "Diem tich luy");
	--给经验
	local nRand = gf_GetRandItemByTable(t_TUOGUAN_EXP[2], 100, 1);
	local nExp = t_TUOGUAN_EXP[2][nRand][1];
	ModifyExp(nExp);
	Msg2Player("B筺 nh薾 頲 "..nExp.." 甶觤 kinh nghi謒");
	--- 觤 V薾 May
	local nPointVM = gf_GetTaskByte(TSK_LUCKY_DAOHUU_NEW_THANG4, BYTE_POINT_LUCKY)	
	local nExpVM = (nPointVM - 100)/100*nExp
	ModifyExp(nExpVM)
	if nExpVM > 0 then
		Msg2Player("B筺 nh薾 th猰 ".. nExpVM.." 甶觤 kinh nghi謒 t� v薾 may!")
	else
		Msg2Player("B筺 b� t鎛 th蕋 ".. nExpVM.." 甶觤 kinh nghi謒 do kh玭g may m緉. H穣 甶 gi秈 v薾 xui � Th莥 B鉯 Si猽 H筺g!")
	end
	---------	
	--给物品
	nRand = gf_GetRandItemByTable(t_TUOGUAN_AWARD, 1000, 2);
	nName = t_TUOGUAN_AWARD[nRand][1];
	if nRand >=1 and nRand <= 5 then
		nName = "V遪g Th竔 H� B竧 Qu竔";
	end
	local nRet, nIndex = gf_AddItemEx(t_TUOGUAN_AWARD[nRand][3], nName);
	if nRet == 1 then
		WriteLogEx("Uy thac trong cay", "Phan Thuong Nhan Uy Thac", 1, t_TUOGUAN_AWARD[nRand][1]);
		if nRand == 10 then
			SetItemExpireTime(nIndex, 15 * 24 * 60 * 60);
		end
	end
	if tonumber(date("%y%m%d")) >= 101029 and tonumber(date("%y%m%d")) <= 401205 then
		gf_AddItemEx2({ 2, 1, 30250, 50}, "nguy猲 li謚 event 201011", "Hoat dong thang 11 nam 2010", "N閜 BNCT")
	end
	if tonumber(date("%y%m%d")) >= 110114 and tonumber(date("%y%m%d")) <= 410220 then
		gf_AddItemEx2({ 2, 1, 30277, 30}, "Nguy猲 li謚 event T誸", "Hoat dong thang 1 nam 2011", "N閜 BNCT")
	end
	SetTask(TASK_TUOGUAN_PLANT_HAS_ACTIVE, 0);
	SetTask(TASK_TUOGUAN_PLANT_TYPE, 0);
end

function see_point()
	Say(g_strNpc.."Hi謓 t筰 b筺 c� <color=red>"..GetTask(TASK_TUOGUAN_PLANT_POINT).."<color> 甶觤 tr錸g c﹜.", 1, "tr� l筰/main");
end


function nothing()
end

function already_give_16_banruozhengshu()
	local nDate = tonumber(date("%y%m%d"));
	if GetTask(TASK_TUOGUAN_GIVE_BANRUO_DATE) < nDate then
		SetTask(TASK_TUOGUAN_GIVE_BANRUO_COUNT, 0);
	end
	if GetTask(TASK_TUOGUAN_GET_AWARD_DATE) >= nDate then
		Say(g_strNpc.."H玬 nay thi誹 hi謕  nh薾 ph莕 thng B竧 Nh� Ch鴑g Th� r錳, xin h穣 i ng祔 mai r錳 quay l筰.", 1, "Th藅 ng筰 qu�! Ta s� quay l筰 sau./nothing");
		return 0;
	end
	if GetTask(TASK_TUOGUAN_GIVE_BANRUO_COUNT) < 16 then
		Say(g_strNpc.."Thi誹 hi謕 m韎 n閜 <color=yellow>"..GetTask(TASK_TUOGUAN_GIVE_BANRUO_COUNT).."/16<color> B竧 Nh� Ch鴑g Th� trong ng祔. H穣 n閜 th猰 甶!!", 1, "Th藅 ng筰 qu�! Ta s� quay l筰 sau./nothing");
		return 0;
	else
		if gf_Judge_Room_Weight(2, 50, g_strNpc) == 0 then
			return 0;
		end
--		local nRand = gf_GetRandItemByTable(t_TUOGUAN_8_AWARD, 100, 3);
--		gf_SetLogCaption(str_TUOGUAN_LOG);
--		local nRetCode, nIndex = gf_AddItemEx(t_TUOGUAN_8_AWARD[nRand][3], t_TUOGUAN_8_AWARD[nRand][1]);
--		if nRetCode == 1 then
--			SetItemExpireTime(nIndex, t_TUOGUAN_8_AWARD[nRand][4]);
--			SetTask(TASK_TUOGUAN_GET_AWARD_DATE, nDate);
--			WriteLogEx("Uy thac trong cay", "Nop 16 Bat nha chung thu", 1, t_TUOGUAN_8_AWARD[nRand][1]);
--		end
--		gf_SetLogCaption("");
		SetTask(TASK_TUOGUAN_GET_AWARD_DATE, nDate);
		Give_BNCT_16_Award()
	end
end

function get_award(nPage)
	local tb_say = {};
	if nPage == 1 then
		tinsert(tb_say, "250 甶觤 t輈h l騳 � nh薾 2 M藅 t辌h s� m玭 cap c蕄 70/#confirm_get_award(1, 250)");
		tinsert(tb_say, "500 甶觤 t輈h l騳 �  nh薾 6 Nh﹏ s﹎ v筺 n╩/#confirm_get_award(2, 500)");
		tinsert(tb_say, "750 甶觤 t輈h l騳 � nh薾 100 tr竔 c﹜ ng蓇 nhi猲/#confirm_get_award(3, 750)");	
		tinsert(tb_say, "1000 甶觤 t輈h l騳 � nh薾 1 Thi猲 Th筩h Linh Th筩h/#confirm_get_award(4, 1000)");
		tinsert(tb_say, "1250 甶觤 t輈h l騳 � nh薾 6 nh﹏ s﹎ v筺 n╩/#confirm_get_award(5, 1250)");
		tinsert(tb_say, "1500 甶觤 t輈h l騳 � nh薾 2 H遖 Th� B輈h/#confirm_get_award(6, 1500)");
		tinsert(tb_say, "Trang k�/#get_award(2)");
		tinsert(tb_say, "Trang trc/#get_award(1)");
	elseif nPage == 2 then
		tinsert(tb_say, "1750 甶觤 t輈h l騳 �  nh薾 100 tr竔 c﹜ ng蓇 nhi猲/#confirm_get_award(7, 1750)");
		tinsert(tb_say, "2000 甶觤 t輈h l騳 � nh薾 6 nh﹏ s﹎ v筺 n╩/#confirm_get_award(8, 2000)");
		tinsert(tb_say, "2250 甶觤 t輈h l騳 � nh薾 1 мnh H錸 Thi猲 Th筩h Th莕 Th筩h/#confirm_get_award(9, 2250)");
		tinsert(tb_say, "2500 甶觤 t輈h l騳 � nh薾 2 Thi猲 Cang L謓h/#confirm_get_award(10, 2500)");
		tinsert(tb_say, "2750 甶觤 t輈h l騳 � nh薾 6 nh﹏ s﹎ v筺 n╩/#confirm_get_award(11, 2750)");
		tinsert(tb_say, "3000 甶觤 t輈h l騳 � nh薾 1 Чi мnh H錸/#confirm_get_award(12, 3000)");
		tinsert(tb_say, "Trang k�/#get_award(3)");
		tinsert(tb_say, "Trang trc/#get_award(1)");
	elseif nPage == 3 then	
		tinsert(tb_say, "3250 甶觤 t輈h l騳 � nh薾 2Thi猲 M玭 Kim L謓h/#confirm_get_award(13, 3250)");
		tinsert(tb_say, "3500 甶觤 t輈h l騳 � nh薾 6 nh﹏ s﹎ v筺 n╩/#confirm_get_award(14, 3500)");
		tinsert(tb_say, "3750 甶觤 t輈h l騳 � nh薾 1 L╪g Ba Vi B�/#confirm_get_award(15, 3750)");
		tinsert(tb_say, "4000 甶觤 t輈h l騳 � nh薾 1 t骾 Thi猲 Th筩h Tinh Th筩h/#confirm_get_award(16, 4000)");
		tinsert(tb_say, "4250 甶觤 t輈h l騳 � nh薾 100 tr竔 c﹜ ng蓇 nhi猲/#confirm_get_award(17, 4250)");
		tinsert(tb_say, "4500 甶觤 t輈h l騳 � nh薾 1 Chuy觧 sinh n/#confirm_get_award(18, 4500)");
		tinsert(tb_say, "Trang k�/#get_award(4)");
		tinsert(tb_say, "Trang trc/#get_award(2)");
	elseif nPage == 4 then
		tinsert(tb_say, "4750 甶觤 t輈h l騳 � nh薾 1 Thi猲 Th筩h Linh Th筩h/#confirm_get_award(19, 4750)");
		tinsert(tb_say, "5000 甶觤 t輈h l騳 � nh薾 2 H遖 Th� B輈h/#confirm_get_award(20, 5000)");
		tinsert(tb_say, "5250 甶觤 t輈h l騳 � nh薾 6 nh﹏ s﹎ v筺 n╩/#confirm_get_award(21, 5250)");
		tinsert(tb_say, "5500 甶觤 t輈h l騳 � nh薾 1 мnh H錸 Thi猲 Th筩h Th莕 Th筩h/#confirm_get_award(22, 5500)");
		tinsert(tb_say, "5750 甶觤 t輈h l騳 � nh薾 1 t骾 Thi猲 Th筩h Tinh Th筩h/#confirm_get_award(23, 5750)");
		tinsert(tb_say, "6000 甶觤 t輈h l騳 � nh薾 1 L╪g Ba Vi B� To祅 T藀/#confirm_get_award(24, 6000)");
		tinsert(tb_say, "Trang k�/#get_award(5)");		
		tinsert(tb_say, "Trang trc/#get_award(3)");
	elseif nPage == 5 then
		tinsert(tb_say, "6250 甶觤 t輈h l騳 � nh薾 100 tr竔 c﹜ ng蓇 nhi猲/#confirm_get_award(25, 6250)");
		tinsert(tb_say, "6500 甶觤 t輈h l騳 � nh薾 2 H遖 Th� B輈h/#confirm_get_award(26, 6500)");
		tinsert(tb_say, "6750 甶觤 t輈h l騳 � nh薾 6 nh﹏ s﹎ v筺 n╩/#confirm_get_award(27, 6750)");
		tinsert(tb_say, "7000 甶觤 t輈h l騳 � nh薾 1 Chuy觧 sinh n/#confirm_get_award(28, 7000)");
		tinsert(tb_say, "7250 甶觤 t輈h l騳 � nh薾 2 Thi猲 M玭 Kim L謓h/#confirm_get_award(29, 7250)");
		tinsert(tb_say, "7500 甶觤 t輈h l騳 � nh薾 18 nh﹏ s﹎ v筺 n╩/#confirm_get_award(30, 7500)");
		tinsert(tb_say, "Trang trc/#get_award(4)");
	else
		tinsert(tb_say, "Trang k�/#get_award(2)");
		tinsert(tb_say, "Trang trc/#get_award(1)");
	end		
	tinsert(tb_say, "K誸 th骳 i tho筰/nothing");
	Say(g_strNpc.."Чi hi謕 mu鑞 i ph莕 thng n祇", getn(tb_say), tb_say);
end

function confirm_get_award(nIndex, nNeedPoint)
	local nPoint = GetTask(TASK_TUOGUAN_PLANT_POINT);
	local nFlag = GetTask(TASK_TUOGUAN_GET_AWARD_FLAG);
	if GetBit(nFlag, nIndex) == 1 then
		Talk(1, "", g_strNpc.."Чi hi謕  nh薾 ph莕 thng n祔 r錳, kh玭g th� nh薾 th猰 頲 n鱝");
		return 0;
	end
	if nPoint < nNeedPoint then
		Talk(1, "", g_strNpc.."觤 t輈h l騳 c馻 i hi謕 kh玭g , kh玭g th� nh薾 ph莕 thng n祔");
		return 0;
	end
	if t_TUOGUAN_POINT_TO_AWARD[nIndex][2] == nil then
		if gf_JudgeRoomWeight(2, 50, g_strNpc) == 0 then
			Talk(1,"","H祅h trang ho芻 s鴆 l鵦 kh玭g , vui l遪g s緋 x誴 l筰.")
			return 0;
		end
	else
		if gf_JudgeRoomWeight(t_TUOGUAN_POINT_TO_AWARD[nIndex][2][4], 50, g_strNpc) == 0 then
			Talk(1,"","H祅h trang ho芻 s鴆 l鵦 kh玭g , vui l遪g s緋 x誴 l筰.")
			return 0;
		end
	end
	SetTask(TASK_TUOGUAN_GET_AWARD_FLAG, SetBit(nFlag, nIndex, 1));
	gf_SetLogCaption(str_TUOGUAN_LOG);
	if nIndex ~= 1 and nIndex ~= 3 and nIndex ~= 7 and nIndex ~= 17 and nIndex ~= 25 then
		gf_AddItemEx2(t_TUOGUAN_POINT_TO_AWARD[nIndex][2], t_TUOGUAN_POINT_TO_AWARD[nIndex][1], "BNCT doi diem tich luy", "B竧 Nh� Ch鴑g Th�",t_TUOGUAN_POINT_TO_AWARD[nIndex][3])
--		local _, nItemIndex = gf_AddItemEx(t_TUOGUAN_POINT_TO_AWARD[nIndex][2], t_TUOGUAN_POINT_TO_AWARD[nIndex][1]);		
--		if t_TUOGUAN_POINT_TO_AWARD[nIndex][3] then
--			SetItemExpireTime(nItemIndex, t_TUOGUAN_POINT_TO_AWARD[nIndex][3]);
--		end
	elseif nIndex == 1 then
		--按门派给秘籍
		local nRoute = GetPlayerRoute();
		if not t_TUOGUAN_LOW[nRoute] then
			Talk(1, "", g_strNpc.."Чi hi謕 v蒼 ch璦 gia nh藀 m玭 ph竔 n祇 c�, kh玭g th� nh薾 頲 m藅 t辌h s� m玭 cao c蕄");
			return 0;
		end
		gf_AddItemEx(t_TUOGUAN_HIG[nRoute][2], t_TUOGUAN_HIG[nRoute][1])
	elseif  nIndex == 3 or nIndex == 7 or nIndex == 17  or nIndex == 25 then
		local nAwardRand = mod(random(1,1000),20)
		gf_AddItemEx2({2,1,(30164+nAwardRand),100}, "Tr竔 C﹜")
	end
	WriteLogEx("Uy thac trong cay", "Doi diem", 1, t_TUOGUAN_POINT_TO_AWARD[nIndex][1]);
	gf_SetLogCaption("");
end

function get_award_2010(nPage)
	local tb_say = {};
	if nPage == 1 then
		tinsert(tb_say, "300 甶觤 t輈h l騳 � nh薾 4 Nh﹏ S﹎ V筺 N╩/#confirm_get_award_2010(1, 300)");
		tinsert(tb_say, "600 甶觤 t輈h l騳 � nh薾 4 Nh﹏ S﹎ V筺 N╩/#confirm_get_award_2010(2, 600)");
		tinsert(tb_say, "900 甶觤 t輈h l騳 � nh薾 4 Nh﹏ S﹎ V筺 N╩/#confirm_get_award_2010(3, 900)");	
		tinsert(tb_say, "1200 甶觤 t輈h l騳 � nh薾 4 Nh﹏ S﹎ V筺 N╩/#confirm_get_award_2010(4, 1200)");
		tinsert(tb_say, "1500 甶觤 t輈h l騳 � nh薾 4 Nh﹏ S﹎ V筺 N╩/#confirm_get_award_2010(5, 1500)");
		tinsert(tb_say, "1800 甶觤 t輈h l騳 � nh薾 4 Nh﹏ S﹎ V筺 N╩/#confirm_get_award_2010(6, 1800)");
		tinsert(tb_say, "Trang k�/#get_award_2010(2)");
		tinsert(tb_say, "Trang trc/#get_award_2010(1)");
	elseif nPage == 2 then
		tinsert(tb_say, "2100 甶觤 t輈h l騳 � nh薾 4 Nh﹏ S﹎ V筺 N╩/#confirm_get_award_2010(7, 2100)");
		tinsert(tb_say, "2400 甶觤 t輈h l騳 � nh薾 4 Nh﹏ S﹎ V筺 N╩/#confirm_get_award_2010(8, 2400)");
		tinsert(tb_say, "2700 甶觤 t輈h l騳 � nh薾 4 Nh﹏ S﹎ V筺 N╩/#confirm_get_award_2010(9, 2700)");
		tinsert(tb_say, "3000 甶觤 t輈h l騳 � nh薾 4 Nh﹏ S﹎ V筺 N╩/#confirm_get_award_2010(10, 3000)");
		tinsert(tb_say, "3300 甶觤 t輈h l騳 � nh薾 4 Nh﹏ S﹎ V筺 N╩/#confirm_get_award_2010(11, 3300)");
		tinsert(tb_say, "3600 甶觤 t輈h l騳 � nh薾 4 Nh﹏ S﹎ V筺 N╩/#confirm_get_award_2010(12, 3600)");
		tinsert(tb_say, "Trang k�/#get_award_2010(3)");
		tinsert(tb_say, "Trang trc/#get_award_2010(1)");
	elseif nPage == 3 then	
		tinsert(tb_say, "3900 甶觤 t輈h l騳 � nh薾 4 Nh﹏ S﹎ V筺 N╩/#confirm_get_award_2010(13, 3900)");
		tinsert(tb_say, "4200 甶觤 t輈h l騳 � nh薾 4 Nh﹏ S﹎ V筺 N╩/#confirm_get_award_2010(14, 4200)");
		tinsert(tb_say, "4500 甶觤 t輈h l騳 � nh薾 4 Nh﹏ S﹎ V筺 N╩/#confirm_get_award_2010(15, 4500)");
		tinsert(tb_say, "4800 甶觤 t輈h l騳 � nh薾 4 Nh﹏ S﹎ V筺 N╩/#confirm_get_award_2010(16, 4800)");
		tinsert(tb_say, "5100 甶觤 t輈h l騳 � nh薾 4 Nh﹏ S﹎ V筺 N╩/#confirm_get_award_2010(17, 5100)");
		tinsert(tb_say, "5400 甶觤 t輈h l騳 � nh薾 4 Nh﹏ S﹎ V筺 N╩/#confirm_get_award_2010(18, 5400)");
		tinsert(tb_say, "Trang k�/#get_award_2010(4)");
		tinsert(tb_say, "Trang trc/#get_award_2010(2)");
	elseif nPage == 4 then
		tinsert(tb_say, "5700 甶觤 t輈h l騳 � nh薾 4 Nh﹏ S﹎ V筺 N╩/#confirm_get_award_2010(19, 5700)");
		tinsert(tb_say, "6000 甶觤 t輈h l騳 � nh薾 4 Nh﹏ S﹎ V筺 N╩/#confirm_get_award_2010(20, 6000)");
		tinsert(tb_say, "6300 甶觤 t輈h l騳 � nh薾 4 Nh﹏ S﹎ V筺 N╩/#confirm_get_award_2010(21, 6300)");
		tinsert(tb_say, "6600 甶觤 t輈h l騳 � nh薾 4 Nh﹏ S﹎ V筺 N╩/#confirm_get_award_2010(22, 6600)");
		tinsert(tb_say, "6900 甶觤 t輈h l騳 � nh薾 4 Nh﹏ S﹎ V筺 N╩/#confirm_get_award_2010(23, 6900)");
		tinsert(tb_say, "7200 甶觤 t輈h l騳 � nh薾 4 Nh﹏ S﹎ V筺 N╩/#confirm_get_award_2010(24, 7200)");		
		tinsert(tb_say, "Trang trc/#get_award_2010(3)");
	else
		tinsert(tb_say, "Trang k�/#get_award_2010(2)");
		tinsert(tb_say, "Trang trc/#get_award_2010(1)");
	end		
	tinsert(tb_say, "K誸 th骳 i tho筰/nothing");
	Say(g_strNpc.."Чi hi謕 mu鑞 i ph莕 thng n祇", getn(tb_say), tb_say);
end

function confirm_get_award_2010(nIndex, nNeedPoint)
	local nPoint = GetTask(TASK_TUOGUAN_PLANT_POINT);
	local nFlag = GetTask(TASK_TUOGUAN_GET_AWARD_FLAG);
	if GetBit(nFlag, nIndex) == 1 then
		Talk(1, "", g_strNpc.."Чi hi謕  nh薾 ph莕 thng n祔 r錳, kh玭g th� nh薾 th猰 頲 n鱝");
		return 0;
	end
	if nPoint < nNeedPoint then
		Talk(1, "", g_strNpc.."觤 t輈h l騳 c馻 i hi謕 kh玭g , kh玭g th� nh薾 ph莕 thng n祔");
		return 0;
	end
	if gf_JudgeRoomWeight(2, 50, g_strNpc) == 0 then
		return 0;
	end
	gf_AddItemEx2({2,1,30071,4}, "4 Nh﹏ S﹎ V筺 N╩", "Uy thac trong cay 2010", "nh薾 thng")
	gf_SetTaskBit(TASK_TUOGUAN_GET_AWARD_FLAG, nIndex, 1)
end