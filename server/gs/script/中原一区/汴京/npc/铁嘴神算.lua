
-- ====================== 文件信息 ======================

-- 剑侠情缘onlineII 铁嘴神算脚本
-- Edited by peres
-- 2005/02/22 PM 18:03

-- ======================================================

Include("\\script\\task\\teach\\teach_main.lua");
Include("\\script\\vng\\lib\\vnglib_textdata.lua");
Include("\\script\\vng\\lib\\vnglib_award.lua");
Include("\\script\\vng\\lib\\vnglib_function.lua");
Include("\\script\\online\\viet_event\\top_server\\head_top.lua");
Include("\\script\\online\\viet_event\\top_server\\npc_top.lua");

szNpcName =  "<color=green>Th莥 B鉯<color>: "
function main()	

	local nState = TE_GetTeachState()
	local nLevel = GetLevel()
	local nDate = tonumber(date("%Y%m%d"))
	local tbSay = {}	
	
	if GetGlbValue(GLB_TSK_SERVER_ID) == 92 then
		if nDate >= 20141206 and nDate <= 20141207 then
			tinsert(tbSay, "Th祅h vi猲 nh薾 thng bang h閕 h筺g 1,2,3/TopBangHoi_NhanThuong_ThanhVien")
			tinsert(tbSay,"R阨 kh醝/gf_DoNothing")
			Say(szNpcName.."H� tr� nh薾 thng 畊a top bang h閕 \n", getn(tbSay), tbSay)
		end
		
		if nDate > 20141207 then
			if (nState==11) then
				task_011();
				return
			else
				Talk(1,"","Gi竝 th﹏ m飊g 5 th竛g 1, kinh tr藀, tr阨 l筺h, c� ngi di qu� l猲, th輈h h頿 ci h醝, k� th� m閏, hng ng nam t鑤!");
			end	
		end
	else		
		if (nState==11) then
			task_011();
			return
		else
			Talk(1,"","Gi竝 th﹏ m飊g 5 th竛g 1, kinh tr藀, tr阨 l筺h, c� ngi di qu� l猲, th輈h h頿 ci h醝, k� th� m閏, hng ng nam t鑤!");
		end		
	end	
end;

function TopBangHoi_NhanThuong_ThanhVien()
	local tbNhanThuong = {
		"5чcxxLoveCu錸g",	
		"oLoveуS竧VNGo",	
		"S鉩L銵猲Dame",	
		"StzHonDaCiVic",	
		"ZzCoiSieuNhanzZ",	
		"s2B阭C遡",	
		"oS2oM骯C閠9x",	
		"Ti襫LongH醓Ph鬾g",	
		"Ti猲LongH醓Ph鬾g",	
		"CXaVoTinhxxx",	
		"Kh玭gBi誸tT猲",	
		"JaVoAnhTh瞌i謓Z",	
		"VoDang1102",	
		"LinhSika",	
		"CloudofTsu",	
		"ZzCoiSieuNhanzZ",	
		"GiangHoLangTu",	
		"s2B阭C遡",	
		"StzHonDaCiVic",	
		"B鏽gV玊譶h",	
		"zzChuBizz",	
		"NSMxYeuStingRuaZ",	
		"zTuoiDayThio",	
		"ZzgTr﹗",	
		"zHiImGosu",	
		"GietNguoiKia",	
		"izC遡DJxT鑓чS2i",	
		"Thi猲S琻уngL穙",	
	}
	
	local bFound = 0
	for i = 1, getn(tbNhanThuong) do		
		if tbNhanThuong[i] == GetName() then	
			bFound = 1
			break
		end	
	end
	
	if bFound == 0 then
		Talk(1,"",szNpcName.."C竎 h� kh玭g c� t猲 trong danh s竎h nh薾 thng!")
		return
	end
	
	if VNG_GetTaskPos(TSK_CONGHIENBANG,5,5) == 1 then
		Talk(1,"",szNpcName.."C竎 h�  nh薾 thng, kh玭g th� nh薾 th猰 l莕 n鱝.")
		return 0
	end
	
	if gf_Judge_Room_Weight(15, 300) == 0 then
		Talk(1,"", szNpcName.."S鴆 l鵦 ho芻 h祅h trang kh玭g , c竎 h� h穣 s緋 x誴 l筰 nh�.")
		return 0
	end
	
	local nLevel = GetLevel();
	if nLevel <  90 then
		Talk(1,"",szNpcName.."Ъng c蕄 c馻 c竎 h� kh玭g  90, kh玭g th� nh薾 thng!")
		return 0
	end
	
	local nRoute = GetPlayerRoute()
	if nRoute == 0 then
		Talk(1, "", strNpcName.."C竎 h� ch璦 gia nh藀 m玭 ph竔 kh玭g th� nh薾 thng.");
		return
	end
	
	local tbAward1 = {
		item = {
			{gdp={2,1,30499,10}}, -- Hu﹏ chng anh h飊g
			{gdp={2,1,30535,20,4}}, -- Thi誸 tinh c蕄 3
			{gdp={2,1,1008,4,4}, nExpired=7*24*3600}, -- B筩h C﹗ Ti猲 Кn
			{gdp={0,105,30027,1,4,-1,-1,-1,-1,-1,-1,-1}}, -- H綾 H�
		},
		nExp = 200000000,
	}
	
	LIB_Award:Award(tbAward1)
	VNG_SetTaskPos(TSK_CONGHIENBANG, 1, 5, 5)
	Talk(1,"",szNpcName.."Nh薾 th祅h c玭g ph莕 tng d祅h cho th祅h vi猲 bang h閕!")
	gf_WriteLogEx("NHAN THUONG DUA TOP", "Nh薾", 1, "Ph莕 thng th祅h vi猲 bang h閕")
end