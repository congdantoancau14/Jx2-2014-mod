--生产技能戒子材料制作
Include("\\script\\lib\\globalfunctions.lua")
Include("\\script\\equip_shop\\equip_shop_head.lua")

DSN_NPC = "<color=green>х T� Nng<color>: ";

function main()
	local tSay = {
		"Ti謒 Ц Qu�/#show_equip_shop(6000)",
		"Ti謒 S竎h Pet/#show_equip_shop(6012)",
		"Ti謒 Th� Ci/#show_equip_shop(6006)",
		"Ti謒 U萵 Linh C蕄 7/ShopUL7",
		--"Ti謒 V� H� H祇 Hi謕/#show_equip_shop(6001)",
		"Ti謒 Kim X� C蕄 6/#show_equip_shop(6011)",
		"Ti謒 萴 Huy誸/#show_equip_shop(6003)",
		"Ti謒 S竧 Tinh/#show_equip_shop(6004)",
		"Ti謒 V� Song Chi課 Th莕/#show_equip_shop(6005)",
		"Ti謒 Minh Tinh V� C鵦/#show_equip_shop(6007)",
		"\nT玦 ch� xem xem th玦/nothing",
	}		
	Say(DSN_NPC..format("%s c� th� gi髉 頲 g� kh玭g?", gf_GetPlayerSexName()), getn(tSay), tSay)
end


function ShopUL7()
	local tSay = {
		"Ti謒 U萵 Linh C蕄 7 - u/#show_equip_shop(6008)",
		"Ti謒 U萵 Linh C蕄 7 - Y/#show_equip_shop(6009)",
		"Ti謒 U萵 Linh C蕄 7 - Trang/#show_equip_shop(6010)",
		"\nRa kh醝/nothing",
	};
	--SelectSay(szSay);
	Say(DSN_NPC..format("%s c� th� gi髉 頲 g� kh玭g?", gf_GetPlayerSexName()), getn(tSay), tSay)
end
