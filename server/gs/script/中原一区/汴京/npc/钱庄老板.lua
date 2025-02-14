
-- ====================== 文件信息 ======================

-- 剑侠情缘onlineII 钱庄老板脚本
-- Edited by peres
-- 2005/02/22 PM 18:03

-- ======================================================
GOLD_COIN_2_TIME =
{
	-- 天数,	花费
	{ 	7,	200 },
	{ 	28, 	600 },
};
SECONDS_ONE_DAY = 24 * 3600;

best = 0;
if GOLD_COIN_2_TIME[1][1]/GOLD_COIN_2_TIME[1][2] < GOLD_COIN_2_TIME[2][1]/GOLD_COIN_2_TIME[2][2] then
	best = 2;
else
	best = 1;
end

function main()
	Say("L穙 c� th� gi髉 g� cho qu� kh竎h y??", 2,
--		"我想使用金币充游戏时间！/select_charge_style",
		"Ta mu鑞 s� d鬾g Kim t�  n筽 th阨 gian ch琲 game/select_charge_style",
		"Ta nh﹏ ti謓 gh� th╩ 玭g th玦 m�!/nothing" )
	return
end

function nothing()
end

function select_charge_style()
	local nGoldCoin = GetGoldCoin();
	if nGoldCoin <= 0 then
		Say("H譶h nh� qu� kh竎h kh玭g mang theo ti襫 xu!!", 0);
		return
	end
	Say("Qu� kh竎h c� th�: 1. D飊g 200 Xu i 7 ng祔 ch琲. 2. D飊g 600 Xu i 28 ng祔 ch琲." ,
		4,
		"Ta mu鑞 d飊g 200 Xu i 7 ng祔 ch琲/#start_charge(1)",
		"Ta mu鑞 d飊g 600 Xu i 28 ng祔 ch琲/#start_charge(2)",
--		"我想自己输入要使用的金币数量/customize_charge_input",
		"Ta mu鑞 nh藀 s� lng xu c� th�/customize_charge_input",
		"T筸 th阨 ch璦 c莕!/nothing" );
end

function start_charge(n)
	if n < 1 or n > getn(GOLD_COIN_2_TIME) then
		return
	end
	local nGoldCoin = GetGoldCoin();
	if nGoldCoin >= GOLD_COIN_2_TIME[n][2] then
		Say( "B筺 ng � d飊g"..GOLD_COIN_2_TIME[n][2].." Xu i "..GOLD_COIN_2_TIME[n][1].." ng祔 ch琲 ch�?!?",
			2,
			"ng r錳!/#finish_charge("..n..")",
			"Th玦! Kh玭g i n鱝!/nothing" );
	else
		Say( "Xin l鏸! Kh竎h quan kh玭g  xu!", 0);
	end
end

function finish_charge(n)
	print(n, type(n))
	if n < 1 or n > getn(GOLD_COIN_2_TIME) then
		return
	end
	local nGoldCoin = GetGoldCoin();
	if nGoldCoin >= GOLD_COIN_2_TIME[n][2] then
		ChargeTimeUseCoin( GOLD_COIN_2_TIME[n][2], GOLD_COIN_2_TIME[n][1] * SECONDS_ONE_DAY);
		WriteLog("[CoinExchange]\t"..GetAccount().."\t"..GetName().."\td飊g"..GOLD_COIN_2_TIME[n][2].." Xu i "..GOLD_COIN_2_TIME[n][1].." ng祔 ch琲.")		
	else
		Say( "Xin l鏸! Kh竎h quan kh玭g  xu!", 0);
	end
end

function customize_charge_input()
	AskClientForNumber("customize_charge_start", 1, GetGoldCoin(), "Xin nh藀 s� Xu c莕 i!");
end

function customize_charge_start(num)
	if num == nil then
		return
	end
	if num <= 0 or num > GetGoldCoin() then
		Say( "Nh藀 s� b� l鏸!", 0);
		return
	end

	local n1 = floor( num / GOLD_COIN_2_TIME[best][2] );
	local m = mod( num, GOLD_COIN_2_TIME[best][2] );
	local n2 = floor( m / GOLD_COIN_2_TIME[3-best][2] );

	Say( "Qu� kh竎h v鮝 nh藀 "..num.." Xu. Theo l穙 t輓h, c� th� s� d鬾g "..n1.."  "..GOLD_COIN_2_TIME[best][2].." ng祔 v� "..n2.."  "..GOLD_COIN_2_TIME[3-best][1].." ng祔. Nh� v藋 kh玭g c� v蕁  g� ch�?",
		2,
		format("ng r錳! C� nh� v藋 甶!/#customize_charge_finish(%d,%d)", n1, n2),
		"Khoan ! Ta suy ngh� ch髏!/nothing" );
end

function customize_charge_finish(n1, n2)
	if n1 == nil then
		n1 = 0;
	end
	if n2 == nil then
		n2 = 0;
	end
	if n1 < 0 or  n2 < 0 then
		return
	end
	if n1 == 0 and n2 == 0 then
		return
	end
	if n1 * GOLD_COIN_2_TIME[best][2] + n2 * GOLD_COIN_2_TIME[3-best][2] > GetGoldCoin() then
		return
	end
	local d1 = n1 * GOLD_COIN_2_TIME[best][1];
	local d2 = n2 * GOLD_COIN_2_TIME[3-best][1];
	if n1 > 0 then
		ChargeTimeUseCoin( n1 * GOLD_COIN_2_TIME[best][2], d1 * SECONDS_ONE_DAY );
	end
	if n2 > 0 then
		ChargeTimeUseCoin( n2 * GOLD_COIN_2_TIME[3-best][2], d2 * SECONDS_ONE_DAY );
	end
end

