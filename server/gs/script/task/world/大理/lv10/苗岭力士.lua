-- ====================== 文件信息 ======================

-- 剑侠情缘onlineII 大理任务NPC血鳞毒蟒召唤和死亡Script
-- By StarryNight
-- 2006/01/09 PM 14:40

--乙酉年  戊子月 己丑日 
--宜: 纳采 订盟 嫁娶 祭祀 祈福 安香 出火 出行 会亲友 经络 求医 治病 解除 拆卸 起基 修造 动土 定磉 扫舍 栽种 牧养 造畜稠 
--忌: 斋醮 作梁 掘井 行丧 安葬 
--吉神宜趋: 阴德 守日 吉期 六合 不将 普护 宝光  
--凶神宜忌: 四离 叁丧  
--每日胎神占方: 占门厕外正北 
--五行: 霹雳火  除执位 
--冲: 冲羊(癸未)煞东 
--彭祖百忌: 己不破券二比并亡 丑不冠带主不还乡 

-- ======================================================
-- 引用剧情任务文件
Include("\\script\\task\\world\\大理\\task_head.lua");
Include("\\script\\task\\world\\大理\\lv10\\task_main.lua");
Include("\\script\\task\\world\\task_head.lua");

function OnUse()

	local nMapID,nWx,nWy = GetWorldPos();

	if nMapID == 420 then --and GetTask(TASK_DL_LV45_ID) == 2 then
	
		local nLSIndex = CreateNpc("Mi猽 L躰h L鵦 S�","Mi猽 L躰h L鵦 S�",nMapID,nWx,nWy,-1,1,1,50);
		SetNpcLifeTime(nLSIndex,900); 
		SetNpcScript(nLSIndex,"\\script\\task\\world\\大理\\Lv10\\苗岭力士.lua");
		ChangeNpcToFight(nLSIndex);
		TaskTip("B筺  g鋓 頲 s� gi� Mi猽 L躰h, mau gi誸 h緉.");
		Msg2Player("B筺  g鋓 頲 s� gi� Mi猽 L躰h, mau gi誸 h緉.");
		DelItem(2,0,367,1);--删去力士信哨
		return
	else
		local strTalk = {
			"Ph秈 n Y課 T� чng t莕g 1 m韎 d飊g 頲 T輓 ti猽 n祔 g鋓 Mi猽 L躰h L鵦 S�"
		};
		TalkEx("",strTalk);
	end;
end;

function OnDeath(index)

	local nPreservedPlayerIndex = PlayerIndex;
	local nMemCount = GetTeamSize();
	local nMapId, nX, nY = GetWorldPos();

	SetNpcLifeTime(index,15);--使得尸体消失
	
	if GetTask(TASK_DL_LV45_ID) == 2 then
		if nMemCount == 0 then -- 玩家未组队
			if GetTask(TASK_DL_LV45_ID) == 2 then
				AddItem(2,0,369,1);--打倒苗岭力士得到一封信
				SetTask(TASK_DL_LV45_ID,3);
				TaskTip("m th� v� cho Tr辬h Qu竛 Chi");
				Msg2Player("m th� v� cho Tr辬h Qu竛 Chi");
			end;
		else	
			for i=1,nMemCount do
			PlayerIndex = GetTeamMember(i);
			local nTeamMapId, nTeamX, nTeamY = GetWorldPos();
			local nDist = DistanceBetweenPoints(nMapId, nX, nY, nTeamMapId, nTeamX, nTeamY);
				if GetTask(TASK_DL_LV45_ID) == 2 then
					AddItem(2,0,369,1);--打倒苗岭力士得到一封信 
					SetTask(TASK_DL_LV45_ID,3);
					TaskTip("m th� v� cho Tr辬h Qu竛 Chi");
					Msg2Player("m th� v� cho Tr辬h Qu竛 Chi");
				end;
			end;
			PlayerIndex = nPreservedPlayerIndex; -- 重置之前储存的玩家编号
		end;
	end;
end
