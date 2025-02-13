
-- ====================== 文件信息 ======================
-- 对应NPC名称：钟放
-- Edited by lizhi
-- 2005-8-4 21:37
-- ======================================================

Include("\\script\\task\\world\\lizhi_泉州\\task_head.lua")
Include("\\script\\task\\world\\lizhi_泉州\\18级\\task_main.lua");
THIS_FILE = "\\script\\江南区\\泉州\\npc\\钟放.lua";
npc_name = "<color=green>Chung Ph鉵g<color>: ";

tbMaterials = {
	{"M秐h thi猲 th筩h",{2,2,7},500},
	{"Thi猲 th筩h",{2,2,8},300},
	{"Thi猲 th筩h tinh th筩h",{2,1,1009},500},
}

player = ""

function main()
    player = format("<color=green>%s<color>: ",GetName())
	
    local nLevel = 0;
    local nStep = 0;
    
    nStep = GetTask(TASK_LEV_18_ID);
    if (nStep == 100) then
        task_000_00();
    elseif (nStep == 1) then
        task_001_01();
    elseif (nStep == 2) then
        task_002_00();
    elseif (nStep == 3 or nStep == 4) then
        task_003_01();
    else
		local szMaterial = "";
		for i=1,getn(tbMaterials) do 
			szMaterial = szMaterial..format("<color=yellow>%d %s<color>, ",tbMaterials[i][3],tbMaterials[i][1])
		end
        -- can_not_accept_task();
		local szSay = npc_name.."S鑞g tr猲 i ph秈 bi誸 gi� ngu th� cu閏 s鑞g s� y猲 b譶h h琻. L穙 L璾 n鎖 ti課g tr猲 giang h� m� c竎 ngi t鮪g bi誸 c� t礽 nh h錸 v� cng h鉧 v� kh� l猲 n c蕄 7 ph秈 kh玭g? "
			.."Ch� c莕 a cho ta "..szMaterial.."th� ta c� th� cng h鉧 trang b� c馻 ngi, l猲 c鵦 i ngi c� tin kh玭g?";
		Say(szSay,2,
			"Th� m韎 bi誸 頲/try_force",
			"L祄 sao tin 頲/nothing"
		)
    end;
end;

function try_force()
	local MaxPutinCount = 1;
	PutinItemBox("Cng h鉧 v藅 ph萴", MaxPutinCount, npc_name.."Ngi x竎 nh薾 v藅 ph萴  t v祇?", THIS_FILE, 1);
end;

function OnPutinCheck(param, idx, genre, detail, particular)
	if param ~= 1 then
		return 0;
	end
	if genre ~= 0 and (detail ~= 100 or detail ~= 101 or detail ~= 103 or (detail < 0 and detail > 14)) then 
		Talk(1,"",npc_name.."Лa trang b� v祇 khay cho ta trc. Nguy猲 li謚 cng h鉧 c�  trong h祅h trang. Ta s� m cho ngi sau khi ki觤 tra xong trang b� .");
		return 0;
	end
	return 1;
end
	
function OnPutinComplete(param)
	if param ~= 1 then
		return 0;
	end
	local t = GetPutinItem()
	
	-- for i=1, getn(t) do
		-- for j=1,getn(t[i]) do
			-- print(format("t[%d][%d] = ",i,j)..t[i][j]);
		-- end
	-- end
	
	-- local tItem = {t[1][5],{t[1][2],t[1][3],t[1][4]}}
	force_item(t[1]);
end

function count_materials(t)
	local nRes = 1;
	for i=1,getn(t) do 
		if GetItemCount(t[i][2][1],t[i][2][2],t[i][2][3]) < t[i][3] then 
			print("error: thi誹",t[i][1]);
			nRes = 0;
			break;
		end
	end
	return nRes;
end;

function del_materials(t)
	local nRes = 1;
	for i=1,getn(t) do 
		if DelItem(t[i][2][1],t[i][2][2],t[i][2][3],t[i][3]) ~= 1 then 
			nRes = 0;
			break;
		end
	end
	return nRes;
end;

function force_item(tItem)
	
	local nItemIndex = tItem[1];
	local g,d,p = tItem[2],tItem[3],tItem[4];
	-- print(g,d,p);
	-- local nItemIndex = GetItemIndex(g,d,p);
	local szItemName = tItem[5];
	local nEnhance = GetEquipAttr(nItemIndex,2)
	local nIsDing7 = GetItemSpecialAttr(nItemIndex,"DING7")
	local nIsDing10 = GetItemSpecialAttr(nItemIndex,"DING10")
	local nZhuangbeiLv = GetEquipLevel(nItemIndex); --获取当前装备等级
	local nLingqi = GetItemMaxLingQi(nItemIndex);   --获取灵气值
	
	local nMofa1,nLv1 = GetItemAttr(nItemIndex,1)
	local nMofa2,nLv2 = GetItemAttr(nItemIndex,2)
	local nMofa3,nLv3 = GetItemAttr(nItemIndex,3)
	-- print("nMofa",nMofa1,nMofa2,nMofa3);
	
	if nEnhance == 15 then 
		Talk(1,"",npc_name.."Trang b�  t c鵦 i m� ngi c遪 mu鑞 cng h鉧 g� n鱝???")
		return 0;
	end
	
	if count_materials(tbMaterials) == 0 then 
		Talk(1,"",npc_name.."Ngi chu萵 b� ch璦  nguy猲 li謚 r錳! Khi n祇  th� h穣 quay l筰.")
		return 0;
	else
		if del_materials(tbMaterials) ~= 1 then 
			Talk(1,"",npc_name.."H譶h nh� c� s� gian l薾 n祇 � y!")
			print("error: del_materials failed!");
			return 0;
		end
	end
	
	if DelItemByIndex(nItemIndex,-1) ~= 1 then 
		Talk(1,"",npc_name.."H譶h nh� c� s� gian l薾 n祇 � y!")
		print(format("error: DelItemByIndex(%d) failed!",nItemIndex))
		return 0;
	end
	local nAdd = AddItem(g,d,p,1,1,nLv1,nMofa1,nLv2,nMofa2,nLv3,nMofa3,-1,15)
	if nAdd == 1 then 
		Talk(2,"",
			npc_name.."Trang b� c馻 ngi y!",
			player.."Qu� th藅 l頸 h筰!  t� ti襫 b鑙!"
		)
	else
		print("error: Added item failed!");
		return 0;
	end

	-- local nScrollIndex = tonumber(nItemIndex)
	-- local nLeft = AbradeItem(nScrollIndex, 0)
	-- AbradeItem(nScrollIndex, -10)
	
	-- if DelItemByIndex(nRightIdx, -1) == 1 then
		-- local nRet, nAddIdx = AddItem(0,102,8013+nBody,1,1,-1,-1,-1,-1,-1,-1,0,nEnhance)
		-- if nRet == 1 and nAddIdx > 0 then
			-- SetItemSpecialAttr(nAddIdx, "DING7", nIsDing7)
			-- WriteLog(GetName().."фi Th祅h Ch� kim 蕁;"..(8013+nBody))
		-- end
	-- end
	return 1;
end;

function player_talk()
	Talk(1,"",player.." t� ti襫 b鑙! Th藅 kh玭g ng�!")
end;

function nothing() end;