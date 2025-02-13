
-- ====================== 文件信息 ======================

-- 剑侠情缘onlineII 门派任务头文件
-- Edited by peres
-- 2005/02/17 PM 18:03

-- ======================================================
Include("\\script\\global\\技能树操作.lua")
Include("\\script\\equip_shop\\equip_shop_head.lua")
Include("\\script\\task\\tasklink\\factiontasklink_temp.lua"); -- 师门任务链的头文件
--越南09年11月活动
Include("\\script\\online\\viet_event\\200911\\event_head.lua");

--各门派的任务变量

FN_SL 	= 1001; --少林
FN_WD 	= 1002; --武当
FN_EM 	= 1003; --峨眉
FN_GB 	= 1004; --丐帮
FN_TM 	= 1005; --唐门
FN_YM 	= 1031; --杨门男
FN_YMM  = 1032; --杨门女
FN_WP   = 1033; --五毒

-- 子函数，用以获取门派任务的进展程度
function FN_GetTaskState(fn)

	return GetTask(fn)

end

-- 子函数，用以设置门派任务的进展程度
function FN_SetTaskState(fn, nValue)

	SetTask(fn, nValue)

end


-- 子函数，使门派任务进展到下一步
function FN_SetTaskAdd(fn)
	SetTask(fn, GetTask(fn) + 1)
	return
end


-- 子函数，用于扩展对话 TALK 函数的功能
function TE_Talk(num,fun,szMsg)
	local szmsg = ""
	for i=1,num-1 do
		szmsg = szmsg..format("%q",szMsg[i])..","
	end
	szmsg = szmsg .. format("%q",szMsg[num])
	szmsg = "Talk("..num..","..format("%q",fun)..","..szmsg..")"
	dostring(szmsg)
end	

--越南09年11月活动给掌门东西
function GiveItemToMaster(szHeader, nPlayerRoute)
	local nDate = tonumber(date("%y%m%d"));
	if nDate >= 091113 and nDate < 491130 then
		if GetPlayerFaction() ~= nPlayerRoute then
			Talk(1, "", szHeader.."C竎 h� kh玭g ph秈 l�  t� c馻 b鎛 m玭.");
			return 0;
		end
		if GetItemCount(2, 1, 30119) < 20 or GetItemCount(2, 1, 30120) < 20 then
			Talk(1, "", szHeader.."C竎 h� 產ng a ta ph秈 kh玭g?  Kh玭g ph秈 t苙g ta tr� v韎 b竛h hay sao?")
			return 0;
		end
		if GetTask(VIET_0911_TASK_ZHANGMEN_DATE) >= nDate then
			if GetTask(VIET_0911_TASK_ZHANGMEN_COUNT) >= 2 then
				Talk(1, "", szHeader.."C竎 h� h玬 nay t苙g ta b竛h v� tr� 2 l莕 r錳, h穣 i ng祔 mai r錳 ti誴 t鬰.");
				return 0;
			else
				if GetTime() - GetTask(VIET_0911_TASK_ZHANGMEN_TIME) < 3600 then
					Talk(1, "", szHeader.."Gi穘 c竎h t苙g tr� v� b竛h c莕 60 ph髏, h穣 i th猰 ch髏 x輚 n鱝 nh�.");
					return 0;
				else
					if DelItem(2, 1, 30119, 20) == 1 and DelItem(2, 1, 30120, 20) == 1 then
						ModifyExp(3000000);
						SetTask(336, GetTask(336) + 20);
						SetTask(VIET_0911_TASK_ZHANGMEN_TIME, GetTime());
						SetTask(VIET_0911_TASK_ZHANGMEN_DATE, nDate);
						SetTask(VIET_0911_TASK_ZHANGMEN_COUNT, GetTask(VIET_0911_TASK_ZHANGMEN_COUNT) + 1);
					end
				end
			end
		else
			SetTask(VIET_0911_TASK_ZHANGMEN_COUNT, 0);
			if DelItem(2, 1, 30119, 20) == 1 and DelItem(2, 1, 30120, 20) == 1 then
				ModifyExp(3000000);
				SetTask(336, GetTask(336) + 20);
				SetTask(VIET_0911_TASK_ZHANGMEN_TIME, GetTime());
				SetTask(VIET_0911_TASK_ZHANGMEN_DATE, nDate);
				SetTask(VIET_0911_TASK_ZHANGMEN_COUNT, GetTask(VIET_0911_TASK_ZHANGMEN_COUNT) + 1);
			end
		end
	end
end
--脚本功能：流派加入NPC相关功能统一处理
--功能设计：村长
--代码开发：村长
--开发时间：2009-3-14
--我问佛祖：bug为什么改不完？佛祖曰：策划乃bug之母。我问：bug之父呢？佛祖曰：非你莫属！
--门派名称
--====================门派传送人===============
g_szInfoHead = "<color=green>Ti誴 d蒼 m玭 ph竔<color>:";
MAX_SEL_PER_PAGE = 5;	--每页门派数量

TB_FACTION_PLACE =
{	--{门派名字,{坐标点信息},战斗状态,门派编号}
	{"Thi誹 L﹎",{204,1501,3328},1,1},
	{"V� ng",{312,1713,3469},1,2},
	{"Nga My",{303,1603,3240},1,3},
	{"C竔 Bang",{209,1528,3246},1,4},
	{"Л阯g M玭",{305,1532,2915},1,5},
	{"Thi猲 Ba Dng ph�",{219,1630,3274},1,6},
	{"Ng� чc Gi竜",{407,1555,3282},1,7},
	{"C玭 L玭",{509,1513,3285},0,8},
	{"Minh Gi竜",{152,1518,3078},0,9},
	{"Th髖 Y猲",{404,1507,2788},0,10},
}
TB_FACTION_PLACE_INDEX = nil
function _init_TB_FACTION_PLACE_INDEX()
	if not TB_FACTION_PLACE_INDEX then
		TB_FACTION_PLACE_INDEX = {}
		for i=1,getn(TB_FACTION_PLACE) do
			local t = TB_FACTION_PLACE[i]
			TB_FACTION_PLACE_INDEX[t[4]] = t;
		end
		return 1
	end
end

--获得选项table
function get_list()
	local nFaction = GetPlayerFaction();
	local tbRetTb = {};
	local tbFactionTb = get_faction_list();
	local szFactionName = "";
	local nFactionIdx = 0;
	_init_TB_FACTION_PLACE_INDEX()
	for i=1,getn(tbFactionTb) do
		nFactionIdx = tbFactionTb[i];
		szFactionName = TB_FACTION_PLACE_INDEX[nFactionIdx][1];
		if i == 1 and nFaction ~= 0 then
			tinsert(tbRetTb,"V� s� m玭 ("..szFactionName..")/#go_to_faction("..nFactionIdx..")");
		else
			tinsert(tbRetTb,szFactionName.."/#go_to_faction("..nFactionIdx..")");
		end;
	end;
	return tbRetTb;
end;
--获得门派对应的对话顺序table
function get_faction_list()
	local nFaction = GetPlayerFaction();
	local tbRetTb = {};	--返回table
	local tbInitTb = {};	--基础table，用作中间处理
	for i=1,getn(TB_FACTION_PLACE) do
		tbInitTb[i] = TB_FACTION_PLACE[i][4];
	end;
	if nFaction == 0 then
		tbRetTb = tbInitTb;
	else
		tinsert(tbRetTb,nFaction);	--先把对应的门派放第一位
		--tbInitTb[nFaction] = 0;	--标记对应的门派已放进tbRetTb
		for i=1,getn(tbInitTb) do
			if tbInitTb[i] ~= nFaction then
				tinsert(tbRetTb,tbInitTb[i])	--把剩下未放进tbRetTb的门派按顺序放进tbRetTb
			end;
		end;
	end;
	return tbRetTb;
end;
--列出对话选项
function list_content(nPageNum)
	local tbList = get_list();
	local nRecordCount = getn(tbList);
	local GetMaxItemCountPerPage = function(nPN,nRC)	--这个函数是用来获得当前页数的最大显示项目数的
		local nCount = nRC-(nPN-1)*MAX_SEL_PER_PAGE;
		if nCount >= MAX_SEL_PER_PAGE then
			return MAX_SEL_PER_PAGE
		else
			return mod(nCount,MAX_SEL_PER_PAGE);
		end;
	end;
	local nMaxIndex = GetMaxItemCountPerPage(nPageNum,nRecordCount);
	local nCurStartIndex = (nPageNum-1)*MAX_SEL_PER_PAGE+1;
	local selTab = {};
	for i=nCurStartIndex,nCurStartIndex+nMaxIndex-1 do
		tinsert(selTab,tbList[i]);
	end;
	if nPageNum ~= 1 then
		tinsert(selTab,format("\n Trang trc/#list_content(%d)",nPageNum-1));
	end;
	if nPageNum ~= ceil(nRecordCount/MAX_SEL_PER_PAGE) then
		tinsert(selTab,format("\n Trang sau/#list_content(%d)",nPageNum+1));
	end;
	tinsert(selTab,"Ta mu鑞 h駓 b� nhi謒 v� nh藀 m玭 hi謓 t筰./cancel_faction");
	tinsert(selTab,"Kh玭g 甶 u c�./no");
	Say(g_szInfoHead.."Ta l� S� Gi� M玭 Ph竔, c� th� a ngi n c竎 i m玭 ph竔 tr猲 giang h�, ngi mu鑞 n m玭 ph竔 n祇?",getn(selTab),selTab);
end
function moneygo()
	--if GetLevel()<70 then
		--return 1
	--elseif GetCash()>=500 then
		--PrePay(500)
		--return 1
	--else
		--return 0
	--end
	
	return 1
end;
--去目的地
function go_to_faction(nFaction)
	if moneygo() == 1 then
		CleanInteractive();
		local nMapID,nMapX,nMapY = 0,0,0;
		local nFightState = 0;
		_init_TB_FACTION_PLACE_INDEX()
		nMapID = TB_FACTION_PLACE_INDEX[nFaction][2][1];
		nMapX = TB_FACTION_PLACE_INDEX[nFaction][2][2];
		nMapY = TB_FACTION_PLACE_INDEX[nFaction][2][3];
		nFightState = TB_FACTION_PLACE_INDEX[nFaction][3];
		NewWorld(nMapID,nMapX,nMapY);
		SetFightState(nFightState);
	else
		Talk(1,"",g_szInfoHead.."Ng﹏ lng c馻 ngi kh玭g , t譵  r錳 h穣 quay l筰 nh�!")
	end;
end;

function no()
end;

--取消目前所有入门任务进度
function cancel_faction()
	if GetPlayerFaction()~=0 then
		Say("C竎 h�  gia nh藀 m玭 ph竔, mu鑞 h駓 b� m玭 ph竔 sao?",0);
	else
		Say("Hi謓 c竎 h� c� th� ch鋘 l筰 m玭 ph竔 kh竎!",0);
		for i = 1,getn(TB_FACTION_TASKID_LIST) do
			SetTask(TB_FACTION_TASKID_LIST[i],0)
		end
		if GetNpcName(GetFollower())  == "Ti觰 猽" then
			KillFollower()
		end
	end
end
--====================新门派其它功能===========
TB_FACTION_TASKID_LIST = {1001,1002,1003,1004,1005,1031,1032,1033,1017,1018,1019}
TB_FACTION_INFO = {
	"Thi誹 L﹎","V� ng","Nga My","C竔 Bang","Л阯g M玭","Dng M玭","Ng� чc","C玭 L玭","Minh gi竜","Th髖 Y猲",
}
--流派名称
TB_ROUTE_INFO = {
	"Thi誹 L﹎","Thi誹 T鬰","Thi襫 t╪g","V� t╪g","Л阯g M玭","Л阯g M玭","Nga My","Ph藅 Gia","T鬰 gia","C竔 Bang",
	"T辬h Y","� Y","V� ng","Чo Gia","T鬰 gia","Dng M玭","Thng K�","Cung K�","Ng� чc","T� hi謕",
	"C� s�","C玭 L玭","Thi猲 S�","Minh gi竜","Th竛h Chi課","Tr薾 Binh","Huy誸 Nh﹏","Th髖 Y猲","V� Ti猲","Linh N�",
	"Nh薽 Hi謕","Ki誱 T玭"
}
--门派对应的流派
TB_FACTION_ROUTE = {
	[5] = 5,
	[8] = 22,
	[9] = 24,
	[10] = 28,
}
--掌门人NPC
TB_FACTION_MASTER_NAME = {
	[5] = "Л阯g L閚g Nguy謙",
	[8] = "Chu B蕋 Ho芻",
	[9] = "Phng L筽",
	[10] = "S礽 Ho祅g Nhi",
}
--师门重复任务的对应难度
TB_FACTION_TASK_DIFF = {
	[23] = TASK_ID_KUNLUN_TIANSHI,
	[25] = TASK_ID_MINGJIAO_SHENGZHAN,
	[26] = TASK_ID_MINGJIAO_ZHENBING,
	[27] = TASK_ID_MINGJIAO_XUEREN,
	[29] = TASK_ID_CUIYAN_WUXIAN,
	[30] = TASK_ID_CUIYAN_LINGNV,
}
--师门密室NPC
TB_FACTION_BACK_NAME = {
	[8] = "Tr莕 B蕋 Vi",
	[9] = "L璾 Thanh Mi",
	[10] = "Th筩h B秓",
}
--流派入门相关
TB_ROUTE_IN_INFO = {
	[23] = {
		npc_name = "T莕 B蕋 Tri",
		bewrite = "C玭 L玭 phong c秐h h鱱 t譶h! V� c玭g b鎛 ph竔 ch� truy襫 cho  t� Thi猲 S�, k� n╪g h� Phong ch� y誹 l� kh鑞g ch� v� ph遪g th�, k� n╪g t蕁 c玭g s竧 thng th蕄, k� n╪g h� L玦 ch� y誹 g﹜ s竧 thng, 產 s� l� t蕁 c玭g qu莕 c玭g. V� c玭g h� ph竔 xem tr鋘g <color=yellow>n閕 c玭g<color>, d飊g <color=yellow>ki誱<color>  t╪g kh� n╪g t蕁 c玭g.",
		in_route_talk = "Gi� ch輓h th鴆 thu nh薾 ngi l祄  t� v� gi髉 ngi  th玭g kinh m筩h, <color=yellow>t葃 l筰 ti襪 n╪g<color>. V� c玭g h� ph竔 xem tr鋘g <color=yellow>n閕 c玭g<color>, sau n祔 ngi h穣 c� g緉g. Gi� ngi c� th� n g苝 Chng M玭 nh薾 <color=yellow>nhi謒 v� s� m玭<color> r錳.",
		skill = {{4,"Ki誱 t蕁 c玭g b譶h thng"},{1017,"Th竔 蕋 T﹎ Ph竝"},{1018,"L玦 T�"},{1020,"Thi猲 L玦 Ph�"}},
		book={0,112,192,"Phong L玦 Ch﹗"},
		book_chip = {
			{2,95,1 ,"Phong L玦 Ch﹗ T祅 Quy觧-Thng"},
			{2,95,2 ,"Phong L玦 Ch﹗ T祅 Quy觧-Trung"},
			{2,95,3 ,"Phong L玦 Ch﹗ T祅 Quy觧-H�"},
		},
		equip = 2,
	},
	[25] = {
		npc_name = "L� Thi猲 Nhu薾",
		bewrite = "е t� Minh gi竜 lu玭 s鬰 s玦 nhi謙 huy誸! V� c玭g b鎛 ph竔 ch� truy襫 cho Th竛h Chi課  t�, t輈h l騳 n� kh� t蕁 c玭g k� th�. V� c玭g h� ph竔 xem tr鋘g <color=yellow>s鴆 m筺h<color>, d飊g <color=yellow>產o<color>  t╪g kh� n╪g t蕁 c玭g.",
		in_route_talk = "Gi� ch輓h th鴆 thu nh薾 ngi l祄  t� v� gi髉 ngi  th玭g kinh m筩h, <color=yellow>t葃 l筰 ti襪 n╪g<color>. V� c玭g h� ph竔 xem tr鋘g <color=yellow>s鴆 m筺h<color>, sau n祔 ngi h穣 c� g緉g. Gi� ngi c� th� n g苝 Chng M玭 nh薾 <color=yellow>nhi謒 v� s� m玭<color> r錳.",
		skill = {{3,"o t蕁 c玭g b譶h thng"},{1053,"Th竛h H醓 Kim L� C玭g"},{1054,"Th竛h H醓 o Ph竝"}},
		book={0,112,193,"C祅 Kh玭 Чi Na Di T﹎ Ph竝"},
		book_chip = {
			{2,95,4 ,"C祅 Kh玭 Чi Na Di T﹎ Ph竝 T祅 Quy觧-Thng"},
			{2,95,5 ,"C祅 Kh玭 Чi Na Di T﹎ Ph竝 T祅 Quy觧-Trung"},
			{2,95,6 ,"C祅 Kh玭 Чi Na Di T﹎ Ph竝 T祅 Quy觧-H�"},
		},
		equip = 3,
	},
	[26] = {
		npc_name = "Vng D莕",
		bewrite = "Minh Gi竜 tr薾 binh tinh nhu�, nh u th緉g ! V� c玭g b鎛 ph竔 ch� truy襫 cho Tr薾 Binh  t�, th玭g hi觰 ng� h祅h tng kh綾, uy hi誴 k� th�. V� c玭g h� ph竔 xem tr鋘g <color=yellow>linh ho箃<color>, d飊g <color=yellow>b髏<color>  t╪g kh� n╪g t蕁 c玭g.",
		in_route_talk = "Gi� ch輓h th鴆 thu nh薾 ngi l祄  t� v� gi髉 ngi  th玭g kinh m筩h, <color=yellow>t葃 l筰 ti襪 n╪g<color>. V� c玭g h� ph竔 xem tr鋘g <color=yellow>linh ho箃<color>, sau n祔 ngi h穣 c� g緉g. Gi� ngi c� th� n g苝 Chng M玭 nh薾 <color=yellow>nhi謒 v� s� m玭<color> r錳.",
		skill = {{8,"B髏 t蕁 c玭g b譶h thng"},{1083,"Quang Minh Ti猽 Dao C玭g"},{1084,"Quang Minh B髏 Ph竝"}},
		book = {0,112,194,"Quang Minh Ng� H祅h L謓h"},
		book_chip = {
			{2,95,7 ,"Quang Minh Ng� H祅h L謓h T祅 Quy觧-Thng"},
			{2,95,8 ,"Quang Minh Ng� H祅h L謓h T祅 Quy觧-Trung"},
			{2,95,9 ,"Quang Minh Ng� H祅h L謓h T祅 Quy觧-H�"},
			},
		equip = 9,
	},
	[27] = {
		npc_name = "T� H祅h Phng",
		bewrite = "Gi竜 ch髇g Minh Gi竜 t譶h nh� th� t骳, quy誸 kh玭g nng tay v韎 k� th�! V� c玭g b鎛 ph竔 ch� truy襫 cho  t� Huy誸 Nh﹏, d飊g l頸 tr秓 uy hi誴 k� th�, xu蕋 chi猽 ch� m筺g. V� c玭g h� ph竔 xem tr鋘g <color=yellow>th﹏ ph竝<color>, d飊g <color=yellow>tr秓<color>  t╪g kh� n╪g t蕁 c玭g.",
		in_route_talk = "Gi� ch輓h th鴆 thu nh薾 ngi l祄  t� v� gi髉 ngi  th玭g kinh m筩h, <color=yellow>t葃 l筰 ti襪 n╪g<color>. V� c玭g h� ph竔 xem tr鋘g <color=yellow>th﹏ ph竝<color>, sau n祔 ngi h穣 c� g緉g. Gi� ngi c� th� n g苝 Chng M玭 nh薾 <color=yellow>nhi謒 v� s� m玭<color> r錳.",
		skill = {{14,"Tr秓 t蕁 c玭g b譶h thng"},{1131,"H祅 B╪g T﹎ Ph竝"},{1132,"筺 C鑤 Tr秓"}},
		book={0,112,195,"H祅 B╪g Ng璶g Huy誸 Ch�"},
		book_chip = {
			{2,95,10,"H祅 B╪g Ng璶g Huy誸 Ch� T祅 Quy觧-Thng"},
			{2,95,11,"H祅 B╪g Ng璶g Huy誸 Ch� T祅 Quy觧-Trung"},
			{2,95,12,"H祅 B╪g Ng璶g Huy誸 Ch� T祅 Quy觧-H�"},
		},
		equip = 11,
	},
	[29] = {
		npc_name = "Chu T� V╪",
		bewrite = "Th髖 Y猲 tr╩ hoa 畊a n�, ng l� n琲 tuy謙 m� luy謓 t藀 nh秠 m骯! V� c玭g ph竔 ta ch� truy襫 cho V� Ti猲  t�, khi xu蕋 chi猽 uy觧 chuy觧 nh� m骯 l祄 suy y誹 k� th� v� t╪g thu閏 t輓h cho ng i. V� c玭g h� ph竔 xem tr鋘g <color=yellow>th﹏ ph竝<color>, v� kh� l� <color=yellow>Linh Chi<color>  t╪g kh� n╪g t蕁 c玭g.",
		in_route_talk = "Gi� ch輓h th鴆 thu nh薾 ngi l祄  t� v� gi髉 ngi  th玭g kinh m筩h, <color=yellow>t葃 l筰 ti襪 n╪g<color>. V� c玭g h� ph竔 xem tr鋘g <color=yellow>th﹏ ph竝<color>, sau n祔 ngi h穣 c� g緉g. Gi� ngi c� th� n g苝 Chng M玭 nh薾 <color=yellow>nhi謒 v� s� m玭<color> r錳.",
		skill = {{15,"Linh Chi c玭g k輈h"},{1165,"Phong V� T﹎ Ph竝"},{1166,"Kh雐 V�"},{1167,"Linh Mi猽 V薾"}},
		book={0,112,196,"Ph鬾g Minh Ph�"},
		book_chip = {
			{2,95,13,"Ph鬾g Minh Ph� T祅 Quy觧-Thng"},
			{2,95,14,"Ph鬾g Minh Ph� T祅 Quy觧-Trung"},
			{2,95,15,"Ph鬾g Minh Ph� T祅 Quy觧-H�"},
		},
		equip = 13,
	},
	[30] = {
		npc_name = "H� Man Th祅h",
		bewrite = "T﹎ kh玭g t筽 ni謒 m韎 c� th� dung h遖 v韎 Ti觰 猽! V� c玭g m玭 ph竔 ch� truy襫 cho Linh N�  t�, thng h鋍 nu玦 Ti觰 猽, khi chi課 u d飊g Ti猽 tri謚 g鋓 Ti觰 猽 t蕁 c玭g k� th�. V� c玭g h� ph竔 xem tr鋘g <color=yellow>linh ho箃<color>, d飊g <color=yellow>ti猽<color>  t╪g kh� n╪g t蕁 c玭g.",
		in_route_talk = "Gi� ch輓h th鴆 thu nh薾 ngi l祄  t� v� gi髉 ngi  th玭g kinh m筩h, <color=yellow>t葃 l筰 ti襪 n╪g<color>. V� c玭g h� ph竔 xem tr鋘g <color=yellow>linh ho箃<color>, sau n祔 ngi h穣 c� g緉g. Gi� ngi c� th� n g苝 Chng M玭 nh薾 <color=yellow>nhi謒 v� s� m玭<color>r錳.",
		skill = {{16,"S竜 c玭g k輈h b譶h thng"},{1217,"B竎h Hoa Ng鋍 L� C玭g"},{1218,"Nu玦 Ti觰 猽"},{1219,"L筩 Hoa Quy誸"}},
		book={0,112,197,"Hoa Ti猲 T﹎ Kinh"},
		book_chip = {
			{2,95,16,"Hoa Ti猲 T﹎ Kinh T祅 Quy觧-Thng"},
			{2,95,17,"Hoa Ti猲 T﹎ Kinh T祅 Quy觧-Trung"},
			{2,95,18,"Hoa Ti猲 T﹎ Kinh T祅 Quy觧-H�"},
		},
		equip = 12,
	},
	[31] = {
		npc_name = "Л阯g L閚g Nguy謙",
		bewrite = "Х v祇 h� ph竔 ta th� ng c﹗ n� l� c� nh� Л阯g, c� t飝 � h祅h t萿 giang h�. Ch駓 th� l� v� kh� s� trng c馻 ph竔 ta.",
		in_route_talk = "Gi� ch輓h th鴆 thu nh薾 ngi l祄  t� v� gi髉 ngi  th玭g kinh m筩h, <color=yellow>t葃 l筰 ti襪 n╪g<color>. V� c玭g h� ph竔 xem tr鋘g <color=yellow>s鴆 m筺h<color>, sau n祔 ngi h穣 c� g緉g. Gi� ngi c� th� n g苝 Chng M玭 nh薾 <color=yellow>nhi謒 v� s� m玭<color>r錳.",
		skill = {{17,"Ch駓 th� k輈h b譶h thng"},{1872,"M� 秐h T﹎ Ph竝"},{1875,"S竧 �"}},
		equip = 14,
	},
	[32] = {
		npc_name = "V﹏ Hi H遖",
		bewrite = "Х v祇 h� ph竔 ta ph秈 th� c� i mang ki誱 tu h祅h, th鵦 thi ch輓h ngh躠. Ki誱 l� v� kh� s� trng c馻 ph竔 ta.",
		in_route_talk = "Gi� ch輓h th鴆 thu nh薾 ngi l祄  t� v� gi髉 ngi  th玭g kinh m筩h, <color=yellow>t葃 l筰 ti襪 n╪g<color>. V� c玭g h� ph竔 xem tr鋘g <color=yellow>s鴆 m筺h<color>, sau n祔 ngi h穣 c� g緉g. Gi� ngi c� th� n g苝 Chng M玭 nh薾 <color=yellow>nhi謒 v� s� m玭<color>r錳.",
		skill = {{4,"Ki誱 k輈h b譶h thng"},{1887,"Nh﹏ Ki誱 H頿 Nh蕋"},{1888,"Luy謓 Ki誱 Si H祅"}},
		equip = 2,
	},
}
--师门外装
TB_FACTION_SUIT_INFO = {
	[8] = 530,
	[9] = 534,
	[10] = 532,
}
--镇派秘籍兑换几率
TB_BOOK_CHG_ODD = {
	{1,5,50},
	{5,3,60},
	{50,60,40},
}
--师门售卖
TB_FACTION_SALE = {
	[1]={44,66,67},
	[2]={46,78,79},
	[3]={45,72,73},
	[4]={47,75,76},
	[5]={48,69,70},
	[6]={51,81,82},
	[7]={55,84,85},
	[8]={112,113,114},
	[9]={116,117,118},
	[10]={120,121,122},
}
--师门售卖NPC
TB_FACTION_SALE_NPC = {
	[1] = "T� V╪ Чt",
	[2] = "Y猲 Nh�",
	[3] = "Di謕 T� Hinh",
	[4] = "V璾 Tri V�",
	[5] = "Л阯g Thi猲 H秈",
	[6] = "Dng B礽 Phong",
	[7] = "Th竔 Quang",
	[8] = "Mai B蕋 Dung",
	[9] = "Phng Th蕋 Ph藅",
	[10] = "H� H礽",
}
--师门传送
TB_TRANSPORT_INFO = {
	[8] = {"<color=green>Vng B蕋 Ph祄<color>: Зy l� n骾 C玭 L玭, gi竜 ph竔 ta tuy ch璦 thu nh薾  t� nh璶g  c� nhi襲 v� l﹎ trung nh﹏ y tham quan, ngi c� th� v祇 y th╩ th�. Л阯g n骾 hi觤 tr�, n誹 mu鑞 xu鑞g n骾 ta s� d蒼 阯g.",
		{
			{300,1793,3544},
			{300,1755,3518},
			{300,1718,3534},
			{300,1744,3562},
		}
	},
	[9] = {"<color=green>Phng B竎h Hoa<color>: N琲 n祔 nguy hi觤,  ta a ngi m閠 畂筺.",
		{
			{100,1460,2967},
			{100,1429,3005},
			{100,1398,2979},
			{100,1433,2947},
		}
	},
	[10] = {"<color=green>X秓 X秓<color>: Th髖 Y猲 phong c秐h h鱱 t譶h nh璶g d� l筩 阯g,  ta a ngi ra",
		{
			{400,1549,2968},
			{400,1512,2980},
			{400,1533,2993},
			{400,1541,2935},
		}
	}
}

--=============流派师父相关=================
function master_main(faction_seq,route_seq)
	local t_dia_sel = {
--		"弟子参拜师傅/#get_in_route("..faction_seq..","..route_seq..")",
		"H鋍 "..TB_FACTION_INFO[faction_seq]..TB_ROUTE_INFO[route_seq].." V� c玭g/#learn_skill("..route_seq..")",
--		"我得到了本门镇派秘籍的残卷/#book_chg("..route_seq..")",
		"Ch祇 h醝/end_dialog",
	}
	local t_dia_show = {}
	local s_dia_main = "<color=green>"..TB_ROUTE_IN_INFO[route_seq].npc_name.."<color>: "..TB_ROUTE_IN_INFO[route_seq].bewrite

	local nRoute = GetPlayerRoute();
	if GetPlayerFaction() == faction_seq or isNewRoute(nRoute) then
		if GetPlayerRoute() == TB_FACTION_ROUTE[faction_seq] then
			tinsert(t_dia_show,t_dia_sel[1])
		elseif GetPlayerRoute()  == route_seq then
		-- if GetPlayerRoute()  == route_seq then
			tinsert(t_dia_show,t_dia_sel[1])
--			tinsert(t_dia_show,t_dia_sel[3])
			if route_seq == 30 then
				tinsert(t_dia_show,"H穣 a ta 1 <Dng 猽 Ch� Nam>/give_yangdiao_book"); --养貂指南
			end
			if route_seq == 32 then
				tinsert(t_dia_show,"Nh薾 nguy猲 li謚 luy謓 ki誱/#show_equip_shop(80)"); --炼剑材料
			end
		end
	end
	tinsert(t_dia_show,t_dia_sel[2])
	if getn(t_dia_show) == 1 then
		Talk(1,"",s_dia_main)
	else
		Say(s_dia_main,
			getn(t_dia_show),
			t_dia_show
		)
	end
end

function isNewRoute(nRoute)
	return nRoute == 31 or nRoute == 32;
end;

--拜师
function get_in_route(faction_seq,route_seq)
	Say("<color=green>"..TB_ROUTE_IN_INFO[route_seq].npc_name.."<color>: Х ho祅 th祅h <color=yellow>nhi謒 v� nh藀 m玭<color>, ngi  l� ngi c馻 <color=yellow>"..TB_FACTION_INFO[faction_seq].."<color> ta, m閠 khi  v祇 s� th� thay i, suy ngh� k� ch璦?",
		2,
		"Ta  ngh� k�, quy誸 nh v祇 "..TB_ROUTE_INFO[route_seq].."/#in_route_dtm("..faction_seq..","..route_seq..")",
		"в ta suy ngh� l筰/end_dialog"
	)
end
function in_route_dtm(faction_seq,route_seq)
	if GetFreeItemRoom() < 8 then
		Talk(1,"","<color=green>"..TB_ROUTE_IN_INFO[route_seq].npc_name.."<color>: N誹  quy誸 v祇 m玭 ph竔 ta, vi s� s� t苙g ngi m閠 v礽 trang b� t﹏ th� xem nh� l� qu� nh藀 m玭, h穣 s緋 x誴 l筰 h祅h trang r錳 quay l筰 nh薾 (C莕 <color=yellow>8<color> � t骾 tr鑞g!)")
		return
	end
	
	if GetPlayerRoute() == TB_FACTION_ROUTE[faction_seq] and GetPlayerFaction() == faction_seq or isNewRoute(GetPlayerRoute()) then
		SetPlayerRoute(route_seq)
		ResetProperty()        --洗潜能点
		--技能学习
		for i = 1,getn(TB_ROUTE_IN_INFO[route_seq].skill) do
			LearnSkill(TB_ROUTE_IN_INFO[route_seq].skill[i][1])
			Msg2Player("C竎 h�  l躰h h閕"..TB_ROUTE_IN_INFO[route_seq].skill[i][2])
		end
		--师门第一套
		local particular_id = route_seq*1000+100+GetBody()
		local suit_id = TB_FACTION_SUIT_INFO[faction_seq] - 1+GetBody()
		if faction_seq == 10 then
			particular_id = particular_id - 2
			suit_id = suit_id - 2
		end
			--师门外装增加
			AddItem(0,108,suit_id,1)
			AddItem(0,109,suit_id,1)
			--头
			AddItem(0,103,particular_id,1,1,-1,-1,-1,-1,-1,-1)
			--衣服
			AddItem(0,100,particular_id,1,1,-1,-1,-1,-1,-1,-1)
			--下装
			AddItem(0,101,particular_id,1,1,-1,-1,-1,-1,-1,-1)
			--武器
			AddItem(0,TB_ROUTE_IN_INFO[route_seq].equip,particular_id,1,1,-1,-1,-1,-1,-1,-1)
			--增加貂
			if route_seq == 30 then
				AddItem(2,20,1,1)
			end
		--对话
		Talk(1,"","<color=green>"..TB_ROUTE_IN_INFO[route_seq].npc_name.."<color>: ".. TB_ROUTE_IN_INFO[route_seq].in_route_talk)
	else
		Msg2Player("Gia nh藀 h� ph竔 th蕋 b筰!");
		return
	end
end
--学习技能
function learn_skill(route_seq)
	if GetPlayerRoute() ~= route_seq then	--流派检测
		Talk(1,"","<color=green>"..TB_ROUTE_IN_INFO[route_seq].npc_name.."<color>: Ngi kh玭g ph秈  t� c馻 ta, kh玭g th� h鋍 v� c玭g V� ng o gia.")
	else
		Say(1,"","<color=green>"..TB_ROUTE_IN_INFO[route_seq].npc_name.."<color>: G鉩 ph秈 bi觰 tng v� c玭g hi謓 # l� v� c玭g c� th� h鋍, hi謓 # l� c� th� t╪g c蕄, nh蕄 chu閠 tr竔 v祇 l� 頲.")
		AllowLearnSkill()
	end
end
--===============镇派秘籍相关===========
function book_chg(route_seq)
	if GetPlayerRoute() ~= route_seq then	--流派检测
		Talk(1,"","<color=green>"..TB_ROUTE_IN_INFO[route_seq].npc_name.."<color>: Kh玭g ph秈  t� c馻 ta, M藅 T辌h Tr蕁 Ph竔 n祔 kh玭g th� giao cho ngi!")
		return
	end
	--残卷拥有检测
	for i = 1,getn(TB_ROUTE_IN_INFO[route_seq].book_chip) do
		if GetItemCount(TB_ROUTE_IN_INFO[route_seq].book_chip[i][1],TB_ROUTE_IN_INFO[route_seq].book_chip[i][2], TB_ROUTE_IN_INFO[route_seq].book_chip[i][3]) > 0 then
			Say("<color=green>"..TB_ROUTE_IN_INFO[route_seq].npc_name.."<color>: Th藅 kh玭g ng� th玭g qua th� luy謓 ngi l筰 c� th� nh薾 頲 M藅 T辌h Tr蕁 Ph竔, th藅 x鴑g ng l�   c馻 b鎛 m玭. Ta s� gi髉 ngi ng l筰 th祅h m閠 quy觧 ho祅 ch豱h nh璶g th祅h c玭g hay kh玭g c遪 xem ngi c� may m緉 kh玭g.",
				2,
				"Лa c竎 trang s竎h cho s� ph�/#hand_up("..route_seq..")",
				"Kh玭g c莕 u/no"
				)
			return
		end
	end
	Talk(1,"","<color=green>"..TB_ROUTE_IN_INFO[route_seq].npc_name.."<color>: Ngi ch璦 t鮪g nh薾 頲 M藅 T辌h V� C玭g T祅 Quy觧 n祇.")
end
function hand_up(route_seq)
	Say("<color=green>"..TB_ROUTE_IN_INFO[route_seq].npc_name.."<color>: N誹 nh� ngi c�  3 t藀 thng, trung, h�, ta nh蕋 nh s� ng l筰 th祅h m閠 quy觧 ho祅 ch豱h.",
		2,
		"уng � ng s竎h/#hand_up_dtm("..route_seq..")",
		"Kh玭g c莕 u/no"
	)
end
function hand_up_dtm(route_seq)
	--携带、删除判断
	local s_del_log = "[S� M玭 M藅 T辌h]  ngi ch琲"..GetNpcName()
	local t_del_num = {}
	for i = 1,getn(TB_ROUTE_IN_INFO[route_seq].book_chip) do
		if GetItemCount(TB_ROUTE_IN_INFO[route_seq].book_chip[i][1],TB_ROUTE_IN_INFO[route_seq].book_chip[i][2], TB_ROUTE_IN_INFO[route_seq].book_chip[i][3]) > 0 then
			if DelItem(TB_ROUTE_IN_INFO[route_seq].book_chip[i][1],TB_ROUTE_IN_INFO[route_seq].book_chip[i][2], TB_ROUTE_IN_INFO[route_seq].book_chip[i][3],1) == 1 then
				s_del_log = s_del_log.."H駓 1 quy觧"..TB_ROUTE_IN_INFO[route_seq].book_chip[i][1],TB_ROUTE_IN_INFO[route_seq].book_chip[i][2], TB_ROUTE_IN_INFO[route_seq].book_chip[i][4].." th祅h c玭g "
				tinsert(t_del_num,i)
			end
		end
	end
	-- 啥也没有
	if getn(t_del_num) == 0  then
		Talk(1,"","<color=green>"..TB_ROUTE_IN_INFO[route_seq].npc_name.."<color>: Ngi ch璦 t鮪g nh薾 頲 M藅 T辌h V� C玭g T祅 Quy觧 n祇.")
		return
	end
	--几率判断
	local ran_num = random(100)
	local add_odds = 0
	if getn(t_del_num) == 3 then
		add_odds = 100
	else
		if getn(t_del_num) == 1 then
			tinsert(t_del_num,t_del_num[1])
		end
		add_odds = TB_BOOK_CHG_ODD[t_del_num[1]][t_del_num[2]]
	end
	-- 可以给秘籍
	if (add_odds >= ran_num) then
		local add_flag = AddItem(TB_ROUTE_IN_INFO[route_seq].book[1],TB_ROUTE_IN_INFO[route_seq].book[2],TB_ROUTE_IN_INFO[route_seq].book[3], 1)
		if add_flag == 1 then
			Talk(1,"","<color=green>"..TB_ROUTE_IN_INFO[route_seq].npc_name.."<color>: Ngi th藅 may m緉, M藅 T辌h Tr蕁 Ph竔 S� M玭 xin giao cho ngi!")
			Msg2Player("Nh薾 頲 M藅 T辌h Tr蕁 Ph竔 S� M玭: "..TB_ROUTE_IN_INFO[route_seq].book[4].."1 quy觧!")
		else
			WriteLog(s_del_log.."	Th猰 M藅 T辌h S� M玭 th蕋 b筰, nh d蕌 th蕋 b筰: "..add_flag)
		end
	else
		Talk(1,"","<color=green>"..TB_ROUTE_IN_INFO[route_seq].npc_name.."<color>: фi M藅 T辌h Tr蕁 Ph竔 th蕋 b筰!")
	end;
end
--对话结束
function end_dialog()
end
TB_FACTION_WEAPON_ROUTE = {
	[2] = {3,5},
	[3] = {8},
	[4] = {0},
	[6] = {1},
	[8] = {2},
	[9] = {10},
	[11] = {0},
	[12] = {5},
	[14] = {2},
	[15] = {9},
	[17] = {6},
	[18] = {4},
	[20] = {7},
	[21] = {11},
	[23] = {2},
	[25] = {3},
	[26] = {9},
	[27] = {11},
	[29] = {13},
	[30] = {12},
	--[31] = {14},
	--[32] = {2},
}
--老门派师门第一套增加
function old_route_equip_add(route_seq)
	--判断输入正确性
	if TB_FACTION_WEAPON_ROUTE[route_seq] == nil then
		return 0
	end
	--增加空间负重检测
	if GetFreeItemRoom() <  8 then
		Talk(1,"","<color=green>"..GetTargetNpcName().."<color>: N誹  quy誸 v祇 m玭 ph竔 ta, b鎛 s� s� t苙g ngi m閠 v礽 trang b� t﹏ th� xem nh� l� qu� nh藀 m玭, h穣 s緋 x誴 l筰 h祅h trang r錳 quay l筰 nh薾 (C莕 <color=yellow>8<color> � t骾 tr鑞g!)")
		return 0
	end
	--增加装备
		--师门第一套
	local particular_id = route_seq*100+GetBody()
	if route_seq == 8 or route_seq == 9 then
		particular_id = particular_id - 2
	end
	--头
	AddItem(0,103,particular_id,1,1,-1,-1,-1,-1,-1,-1)
	--衣服
	AddItem(0,100,particular_id,1,1,-1,-1,-1,-1,-1,-1)
	--下装
	AddItem(0,101,particular_id,1,1,-1,-1,-1,-1,-1,-1)
	--武器
	for i = 1,getn(TB_FACTION_WEAPON_ROUTE[route_seq]) do
		AddItem(0,TB_FACTION_WEAPON_ROUTE[route_seq][i],particular_id,1,1,-1,-1,-1,-1,-1,-1)
	end
	return 1
end
--=============师门重复任务相关==========
function ftask_repeat_main(faction_seq)
	Say("<color=green>"..TB_FACTION_MASTER_NAME[faction_seq].."<color>: Tr� gian l� nhi謒 v� c馻 ch輓h ph竔 ch髇g ta, ng l祄 m蕋 thanh danh s� m玭!",
		4,
		"Ta mu鑞 c鑞g hi課 cho s� m玭 (nhi謒 v� s� m玭)/#start_faction("..faction_seq..")",
		"Ta mu鑞 tra xem  c鑞g hi課./#check_query("..faction_seq..")",
		"Ta mu鑞 t譵 hi觰  c鑞g hi課 s� m玭./shimenshuoming",
		"   /#repair_faction("..faction_seq..")",
		"R阨 kh醝/end_dialog"
		)
end
function start_faction(faction_seq)
	if (GetPlayerFaction() ~= faction_seq and isNewRoute(GetPlayerRoute) ~= nil) then
		Talk(1,"","<color=green>"..TB_FACTION_MASTER_NAME[faction_seq].."<color>: Ch� c�"..TB_FACTION_INFO[faction_seq].." t� ta m韎 頲 c鑞g hi課 b鎛 m玭!")
		return
	elseif (GetPlayerRoute() == TB_FACTION_ROUTE[faction_seq]) then
		Talk(1,"","<color=green>"..TB_FACTION_MASTER_NAME[faction_seq].."<color>: H穣 b竔 s� h鋍 ngh� trc, r錳 h穣 g鉷 s鴆 cho s� m玭!")
		return
	else
		task_main_entrance(TB_FACTION_TASK_DIFF[GetPlayerRoute()])
	end
end
function check_query(faction_seq)
	if (GetPlayerFaction() == 0) then	-- 没有加入门派
		Talk(1,"","<color=green>"..TB_FACTION_MASTER_NAME[faction_seq].."<color>: Mu鑞 c鑞g hi課 cho b鎛 m玭 th� ph秈 gia nh藀 b鎛 m玭 trc. Gia nh藀 ph竔 b蕋 k� c� th� t韎 y nh薾 nhi謒 v�. Ho祅 th祅h nhi謒 v� s� m玭 s� nh薾 頲 甶觤 s� m玭, t輈h l騳  mua v藅 ph萴 b� truy襫 c馻 b鎛 m玭.")
		return
	end

	if (GetPlayerFaction() ~= faction_seq) then
		Talk(1,"","<color=green>"..TB_FACTION_MASTER_NAME[faction_seq].."<color>: Kh玭g ph秈  t� b鎛 m玭, h穣 t韎 m玭 ph竔 c馻 m譶h xem 甶觤 s� m玭. F3 m� giao di謓 xem 甶觤 s� m玭.")
		return
	end
	query_faction_contribute()
end
function shimenshuoming()
	Talk(1,"shuoming2","<color=green>Thuy誸 minh  c鑞g hi課 s� m玭<color>: \n <color=yellow>ч c鑞g hi課 s� m玭<color>: Th玭g qua vi謈 ho祅 th祅h nhi謒 v� S� M玭 t n m閠 ng c蕄 nh蕋 nh, b筺 c� th� nh薾 頲 trang ph鬰 ho芻 v� kh� c馻 S� M玭. \n <color=yellow>Gi韎 h筺  c鑞g hi課 s� m玭<color>: Hi謓 nay  c鑞g hi課 S� M玭 kh玭g b� h筺 ch�, ch� c莕 ho祅 th祅h nhi謒 v� th� c� th� n﹏g cao  c鑞g hi課. \n <color=yellow>S� ki謓 V� L﹎<color>: L祄 xong nhi謒 v� c� nh s� nh薾 th猰 m閠 nhi謒 v� ng蓇 nhi猲, ho祅 th祅h s� nh薾 頲 50 甶觤 c鑞g hi課 S� m玭 v� c� kh� n╪g nh薾 頲 m藅 t辌h s� m玭.")
end
function shuoming2()
	Talk(1,"","<color=green>Thuy誸 minh  c鑞g hi課 s� m玭<color>: \n <color=yellow>Gi韎 h筺 ng c蕄  c鑞g hi課 S� M玭<color>: Ъng c蕄 kh竎 nhau th� 甶觤 t輈h l騳  c鑞g hi課 c騨g kh玭g gi鑞g nhau. ч c鑞g hi課 S� M玭 c祅g cao c祅g n﹏g cao ng c蕄 c馻 m譶h, t� sau c蕄 75 th� kh玭g c遪 gi韎 h筺  c鑞g hi課 n鱝. \n <color=yellow>觤 kinh nghi謒 ng蓇 nhi猲<color>. L祄 nhi襲 nhi謒 v� s� m玭  c鑞g hi課 c祅g cao 甶觤 kinh nghi謒 c祅g nhi襲. 觤 c鑞g hi課 <3000 <color=yellow>觤 kinh nghi謒 tng i<color>, >3000 <color=yellow>甶觤 kinh nghi謒 c祅g nhi襲<color>.")
end
-- 修复杀怪任务无法完成的bug
function repair_faction(faction_seq)
	Say("<color=green>"..TB_FACTION_MASTER_NAME[faction_seq].."<color>: Do b薾 r閚 c玭g v� n猲 qu猲 chuy謓 ngi l祄 nhi謒 v�. Зy c騨g l�  ngi r蘮 luy謓! Gi� ta s� gi髉 ngi h駓 nhi謒 v� trc, nh璶g ph秈 tr� 5 甶觤 s� m玭, ng � kh玭g?",
		2,
		"Л頲, ta ng �/#cfm_repair_bug("..faction_seq..")",
		"в ta ngh� c竎h kh竎/no")
end;

function cfm_repair_bug(faction_seq)
	RepairAllChainTask()
	Talk(1,"","<color=green>"..TB_FACTION_MASTER_NAME[faction_seq].."<color>: Л頲, ta  h駓 gi髉 ngi r錳!")
end;
--==============闭关修炼=================
cards_table = {
    {2, 0, 205},
    {2, 0, 206},
    {2, 0, 207},
    {2, 0, 208},
    {2, 0, 209},
    {2, 0, 350},
    {2, 0, 390},
    {2, 0, 787},
    {2, 0, 788},
    {2, 0, 789},
}
function practice_main(faction_seq)
		if GetPlayerFaction() == 0 then return 0; end
    if GetPlayerFaction() ~= faction_seq then
       Talk(1, "", "<color=green>"..TB_FACTION_MASTER_NAME[faction_seq].."<color>: Th� ch� kh玭g ph秈"..TB_FACTION_INFO[faction_seq].." t� c馻 ta, kh玭g th� tu luy謓 � b鎛 ph竔.");
    else
        if GetItemCount(cards_table[faction_seq][1],cards_table[faction_seq][2],cards_table[faction_seq][3]) >= 1 then  --师门令牌
            Say("<color=green>"..TB_FACTION_MASTER_NAME[faction_seq].."<color>: V祇 tu luy謓 kh玭g?",
            	2,
            	"ng/practice_start",
            	"Sai/no_practice");
        else
            Talk(1, "", "<color=green>"..TB_FACTION_MASTER_NAME[faction_seq].."<color>: Ngi kh玭g c�<color=yellow>"..TB_FACTION_INFO[faction_seq].."L謓h B礽 S� M玭<color>, kh玭g th� b� quan tu luy謓.");
        end;
    end;
end
--=============师门密室NPC对话==========
function backdoor_main(faction_seq)

end
--=============师门售卖=================
function sale_main(faction_seq)
	local player_sex_name = "Чi hi謕"
	if GetSex() == 2 then
		player_sex_name = "N� hi謕 "
	end
	if GetPlayerFaction() == faction_seq  then
		Say("<color=green>"..TB_FACTION_SALE_NPC[faction_seq].."<color>: <color=yellow>"..player_sex_name.."<color>, c� th� gi髉 頲 g� cho ngi?",
		4,
		"Ta mu鑞 mua m閠 s� v藅 d鬾g./#Sale("..TB_FACTION_SALE[faction_seq][1]..")",
		"Ta nghe n鉯 s� m玭 c� 1 th莕 binh b秓 gi竝 th輈h h頿 v韎 giang h� t﹏ th�? Ta mu鑞 xem xem nh� th� n祇./#Sale("..TB_FACTION_SALE[faction_seq][2]..")",
		"Ta nghe n鉯 s� m玭 c� 1 b� th莕 binh b秓 gi竝 gi祅h cho v� l﹎ cao th�? H穣 cho ta xem!/#Sale("..TB_FACTION_SALE[faction_seq][3]..")",
		"Ta ch� ti謓 阯g gh� ngang/end_dialog"
		)
	else
		Say("<color=green>"..TB_FACTION_SALE_NPC[faction_seq].."<color>: C� th� gi髉 頲 g� cho ngi?",
		2,
		"Ta mu鑞 mua m閠 s� v藅 d鬾g./#Sale("..TB_FACTION_SALE[faction_seq][1]..")",
		"Ta ch� ti謓 阯g gh� ngang/end_dialog"
		)
	end
end
--==============师门传送==================
function transport_main(faction_seq)
	Say(TB_TRANSPORT_INFO[faction_seq][1],
		2,
		"H穣 ti詎 ta m閠 畂筺/#trans_2_city("..faction_seq..")",
		"Ta mu鑞 ng緈 c秐h/end_dialog"
	)
end
--传送走
function trans_2_city(faction_seq)
	if(GetPKValue() >3 ) then
		Msg2Player("Ngi l祄 vi謈 竎 c蕀 ra v祇 th玭 tr蕁.")
	end
    SetFightState(0)
	local n_ran_att = random(getn(TB_TRANSPORT_INFO[faction_seq][2]))
	NewWorld(TB_TRANSPORT_INFO[faction_seq][2][n_ran_att][1],TB_TRANSPORT_INFO[faction_seq][2][n_ran_att][2],TB_TRANSPORT_INFO[faction_seq][2][n_ran_att][3])
end

function showlimit(n)	--师门说话
--	if n==1 then
--		Say(NPC_NAME.."你的武功精进了！",0)
	if n==2 then
		Say(NPC_NAME.."C蕄 kh玭g   h鋍 v� c玭g m韎, h穣 th╪g c蕄 trc?",0)
	elseif n==3 then
		Say(NPC_NAME.."Kinh nghi謒 kh玭g  h鋍 v� c玭g m韎, h穣 luy謓 t藀 trc?",0)
	elseif n==4 then
		Say(NPC_NAME.."觤 s� m玭 kh玭g   h鋍 v� c玭g m韎, h穣 l祄 nhi謒 v�  t輈h l騳!",0)
	elseif n==5 then
		Say(NPC_NAME.."V� c玭g trc v蒼 ch璦 h鋍 xong, kh玭g th� h鋍 v� c玭g m韎!",0)
	elseif n==6 then
		Say(NPC_NAME.."Ng﹏ lng c馻 ngi kh玭g , t譵  r錳 h穣 quay l筰 nh�!",0)
	else
	end
end;
function beforelearnskill(id)
end

function afterlearnskill(id)
	if id == 1032 or id == 1196 or id == 1066 or id == 1230 or id == 1213 or id == 1096 or id == 1883 or id == 1897 then
		if GetSkillLevel(id) == 1 then
			SetMomentum(10)
			RandomTaskTipEx("Nh薾 頲 10 甶觤 s竧 kh� s� ph� truy襫 cho", "momentumtip")
		end
	end
end

function give_yangdiao_book()
	if BigGetItemCount(2,100,33) >= 1 then
		Talk(1,"","<color=green>H� Man Th祅h<color>: Ngi  c� 1 cu鑞 trong rng r錳 th� ph秈?");
		return 0;
	end
	if GetFreeItemRoom() < 1 then
		Talk(1,"","<color=green>H� Man Th祅h<color>: H穣 s緋 x誴 l筰 � t骾.");
		return 0;
	end
	AddItem(2,100,33,1);
	Talk(1,"","<color=green>H� Man Th祅h<color>: Зy l� <Dng 猽 Ch� Nam>, h穣 gi� k�");
end
