--filename:chocolate_item.lua
--create date:2006-01-19
--author:yanjun
--describe:巧克力道具脚本
Include("\\script\\lib\\globalfunctions.lua");
Include("\\script\\online\\qingrenyuanxiao\\qryx_head.lua")

function OnUse(nItemIdx)
	local nDate = tonumber(date("%y%m%d"))
	if nDate < 110214 or nDate > 410220 then
		Talk(1, "", "S玞玪a  h誸 h筺 s� d鬾g!")
		return
	end
	if IsLoversTeam() == 1 then
		if GetSex() ~= 1 then
			Say("Ch� c� nam nh﹏ m韎 頲 ph衟 s� d鬾g.",0)
			return 0
		end
		local nPlayerMapId, nPlayerMapX, nPlayerMapY = GetWorldPos()
		if (nPlayerMapId ~= 100 and nPlayerMapId ~= 150 and nPlayerMapId ~= 200 and nPlayerMapId ~= 300 and nPlayerMapId ~= 350 and nPlayerMapId ~= 400 and nPlayerMapId ~= 500) then
			Talk(1,"","S玞玪a ch� c� th� s� d鬾g � 7 i th祅h th�!")
			return	
		end
		local nOldPlayerIndex = PlayerIndex
		for i = 1, GetTeamSize() do
			PlayerIndex = GetTeamMember(i)
			if GetPlayerRoute() == 0 or GetLevel() < 77 then
				Talk(1, "", "Ch� c� nh﹏ v藅 c蕄 77 tr� l猲  gia nh藀 m玭 ph竔 m韎 c� th� tham gia ho箃 ng n祔!")
				return
			end
			local nDate = tonumber(date("%y%m%d"))
			local nUsedDate = floor(GetTask(TSK_VALENTINE_USE_FLAG_2011) / 100)
			if nDate ~= nUsedDate then
				SetTask(TSK_VALENTINE_USE_FLAG_2011, nDate * 100)
			end
			
			local nGetUsed = mod(GetTask(TSK_VALENTINE_USE_FLAG_2011), 10)
			if nGetUsed >= 4 then
				gf_Msg2Team("C� ngi trong t� i c馻 b筺  s� d鬾g S玞玪a  4 l莕 trong ng祔, kh玭g th� s� d鬾g th猰!")
				return
			end
			
			local nUsedExp = GetTask(TSK_VALENTINE_USED_EXP_2011)
			if nUsedExp >= 28000000 then
				Talk(1, "", "B筺  s� d鬾g S玞玪a t t鑙 產 s� 甶觤 kinh nghi謒 cho ph衟, kh玭g th� s� d鬾g th猰!")
				return
			end
		end
		PlayerIndex = nOldPlayerIndex
		
		if GetTrigger(TRIGGER_USER_DEFINE_VALENTINE_2011) ~= 0 then
			Talk(1,"","B筺 產ng s� d鬾g S玞玪a r錳, h穣 ch� n khi s� d鬾g xong!")
			return
		end
		
		if DelItemByIndex(nItemIdx, 1) == 1 then
			local nOldPlayerIndex = PlayerIndex
			for i = 1, GetTeamSize() do
				PlayerIndex = GetTeamMember(i)
				CreateTrigger(1, TRIGGER_TB_DEFINE_VALENTINE_2011, TRIGGER_USER_DEFINE_VALENTINE_2011);
	        		ContinueTimer(GetTrigger(TRIGGER_USER_DEFINE_VALENTINE_2011))
	        		
	        		local nTimes = floor(mod(GetTask(TSK_VALENTINE_USE_FLAG_2011), 100) / 10)
	        		SetTask(TSK_VALENTINE_USE_FLAG_2011, GetTask(TSK_VALENTINE_USE_FLAG_2011) - (nTimes * 10) + 1)
	        		gf_WriteLogEx("Valentine 2011", "s� d鬾g S玞玪a")
	        	end
	        	local nOldPlayerIndex = PlayerIndex
		end
	else
		Say("2 ngi kh竎 ph竔 t� i m韎 c� th� ╪ S玞玪a.",0)
	end		
end		
		--第2字节用来标记玩家当天是否使用过巧克力
--		local nDay = tonumber(date("%d"))
--		if GetByte(GetTask(TASK_GOTUSE_CHOCOLATE),2) < nDay then
--			SetTask(TASK_GOTUSE_CHOCOLATE,SetByte(GetTask(TASK_GOTUSE_CHOCOLATE),3,0))
--		end
--		
--		local qklleft = 7 - GetByte(GetTask(TASK_GOTUSE_CHOCOLATE),3)
--		if qklleft <= 0 then
--			Say("H玬 nay b筺  s� d鬾g 7 thanh chocola, ng祔 mai h穣 s� d鬾g ti誴 nh�!",0)
--			return 0
--		end
--		
--		local selTab = {
--			"уng �/ok",
--			"H駓 b�/cancel"
--		}
--		Say("Trc khi ╪, h穣 x竎 nh薾 b筺 v� i h鱱  k誸 th祅h h秓 h鱱 ch璦? N誹 kh玭g, ╪ S玞玪a s� kh玭g hi謚 qu�. B籲g h鱱 c遪 c� th� ╪ <color=yellow>"..qklleft.."<color> th醝 S玞玪a. B籲g h鱱 c� mu鑞 ╪ S玞玪a kh玭g?",2,selTab)
--	else
--		Say("2 ngi kh竎 ph竔 t� i m韎 c� th� ╪ S玞玪a.",0)
--	end
--end

function ok()
	local OldPlayerIndex = PlayerIndex
	local nDay = tonumber(date("%d"))
	if DelItem(2,0,361,1) == 1 then
		local player_name
		PlayerIndex = GetTeamMember(1)
		player_name = GetName()
		PlayerIndex = GetTeamMember(2)
		ModifyFriendliness(player_name,2+random(1,4))
		PlayerIndex = OldPlayerIndex
		WriteLog("[L� t譶h nh﹏ v� nguy猲 ti猽]:"..GetName().."Х s� d鬾g S玞玪a. ")
		SetTask(TASK_GOTUSE_CHOCOLATE,SetByte(GetTask(TASK_GOTUSE_CHOCOLATE),2,nDay))
		SetTask(TASK_GOTUSE_CHOCOLATE,SetByte(GetTask(TASK_GOTUSE_CHOCOLATE),3,GetByte(GetTask(TASK_GOTUSE_CHOCOLATE),3)+1))
	end
end

function cancel()

end
