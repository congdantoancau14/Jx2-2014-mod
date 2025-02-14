--File name:	fruit_item.lua
--Describe:		水果宴会活动道具脚本
--Item ID:		2,1,30008	--	水果包
--				2,1,30009	--	葡萄
--				2,1,30010	--	番荔枝
--				2,1,30011	--	山竹
--				2,1,30012	--	牛奶果
--				2,1,30013	--	榴莲
--Create Date:	2008-06-23
--Author:		chenbenqian


DATE_FRUIT_ITEM_VIET_END		= 2048080100;		-- 水果宴会活动道具使用结束日期

g_tFruitItemList = 
{
	--		"名称",	G1,G2,G3,经验,概率
	[1] = {"T骾 tr竔 c﹜",2,1,30008},				--设定该项的索引必须为1
	[2] = {"Nho",	2,1,30009,8,	60},
	[3] = {"M穘g c莡",2,1,30010,80,	20},
	[4] = {"M╪g c魌",	2,1,30011,800,	14},
	[5] = {"V� s鱝",2,1,30012,8000,	4},
	[6] = {"S莡 ri猲g",	2,1,30013,80000,2},		--设定该项的索引必须为6
}

g_tPrizeItemList =
{
	--		"名称",		G1,	G2,		G3,	概率
	[1] = {"Chi猰 Y Ph�",	0,	107,	66,	10},
	[2] = {"Thi猲 H� M藅 t辌h",	0,	107,	64,	40},
	[3] = {"T� H� M藅 t辌h",	0,	107,	65,	20},
	[4] = {"B� Kim M藅 t辌h",	0,	107,	61,	500},
	[5] = {"B� Th筩h M藅 t辌h",	0,	107,	62,	500},
	[6] = {"Ng� Qu� M藅 t辌h",	0,	107,	63,	500},
	[7] = {"M秐h Thi猲 th筩h",	2,	2,		7,	500},
	[8] = {"Thi猲 th筩h",		2,	2,		8,	2000},
	[9] = {"M秐h B╪g th筩h",	2,	1,		148,	8000},
	[10] = {"B╪g th筩h",		2,	1,		149,	2500},
	[11] = {"C﹜ B竧 Nh�",	2,	0,		398,	3000},
	[12] = {"C﹜ B竧 Nh� nh�",2,	0,		504,	5000},
	[13] = {"L� th駓",		2,	0,		351,	10000},
}

function OnUse(nItemIdx)
	local nDate = tonumber(date("%Y%m%d%H"));
	if nDate >= DATE_FRUIT_ITEM_VIET_END then
		return
	end
	local nType = get_type(nItemIdx);
	if nType == 0 then
		Talk(1,"","V藅 ph萴 b筺 產ng s� d鬾g kh玭g ng y猽 c莡!");
		return 0;
	end;
	if nType ~= 1 and nType ~= 6 then
		if GetTask(2441) >= 25000000 then
			Msg2Player("觤 kinh nghi謒 nh薾 頲 do tham gia ho箃 ng L� h閕 tr竔 c﹜  t gi韎 h筺 25.000.000, b筺 kh玭g th� ti誴 t鬰 s� d鬾g v藅 ph萴.");
			Talk(1,"","觤 kinh nghi謒 nh薾 頲 do tham gia ho箃 ng L� h閕 tr竔 c﹜  t gi韎 h筺 25.000.000, b筺 kh玭g th� ti誴 t鬰 s� d鬾g v藅 ph萴.");
			return
		end
	end
	if DelItemByIndex(nItemIdx,1) == 1 then
		use(nType);
	end;
end;

function get_type(nItemIdx)
	local genre = GetItemGenre(nItemIdx)
	local detail = GetItemDetail(nItemIdx)
	local particular = GetItemParticular(nItemIdx);
	for i=1,getn(g_tFruitItemList) do
		if genre == g_tFruitItemList[i][2] and detail == g_tFruitItemList[i][3] and particular == g_tFruitItemList[i][4] then
			return i;
		end;
	end;
	return 0;
end;

function use(nType)
	if nType == 1 then
		local nRandom = random(1,100);
		local nBase = 0;
		for i=2, getn(g_tFruitItemList) do
			nBase = nBase + g_tFruitItemList[i][6];
			if nRandom <= nBase then
				add_item_ex(g_tFruitItemList[i]);
				return
			end;
		end;
	else
		local szLogTitle = "L� h閕 tr竔 c﹜ : "..g_tFruitItemList[nType][1];
		local nExp = g_tFruitItemList[nType][5];
		local nExpTotal = GetTask(2441);
		if nExpTotal >= 25000000 then
			Msg2Player("觤 kinh nghi謒 nh薾 頲 do tham gia ho箃 ng L� h閕 tr竔 c﹜  t gi韎 h筺 25.000.000, s� d鬾g S莡 ri猲g s� kh玭g nh薾 頲 甶觤 kinh nghi謒, nh璶g v蒼 c� c� h閕 nh薾 頲 ph莕 thng kh竎.");
			--Talk(1,"","觤 kinh nghi謒 nh薾 頲 do tham gia ho箃 ng L� h閕 tr竔 c﹜  t gi韎 h筺 25.000.000, s� d鬾g S莡 ri猲g s� kh玭g nh薾 頲 甶觤 kinh nghi謒, nh璶g v蒼 c� c� h閕 nh薾 頲 ph莕 thng kh竎.");
			nExp = 0;
		elseif nExpTotal + g_tFruitItemList[nType][5] > 25000000 then
			nExp = 25000000 - nExpTotal;
		end

		if nExp ~= 0 then
			ModifyExp(nExp);
			SetTask( 2441, (nExpTotal+nExp) )
			Msg2Player("B筺 nh薾 頲  "..nExp.."  甶觤 kinh nghi謒");
			WriteLog("["..szLogTitle.."]: [Account: "..GetAccount().."][Role Name:"..GetName().."] Obtain "..nExp.."  甶觤 kinh nghi謒");
		end

		if nType == 6 then
			local nRandom = random(1,100000);
			local nBase = 0;
			for i=1, getn(g_tPrizeItemList) do
				nBase = nBase + g_tPrizeItemList[i][5];
				if nRandom <= nBase then
					add_item_ex2(g_tPrizeItemList[i]);
					return
				end;
			end;
		end;
	end;
end;

function add_item_ex(tItem)
	local szLogTitle = "L� h閕 tr竔 c﹜ : ".."T骾 tr竔 c﹜";		--此处分为2段只是为了不增加新的翻译
	local nRetCode = 0;
	nRetCode = AddItem(tItem[2],tItem[3],tItem[4],1);
	if nRetCode == 1 then
		Msg2Player("B筺 nh薾 頲 1  "..tItem[1]);
		WriteLog("["..szLogTitle.."]: [Account: "..GetAccount().."][Role Name:"..GetName().."] Obtain 1 "..tItem[1]);
	else
		WriteLog("["..szLogTitle.."]: [Account: "..GetAccount().."][Role Name:"..GetName().."] Obtain 1 "..tItem[1].." Failed, return value = "..nRetCode);
	end
end

function add_item_ex2(tItem)
	local szLogTitle = "L� h閕 tr竔 c﹜ : ".."V藅 ph萴 t� S莡 ri猲g";		--此处分为2段只是为了不增加新的翻译
	local nRetCode = 0;
	nRetCode = AddItem(tItem[2],tItem[3],tItem[4],1);
	if nRetCode == 1 then
		Msg2Player("B筺 nh薾 頲 1  "..tItem[1]);
		WriteLog("["..szLogTitle.."]: [Account: "..GetAccount().."][Role Name:"..GetName().."] Obtain 1 "..tItem[1]);
	else
		WriteLog("["..szLogTitle.."]: [Account: "..GetAccount().."][Role Name:"..GetName().."] Obtain 1 "..tItem[1].." Failed, return value = "..nRetCode);
	end
end
