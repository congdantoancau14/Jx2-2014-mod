--File name:	jixiangxiaobao.lua
--Describe:		吉祥小包脚本
--Item ID:		2,1,30014
--Create Date:	2008-06-23
--Author:		chenbenqian


DATE_FRUIT_ITEM_VIET_END		= 2048072800;		-- 吉祥小包使用结束日期
g_LogTitle = "Ti觰 c竧 tng";


g_tPrizeItemList =
{
	--		"名称",		G1,	G2,		G3,	概率
	[1] = {"Chi猰 Y Ph�",	0,	107,	66,	30	},
	[2] = {"Thi猲 H� M藅 t辌h",	0,	107,	64,	60	},
	[3] = {"T� H� M藅 t辌h",	0,	107,	65,	50	},
	[4] = {"B� Kim M藅 t辌h",	0,	107,	61,	600	},
	[5] = {"B� Th筩h M藅 t辌h",	0,	107,	62,	600	},
	[6] = {"Ng� Qu� M藅 t辌h",	0,	107,	63,	600	},
	[7] = {"M秐h Thi猲 th筩h",	2,	2,	7,	600	},
	[8] = {"Thi猲 th筩h",		2,	2,	8,	5000	},
	[9] = {"B╪g th筩h",		2,	1,	149,	3000	},
	[10] = {"M秐h B╪g th筩h",	2,	1,	148,	5000	},
	[11] = {"C﹜ B竧 Nh�",	2,	0,	398,	5000	},
	[12] = {"C﹜ B竧 Nh� nh�",	2,	0,	504,	5000	},
	[13] = {"L� th駓",		2,	0,	351,	50000	},
	[14] = {"B竧 B秓 T葃 T駓 n",	2,	0,	138,	3	},
	[15] = {"C竧 tng th筩h",	2,	1,	30015,	2000	},
}


function OnUse(nItemIdx)
	local nDate = tonumber(date("%Y%m%d%H"));
	if nDate >= DATE_FRUIT_ITEM_VIET_END then
		return
	end

	if DelItemByIndex(nItemIdx,1) == 1 then
		use();
	end;
end;

function use()
	local nExp = 50000;
	local nExpTotal = GetTask(2442);
	if nExpTotal >= 15000000 then
		Msg2Player("觤 kinh nghi謒 nh薾 頲 do m� Ti觰 c竧 tng  t gi韎 h筺 15.000.000 甶觤 kinh nghi謒, v� th� s� kh玭g nh薾 頲 甶觤 kinh nghi謒 n鱝, tuy nhi猲 v蒼 c� th� nh薾 頲 ph莕 thng kh竎.");
		--Talk(1,"","觤 kinh nghi謒 nh薾 頲 do m� Ti觰 c竧 tng  t gi韎 h筺 15.000.000 甶觤 kinh nghi謒, v� th� s� kh玭g nh薾 頲 甶觤 kinh nghi謒 n鱝, tuy nhi猲 v蒼 c� th� nh薾 頲 ph莕 thng kh竎.");
		nExp = 0;
	elseif nExpTotal + 50000 > 15000000 then
		nExp = 15000000 - nExpTotal;
	end

	if nExp ~= 0 then
		ModifyExp(nExp);
		SetTask( 2442, (nExpTotal+nExp) )
		Msg2Player("B筺 nh薾 頲  "..nExp.."  甶觤 kinh nghi謒");
		WriteLog("["..g_LogTitle.."]: [Account: "..GetAccount().."][Role Name:"..GetName().."] Obtain "..nExp.."  甶觤 kinh nghi謒");
	end

	local nRandom = random(1,1000000);
	local nBase = 0;
	for i=1, getn(g_tPrizeItemList) do
		nBase = nBase + g_tPrizeItemList[i][5];
		if nRandom <= nBase then
			add_item_ex(g_tPrizeItemList[i]);
			return
		end;
	end;
end;


function add_item_ex(tItem)
	local nRetCode = 0;
	local nItemIdx = 0;
	nRetCode, nItemIdx = AddItem(tItem[2],tItem[3],tItem[4],1);
	if nRetCode == 1 then
		if tItem[1] == "B竧 B秓 T葃 T駓 n" then
			SetItemExpireTime(nItemIdx,30*24*3600)	
		end
		Msg2Player("B筺 nh薾 頲 1  "..tItem[1]);
		WriteLog("["..g_LogTitle.."]: [Account: "..GetAccount().."][Role Name:"..GetName().."] Obtain 1 "..tItem[1]);
	else
		WriteLog("["..g_LogTitle.."]: [Account: "..GetAccount().."][Role Name:"..GetName().."] Obtain 1 "..tItem[1].." Failed, return value = "..nRetCode);
	end
end

