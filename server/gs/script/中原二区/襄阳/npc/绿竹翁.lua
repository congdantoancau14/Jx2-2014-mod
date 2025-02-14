--NPC默认对话脚本
Include("\\script\\lib\\globalfunctions.lua")
Include("\\script\\online_activites\\2014_02\\shazhongjin.lua")
Include("\\script\\online_activites\\head\\activity_kill_npc_task.lua")
Include("\\script\\online_activites\\201504\\kill_npc_daily.lua")
Include("\\script\\online_activites\\201504\\kill_npc_weekly.lua")

function main(bTag)
	if g_akct_GetTaskStep(bTag) then
		return
	end
	local tbSay = {};
	
	--活动
	local tID = {152, 153}
	for i = 1, getn(tID) do
		g_online_npc_main(tbSay, tID[i], bTag)
	end

	if gf_CheckEventDateEx(VET_201402_ACTIVITYID) == 1 then
		tinsert(tbSay, VET_201402_MAIN);
	end
	
	if tbKillNpcDaily:CheckCondition(tbKillNpcDaily.nActivityID) == 1 then
		tbKillNpcDaily:NpcShowMainDialog(tbSay)
	end
	
	if tbKillNpcWeekly:CheckCondition(tbKillNpcWeekly.nActivityID) == 1 then
		tbKillNpcWeekly:NpcShowMainDialog(tbSay)
	end
local nDate = tonumber(date("%Y%m%d"))
	if nDate <= 20140930 then
		local nIsGetNV = mod(GetTask(TSK_THANGTIEN_PHUCSINH),10)
		if nIsGetNV == 0 then
			tinsert(tbSay, "Ta mu鑞 nh薾 nhi謒 v� T輈h L騳 Ph鬰 Sinh/get_TichLuyPhucSinh")		
		elseif nIsGetNV == 1 then
			tinsert(tbSay, "Ta mu鑞 i 甶觤 t輈h l騳 ph鬰 sinh/getpoint_TLPS")		
			tinsert(tbSay, "Ta mu鑞 xem s� 甶觤 t輈h l騳 ph鬰 sinh/showpoint_TLPS")	
			tinsert(tbSay, "Ta mu鑞 th╪g ti課 ph鬰 sinh (ti猽 hao 90 甶觤 t輈h l騳 ph鬰 sinh)/usepoint_TLPS")	
		end
	end
	if nDate >= 20130409 and nDate <= 20130421 then
 		tinsert(tbSay, "T輈h l騳 01 Ho祅g Kim Чi Ng﹏ Phi誹/#vng_nhiemvuthang4(1)")			
 		tinsert(tbSay, "T輈h l騳 10 Чi Ng﹏ Phi誹/#vng_nhiemvuthang4(2)")
 		tinsert(tbSay, "Nh薾 thng ho祅 th祅h  2 nhi謒 v� t輈h l騳/vng_nhiemvuthang4_finish")
 		tinsert(tbSay, "T筸 th阨 ta kh玭g mu鑞 l祄/nothing")			
	end
	tinsert(tbSay, "Tho竧/nothing")

	Say("<color=green>L鬰 Tr骳 g: <color>阯g ph� h玬 nay th藅 n竜 nhi謙.",getn(tbSay),tbSay);
end

function vng_nhiemvuthang4(nType)
	local tbCheck ={
				[1] = {"Ho祅g Kim Чi Ng﹏ Phi誹", 30490, 1},
				[2] = {"Чi Ng﹏ Phi誹", 199, 10},	
					}
	local nExp = 400000000
	if gf_GetTaskByte(TSK_NHIEMVUTHANG4,nType) >= 1 then
		Talk(1,"","Чi hi謕  ho祅 th祅h nhi謒 v� t輈h l騳 "..tbCheck[nType][1]);
		return 0;
	end		
	if GetItemCount(2,1, tbCheck[nType][2]) < tbCheck[nType][3] then
		Talk(1,"","Чi hi謕 kh玭g mang theo  "..tbCheck[nType][3].." "..tbCheck[nType][1].."  ho祅 th祅h nhi謒 v�");
		return 0
	end
	if gf_Judge_Room_Weight(5,200," ") ~= 1 then
		Talk(1,"","H祅h trang ho芻 s鴆 l鵦 kh玭g , vui l遪g s緋 x誴 l筰.")
		return 0;
	end	
	if GetPlayerRebornParam(0) < 1 then
		if  nExp > (2000000000 - GetExp()) then
			Talk(1,"", "C竎 h� kh玭g nh薾 頲 甶觤 kinh nghi謒 v� s� vt qu� 2 t� 甶觤 !!!!")
		end
	end
	if DelItem(2,1,tbCheck[nType][2],tbCheck[nType][3]) == 1 then
		gf_SetTaskByte(TSK_NHIEMVUTHANG4,nType,gf_GetTaskByte(TSK_NHIEMVUTHANG4,nType) + 1)
		ModifyExp(nExp)
		AwardGenuineQi(7000)
		gf_AddItemEx2({2,1,30390,70},"фi thng lo筰 "..tbCheck[nType][1],"NHIEM VU THANG 4 BK","Nh薾 th祅h c玭g m秐h thi猲 cang")
		if GetTask(701) >= 0 then
			SetTask(701,GetTask(701) + 7000)
		else
			SetTask(701,GetTask(701) - 7000)
		end		
		Msg2Player("B筺 nh薾 頲 7000 甶觤 c玭g tr筺g�")		
		gf_WriteLogEx("NHIEM VU THANG 4", "nh薾 thng th祅h c玭gi", 1, "Nh薾 thng lo筰 "..tbCheck[nType][1])		
	end
	
end

function vng_nhiemvuthang4_finish()
	local nValue1 = gf_GetTaskByte(TSK_NHIEMVUTHANG4,1)
	local nValue2 = gf_GetTaskByte(TSK_NHIEMVUTHANG4,2)
	local nValue3 = gf_GetTaskByte(TSK_NHIEMVUTHANG4,3)
	if nValue1 < 1 or nValue2 < 1 then
		Talk(1,"", "Чi hi謕 ch璦 ho祅 th祅h  2 nhi謒 v� t輈h l騳 n猲 kh玭g th� nh薾 thng !!")
		return 0
	end
	if nValue3 >= 1 then
		Talk(1,"", "Чi hi謕  nh薾 thng ho祅 th祅h  2 nhi謒 v� t輈h l騳 r錳 !!")
		return 0
	end
	if gf_Judge_Room_Weight(17,200," ") ~= 1 then
		Talk(1,"","H祅h trang ho芻 s鴆 l鵦 kh玭g , vui l遪g s緋 x誴 l筰.")
		return 0;
	end	
	gf_SetTaskByte(TSK_NHIEMVUTHANG4,3,gf_GetTaskByte(TSK_NHIEMVUTHANG4,3) + 1)	
	gf_AddItemEx2({2,1,9977,7},"Ho祅 th祅h 2 nv t輈h l騳","NHIEM VU THANG 4 BK","Nh薾 th祅h c玭g 7 Huy Ho祅g", 15 * 24 * 3600)
	gf_AddItemEx2({2,1,9998,7},"Ho祅 th祅h 2 nv t輈h l騳","NHIEM VU THANG 4 BK","Nh薾 th祅h c玭g 7 C玭g Чi", 15 * 24 * 3600)
	gf_AddItemEx2({2,1,30345,1,1},"Ho祅 th祅h 2 nv t輈h l騳","NHIEM VU THANG 4 BK","Nh薾 th祅h c玭g 1 Chuy觧 Sinh Кn", 60 * 24 * 3600)	
	gf_WriteLogEx("NHIEM VU THANG 4", "nh薾 thng th祅h c玭gi", 1, "Nh薾 thng ho祅 th祅h 2 l莕 t輈h l騳")				
end

function get_TichLuyPhucSinh()
	local nRoute = GetPlayerRoute()
	local tRoute = {[2]=1,[3]=1,[4]=1,[6]=1,[8]=1,[9]=1,[11]=1,[12]=1,[14]=1,[15]=1,[17]=1,[18]=1,[20]=1,[21]=1,[23]=1,[29]=1,[30]=1}
	local nChuyenSinh = (GetTranslifeCount() + GetPlayerRebornParam(0)) * 100 + GetLevel()
	if tRoute[nRoute] ~= 1 then	
		Talk(1, "", "<color=green>L鬰 Tr骳 g: <color>Ch璦 gia nh藀 h� ph竔, kh玭g th� tham gia ho箃 ng n祔.");
		return 0
	end	
	if nChuyenSinh < 599 then -- b総 chuy觧 sinh 7
		Talk(1,"","<color=green>L鬰 Tr骳 g: <color>Kinh nghi謒 chuy觧 sinh c馻 i hi謕 kh玭g , ta kh玭g th� gi髉 g� 頲 c� !!!!")
		return 0	
	end	
	if nChuyenSinh >= 600 then -- b総 chuy觧 sinh 7
		Talk(1,"","<color=green>L鬰 Tr骳 g: <color>Kinh nghi謒 chuy觧 sinh c馻 i hi謕 qu� cao, ta kh玭g th� gi髉 g� 頲 c� !!!!")
		return 0	
	end

	SetTask(TSK_THANGTIEN_PHUCSINH,1)
	gf_WriteLogEx("THANG TIEN PHUC SINH", "nh薾 nv", 1, "Nh薾 nhi謒 v� TTPS")	
	Talk(1, "", "<color=green>L鬰 Tr骳 g: <color>Ch骳 m鮪g b筺  nh薾 nhi謒 v� Th╪g Ti課 Ph鬰 Sinh th祅h c玭g")
end

function getpoint_TLPS()
	if TTPS_GetStatus() ~= 1 then
		Talk(1, "", "Чi hi謕 ch璦 nh薾 nhi謒 v�.");
		return 0
	end
	local nThaiHu = VNG_GetTaskPos(TSK_THANGTIEN_PHUCSINH,6,6)
	local nThoNuong = VNG_GetTaskPos(TSK_THANGTIEN_PHUCSINH,7,7)
	local nTongLieu = VNG_GetTaskPos(TSK_THANGTIEN_PHUCSINH,8,8)
	local nTodayPoint = VNG_GetTaskPos(TSK_THANGTIEN_PHUCSINH,5,4)
	local nCurrentPoint = VNG_GetTaskPos(TSK_THANGTIEN_PHUCSINH,3,2)
	local nMaxAllow = 90
	if nThaiHu < 1 then
		Talk(1, "", "<color=green>L鬰 Tr骳 g: <color>H玬 nay b筺 ch璦 ho祅 th祅h 1 l莕 Th竔 H� (thu ph�) n猲 kh玭g th� i 甶觤 t輈h l騳. H穣 mau 甶 ho祅 th祅h nhi謒 v� Th竔 H� !!!!")
		return 0
	end
	if nThoNuong < 1 then
		Talk(1, "", "<color=green>L鬰 Tr骳 g: <color>H玬 nay b筺 ch璦 ho祅 th祅h nhi謒 v� Th� Nng n猲 kh玭g th� i 甶觤 t輈h l騳. H穣 mau 甶 ho祅 th祅h nhi謒 v� Th� Nng !!!!")
		return 0
	end	
	if nTongLieu < 1 then
		Talk(1, "", "<color=green>L鬰 Tr骳 g: <color>H玬 nay b筺 ch璦 ho祅 th祅h 1 nhi謒 v� T鑞g Li猽 n猲 kh玭g th� i 甶觤 t輈h l騳. H穣 mau 甶 ho祅 th祅h 1 nhi謒 v� T鑞g Li猽 !!!!")
		return 0
	end		
--	if nTodayPoint >= 10 then
--		Talk(1, "", "<color=green>L鬰 Tr骳 g: <color>H玬 nay b筺  i  10 甶觤 t輈h l騳 r錳, ng祔 mai h穣 quay l筰 nha !!!!")
--		return 0
--	end	
	if nCurrentPoint >= nMaxAllow then
		Talk(1,"","<color=green>L鬰 Tr骳 g: <color>B筺  i  90 甶觤 r錳, h穣 th鵦 hi謓 Th╪g Ti課 Ph鬰 Sinh 甶 !!!!")
		return 0
	end	
	local tbSay = {}
	tinsert(tbSay, "фi 1 甶觤 t輈h l騳 (ti猽 hao 100 tri謚 kinh nghi謒 + 10 xu v藅 ph萴 + 10 v祅g/#takePoint(1)")			
	tinsert(tbSay, "фi 5 甶觤 t輈h l騳 (ti猽 hao 500 tri謚 kinh nghi謒 + 50 xu v藅 ph萴 + 50 v祅g/#takePoint(5)")			
	tinsert(tbSay, "фi 10 甶觤 t輈h l騳 (ti猽 hao 1 t� kinh nghi謒 + 100 xu v藅 ph萴 + 100 v祅g/#takePoint(10)")					
	tinsert(tbSay, "T筸 th阨 ta kh玭g mu鑞 l祄/nothing")			
	
	Say("<color=green>L鬰 Tr骳 g: <color>Ta c� th� gi髉 i hi謕 i 甶觤 t輈h l騳 Th╪g Ti課 Ph鬰 Sinh",getn(tbSay),tbSay);	
end

function takePoint(nType)
	if TTPS_GetStatus() ~= 1 then
		Talk(1, "", "Чi hi謕 ch璦 nh薾 nhi謒 v�.");
		return 0
	end
	if IsPlayerDeath() == 1 or IsStalling() == 1 then
		return 0
	end
	local nCurrentPoint = VNG_GetTaskPos(TSK_THANGTIEN_PHUCSINH,3,2)
	local nTodayPoint = VNG_GetTaskPos(TSK_THANGTIEN_PHUCSINH,5,4)
	local nMaxToday = 10
	local nMaxAllow = 90
	local tbMaterial = {
		[1] = {item={{gdp={2,1,30230,10}}},nExp = 100000000, nGold = 100000},
		[5] = {item={{gdp={2,1,30230,50}}},nExp = 500000000, nGold = 500000},
		[10] = {item={{gdp={2,1,30230,100}}},nExp = 1000000000, nGold = 1000000},
	}
	local nCheck = LIB_Award:CheckMaterial(tbMaterial[nType])
	if nCheck == 0 then
		return 0
	end	
	local nCheck_reset = VNG_GetTaskPos(TSK_THANGTIEN_PHUCSINH,9,9)
--	if nCheck_reset == 1 then
--		VNG_SetTaskPos(TSK_THANGTIEN_PHUCSINH, 0, 5, 4) -- Reset doi diem moi ngay
--		VNG_SetTaskPos(TSK_THANGTIEN_PHUCSINH, 0, 9, 9)
--	end	
	if nCurrentPoint >= nMaxAllow then
		Talk(1,"","<color=green>L鬰 Tr骳 g: <color>B筺  i  90 甶觤 r錳, h穣 th鵦 hi謓 Th╪g Ti課 Ph鬰 Sinh 甶 !!!!")
		return 0
	end	
--	if (nTodayPoint + nType) > nMaxToday then
--		Talk(1,"","<color=green>L鬰 Tr骳 g: <color>M鴆 甶觤 i trong ng祔 vt qu� gi韎 h筺 "..nMaxToday..", c竎 h� h穣 ch鋘 m鴆 i kh竎.")
--		return 0
--	end

	LIB_Award:PayMaterial(tbMaterial[nType])
	nCurrentPoint = nCurrentPoint + nType
	nTodayPoint = nTodayPoint + nType
	VNG_SetTaskPos(TSK_THANGTIEN_PHUCSINH,nCurrentPoint,3,2)
	VNG_SetTaskPos(TSK_THANGTIEN_PHUCSINH,nTodayPoint,5,4)
	Talk(1, "", "<color=green>L鬰 Tr骳 g: <color> Ch骳 m鮪g i hi謕 i th祅h c玭g "..nType.." 甶觤 t輈h l騳")
	gf_WriteLogEx("THANG TIEN PHUC SINH", "i 甶觤", 1, nType.." 甶觤 t輈h c鵦")							
end

function showpoint_TLPS()
	if TTPS_GetStatus() ~= 1 then
		Talk(1, "", "<color=green>L鬰 Tr骳 g: <color>Чi hi謕 ch璦 nh薾 nhi謒 v�.");
		return 0
	end
	local nPoint = VNG_GetTaskPos(TSK_THANGTIEN_PHUCSINH,3,2)
	local nTodayPoint = VNG_GetTaskPos(TSK_THANGTIEN_PHUCSINH,5,4)
	local zString = "<color=green>L鬰 Tr骳 g: <color>\n"
	zString = zString.."T鎛g 甶觤 t輈h l騳 hi謓 t筰 c馻 b筺 l�: <color=yellow>"..nPoint.." 甶觤<color>\n"
	zString =	zString.."觤 i trong ng祔 l�: <color=yellow>"..nTodayPoint.." 甶觤<color>"
				
	Talk(1, "", zString)
end

function usepoint_TLPS()
	if TTPS_GetStatus() ~= 1 then
		Talk(1, "", "<color=green>L鬰 Tr骳 g: <color>Чi hi謕 ch璦 nh薾 nhi謒 v�.");
		return 0
	end
	local nCheckRule = check_rule()
	if nCheckRule == 0 then
		return 0
	end
	local tHeader = "<color=green>L鬰 Tr骳 g: <color>Чi hi謕 qu� l� m閠 k� nh﹏ trong V� L﹎, b総 u l躰h ng� b� k輕 <color=yellow>T� Linh Ph鬰 Sinh<color>  t ph� b譶h c秐h. L躰h ng� th祅h c玭g c� th� kich th輈h ti襪 l鵦 c馻 b秐 th﹏ t c秐h gi韎 m韎 trong Ф Th玭g Kinh M筩h. !!!"
	local tSay = {}	
	tinsert(tSay, "Ph鬰 sinh theo hng Long T�/#cs6_ttps_finish_confrim(1)")			
	tinsert(tSay, "Ph鬰 sinh theo hng H� T�/#cs6_ttps_finish_confrim(2)")			
	tinsert(tSay, "Ph鬰 sinh theo hng Ph鬾g T�/#cs6_ttps_finish_confrim(4)")			
	tinsert(tSay, "Ph鬰 sinh theo hng g T�/#cs6_ttps_finish_confrim(3)")		
	tinsert(tSay, "Ta ch璦 mu鑞 Ph鬰 Sinh/nothing")		
	Say(tHeader, getn(tSay), tSay)	
end

function cs6_ttps_finish_confrim(nType)
	local nChuyenSinh = (GetTranslifeCount() + GetPlayerRebornParam(0)) * 100 + GetLevel()
	local nRoute = GetPlayerRoute()
	local tbType = {"Long T�", "H� T�", "g T�", "Ph鬾g T�"}
	if IsPlayerDeath() ~= 0 then 
		Talk(1, "", "Hi謓 t筰 kh玭g th� nh薾 thng!!!")
		return
	end	
	if nChuyenSinh < 599 then -- b総 chuy觧 sinh 7
		Talk(1,"","<color=green>L鬰 Tr骳 g: <color>Kinh nghi謒 chuy觧 sinh c馻 i hi謕 kh玭g , ta kh玭g th� gi髉 g� 頲 c� !!!!")
		return 0	
	end	
	if nChuyenSinh >= 600 then -- b総 chuy觧 sinh 7
		Talk(1,"","<color=green>L鬰 Tr骳 g: <color>Kinh nghi謒 chuy觧 sinh c馻 i hi謕 qu� cao, ta kh玭g th� gi髉 g� 頲 c� !!!!")
		return 0	
	end
	--- b総 甶襲 ki謓 � y
	local nCheckRule = check_rule()
	if nCheckRule == 0 then
		return 0
	end
	if MeridianGetLevel() < 2 then	
		Talk(1,"","Kinh m筩h c馻 i hi謕 ch璦 t c蕄  V� Tng !!!!")
		return 0			
	end
	DelItem(2,0,1083,2)
	DelItem(2,1,30345,2)

	BigDelItem(2,0,30002, BigGetItemCount(2,0,30002))
	BigDelItem(2,0,30003, BigGetItemCount(2,0,30003))
	BigDelItem(2,0,30005, BigGetItemCount(2,0,30005))
	BigDelItem(2,0,30006, BigGetItemCount(2,0,30006))	
	local nType_cs5 = GetTranslifeFaction()	
	local nTransCount = GetTranslifeCount()	
		for i=1, getn(tb_translife_cloth[nType_cs5][nTransCount]) do
			local G,D,P,nCount, _, lvatt1, att1, lvatt2, att2, lvatt3, att3  = gf_UnPack(tb_translife_cloth[nType_cs5][nTransCount][i][2])
			P = P + GetBody() - 1
			Pnew = 30000 + GetBody()
			Pnew1 = 561 + GetBody()			
			Pnew2 = 565 + GetBody()		
			lvatt3 = lvatt3 or 0
			att3 = att3 or 0
			BigDelItem(G,D,P,BigGetItemCount(G,D,P))
			BigDelItem(G,D,Pnew,BigGetItemCount(G,D,Pnew))
			BigDelItem(G,D,Pnew1,BigGetItemCount(G,D,Pnew1))			
			BigDelItem(G,D,Pnew2,BigGetItemCount(G,D,Pnew2))					
--			gf_AddItemEx2({G, D, (30000 + GetBody()), nCount,4, lvatt1, att1, lvatt2, att2, lvatt3, att3},"T� Linh Vi謙 Trang","Chuyen Sinh","nh薾 ngo筰 trang",120*24*3600,1)
		end

	RemoveTitle(tb_translife_tittle[nTransCount][nRoute][2], tb_translife_tittle[nTransCount][nRoute][3])	

	local tbVanSu = {"V╪ S� ngo筰 trang",0,108,570,188}
	local nPVanSu = tbVanSu[4]  + GetBody() - 1
	for i = 0, 2 do
		BigDelItem(0, 108 + i, nPVanSu, BigGetItemCount(0, 108 + i, nPVanSu))	
	end
	gf_AddItemEx(tb_translife_seal_cs6[nType][2], tb_translife_seal_cs6[nType][1])
	PlayerReborn(1,nType) -- Chuy觧 Sinh 6 th祅h c玭g		
	SetLevel(10,0)
	AddTitle(61,05)
--	SetTask(TSK_CS6_TULINH,5)		--ho祅 th祅h nh謒 v� chuy觧 sinh
	VNG_SetTaskPos(TSK_THANGTIEN_PHUCSINH, 2, 1, 1)
 	gf_WriteLogEx("THANG TIEN PHUC SINH", "chuy觧 sinh th祅h c玭g", 1, "Finish nv Th╪g Ti課 Ph鬰 Sinh")	
 	local nGetExp = GetExp()
	local nTime = floor(nGetExp/2000000000)
	if nTime >= 1 then
		for i = 1, nTime do
			ModifyExp(-2000000000)
		end
	end
	ModifyExp(-GetExp())
	Msg2Player("Ch骳 m鮪g i hi謕  Ph鬰 Sinh th祅h c玭g theo hng "..tbType[nType])
	Say("Ch骳 m鮪g i hi謕  l躰h ng� th祅h c玭g b� k輕 gia truy襫 T� Linh Ph鬰 Tinh! H穣 ng nh藀 l筰.",1,"Tho竧!/go_exit")
end

function check_rule()
	local nPoint = VNG_GetTaskPos(TSK_THANGTIEN_PHUCSINH,3,2)
	if nPoint < 90 then
		Talk(1, "", "<color=green>L鬰 Tr骳 g: <color>Чi hi謕 t輈h ch璦 l騳  90 甶觤 Th╪g Ti課 Ph鬰 Sinh.");
		return 0
	end
	if GetItemCount(2,1,30345) < 2 then
		Talk(1, "", "<color=green>L鬰 Tr骳 g: <color>Чi hi謕 kh玭g mang  2 Chuy觧 Sinh Кn.");
		return 0
	end
	if GetItemCount(2,0,1083) < 2 then
		Talk(1, "", "<color=green>L鬰 Tr骳 g: <color>Чi hi謕 kh玭g mang  2 Th竔 D辌h H鏽 Nguy猲 C玭g Ph�.");
		return 0
	end
	return 1
end


function nothing()

end