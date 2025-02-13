--by liubo
--装饰圣诞树活动脚本
Include("\\script\\lib\\globalfunctions.lua")
Include("\\script\\online_activites\\2011_11\\string.lua")
Include("\\script\\misc\\taskmanager.lua")

VET_201111_DECORATE_TREE_ID = 50 --圣诞树活动ID
VET_201111_TREE_VALUE = 50 --圣诞树价格*10000
VET_201111_TREE_EXITSTIME = 3*60 --圣诞树存在的时间
VET_201111_TIMESPACE_MAX = 1*60 --装饰的最小时间间隔
VET_201111_DECOTIMES_MAX = 10 --装饰圣诞树棵树上限
--时间触发器
VET_201111_TRIGGER_TBID = 1517
VET_201111_TRIGGER_UFID = 1517*2

VET_201111_TREENPC_NAME = {
	[1] = "C﹜ Gi竛g sinh 2d",
	[2] = "C﹜ Gi竛g sinh 2c",
	[3] = "C﹜ Gi竛g sinh 1c",
	[4] = "C﹜ Gi竛g sinh 1b",
	[5] = "C﹜ Gi竛g sinh 1a",
}
VET_201111_DECORATETREE_TASK = TaskManager:Create(5,13)
VET_201111_DECORATETREE_TASK.IsCreate = 1 --是否创建，1是0否，装饰一次加1
VET_201111_DECORATETREE_TASK.TreeIndex = 2 --圣诞树索引
VET_201111_DECORATETREE_TASK.DecoTimes = 3 --装饰次数
VET_201111_DECORATETREE_TASK.TimeSpace = 4 --装饰的时间间隔
VET_201111_DECORATETREE_TASK.DaySeq = 5 --天次
VET_201111_DECORATETREE_TASK.PlayerIndex = 6 --玩家索引


function VET_201111_DecorateTreeDialog(tbSayDialog, szSayHead)
	if gf_CheckEventDateEx(VET_201111_DECORATE_TREE_ID) == 1 then
		tinsert(tbSayDialog, format(tSTRING_DECORATETREE_TABLE[1],VET_201111_TREE_VALUE).."/sale_christmas_tree")
	end
    return tbSayDialog, szSayHead 
end

function sale_christmas_tree()
	Say(format(tSTRING_DECORATETREE_TABLE[2],VET_201111_TREE_VALUE),2,"уng �/ensure","Kh玭g c莕 u/do_nothing")
end

function ensure()
	--判断背包空间
	if gf_Judge_Room_Weight(1,1," ") ~= 1 then
		Talk(1,"",tSTRING_201111_TABLE[3])
		return 0
	end
	if Pay(VET_201111_TREE_VALUE*10000) == 1 then
		gf_AddItemEx2({2,1,30350,1},"C﹜ th玭g gi竜 h閕","Event trang tr� c﹜ th玭g noel","Mua c﹜ th玭g noel",24*60*60,1)
	else
		Talk(1,"",format(tSTRING_DECORATETREE_TABLE[3],VET_201111_TREE_VALUE))
	end
end

function do_nothing()
end