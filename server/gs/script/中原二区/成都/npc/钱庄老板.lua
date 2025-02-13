
-- ====================== 文件信息 ======================

-- 剑侠情缘onlineII 钱庄老板脚本
-- Edited by peres
-- 2005/02/22 PM 18:03

-- ======================================================

Include("\\script\\task\\teach\\maintask.lua");
szNpcName = "<color=green>Ch� Ti襫 Trang: <color>";

tbExchange = {
	{"T� Kim h錸g bao",{2,1,537},1,360},
	{"Ho祅g Kim h錸g bao",{2,1,539},1,999},
	{"B筩h Kim h錸g bao",{2,1,30229},1,4000},
	{"B祅 Long B輈h",{2,1,1000},1,35},
	{"H遖 Th� B輈h",{2,1,1001},1,2000},
	{"Чi Ng﹏ Phi誹",{2,1,199},2,100},
	{"Ho祅g Kim i ng﹏ phi誹",{2,1,30490},2,1000},
}

tbCoins = {
	[1] = {"v祅g"},
	[2] = {"xu",{2,1,30230}},
}

DISCOUNT_RATE = {"0.5%",0.005}

function main()

	local nState = TE_GetTeachState()
	local nLevel = GetLevel()
	
	if (nState==19) then
	
		Teach_Level07_02()
		
	else
		
		-- Talk(1,"",szNpcName.."M蕐 n╩ nay Th祅h Й bu玭 b竛 � 萴, Ti襫 Trang  ng c鯽, xin h穣 n Bi謓 Kinh  nh薾.");
		local tbSay = {}
		local t = tbExchange;
		for i=1,getn(t) do 
			tinsert(tbSay,format("Ta mu鑞 i <%s> l蕐 <%s> (t� gi� 1\/%d)/#exchange_money(%d,%d)",t[i][1],tbCoins[t[i][3]][1],t[i][4],i,t[i][3]));
		end
		
		local i = 3;
		tinsert(tbSay,format("Ta mu鑞 quy i <%s> ra <%s> (t� gi� %d\/1)/#charge_money(%d,%d)",tbCoins[t[i][3]][1],t[i][1],t[i][4],i,t[i][3]));
	
		tinsert(tbSay,"R阨 Kh醝/nothing")
		Say(szNpcName.."Ph� quy i thu薾 v� ngh辌h u l� <color=gold>"..DISCOUNT_RATE[1].."<color>",getn(tbSay),tbSay)
	end
	
	return

end

nIndex = 0;
nType = 0;

function charge_money(index,type)
	local i = index;
	local t = tbExchange;
	local nCash = GetCash();
	local nRate = t[i][4]*10000;
	local nItem = floor(nCash/nRate);
	local nTotal = nItem*nRate;
	local nDiscount = nTotal*DISCOUNT_RATE[2];
	local nAfterDiscount = nCash - nTotal;
	while nAfterDiscount < nDiscount do
		nItem = nItem - 1;
		nTotal = nItem*nRate;
		nDiscount = nTotal*DISCOUNT_RATE[2];
		nAfterDiscount = nCash - nTotal;
	end
	-- print("nItem",nItem);
	if nItem < 1 then 
		Talk(1,"","S� ti襫 qu� nh�. Kh玭g th� quy i ra v藅 ph萴!");
		return 0;
	end
	
	local nPay = Pay(nTotal);
	local nAdd = AddItem(t[i][2][1],t[i][2][2],t[i][2][3],nItem);
	
	if nPay == 1 and nAdd == 1 then 
		Msg2Player("Giao d辌h th祅h c玭g!")
		Msg2Player(format("Nh薾 頲 %s x%d.",t[i][1],nItem))
		nTotal = nItem*nRate;
		nDiscount = nTotal*DISCOUNT_RATE[2];
		Pay(nDiscount);
		Msg2Player("Chi誸 kh蕌 ph� giao d辌h "..DISCOUNT_RATE[1]..format(" c馻 %d = %d.",nTotal,nDiscount))
	else
		Msg2Player("Giao d辌h th蕋 b筰!")
	end
	
	
end;

function exchange_money(index,type)
	nIndex = index;
	nType = type;
	local nMax = GetItemCount(tbExchange[index][2][1],tbExchange[index][2][2],tbExchange[index][2][3])
	if nMax == 1 then 
		_request_number_callback(1);
	else
		AskClientForNumber("_request_number_callback",1,nMax,"Nh藀 s� lng");
	end
end;

function _request_number_callback(number)
	if number < 1 then 
		Msg2Player("Х h駓 b� giao d辌h!")
		return 0;
	end
	
	local t = tbExchange;
	local i = nIndex;
	local nDel = DelItem(t[i][2][1],t[i][2][2],t[i][2][3],number)
	if nDel ~= 1 then 
		Talk(1,"","Kh玭g  s� lng! H駓 b� giao d辌h!")
		return 0;
	end
	local nResult = 0;
	local nTotal = 0;
	if nType == 1 then 
		local rate = t[i][4] * 10000;
		nTotal = number*rate;
		Earn(nTotal);
		nResult = 1;
	elseif nType == 2 then
		local rate = t[i][4];
		local coin = tbCoins[nType][2];
		nTotal = number*rate;
		nResult = AddItem(coin[1],coin[2],coin[3],nTotal);
	end
	
	if nResult == 1 then 
		Msg2Player("Giao d辌h th祅h c玭g!")
		local nDiscount = nTotal*DISCOUNT_RATE[2];
		Pay(nDiscount);
		Msg2Player("Chi誸 kh蕌 ph� giao d辌h "..DISCOUNT_RATE[1]..format(" c馻 %d = %d.",nTotal,nDiscount))
	else
		Msg2Player("Giao d辌h th蕋 b筰!")
	end
end;
