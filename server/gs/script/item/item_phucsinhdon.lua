--复生丹脚本
Include("\\script\\lib\\globalfunctions.lua")

--tinsert(tbSay, format("%s/on_use_fusheng", "确定使用"))

fsd_task_id = 3284
fsd_task_acc = 36

fsd_this_item={
	{"Ph鬰 Sinh Кn (Nguy猲 li謚)",2, 1, 30812},
	{"Ph鬰 Sinh Кn (Tu luy謓)",2, 1, 30813},
	{"Ph鬰 Sinh Кn",2, 1, 30814},
}
fsd_max_xiulan_daily=10
fsd_max_xiulan=100
fsd_taiyisuipian = {"Th竔 D辌h H鏽 Nguy猲 C玭g у",2, 0, 1082}
fsd_taiyihunyuan = {"Th竔 D辌h H鏽 Nguy猲 Ph�",2, 0, 1083, 4}
fsd_tNeed = {
	--经验 太易碎片 修为 点数
	{1000000000,100,7000, 1},
	{2000000000,200,8000, 2},
	{5000000000,500,9000, 5},
	{10000000000,1000,10000, 10},
}

--修炼
function on_use_xiulian(nItemIdx)
	if get_trans_level() < 699 then
		Talk(1,"","Ch璦 t chuy觧 sinh 6 c蕄 99!")
		return
	end
	
	local szTitle = format("Ta c� th� gi髉 ngi tu luy謓 Ph鬰 Sinh Кn, nguy猲 li謚 sau khi tu luy謓 s� kh鉧,\nХ t輈h l騳 tu luy謓 <color=yellow>%d/%d<color> 甶觤, h玬 nay c遪 頲 tu luy謓 <color=yellow>%d/%d<color> 甶觤", 
		fsd_get_xiulian(), fsd_max_xiulan, fsd_get_left_xiulian_cap(), fsd_max_xiulan_daily)
	local tbSay = {}
	for i=1,getn(fsd_tNeed) do
		t = fsd_tNeed[i]
		local szWord = format("Ta mu鑞 tu luy謓 %d 甶觤", t[4])
		tinsert(tbSay, format("%s/#do_xiulian(%d,%d)", szWord, nItemIdx, i))
	end

	tinsert(tbSay, format("%s/nothing", "Ra kh醝"))
	Say(szTitle, getn(tbSay), tbSay)
end

--转生
function on_use_fusheng(nItemIdx)
--	local szTitle = format("Чt chuy觧 sinh 6 c蕄 99, ti猽 hao 1 Ph鬰 Sinh Кn, %d %s, c� th� t╪g l猲 chuy觧 sinh 7 c蕄 10.", fsd_taiyihunyuan[5], fsd_taiyihunyuan[1])
--	tinsert(tbSay, format("%s/#on_use_fusheng_sure(%d)", "S� d鬾g", nItemIdx))
--	tinsert(tbSay, format("%s/nothing", "Ra kh醝"))
--	Say(szTitle, getn(tbSay), tbSay)
	Talk(1,"","C竎 h� h穣 n B綾 u L穙 Nh﹏ � Tuy觧 Ch﹗  c� th� ph鬰 sinh")
end

--获取修炼值
function fsd_get_xiulian()
	return gf_SafeGetTaskByte(fsd_task_id, 2)
end
--获取今日修炼值
function fsd_get_today_xiulian()
	return gf_SafeGetTaskByte(fsd_task_id, 1)
end
function fsd_set_xiulian(nValue)
	return gf_SafeSetTaskByte(fsd_task_id, 2, nValue, fsd_task_acc)
end
function fsd_set_today_xiulian(nValue)
	return gf_SafeSetTaskByte(fsd_task_id, 1, nValue, fsd_task_acc)
end
function fsd_get_left_xiulian_cap()
	local left_today = fsd_max_xiulan_daily - fsd_get_today_xiulian()
	local left_all = fsd_max_xiulan - fsd_get_xiulian()
	local ret = min(left_all, left_today)
	return ret
end

function do_xiulian(nItemIdx, nType)
	t = fsd_tNeed[nType]
	if not t then
		return
	end
	
	local nW, nX, nY = GetWorldPos()
	if nW ~= 300 and nW ~= 500 and nW ~= 400 and nW ~= 200 and nW ~= 350 and nW ~= 150 and nW ~= 100 then
		Talk(1,"","Ch� c� th� tu luy謓 � th蕋 i th祅h th�!")
		return 0
	end

	if  IsPlayerDeath() ~= 0 then
		Talk(1,"","Ngi  b� tr鋘g thng kh玭g th� tu luy謓")
		return
	end	
	
	if GetFightState() ~= 0 then
		Talk(1,"","Tr筺g th竔 hi謓 t筰 kh玭g th� tu luy謓!")
		return
	end

	if gf_CheckPlayerRoute() ~= 1 then
		Talk(1,"","C竎 h� ch璦 gia nh藀 h� ph竔, kh玭g th� tu luy謓 Ph鬰 Sinh Кn!")
		return
	end
	
	if gf_Judge_Room_Weight(2, 100, "") ~= 1 then
		return 0
	end

	local szTitle = format("Tu luy謓 %d 甶觤 c莕 ti猽 hao %s EXP, %d Th竔 D辌h H鏽 Nguy猲 C玭g у Gi竚, %d tu vi, ng � kh玭g?", t[4], show_large_int(t[1]), t[2], t[3])
	local tbSay = {}
	tinsert(tbSay, format("%s/#do_xiulian_sure(%d,%d)", "уng � tu luy謓", nItemIdx, nType))
	tinsert(tbSay, format("%s/nothing", "Ra kh醝"))

	Say(szTitle, getn(tbSay), tbSay)
end

function show_large_int(nValue)
	local strRet = ""
	local n = nValue
	while n >= 0 do
		if n >= 1000 then
			strRet = format("%s,000", strRet)
			n = floor(n/1000)
		else
			strRet = format("%d%s", n, strRet)
			n = -1
		end
	end
	return strRet
end

function do_xiulian_sure(nItemIdx, nType)
	local nW, nX, nY = GetWorldPos()
	if nW ~= 300 and nW ~= 500 and nW ~= 400 and nW ~= 200 and nW ~= 350 and nW ~= 150 and nW ~= 100 then
		Talk(1,"","Ch� c� th� tu luy謓 � th蕋 i th祅h th�!")
		return 0
	end

	if  IsPlayerDeath() ~= 0 then
		Talk(1,"","Ngi  b� tr鋘g thng kh玭g th� tu luy謓")
		return
	end	
	
	if GetFightState() ~= 0 then
		Talk(1,"","Tr筺g th竔 hi謓 t筰 kh玭g th� tu luy謓!")
		return
	end

	t = fsd_tNeed[nType]
	if not t then
		return 0
	end
	local nPoint = t[4]
	if 1 == check_and_give_fushengdan(0, nItemIdx) then --先看看以前有没有修满但是没领到奖励的情况
		return 0
	end
	
	if gf_CheckPlayerRoute() ~= 1 then
		Talk(1,"","C竎 h� ch璦 gia nh藀 h� ph竔, kh玭g th� tu luy謓 Ph鬰 Sinh Кn!")
		return
	end
	
	if fsd_get_left_xiulian_cap() < nPoint then
		Talk(1, "", "M鏸 ng祔 ch� c� th� tu luy謓 t鑙 產 10 甶觤!")
		return 0
	end
	if gf_Judge_Room_Weight(2, 100, "") ~= 1 then
		return 0
	end
	if check_and_consume(nType, 1, 1) ~= 1 then
		return 0
	end
	local g,d,p = GetItemInfoByIndex(nItemIdx)
	local tCaiLiao = fsd_this_item[1]
	if p == tCaiLiao[4] then
		local tXiuLian = fsd_this_item[2]
		if DelItemByIndex(nItemIdx, -1) ~= 1 then
			return 0
		end
		AddItem(tXiuLian[2], tXiuLian[3], tXiuLian[4], 1)
	end
	--SetItemSpecialAttr(nItemIdx, "BIND", 1)--绑定
	fsd_set_xiulian(fsd_get_xiulian()+nPoint)
	fsd_set_today_xiulian(fsd_get_today_xiulian()+nPoint)
	check_and_give_fushengdan(nPoint,nItemIdx)
	PlaySound("\\sound\\sound_i016.wav");
	SetCurrentNpcSFX(PIdx2NpcIdx(),905,0,0);
	
	return 1
end

function check_and_give_fushengdan(nPoint, nItemIdx)
	if fsd_get_xiulian() >= fsd_max_xiulan then
		if gf_Judge_Room_Weight(2, 100, "") ~= 1 then
			return 0
		end
		if DelItemByIndex(nItemIdx, -1) ~= 1 then
			return 0
		end
		local t = fsd_this_item[3]
		local _,idx = AddItem(t[2], t[3], t[4], 1)
		if idx > 0 then
			fsd_set_xiulian(0)
		end
		local szTitle = format("Ch骳 m鮪g t輈h l騳 頲 %d 甶觤 tu luy謓, nh薾 頲 1 %s", fsd_max_xiulan, t[1])
		Talk(1,"",szTitle)
		return 1
	else
		if nPoint > 0 then
			local szTitle = format("Ch骳 m鮪g th祅h c玭g nh薾 頲 %d 甶觤 tu luy謓,  t輈h l騳 %d/%d 甶觤 tu luy謓, h玬 nay c遪 頲 tu luy謓 %d/%d 甶觤", 
			nPoint, fsd_get_xiulian(), fsd_max_xiulan, fsd_get_left_xiulian_cap(), fsd_max_xiulan_daily)
			Talk(1,"",szTitle)
		end
		return 0
	end
end


function on_use_fusheng_sure(nItemIdx)
	if  IsPlayerDeath() ~= 0 then
		Talk(1,"","Ngi ch琲 c遪 s鑞g m韎 頲 s� d鬾g Ph鬰 Sinh Кn")
		return
	end	

	if get_trans_level() ~= 699 then
		Talk(1,"","Ch� c� chuy觧 sinh 6 c蕄 99 m韎 頲 d飊g Ph鬰 Sinh Кn!")
		return 0
	end
	if GetItemCount(fsd_taiyihunyuan[2], fsd_taiyihunyuan[3], fsd_taiyihunyuan[4]) < fsd_taiyihunyuan[5] then
		Talk(1, "", format("%s kh玭g  %d", fsd_taiyihunyuan[1], fsd_taiyihunyuan[5]))
		return 0
	end
	if nItemIdx and nItemIdx > 0 then
		if DelItemByIndex(nItemIdx, -1) ~= 1 then
    		return 0
    	end
	else
		local t = fsd_this_item[3]
		if DelItem(t[2], t[3], t[4], 1)~= 1 then
			return 0
		end
	end
	
	if DelItem(fsd_taiyihunyuan[2], fsd_taiyihunyuan[3], fsd_taiyihunyuan[4], fsd_taiyihunyuan[5])~= 1 then
		return 0
	end
	PlayerReborn(2, random(1,4))
	PlaySound("\\sound\\sound_i016.wav");
	SetCurrentNpcSFX(PIdx2NpcIdx(),905,0,0);
	local szTitle = format("Ch骳 m鮪g b筺 t chuy觧 sinh 7 c蕄 10, h穣 ng nh藀 l筰!")
	local tbSay = {}
	tinsert(tbSay, format("%s/fsd_offline", "Жng nh藀 l筰"))
	Say(szTitle, getn(tbSay), tbSay)
	return 1
end

function fsd_offline()
	ExitGame()
end

function check_and_consume(nType, bDel, bNotify)
	t = fsd_tNeed[nType]
	if not t then
		return
	end
	if GetExp() < t[1] then
		if 1==bNotify then
			Talk(1, "", format("%s kh玭g  %s", "Kinh nghi謒", show_large_int(t[1])))
		end
		return 0
	end
	if GetItemCount(fsd_taiyisuipian[2], fsd_taiyisuipian[3], fsd_taiyisuipian[4]) < t[2] then
		if 1==bNotify then
			Talk(1, "", format("%s kh玭g  %d", fsd_taiyisuipian[1], t[2]))
		end
		return 0
	end
	if GetPopur() < t[3] then
		if 1==bNotify then
			Talk(1, "", format("%s kh玭g  %d", "Luy謓", t[3]))
		end
		return 0
	end
	if bDel and bDel == 1 then
		ModifyPopur(-1*t[3])
		DelItem(fsd_taiyisuipian[2], fsd_taiyisuipian[3], fsd_taiyisuipian[4], t[2])
		big_del_exp(t[1])
	end
	return 1
end

function big_del_exp(nValue)
	if GetExp() < nValue then
		return 0
	end
	local nExp = nValue
	while nExp > 0 do
		local nDelExp = 2000000000
		if nExp > nDelExp then
			nExp = nExp - nDelExp
		else
			nDelExp = nExp
			nExp = 0
		end
		ModifyExp(-1*nDelExp)
	end
	return 1
end

--每日清理
function on_daily_clear()
	fsd_set_today_xiulian(0)
end

function get_trans_level()
	return gf_GetPlayerRebornCount()*100+GetLevel()
end
