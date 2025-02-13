--bu liubo
--装饰圣诞树
Include("\\script\\online_activites\\2011_11\\activity_04\\decorate_tree.lua")
Include("\\script\\online\\zgc_public_fun.lua")
Include("\\script\\lib\\globalfunctions.lua");
Include("\\script\\online_activites\\reborn\\tongban\\head.lua")

VET_ITEM_COUNT = 5 --所需露水的数量

VET_DECOTREE_AWARD = {
	{1, 6, " я", {2, 1, 30178, 2}, 0},
	{4, 19, 10, 1},
	{5, 19, 10, 1},
	{31, 25, "get_popur_value()", ""},
	{31, 25, "get_petgrow_value()", ""}, --3点宠物成长值
	{31, 6, "get_petmp_value()", ""}, --1点灵力值
}

function main()
	-- 活动是否开启
	if gf_CheckEventDateEx(VET_201111_DECORATE_TREE_ID) ~= 1 then
		return 0
	end
	local npcIndexz = GetTargetNpc()
	local nPlayerIdx = GetUnitCurStates(npcIndexz,6)
	if nPlayerIdx ~= PlayerIndex then
		Talk(1, "", "Зy kh玭g ph秈 c﹜ c馻 i hi謕!")
		return 0
	end
	
	local strName = GetTargetNpcName() or "C﹜ th玭g gi竜 h閕"
	if VET_201111_DECORATETREE_TASK:GetTask(VET_201111_DECORATETREE_TASK.PlayerIndex) ~= PlayerIndex then
		Talk(1,"",format(tSTRING_DECORATETREE_TABLE[9],strName))
		return 0
	end
	
	local tbChoice = {
		[1] = "Trang tr� c﹜ th玭g gi竛g sinh/to_decorate",
		[2] = "Th玭g 琲 l韓 nhanh l猲/do_nothing",
	}
	local nTimes = VET_201111_DECORATETREE_TASK:GetTask(VET_201111_DECORATETREE_TASK.IsCreate)
	if nTimes == 5 then 
		tremove(tbChoice,1)
		tinsert(tbChoice,1,"Nh薾 l蕐 ph莕 thng./to_get_award")
	end	
	Say(format(tSTRING_DECORATETREE_TABLE[9],strName),getn(tbChoice),tbChoice)
end

function to_decorate()
	local nLevel = GetLevel()
	if nLevel < 79 or gf_Check55HaveSkill() == 0 or GetPlayerFaction() == 0 then
		Talk(1,"",tSTRING_201111_TABLE[2])
		return 0
	end
	
	local nTimes = VET_201111_DECORATETREE_TASK:GetTask(VET_201111_DECORATETREE_TASK.IsCreate)
	if nTimes <= 0 or nTimes >= 5 then return 0 end
	if VET_201111_DECORATETREE_TASK:GetTask(VET_201111_DECORATETREE_TASK.DaySeq) ~= zgc_pub_day_turn() then
		VET_201111_DECORATETREE_TASK:SetTask(VET_201111_DECORATETREE_TASK.DaySeq,zgc_pub_day_turn())
		VET_201111_DECORATETREE_TASK:SetTask(VET_201111_DECORATETREE_TASK.DecoTimes,0)
	end
	if GetTime() - VET_201111_DECORATETREE_TASK:GetTask(VET_201111_DECORATETREE_TASK.TimeSpace) < VET_201111_TIMESPACE_MAX then
		Talk(1,"",format(tSTRING_DECORATETREE_TABLE[8],VET_201111_TIMESPACE_MAX / 60))
		return 0
	end
	if GetItemCount(2,0,351) < VET_ITEM_COUNT then
		Talk(1,"",format(tSTRING_DECORATETREE_TABLE[6],VET_ITEM_COUNT))
		return 0
	end
	if DelItem(2,0,351,VET_ITEM_COUNT) == 0 then
		return 0
	end
	local nNpcIndex = VET_201111_DECORATETREE_TASK:GetTask(VET_201111_DECORATETREE_TASK.TreeIndex)
	local nMapId,nX,nY = GetNpcWorldPos(nNpcIndex)
	SetNpcLifeTime(nNpcIndex,0)
	nNpcIndex = CreateNpc(VET_201111_TREENPC_NAME[nTimes+1],format(tSTRING_DECORATETREE_TABLE[7],nTimes+1),nMapId,nX,nY)
	StartTimeGuage("Trang tr� c﹜ th玭g",60,0,1)
	SetNpcScript(nNpcIndex,"\\script\\online_activites\\2011_11\\activity_04\\npc_decorate.lua")
	SetNpcLifeTime(nNpcIndex,VET_201111_TREE_EXITSTIME)
	AddUnitStates(nNpcIndex,6,PlayerIndex)
	VET_201111_DECORATETREE_TASK:SetTask(VET_201111_DECORATETREE_TASK.TreeIndex,nNpcIndex)
	VET_201111_DECORATETREE_TASK:SetTask(VET_201111_DECORATETREE_TASK.TimeSpace,GetTime())
	VET_201111_DECORATETREE_TASK:SetTask(VET_201111_DECORATETREE_TASK.IsCreate,nTimes+1)
	gf_EventGiveCustomAward(1,500000,1,"Event trang tri cay thong noel","C﹜ th玭g gi竜 h閕")
end

function to_get_award()
	--判断背包空间
	if gf_Judge_Room_Weight(1,1," ") ~= 1 then
		Talk(1,"",tSTRING_201111_TABLE[3])
		return 0
	end
	gf_EventGiveCustomAward(1,600000,1,"Event trang tri cay thong noel","C﹜ th玭g gi竜 h閕")
	gf_EventGiveRandAward(VET_DECOTREE_AWARD,100,"Event trang tr� c﹜ th玭g noel","C﹜ th玭g gi竜 h閕")
	local nNpcIndex = VET_201111_DECORATETREE_TASK:GetTask(VET_201111_DECORATETREE_TASK.TreeIndex)
	SetNpcLifeTime(nNpcIndex,0)
	VET_201111_DECORATETREE_TASK:SetTask(VET_201111_DECORATETREE_TASK.TimeSpace,VET_201111_DECORATETREE_TASK:GetTask(VET_201111_DECORATETREE_TASK.TimeSpace)-VET_201111_TREE_EXITSTIME)
	return 1
end

--给修为
function get_popur_value()
	gf_EventGiveCustomAward(26,1000,1,"Event trang tri cay thong noel","C﹜ th玭g gi竜 h閕")
end

function do_nothing()
	--do nothing
end

------------------------------------------------------
--attention:all the pet-award-api are here
--add pet grow award
function get_petgrow_value()
	local nCurPetLevel = mod(GetTask(TASK_VNG_PET), 100)
	if nCurPetLevel < 1 then
		Talk(1,"","Чi hi謕 ch璦 c� B筺 уng H祅h n猲 ph莕 thng b� v� hi謚!")		
		return
	end
	SetTask(TASK_VNG_PET, GetTask(TASK_VNG_PET) + (3 * 100))
	Msg2Player("B筺 nh薾 頲 3 觤 N﹏g C蕄 B筺 уng H祅h")
	gf_WriteLogEx("Event trang tri cay thong noel" ,"3 觤 N﹏g C蕄 B筺 уng H祅h")
end

--add pet mp award api
function get_petmp_value()
	local nCurPetLevel = mod(GetTask(TASK_VNG_PET), 100)
	if nCurPetLevel < 2 then
		Talk(1,"","B筺 уng H祅h ch璦  c蕄 2 n猲 ph莕 thng b� v� hi謚!")		
		return
	end
	Pet_AddGP(1)
	Msg2Player("B筺 nh薾 頲 1 觤 Linh L鵦 B筺 уng H祅h")
	gf_WriteLogEx("Event trang tri cay thong noel" ,"1 觤 Linh L鵦 B筺 уng H祅h")
end