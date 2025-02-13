--脚本功能：
--代币商店入口对话

Include("\\script\\equip_shop\\equip_shop_head.lua")
Include("\\script\\system_switch_config.lua")

function OnOpenShopGroup1()
	local szTitle = format("H穣 l鵤 ch鋘 phng th鴆 i")
	local strtab = {}
	tinsert(strtab,"\n T� B秓 Thng Nh﹏ C� Linh Th筩h /OnOpenShops_GuLingShi");
	tinsert(strtab,"\n T� B秓 Thng Nh﹏ C� Linh Ng鋍 /OnOpenShops_GuLingYu");
	if IsTongTianHuanJingMissionSystemOpen() == 1 then
		tinsert(strtab,"\n T� B秓 Thng Nh﹏ Thi猲 M玭 Kim L謓h /OnOpenShops_TianMenJinLing");
	end
	tinsert(strtab,"\n r髏 lui/nothing");
	
	Say(szTitle, getn(strtab), strtab)
end

--古灵石兑换
function OnOpenShops_GuLingShi()
	local szTitle = format("H穣 l鵤 ch鋘 phng th鴆 i")
	local strtab = {
			"\n Ti謒 t筽 h鉧 C� Linh Th筩h /#show_equip_shop(3001)",
			"\n S� M玭 b� 4/#show_equip_shop(3)",
			"\n S� M玭 b� 5/#show_equip_shop(6)",
			"\n U萵 Linh c蕄 1 /OpenLevel1WenShiShops",
			"\n r髏 lui/nothing",
	};
	Say(szTitle, getn(strtab), strtab)
end

--一级纹饰兑换
function OpenLevel1WenShiShops()
	local szTitle = format("Vui l遪g ch鋘 b� ph薾 V薾 Linh")
	local strtab = {
			"\n U萵 Linh u qu竛 c蕄 1/#show_equip_shop(3004)",
			"\n U萵 Linh y ph鬰 c蕄 1/#show_equip_shop(3005)",
			"\n U萵 Linh h� y c蕄 1/#show_equip_shop(3006)",
			"\n Ph秐 h錳/OnOpenShops_GuLingShi",
			"\n r髏 lui/nothing",
	};
	Say(szTitle, getn(strtab), strtab)
end

function OnOpenShops_GuLingYu()
	local szTitle = format("H穣 l鵤 ch鋘 phng th鴆 i")
	local strtab = {
			"\n Ti謒 T筽 h鉧 C� Linh Ng鋍/#show_equip_shop(3002)",
			"\n Trang b� C� Linh Ng鋍 H筼 Nguy謙/#show_equip_shop(10)",
			"\n U萵 Linh c蕄 2/OpenLevel2WenShiShops",
			"\n U萵 Linh c蕄 3/OpenLevel3WenShiShops",
			"\n r髏 lui/nothing",
	};
	Say(szTitle, getn(strtab), strtab)
end

--二级纹饰兑换
function OpenLevel2WenShiShops()
	local szTitle = format("Vui l遪g ch鋘 b� ph薾 V薾 Linh")
	local strtab = {
			"\n U萵 Linh u qu竛 c蕄 2/#show_equip_shop(3007)",
			"\n U萵 Linh y ph鬰 c蕄 2/#show_equip_shop(3008)",
			"\n U萵 Linh h� y c蕄 2/#show_equip_shop(3009)",
			"\n Ph秐 h錳/OnOpenShops_GuLingYu",
			"\n r髏 lui/nothing",
	};
	Say(szTitle, getn(strtab), strtab)
end

--三级纹饰兑换
function OpenLevel3WenShiShops()
	local szTitle = format("Vui l遪g ch鋘 b� ph薾 V薾 Linh")
	local strtab = {
			"\n U萵 Linh u qu竛 c蕄 3/#show_equip_shop(3010)",
			"\n U萵 Linh y ph鬰 c蕄 3/#show_equip_shop(3011)",
			"\n U萵 Linh Kh� c蕄 3/#show_equip_shop(3012)",
			"\n Ph秐 h錳/OnOpenShops_GuLingYu",
			"\n r髏 lui/nothing",
	};
	Say(szTitle, getn(strtab), strtab)
end

function OnOpenShops_TianMenJinLing()
	local szTitle = format("H穣 l鵤 ch鋘 phng th鴆 i")
	local strtab = {
			"\nTi謒 T筽 h鉧 Thi猲 M玬 Kim L謓h/#show_equip_shop(3003)",
			"\nTrang b� Th玭g Thi猲 Di謚 Dng/#show_equip_shop(13)",
	};
	
	--新旧耀阳，皓月装备兑换
	local nDate = tonumber(date("%Y%m%d%H"));
	if nDate >= 2012101200 and nDate < 2042111200 then
		tinsert(strtab, "\nфi trang b� H筼 Nguy謓, Di謚 Dng (t� 12 th竛g 10 n 11 th竛g 11)/#show_equip_shop(3025)");
	end 
	
	tinsert(strtab, "\n r髏 lui/nothing");
	Say(szTitle, getn(strtab), strtab)
end

--三级纹饰兑换
function OpenLeihuJingPoShops()
	local szTitle = format("Vui l遪g ch鋘 b� ph薾 V薾 Linh")
	local strtab = {
			"\n C鯽 hi謚 qu﹏ ph鬰 L玦 H�/#show_equip_shop(3038)",
			"\n r髏 lui/nothing",
	};
	Say(szTitle, getn(strtab), strtab)
end

function nothing()
end

