--=============================================
--create by liubo
--describe:越南版2011年8月活动2 头文件
--related files:
--=============================================

--活动字符串
Include("\\script\\online_activites\\2011_08\\string.lua")
--任务变量管理脚本
Include("\\script\\misc\\taskmanager.lua")

--烤炉时间触发器自定义ID
VET_201108_TIME_USER_DEFINE = 2519
--烤炉时间触发器表内ID
VET_201108_TIME_TB_DEFINE = 1512
--火柴价格30金
VET_201108_MATCH_COST = 300000
--每人最多参与活动4次
VET_201108_MAX_TIMES = 4
--获取经验时间
VET_201108_OVEN_LIFE = 4*60
--活动ID
VET_201108_BAKEDCAKE_ACTIVITY_ID = 38
--任务变量处理
VET_201108_MIDAUTUMN_TaskGroup = TaskManager:Create(2,21)
--次数
VET_201108_MIDAUTUMN_TaskGroup.Times = 1
--天数
VET_201108_MIDAUTUMN_TaskGroup.Date = 2
--结束时间0
VET_201108_MIDAUTUMN_TaskGroup.Time_End = 3
--NPC索引
VET_201108_MIDAUTUMN_TaskGroup.Npc_Index = 4
--tag上等中秋月饼
VET_201108_MIDAUTUMN_TaskGroup.Tag_CCake = 5

function VET_201108_BakedCakes_Dialog(tbSayDialog, szSayHead)
	if gf_CheckEventDateEx(VET_201108_BAKEDCAKE_ACTIVITY_ID) == 1 then
		tinsert(tbSayDialog, VET_201108_STRING_LIST[14].."/active_show")
		tinsert(tbSayDialog, VET_201108_STRING_LIST[1].."/active_oven")
		tinsert(tbSayDialog, VET_201108_STRING_LIST[2].."/buy_match_201108")
	end
    return tbSayDialog, szSayHead
end

function active_show()
	--Say(VET_201108_STRING_LIST[15],1,"返回菜单/back_menu")
	Talk(1,"",VET_201108_STRING_LIST[15])
end

--function back_menu()
--	back menu
--end

function active_oven()
    local nTeamSize = GetTeamSize()
	--没有组队
    if nTeamSize < 2 then
        Talk(1, "", VET_201108_STRING_LIST[3])
        return
    end
	--激活人不是队长
    if GetCaptainName() ~= GetName() then
        Talk(1, "", VET_201108_STRING_LIST[4])
        return
    end
	--检查全队
    if Check_team_member_201108(nTeamSize) == 0 then
        return
    end
    Deal_Triger(nTeamSize)
end

function buy_match_201108()
	local nBuy = floor(GetCash()/VET_201108_MATCH_COST)
	if nBuy == 0 then
        Talk(1, "", VET_201108_STRING_LIST[12])
        return
	else
		AskClientForNumber("match_num_201108",1,nBuy,VET_201108_STRING_LIST[13])
	end
end


function match_num_201108(nBuy)
    if GetCash() < (VET_201108_MATCH_COST*nBuy) then
        Talk(1, "", VET_201108_STRING_LIST[12])
        return
    end
    if gf_Judge_Room_Weight(nBuy,1," ") ~= 1 then
        return
    end
    if Pay(VET_201108_MATCH_COST*nBuy) == 1 then
        local tbItemIds = {VET_201108_ITEM_LIST[2][2],VET_201108_ITEM_LIST[2][3],VET_201108_ITEM_LIST[2][4],nBuy}
		gf_AddItemEx2(tbItemIds, VET_201108_ITEM_LIST[2][1],VET_201108_LOG_TITLE,VET_201108_TB_LOG_ACTION_LIST[1],24*3600,1)
    end
end

function Is_In_City_Map()
    local nMapId = GetWorldPos()
    local bMapIsOk = 0
    for i = 1, getn(VET_201108_TB_MAPID) do
        if nMapId == VET_201108_TB_MAPID[i] then
            bMapIsOk = 1
            break
        end
    end
    if bMapIsOk == 0 then
        return 0
    end
end

--返回天数
function zgc_pub_day_turn(day_num)
	day_num = day_num or 1
	local time_return = floor((GetTime()-57600)/(86400*day_num))
	return time_return
end

function Check_team_member_201108(nTeamSize)
    local nOldPlayer = PlayerIndex
    for i = 1, nTeamSize do
        PlayerIndex = GetTeamMember(i)
        if PlayerIndex <= 0 then
            Talk(1, "", VET_201108_STRING_LIST[5])
            return 0
        end
		--是否在相关城市
        if Is_In_City_Map() == 0 then
            PlayerIndex = nOldPlayer --这个消息告诉队长就行了
            Talk(1, "", VET_201108_STRING_LIST[6])
            return 0
        end
		--等级，技能
		local nLevel = GetLevel()
        if nLevel < 77 or GetPlayerFaction() == 0 or gf_Check55HaveSkill() == 0 then
            Talk(1, "", VET_201108_STRING_LIST[7]);
            PlayerIndex = nOldPlayer; --这个消息告诉队长就行了
            Talk(1, "", VET_201108_STRING_LIST[7]);
            return 0;
        end
		--检查月饼数量
        if GetItemCount(VET_201108_ITEM_LIST[1][2],VET_201108_ITEM_LIST[1][3],VET_201108_ITEM_LIST[1][4]) < 5 then
            PlayerIndex = nOldPlayer --这个消息告诉队长就行了
            Talk(1, "", VET_201108_STRING_LIST[8])
            return 0
        end
		--检查火柴
		if GetItemCount(VET_201108_ITEM_LIST[2][2],VET_201108_ITEM_LIST[2][3],VET_201108_ITEM_LIST[2][4]) < 1 then
            PlayerIndex = nOldPlayer --这个消息告诉队长就行了
            Talk(1, "", VET_201108_STRING_LIST[9])
            return 0
        end
		--检查激活烤炉次数
		--是否在同一天
		local nDate = tonumber(date("%y%m%d")) --zgc_pub_day_turn()
		if nDate ~= VET_201108_MIDAUTUMN_TaskGroup:GetTask(VET_201108_MIDAUTUMN_TaskGroup.Date) then
			VET_201108_MIDAUTUMN_TaskGroup:SetTask(VET_201108_MIDAUTUMN_TaskGroup.Date,nDate)
			VET_201108_MIDAUTUMN_TaskGroup:SetTask(VET_201108_MIDAUTUMN_TaskGroup.Times,0)
		end
        local nTimes = VET_201108_MIDAUTUMN_TaskGroup:GetTask(VET_201108_MIDAUTUMN_TaskGroup.Times)
        if nTimes >= VET_201108_MAX_TIMES then
			Talk(1, "", format(VET_201108_STRING_LIST[10], VET_201108_MAX_TIMES))
			if PlayerIndex ~=nOldPlayer then
				PlayerIndex = nOldPlayer
				Talk(1, "", format(VET_201108_STRING_LIST[10], VET_201108_MAX_TIMES))
                        end
			return 0
        end
		--只能同时激活一个火炉
		local nTime = tonumber(GetTime())
		--Msg2Player("nTime="..nTime)
		--Msg2Player("Task="..VET_201108_MIDAUTUMN_TaskGroup:GetTask(VET_201108_MIDAUTUMN_TaskGroup.Time_End))
		if nTime < VET_201108_MIDAUTUMN_TaskGroup:GetTask(VET_201108_MIDAUTUMN_TaskGroup.Time_End) + 62	then
			Talk(1, "",VET_201108_STRING_LIST[11])
			if PlayerIndex ~= nOldPlayer then
				PlayerIndex = nOldPlayer --一并告诉队长
				Talk(1, "",VET_201108_STRING_LIST[11])
			end
			return 0
		end
    end
    PlayerIndex = nOldPlayer
	return 1
end

--距离判断
function DistanceBetweenPoints(MapID1, MapX1, MapY1, MapID2, MapX2, MapY2)
    if MapID1 ~= MapID2 then
        return -1
    else
	local dx = MapX2 - MapX1
        local dy = MapY2 - MapY1
        local nDist = (dx * dx + dy * dy)^(1/2);
        return nDist;
    end;
end

function Deal_Triger(nTeamSize)
	--判断队员是否在一起
	MapID1, MapX1, MapY1 = GetWorldPos()
	local nOldPlayer = PlayerIndex
    for i = 1, nTeamSize do
        PlayerIndex = GetTeamMember(i)
        if PlayerIndex <= 0 then
            Talk(1, "", VET_201108_STRING_LIST[5])
			PlayerIndex = nOldPlayer
            return
        end
		if PlayerIndex ~= nOldPlayer then
			MapID2, MapX2, MapY2 = GetWorldPos()
			local nDist = DistanceBetweenPoints(MapID1, MapX1, MapY1, MapID2, MapX2, MapY2)
			--Msg2Player("nDist="..nDist)
			if nDist < 0 or nDist > 18 then
				Talk(1,"",VET_201108_STRING_LIST[17])
				PlayerIndex = nOldPlayer
				Talk(1,"",VET_201108_STRING_LIST[17])
				return
			end
		end
    end
    PlayerIndex = nOldPlayer
	--删除物品
    local nOldPlayer = PlayerIndex
    for i = 1, nTeamSize do
        PlayerIndex = GetTeamMember(i)
        if PlayerIndex <= 0 then
            Talk(1, "", VET_201108_STRING_LIST[5])
            return
        end
        if DelItem(VET_201108_ITEM_LIST[1][2],VET_201108_ITEM_LIST[1][3],VET_201108_ITEM_LIST[1][4],5) ~= 1 then
            return
        end
		if DelItem(VET_201108_ITEM_LIST[2][2],VET_201108_ITEM_LIST[2][3],VET_201108_ITEM_LIST[2][4],1) ~= 1 then
            return
        end
    end
    PlayerIndex = nOldPlayer
	--创建烤炉NPC
	local nNpcIndex = 0
	if random(100) > 5 then
		nNpcIndex = CreateNpc(VET_201108_TB_NPCS[1][1],VET_201108_TB_NPCS[1][2],GetWorldPos())
		SetNpcScript(nNpcIndex,"\\script\\online_activites\\2011_08\\activity_02\\npc_script.lua")
		SetNpcLifeTime(nNpcIndex, VET_201108_OVEN_LIFE + 2 + 60)  --修正防止NPC消失拿不到最后一次经验,1min内领取奖励)	
	else
		nNpcIndex = CreateNpc(VET_201108_TB_NPCS[2][1],VET_201108_TB_NPCS[2][2],GetWorldPos())
		SetNpcScript(nNpcIndex,"\\script\\online_activites\\2011_08\\activity_02\\npc_script.lua")
		SetNpcLifeTime(nNpcIndex, VET_201108_OVEN_LIFE + 2 + 60)  --修正防止NPC消失拿不到最后一次经验,1min内领取奖励
	end
	
    local nOldPlayer = PlayerIndex
    for i = 1, nTeamSize do
        PlayerIndex = GetTeamMember(i)
        if PlayerIndex <= 0 then
            Talk(1, "", VET_201108_STRING_LIST[5])
            return
        end
        StartTimeGuage("Nng b竛h", VET_201108_OVEN_LIFE,0,1)
    end
    PlayerIndex = nOldPlayer
		
	Msg2Player("C竎 h�  k輈h ho箃 l� nng th祅h c玭g!")
	--处理每一个队员
    local nOldPlayer = PlayerIndex
    for i = 1, nTeamSize do
        PlayerIndex = GetTeamMember(i)
		if PlayerIndex <= 0 then
            Talk(1, "", VET_201108_STRING_LIST[5])
            return
        end
		--设置tag任务变量（1）
		VET_201108_MIDAUTUMN_TaskGroup:SetTask(VET_201108_MIDAUTUMN_TaskGroup.Tag_CCake,0)
		--触发器终止时间，防止NPC意外丢失。触发器将在NPC时限10秒后消失..（2）
        VET_201108_MIDAUTUMN_TaskGroup:SetTask(VET_201108_MIDAUTUMN_TaskGroup.Time_End,GetTime() + VET_201108_OVEN_LIFE)
		--Msg2Player("Time_end="..VET_201108_MIDAUTUMN_TaskGroup:GetTask(VET_201108_MIDAUTUMN_TaskGroup.Time_End))
        --创建触发器
		CreateTrigger(1,VET_201108_TIME_TB_DEFINE,VET_201108_TIME_USER_DEFINE)
        ContinueTimer(GetTrigger(VET_201108_TIME_USER_DEFINE))
		gf_WriteLogEx(VET_201108_LOG_TITLE,VET_201108_TB_LOG_ACTION_LIST[2]) 					--by xiongyizhi 新加参加活动log
        --任务变量保存NPC索引（3）
		VET_201108_MIDAUTUMN_TaskGroup:SetTask(VET_201108_MIDAUTUMN_TaskGroup.Npc_Index,nNpcIndex)
		--参加次数+1
        VET_201108_MIDAUTUMN_TaskGroup:SetTask(VET_201108_MIDAUTUMN_TaskGroup.Times,VET_201108_MIDAUTUMN_TaskGroup:GetTask(VET_201108_MIDAUTUMN_TaskGroup.Times) + 1)
	end
    PlayerIndex = nOldPlayer
end
--空函数预留
function ServerStartUp()
end
function PlayerLogin()
end