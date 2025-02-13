--2008年五一活动头文件
--by vivi
--2008/04/10

--任务变量
--注意：修改麻将变量记得修改add_mahjong_prob函数
TASK_MJ_TONG1 = 861; --存放麻将1筒的个数，以下类推。
TASK_MJ_TONG2 = 862;
TASK_MJ_TONG3 = 863;
TASK_MJ_TONG4 = 864;
TASK_MJ_TONG5 = 865;
TASK_MJ_TONG6 = 866;
TASK_MJ_TONG7 = 867;
TASK_MJ_TONG8 = 868;
TASK_MJ_TONG9 = 869;
TASK_MJ_TIAO1 = 870; --存放麻将1条的个数，以下类推。
TASK_MJ_TIAO2 = 871;
TASK_MJ_TIAO3 = 872;
TASK_MJ_TIAO4 = 873;
TASK_MJ_TIAO5 = 874;
TASK_MJ_TIAO6 = 875;
TASK_MJ_TIAO7 = 876;
TASK_MJ_TIAO8 = 877;
TASK_MJ_TIAO9 = 878;
TASK_MJ_WAN1 = 879; --存放麻将1万的个数，以下类推。
TASK_MJ_WAN2 = 880;
TASK_MJ_WAN3 = 881;
TASK_MJ_WAN4 = 882;
TASK_MJ_WAN5 = 883;
TASK_MJ_WAN6 = 884;
TASK_MJ_WAN7 = 885;
TASK_MJ_WAN8 = 886;
TASK_MJ_WAN9 = 887;
TASK_MJ_DONG = 888; --存放麻将东风的个数。
TASK_MJ_NAN = 889; --存放麻将南风的个数。
TASK_MJ_XI = 890; --存放麻将西风的个数。
TASK_MJ_BEI = 891; --存放麻将北风的个数。
TASK_MJ_ZHONG = 892; --存放麻将红中的个数。
TASK_MJ_FA = 893; --存放麻将发财的个数。
TASK_MJ_BAI =894; ----存放麻将白板的个数。
TASK_MJ_SINGLE_PRIZE = 895;--领取单张奖励的次数
TASK_MJ_PIHU_RPIZE = 896; --屁胡兑换奖励次数
TASK_MJ_TONG_RPIZE = 897; --清一色筒的兑换次数
TASK_MJ_TIAO_RPIZE = 898; --清一色条的兑换次数
TASK_MJ_WAN_RPIZE = 899; --清一色万的兑换次数
TASK_MJ_SIXI_RPIZE = 900; --大四喜兑换次数
TASK_MJ_BIWU_NUM = 901; --每日比武大会获得麻将数
TASK_MJ_TX_DATE = 902; --每日只有一次可以获得麻将
TASK_MJ_BIWU_DATE = 903;--是否领取了比武大会当日的15本
TASK_MS_BJ_NUM = 904; --挂白驹获取麻将的数量

--临时变量
TASK_TEMP_MJ_KIND = 126

--全局变量
PIHU_TOTAl_NUM = 42; --屁胡兑换次数限制
TONG_TOTAL_NUM = 21;
TIAO_TOTAL_NUM = 14;
WAN_TOTAL_NUM = 7;
SIXI_TOTAL_NUM = 2;
BAIJU_TOTAL_NUM = 120; --挂白驹最多可获得麻将数量

--table
tMahJong = {--麻将名 id
	{"Nh蕋 ng",2,0,630},	
	{"Nh� ng",2,0,631},	
	{"Tam ng",2,0,632},	
	{"T� ng",2,0,633},	
	{"Ng� ng",2,0,634},	
	{"L鬰 ng",2,0,635},	
	{"Th蕋 ng",2,0,636},	
	{"B竧 ng",2,0,637},	
	{"C鰑 ng",2,0,638},	
	{"M閠",2,0,639},	
	{"Nh� 甶襲",2,0,640},	
	{"Ba",2,0,641},	
	{"B鑞",2,0,642},	
	{"Ng� 甶襲",2,0,643},	
	{"L鬰 甶襲",2,0,644},	
	{"Th蕋 甶襲",2,0,645},	
	{"B竧 甶襲",2,0,646},	
	{"C鰑 甶襲",2,0,647},	
	{"Nh蕋 v筺",2,0,648},	
	{"Nh� v筺",2,0,649},	
	{"Tam v筺",2,0,650},	
	{"T� v筺",2,0,651},	
	{"Ng� v筺",2,0,652},	
	{"L鬰 v筺",2,0,653},	
	{"Th蕋 v筺",2,0,654},	
	{"B竧 v筺",2,0,655},	
	{"C鰑 v筺",2,0,656},	
	{"Йng phong",2,0,657},	
	{"Nam phong",2,0,658},	
	{"T﹜ phong",2,0,659},	
	{"B綾 phong",2,0,660},	
	{"H錸g trung",2,0,661},	
	{"ph竧 t礽",2,0,662},	
	{"B筩h ban",2,0,663}	
	};
	
	

--function
function get_laborday08_state()
--活动状态判断
	local nDate = tonumber(date("%Y%m%d"));
	if nDate < 20080428 then
		return 0;
	elseif nDate >= 20080428 and nDate <= 20480505 then
		return 1;
	else 
		return 2;
	end 
end

function get_laborday08_award_state()
--领取奖励判断
	local nDate = tonumber(date("%Y%m%d"));
	if nDate >= 20080428 and nDate <= 20480512 then	
		return 1;
	else
		return 0;
	end
end

function add_mahjong_prob(nP)
--通用麻将概率 传入参数为：概率。单位：千分比。比如传入50 表示5%获得
	local nRandOne = random(1,1000);
	if nRandOne <= nP then	
		local nRandTwo = random(1,100);
		if nRandTwo <= 55 then
			local nRandThree = random(1,9);
			SetTask(860+nRandThree,GetTask(860+nRandThree)+1);
			Msg2Player("B筺 nh薾 頲 1 "..tMahJong[nRandThree][1].." , n� � trong rng M箃 chc.");
		elseif nRandTwo <= 85 then
			local nRandThree = random(1,9);
			SetTask(869+nRandThree,GetTask(869+nRandThree)+1);
			Msg2Player("B筺 nh薾 頲 1 "..tMahJong[9+nRandThree][1].." , n� � trong rng M箃 chc.");
		elseif nRandTwo <= 95 then
			local nRandThree = random(1,9);
			SetTask(878+nRandThree,GetTask(878+nRandThree)+1);
			Msg2Player("B筺 nh薾 頲 1 "..tMahJong[18+nRandThree][1].." , n� � trong rng M箃 chc.");	
		else
			local nRandThree = random(1,7);
			SetTask(887+nRandThree,GetTask(887+nRandThree)+1);
			Msg2Player("B筺 nh薾 頲 1 "..tMahJong[27+nRandThree][1].." , n� � trong rng M箃 chc.");
		end							
		return 1;
	else
		return 0;
	end
end

--宝石包裹概率，参数：获得高级灵石的途径，用于公告
function laborday08_baoshi_prob(sName)
	local nRand = random(1,1000);
	if nRand <= 249 then
		lspf_AddLingShiInBottle(1,1);
		Msg2Player("Ch骳 m鮪g b筺 nh薾 頲 1 Linh Th筩h C蕄 1, n� trong T� linh nh.");
	elseif nRand <= 479 then
		lspf_AddLingShiInBottle(2,1);
		Msg2Player("Ch骳 m鮪g b筺 nh薾 頲 1 Linh Th筩h c蕄 2,  nh藀 v祇 T� linh nh.");		
	elseif nRand <= 709 then
		lspf_AddLingShiInBottle(3,1);
		Msg2Player("Ch骳 m鮪g b筺 nh薾 頲1 Linh Th筩h c蕄 3,  nh藀 v祇 T� linh nh.");		
	elseif nRand <= 939 then
		lspf_AddLingShiInBottle(4,1);
		Msg2Player("Ch骳 m鮪g b筺 nh薾 頲 1 Linh Th筩h c蕄 4,  nh藀 v祇 T� linh nh.");		
	elseif nRand <= 989 then
		lspf_AddLingShiInBottle(5,1);
		Msg2Player("Ch骳 m鮪g b筺 nh薾 頲 1 Linh Th筩h c蕄 5,  nh藀 v祇 T� linh nh.");		
	elseif nRand <= 999 then
		lspf_AddLingShiInBottle(6,1);
		Msg2Player("Ch骳 m鮪g b筺 nh薾 頲 1 Linh Th筩h c蕄 6,  nh藀 v祇 T� linh nh.");
		Msg2Global("Ngi ch琲"..GetName().."Trong cu閏 thi Th莕 b礽"..sName.."Nh薾 頲 1 vi猲 Linh th筩h c蕄 6");
		WriteLog("Ho箃 ng qu鑓 t� lao ng 08: Ngi ch琲"..GetName().."Trong cu閏 thi Th莕 b礽"..sName.."Nh薾 頲 1 vi猲 Linh th筩h c蕄 6");		
	else
		lspf_AddLingShiInBottle(7,1);
		Msg2Player("Ch骳 m鮪g b筺 nh薾 頲 1 Linh Th筩h c蕄 7,  nh藀 v祇 T� linh nh.");		
		Msg2Global("Ngi ch琲"..GetName().."Trong cu閏 thi Th莕 b礽"..sName.."Nh薾 頲 1 vi猲 Linh th筩h c蕄 7");
		WriteLog("Ho箃 ng qu鑓 t� lao ng 08: Ngi ch琲"..GetName().."Trong cu閏 thi Th莕 b礽"..sName.."Nh薾 頲 1 vi猲 Linh th筩h c蕄 7");
	end
end

function Zgc_pub_goods_add_chk(goods_num,goods_weight)
--函数名称：物品添加检查函数
		if GetFreeItemRoom() < goods_num then
			Talk (1,"","<color=red>kho秐g tr鑞g<color> trong h祅h trang kh玭g !")
			return 0
		elseif (GetMaxItemWeight() - GetCurItemWeight()) < goods_weight then			--判断玩家负重和空间
			Talk (1,"","<color=red>S鴆 l鵦<color> c馻 b筺 kh玭g !")
			return 0
		else 
			return 1
		end
end