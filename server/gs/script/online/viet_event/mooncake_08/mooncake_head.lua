--File name:	mooncake_head.lua
--Describe:		中秋活动head文件
--Create Date:	2008-08-18
--Author:		chenbenqian

SWITCH_08_MOONCAKE_VIET	= 1;

DATE_08_MOONCAKE_VIET_START	= 09;			-- 中秋活动开始日期
DATE_08_MOONCAKE_VIET_END	= 10;			-- 中秋活动结束日期

TOTALEXP_08_MOONCAKE_VIET = 2455					--记录使用月饼获得的总共的经验
FIRE_TIME_08_MOONCAKE_VIET = 2456					--记录点火(生成火炉)的时间
CAKE_TYPE_08_MOONCAKE_VIET = 2457					--记录烧烤月饼的类型
BURNER_IDX_08_MOONCAKE_VIET = 2458					--记录火炉npc的索引
WOOD_NUM_08_MOONCAKE_VIET = 2459					--记录成功放木材的个数
OBTAIN_CAKE_08_MOONCAKE_VIET = 2460					--记录是否领取了月饼
LUCKY_DATE_08_MOONCAKE_VIET = 2461					--记录当天点亮幸运灯笼的日期
LUCKY_TIMES_08_MOONCAKE_VIET = 2462					--记录当天点亮幸运灯笼的次数
WOOD_TIME_08_MOONCAKE_VIET = 2463					--记录放木柴的时间
CAKE_DATE_08_MOONCAKE_VIET = 2464					--记录交月饼的日期

RELAY_DB_08_MOONCAKE_VIET = "mooncake_event_08_viet"		--共享数据库字符串标识

g_nExpTotal_MoonCakeViet = 50000000					--中秋活动使用月饼可获得的总共经验值
g_nTime_MoonCakeViet = 300							--烧烤月饼需要的时间(单位：秒)
Include("\\script\\lib\\writelog.lua")
szLogTrungThuName = "Hoat Dong Trung Thu"

--中秋活动开放返回1，关闭返回0
function is_mooncake_viet_open()
	local nDate = tonumber(date("%m"));
	if nDate >= DATE_08_MOONCAKE_VIET_START and nDate < DATE_08_MOONCAKE_VIET_END then
		return SWITCH_08_MOONCAKE_VIET;
	else
		return 0;
	end
end

function search_lantern()
	Talk(1,"","Ho箃 ng \"Truy t譵 l錸g n may m緉\" di詎 ra t� 05-09-2008 n 24:00 ng祔 05-10-2008. L錸g n s� xu蕋 hi謓 T� 11:00 n 14:00 v� t� 21:00 n 24:00 v祇 c竎 ng祔 Th� 6, Th� 7 v� Ch� nh藅 h籲g tu莕. Trong th阨 gian n祔, ngi ch琲 n NPC Ti觰 уng  nh薾 揘課 v祅g�. � tr筺g th竔 chi課 u, ngi ch琲 mang N課 V祅g n c竎 b秐   th緋 s竛g L錸g n May M緉, s� c� c� h閕 nh薾 頲 ph莕 thng 甶觤 kinh nghi謒 v� c竎 v藅 ph萴 c� gi� tr�.");
end;

function give_cake()
	Talk(1,"","Ho箃 ng 揟苙g B竛h Trung Thu� di詎 ra h籲g ng祔 t� 05-09-2008 n 24:00 ng祔 05-10-2008. H祅g ng祔 t� 7:00 n 19:00, ngi ch琲 mang 4 b竛h trung thu b譶h thng ho芻 4 b竛h trung thu c bi謙 n t苙g cho NPC Phi Y課 Ti猲 T�  nh薾 l蕐 1 甶襲 c. T� 20:00 n 06:00 s竛g h玬 sau, ngi ch琲 n NPC Phi Y課 T� T�  nh薾 ph莕 thng t� 甶襲 c c馻 m譶h.\nCh� �: Sau th阨 gian quy nh m� ngi ch琲 kh玭g n nh薾 thng th� ph莕 thng s� b� h駓 b�.");
end;

function collect_materials()
	Talk(1,"","T� 05-09-2008 n 24:00 ng祔 05-10-2008, ngi ch琲 c� th� nh qu竔  thu th藀 nguy猲 li謚 l祄 b竛h trung thu (xem chi ti誸 tr猲 trang ch�).")
end;

function make_cake()
	Talk(1,"","Ho箃 ng l祄 B竛h Trung Thu di詎 ra t� ng祔 05-09-2008 n 24:00 ng祔 05-10-2008. Trong th阨 gian n祔, ngi ch琲 tham gia c竎 ho箃 ng trong tr� ch琲  thu th藀 c竎 T骾 Nguy猲 Li謚, b猲 trong c� ch鴄 c竎 nguy猲 li謚 c莕 thi誸  l祄 B竛h Trung Thu. Ngo礽 ra, ngi ch琲 c� th� l祄 ra nh鱪g chi誧 b竛h trung thu c bi謙 khi mua g鉯 Gia V� t� Ng� C竎. S� d鬾g c竎 lo筰 B竛h Trung Thu s� 頲 甶觤 kinh nghi謒 v� v藅 ph萴 c� gi� tr�.")
end;
	
function get_mooncake_08_info()
	local tbSay = {
		"Ho箃 ng Thu th藀 nguy猲 li謚/collect_materials",
		"Ho箃 ng L祄 b竛h Trung Thu/make_cake",
		"Ho箃 ng Truy t譵 l錸g n may m緉/search_lantern",
		"Ho箃 ng T苙g b竛h Trung Thu/give_cake",
	}
	Say("Danh s竎h c竎 ho箃 ng Trung Thu 2008",getn(tbSay),tbSay)
end;