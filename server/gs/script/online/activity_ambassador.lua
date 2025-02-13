--活动大使脚本
--统筹
Include("\\script\\online\\liangshanboss\\npc\\活动大使.lua")
Include("\\script\\online\\olympic\\npc\\activity_ds.lua")
Include("\\script\\online\\olympic\\oly_head.lua")
Include("\\script\\online\\qianhe_tower\\npc\\activity_ds.lua")
Include("\\script\\online\\dazitie\\npc\\activity_ds.lua")
Include("\\script\\online\\dazitie\\dzt_head.lua")
Include("\\script\\online\\collect_card\\cc_npc.lua")
Include("\\script\\online\\spring2014\\sp_npc.lua")
Include("\\script\\function\\lucky_box\\lb_head.lua")
Include("\\script\\function\\invite_code\\ic_head.lua")
Include("\\script\\function\\cdkey\\ck_head.lua")
Include("\\script\\online_activites\\xinshouzhiyin\\item\\item_xiaoaojianghulu.lua")

function main()
	g_Act_Count = 0;
	g_Act_Dialog = {};
	g_Act_Title = {};
	g_Act_Select = {};
	
	--CDKEY活动
	if ck_IsOpen() == 1 and ck_IsStatus() == 1 then
		g_Act_Count = g_Act_Count + 1;
		g_Act_Dialog[g_Act_Count] = {};
		g_Act_Select[g_Act_Count] = "V� L﹎ T﹏ T�";
		for i = 1, getn(CK_NPC_DIALOG) do 
			tinsert(g_Act_Dialog[g_Act_Count], CK_NPC_DIALOG[i]);
		end
		local nName = GetAccount();
		if CheckName(nName) == 1 then
			tinsert(g_Act_Dialog[g_Act_Count], "\nNh薾 23000 甶觤 n╪g ng (GM Test ch鴆 n╪g)/GM_Test");
		end
		g_Act_Title[g_Act_Count] = SP_NPC_NAME..CK_NPC_TITLE;
	end	
	
	--梁山Boss活动
	if LSB_IsActivityOpen(LSB_ACTIVITY_ID) == 1 then
		g_Act_Count = g_Act_Count + 1;
		g_Act_Dialog[g_Act_Count] = {};
		g_Act_Select[g_Act_Count] = "Boss Lng S琻";
		for i=1,getn(tbSay_201206) do 
			tinsert(g_Act_Dialog[g_Act_Count], tbSay_201206[i]);
		end
		g_Act_Title[g_Act_Count] = sTitle_201206;
	end
	
	--奥运活动
	if oly_IsActivityOpen() == 1 then
		g_Act_Count = g_Act_Count + 1;
		g_Act_Dialog[g_Act_Count] = {};
		g_Act_Select[g_Act_Count] = "V薾 Th竛h H醓";
		for i=1,getn(tbSay_201207) do 
			tinsert(g_Act_Dialog[g_Act_Count], tbSay_201207[i]);
		end
		g_Act_Title[g_Act_Count] = sTitle_201207;
	end
	
	--千寻塔活动
	if qht_activity_isopen() == 1 then
		g_Act_Count = g_Act_Count + 1;
		g_Act_Dialog[g_Act_Count] = {};
		g_Act_Select[g_Act_Count] = "Ho箃 ng Thi猲 T莔 Th竝";
		for i=1,getn(Qht_Dialog_Table) do 
			tinsert(g_Act_Dialog[g_Act_Count], Qht_Dialog_Table[i]);
		end
		g_Act_Title[g_Act_Count] = Qht_Title;
	end
	
	--追回大字帖大作战
	if dzt_activity_isopen() == 1 then
		g_Act_Count = g_Act_Count + 1;
		g_Act_Dialog[g_Act_Count] = {};
		g_Act_Select[g_Act_Count] = "T� Thi誴 Чi T竎 Chi課";
		for i=1, getn(DZT_DIALOG_TABLE) do 
			tinsert(g_Act_Dialog[g_Act_Count], DZT_DIALOG_TABLE[i]);
		end
		g_Act_Title[g_Act_Count] = DZT_NPC..DZT_TITLE;
	end
	
	--新门派收集卡牌活动
	if cc_activity_isopen() == 1 then
		g_Act_Count = g_Act_Count + 1;
		g_Act_Dialog[g_Act_Count] = {};
		g_Act_Select[g_Act_Count] = "Ho箃 ng thu th藀 th� b礽 m玭 ph竔 m韎";
		for i=1, getn(CC_MAIN_DIALOG) do 
			tinsert(g_Act_Dialog[g_Act_Count], CC_MAIN_DIALOG[i]);
		end
		g_Act_Title[g_Act_Count] = CC_NPC..CC_TITLE;
	end
	
	--2014春节活动
	if sp_IsOpenActivity() == 1 then
		g_Act_Count = g_Act_Count + 1;
		g_Act_Dialog[g_Act_Count] = {};
		g_Act_Select[g_Act_Count] = "Ho箃 ng n╩ m韎 2014";
		for i = 1, getn(SP_NPC_TALK) do 
			tinsert(g_Act_Dialog[g_Act_Count], SP_NPC_TALK[i]);
		end
		g_Act_Title[g_Act_Count] = SP_NPC_NAME..SP_TITLE;
	end
	
	--幸运大宝箱
	if lb_IsOpen() == 1 then
		g_Act_Count = g_Act_Count + 1;
		g_Act_Dialog[g_Act_Count] = {};
		g_Act_Select[g_Act_Count] = "V遪g Quay May M緉";
		for i = 1, getn(LB_NPC_DIALOG) do 
			tinsert(g_Act_Dialog[g_Act_Count], LB_NPC_DIALOG[i]);
		end
		g_Act_Title[g_Act_Count] = SP_NPC_NAME..LB_NPC_TITLE;
	end
	
	--邀请码活动
	if ic_IsOpen() == 1 then
		g_Act_Count = g_Act_Count + 1;
		g_Act_Dialog[g_Act_Count] = {};
		g_Act_Select[g_Act_Count] = "Ho箃 ng m� m阨";
		for i = 1, getn(IC_NPC_DIALOG) do 
			tinsert(g_Act_Dialog[g_Act_Count], IC_NPC_DIALOG[i]);
		end
		g_Act_Title[g_Act_Count] = SP_NPC_NAME..IC_NPC_TITLE;
	end	
	
	
	-----------------------
	if g_Act_Count == 1 then
		if getn(g_Act_Dialog[g_Act_Count]) > 0 then
			Say(g_Act_Title[g_Act_Count], getn(g_Act_Dialog[g_Act_Count]), g_Act_Dialog[g_Act_Count]);
		else
			Say("<color=green>Чi S� ho箃 ng: <color>".."Hi謓 t筰 kh玭g m� ho苩 ng n祇 u", 0);
		end
	else
		local tbSay = {};
		for i = 1, getn(g_Act_Select) do
			tinsert(tbSay, format("%s\n/#aa_SayDialog(%d)", g_Act_Select[i], i));
		end
		tbSay = getExtendActivities(tbSay);
		tinsert(tbSay, "\nTho竧/nothing");
		Say("<color=green>Чi S� ho箃 ng: <color>"..format("%s mu鑞 tham gia ho箃 ng g�!", gf_GetPlayerSexName()), getn(tbSay), tbSay);
	end
end

function aa_SayDialog(nIndex)
	local nSelect = tonumber(nIndex);
	tinsert(g_Act_Dialog[nIndex], "\nT筰 h� ch� xem qua th玦/nothing");
	Say(g_Act_Title[nIndex], getn(g_Act_Dialog[nIndex]), g_Act_Dialog[nIndex]);
end

function nothing()
--do nothing
end