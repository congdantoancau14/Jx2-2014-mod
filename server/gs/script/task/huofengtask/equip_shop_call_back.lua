Include("\\script\\task\\global_task\\gtask_head.lua")
Include("\\script\\task\\global_task\\gtask_data.lua")
Include("\\script\\online_activites\\task_values.lua")

t_need = {"H醓 Di謒 Th筩h",2,0,30076,1}
function _specialop_attrcheck_update_huofeng_lv2(nOldItemIdx)
	if _specialop_attrcheck_reduce_enhance7(nOldItemIdx) ~= 1 then --强7以上才能升级
		return 0
	end
	if tGtTask:check_cur_task(264) ~= 1 and tGtTask:check_task_isfinish(264) ~= 1 then
		return 0
	end
	if tGtTask:check_cur_task(264) == 1 and GetItemCount(t_need[2], t_need[3], t_need[4]) < t_need[5] then
		Talk(1, "", format("Tr猲 ngi kh玭g c� %d%s,kh玭g th� n﹏g c蕄!", t_need[5], t_need[1]))
		return 0
	end
	return 1
end

function _specialop_attrsave_update_huofeng_lv2(nOldItemIdx)
	local t = {}
	--t.nEquipEnhance			= GetEquipAttr(nOldItemIdx, 2);
	return t
end
function _specialop_attrrestore_update_huofeng_lv2(nNewItemIdx, tSave)
	local nNum = GetItemCount(t_need[2], t_need[3], t_need[4])
	if nNum > 0 then
		DelItem(t_need[2], t_need[3], t_need[4], GetItemCount(t_need[2], t_need[3], t_need[4]))
	end
	if tGtTask:check_task_isfinish(264) ~= 1 then
		--DirectFinishGTask(264, 2)
		SetTask(VEIT_BATTLE_KILL_BOSS_COUNTER, 1)--完成任务
		Talk(1, "", "Ch骳 m鮪g b筺  nh薾 頲 v� kh� H醓 Ph鬾g c蕄 2, c� th� h錳 b竜 t譶h h譶h v韎 H醓 Ph鬾g T�")
	end
    return 1
end


-------------------------------------------------------------------------------------------------

function _specialop_attrcheck_update_huofeng_lv3(nOldItemIdx)
	if _specialop_attrcheck_reduce_enhance7(nOldItemIdx) ~= 1 then --强7以上才能升级
		return 0
	end
	if tGtTask:check_task_isfinish(270) ~= 1 then
		Talk(1,"","Ho祅 th祅h chu鏸 nhi謒 v� H醓 Ph鬾g m韎 頲 n﹏g c蕄!")
		return 0
	end
	return 1
end

function _specialop_attrsave_update_huofeng_lv3(nOldItemIdx)
	local t = {}
	--t.nEquipEnhance			= GetEquipAttr(nOldItemIdx, 2);
	return t
end
function _specialop_attrrestore_update_huofeng_lv3(nNewItemIdx, tSave)
--	local nEnhance = tSave.nEquipEnhance
--	local nNewEnhance = 0
--	if nEnhance > 0 then
--		if nEnhance >= 1 and nEnhance <=13 then
--			nNewEnhance = 0
--		elseif nEnhance >= 14 and nEnhance <=15 then
--			nNewEnhance = 7
--		end
--		if nNewEnhance > 0 then
--			SetItemEnhance(nNewItemIdx, nNewEnhance);
--		end
--    end
    return 1
end

-------------------------------------------------------------------------------------------------

function _specialop_attrcheck_update_huofeng_equip(nOldItemIdx)
	local nD = GetItemDetail(nOldItemIdx)
	--local nG, nD, nP = GetItemInfoByIndex(nOldItemIdx)
	if nD ~= 102 then--非首饰需要+7以上
    	if _specialop_attrcheck_reduce_enhance7(nOldItemIdx) ~= 1 then --强7以上才能升级
    		return 0
    	end
	end
	if GetFreeItemRoom() < 2 then
		return 0
	end
--	if tGtTask:check_task_isfinish(270) ~= 1 then
--		Talk(1,"","完成火凤系列任务才能升级！")
--		return 0
--	end
	return 1
end

function _specialop_attrsave_update_huofeng_equip(nOldItemIdx)
	local t = {}
	t.tInfo = GetItemInfoByIndex(nOldItemIdx, 1)
	t.nEquipEnhance			= GetEquipAttr(nOldItemIdx, 2);
	t.nEquipDing10			= GetItemSpecialAttr(nOldItemIdx, "DING10");
	t.nEquipDing7			= GetItemSpecialAttr(nOldItemIdx, "DING7");
	t.nBind = 1
	if GetItemSpecialAttr(nOldItemIdx, "BIND") == 1 then
		t.nBind = 4
	end
	--t.nRandSeed				= GetItemRandSeed(nOldItemIdx)
	t.tGem 					= GetItemGemInfo(nOldItemIdx)
	--t.tFeed 				= GetItemFeedUpAttrs(nOldItemIdx)
	return t
end
function _specialop_attrrestore_update_huofeng_equip(nNewItemIdx, tSave)
--	local nEnhance = tSave.nEquipEnhance
--	local nNewEnhance = 0
--	if nEnhance > 0 then
--		if nEnhance >= 1 and nEnhance <=13 then
--			nNewEnhance = 0
--		elseif nEnhance >= 14 and nEnhance <=15 then
--			nNewEnhance = 7
--		end
--		if nNewEnhance > 0 then
--			SetItemEnhance(nNewItemIdx, nNewEnhance);
--		end
--    end
	local szItemName = GetItemName(nNewItemIdx)
	if random(1,10000) <= 1000 then --10%概率成功
		local szMsg = format("Ch骳 m鮪g %s n﹏g c蕄 th祅h c玭g %s", GetName(), szItemName)
		Msg2Global(szMsg)
	else--失败
		DelItemByIndex(nNewItemIdx, -1)--删除换到的装备
		local tInfo = tSave.tInfo
		local ok, nIndex =  AddItem(tInfo.genre, tInfo.detail, tInfo.particular,1,tSave.nBind,-1,-1,-1,-1,-1,-1,
			0 ,tSave.nEquipEnhance, 0, tInfo.randseed)
		if 0 < tSave.nEquipDing10 then
    		SetItemSpecialAttr(nIndex, "DING10", 1);
        end
        if 0 < tSave.nEquipDing7 then
        	SetItemSpecialAttr(nIndex, "DING7", 1);
        end
        if tSave.tGem then
        	for i,v in tSave.tGem do
        		SetItemGemInfo(nIndex, i, v)
        	end
        end
		AddItem(2,1,30770,1)--给一个火凤精华
		local szMsg = format("N﹏g c蕄 %s th蕋 b筰, nh薾 頲 1 tinh hoa h醓 ph鬾g n b�", szItemName)
		Talk(1, "", szMsg)
		Msg2Player(szMsg)
		return 0
	end
    return 1
end