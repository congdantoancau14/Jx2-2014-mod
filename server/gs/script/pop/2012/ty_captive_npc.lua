Include("\\script\\online\\template\\flash_npc.lua");
Include("\\script\\class\\mem.lua")
Include("\\script\\task\\global_task\\gtask_head.lua");
Include("\\script\\misc\\autocleaner\\autocleaner_head.lua")
Include("\\script\\lib\\globalfunctions.lua");

tCaptive = { --天阴俘虏
	nstartDate = 20120301, --活动开始时间
	nEndDate = 20301230, --活动结束时间
	nCheckRoute = 0,  --是否要加入流派
	strNpcMod = "Thi猲  T� Binh",  --Npc模板
	strNpcName = "Thi猲  T� Binh", --npc名字
	nCampType = 2,   --对话npc还是战斗npc
	nNeedRoom = 0,   --如果是对话npc，需要判断背包空间（根据奖励而定）
	nNeedWeight = 0, --如果是对话npc，需要判断背包负重（根据奖励而定）
	strThisFile = "\\script\\pop\\2012\\ty_captive_npc.lua",  
	tNpcPos = {
		[5078]={
 {1763,3307},
 {1769,3299},
 {1775,3286},
 {1783,3274},
 {1794,3279},
 {1801,3285},
 {1811,3293},
 {1804,3303},
 {1798,3295},
 {1792,3290},
 {1782,3283},
 {1778,3293},
 {1788,3302},
 {1794,3310},
 {1787,3317},
 {1776,3319},
 {1770,3315},
 {1762,3307},
 {1772,3304},
 {1773,3305},
			},
	},
	-- 需要实现以下接口函数
	onTalk = nil,						--对话npc入口
	giveDeathAward = nil,	  --杀死npc奖励入口
	giveTalkAward = nil,		--对话npc奖励入口
};

tCaptive = inherit(tFlashNpcInfo,tCaptive);

--function main()
--	autoclean();
--end

function tCaptive.create_captive_npc()
	tCaptive:createFlashNpc(5078,20);
end
	
function tCaptive:giveDeathAward()
	if 1 ~= tGtTask:check_cur_task(78) then return 0 end
	if BigGetItemCount(2,96,135) < 20 and gf_Judge_Room_Weight(1,10,"") ~= 0 then
		gf_SetLogCaption("Ti猽 di謙 Thi猲  T� Binh");
		gf_AddItemEx({2,96,135,1,4},"Tro c鑤 c馻 t� binh");
		gf_SetLogCaption("");
	end
	return 0;
end	
function OnDeath(nNpcIdx)
	tCaptive:npc_death(nNpcIdx);
	RemoveNpc(nNpcIdx);
end