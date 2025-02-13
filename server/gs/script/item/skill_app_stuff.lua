--脚本名称：
--脚本功能：
--功能策划：刘亮
--功能开发：朱力
--开发时间：2013-03-29
--代码修改记录

Include("\\script\\lib\\define.lua");
Include("\\script\\lib\\globalfunctions.lua");
Include("\\script\\lib\\item_define.lua");
Include("\\script\\lib\\message.lua");
Include("\\script\\global\\skill_app.lua");
Include("\\script\\misc\\observer\\observer_head.lua");

g_szLogCaption				= "M秐h Ц K� N╪g";
g_szTitle					= "<color=green>M秐h Ц K� N╪g<color>";
g_tComposeStuff				= {2, 1, 10011};
g_nComposeNeedCount			= 100;
g_nComposeLevel				= 1;
g_nComposeIncreaseTimes		= 10;
g_nComposeIncreaseBeginTime	= MkTime(2013,7,17);
assert(0 < g_nComposeNeedCount);

g_tTaskIDs = {
	[1] = TASKID_JNS_SPE_ACH_TASK_1,
	[4] = TASKID_JNS_SPE_ACH_TASK_2,
	[7] = TASKID_JNS_SPE_ACH_TASK_3,
	[9] = TASKID_JNS_SPE_ACH_TASK_4,
	[10] = TASKID_JNS_SPE_ACH_TASK_5,
};
	
function OnUse()
	local nMaxStuffCount	= GetItemCount(g_tComposeStuff[1], g_tComposeStuff[2], g_tComposeStuff[3]);
	local nMaxComposeCount	= floor(nMaxStuffCount / g_nComposeNeedCount);
	local nHasComposeTimes	= GetTask(TASKID_COMPOSE_SKILL_APP_TIMES);
	local nCanComposeTimes	= GetCanComposeTimes();
	local szMsg	= format("%s: D飊g %d m秐h gh衟 th祅h 1 Ц K� N╪g C蕄 %d v� tr鵦 ti誴 b� v祇 C萴 Nang Ц K� N╪g.\nHi謓 t筰 c� %d m秐h, c� th� gh衟 頲 %d Ц K� N╪g C蕄 %d.\nS� l莕 gh衟 c遪 l筰 l� %d l莕.",
	g_szTitle, g_nComposeNeedCount, g_nComposeLevel, nMaxStuffCount, nMaxComposeCount, g_nComposeLevel, nCanComposeTimes - nHasComposeTimes);
	local tMenu	= {
		"Ta mu鑞 gh衟 Ц K� N╪g			/ComposeSkillApp",
		"Ra kh醝	/nothing",
	};
	suSay(szMsg, getn(tMenu), tMenu);
	return 1;
end

function ComposeSkillApp()
	local nMaxStuffCount	= GetItemCount(g_tComposeStuff[1], g_tComposeStuff[2], g_tComposeStuff[3]);
	local nMaxComposeCount	= floor(nMaxStuffCount / g_nComposeNeedCount);
	
	if 0 >= nMaxComposeCount then
		Talk(1, "", format("%s: Ch祅g trai tr�, kh玭g c� g� th� ng nh蕄 lung tung.", g_szTitle));
		return
	end
	
	local nHasComposeTimes	= GetTask(TASKID_COMPOSE_SKILL_APP_TIMES);
	local nCanComposeTimes	= GetCanComposeTimes();
	
	if nHasComposeTimes >= nCanComposeTimes then
		Talk(1, "", format("%s: Ch祅g trai tr�, h玬 nay  d飊g h誸 s� l莕 gh衟, ng祔 mai h穣 quay l筰 nh�.", g_szTitle));
		return
	end
	
	nMaxComposeCount		= min(nMaxComposeCount, nCanComposeTimes - nHasComposeTimes);
	
	AskClientForNumber("ComposeSkillAppCallBack", 0, nMaxComposeCount, "Mu鑞 gh衟 bao nhi猽?");
end

function OnAchivement(nCount)
	if g_tTaskIDs[g_nComposeLevel] then
		SetTask(g_tTaskIDs[g_nComposeLevel], 1);
		OnAchEvent(2, g_tTaskIDs[g_nComposeLevel]);
	end
	
	if not (GetTask(TASKID_JNS_SPE_ACH_TASK_6) >= 1) then
		SetTask(TASKID_JNS_SPE_ACH_TASK_6, nCount);
		OnAchEvent(2, TASKID_JNS_SPE_ACH_TASK_6);
	end
end

function ComposeSkillAppCallBack(nCount)
	if 0 >= nCount then return end
	
	local nHasComposeTimes	= GetTask(TASKID_COMPOSE_SKILL_APP_TIMES);
	local nCanComposeTimes	= GetCanComposeTimes();
		
	if nHasComposeTimes >= nCanComposeTimes then
		Talk(1, "", format("%s: Ch祅g trai tr�, h玬 nay  d飊g h誸 s� l莕 gh衟, ng祔 mai h穣 quay l筰 nh�.", g_szTitle));
		return
	end
	
	nCount		= min(nCount, nCanComposeTimes - nHasComposeTimes);
	
	gf_SetLogCaption(g_szLogCaption);
	if 1 == DelItem(g_tComposeStuff[1], g_tComposeStuff[2], g_tComposeStuff[3], nCount * g_nComposeNeedCount) then
		if 1 == AddSkillAppCount(g_nComposeLevel, nCount) then
			nHasComposeTimes = nHasComposeTimes + nCount;
			SetTask(TASKID_COMPOSE_SKILL_APP_TIMES, nHasComposeTimes);
			Talk(1, "", format("%s: Ch祅g trai tr�  gh衟 %d Ц K� N╪g C蕄 %d.\n          Ngi c遪 頲 gh衟 %d l莕.", g_szTitle, nCount, g_nComposeLevel, nCanComposeTimes - nHasComposeTimes));
			---------------add by wangjign--------------
			OnAchivement(nCount);
			--------------------------------------------
			---------------add by suzengwei--------------
			for i = 1, nCount do
				Observer:onEvent(OE_COMPOSE_SKILL_STONE, {1});
			end
			--------------------------------------------
		end
	end
	gf_SetLogCaption("");
end

function GetCanComposeTimes()
	local nCurTime		= MkTime(date("%Y"),date("%m"),date("%d"));
	local nBaseTimes	= ((nCurTime - g_nComposeIncreaseBeginTime) / (24 * 60 * 60)) * g_nComposeIncreaseTimes;
	local nAwardTimes	= GetTask(TASKID_COMPOSE_SKILL_APP_TIMES_AWARD);
	return nBaseTimes + nAwardTimes;
end
