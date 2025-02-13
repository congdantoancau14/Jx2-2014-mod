--File name:	fruit_npc.lua
--Describe:		水果宴会活动npc脚本
--Create Date:	2008-06-23
--Author:		chenbenqian

Include("\\script\\online\\fruit_event_08_viet\\fruit_event_head.lua");
Include("\\script\\lib\\globalfunctions.lua")

g_LogTitle = "L� h閕 tr竔 c﹜ : ".."фi";		--此处分为2段只是为了不增加新的翻译

function main()
	if is_fruit_event_viet_open() == 0 then
		return
	end
	local selTab = {
				"T譵 hi觰 c竎h th鴆 i tr竔 c﹜./fruit_event",
				"K誸 th骳 i tho筰/no",
				}
	Say("<color=green>Thng nh﹏ tr竔 c﹜<color>: ".."T� 04-07-2008 n 24:00 27-07-2008, ".."Trong th阨 gian L� h閕 tr竔 c﹜, ngi ch琲 c� th� th玭g qua tham gia Nhi謒 v� s� m玭, T祅g ki誱 s琻 trang v� tr錸g c﹜ B竧 nh�  thu th藀 T骾 tr竔 c﹜. Sau khi m� T骾 tr竔 c﹜ s� nh薾 頲 1 trong 5 lo筰 tr竔 c﹜, nh�: Nho, M穘g c莡, M╪g c魌, V� s鱝, S莡 ri猲g. Sau khi s� d鬾g tr竔 c﹜ s� nh薾 頲 ph莕 thng 甶觤 kinh nghi謒 v� v藅 ph萴 qu� b竨.",getn(selTab),selTab);
end

function fruit_event()
		local selTab = {
					"фi tr竔 c﹜ theo h譶h th鴆 1/#exchange_fruit(1)",
					"фi tr竔 c﹜ theo h譶h th鴆 2/#exchange_fruit(2)",
					"фi tr竔 c﹜ theo h譶h th鴆 3/#exchange_fruit(3)",
					"фi tr竔 c﹜ theo h譶h th鴆 4/#exchange_fruit(4)",
					"K誸 th骳 i tho筰/no",
					}
		Say("<color=green>Thng nh﹏ tr竔 c﹜<color>: C� 4 c竎h i:\n<color=yellow>C竎h th鴆 1<color>: 3 Nho = 1 M穘g c莡.\n<color=yellow>C竎h th鴆 2<color>: 3 M穘g c莡 + 1 Nho = 1 M╪g c魌.\n<color=yellow>C竎h th鴆 3<color>: 3 M╪g c魌 + 1 M穘g c莡 + 1 Nho + 10 B筩 = 1 V� s鱝.\n<color=yellow>C竎h th鴆 4<color>: 3 V� s鱝 + 1 M╪g c魌 + 1 M穘g c莡 + 1 Nho + 80 B筩 = 1 S莡 ri猲g.",getn(selTab),selTab);
end

function exchange_fruit(nType)
	local nRetCode = 0;
	if nType == 1 then
		if GetItemCount(2,1,30009) < 3 then
			Say("<color=green>Thng nh﹏ tr竔 c﹜<color>: Nguy猲 li謚 mang theo kh玭g .",1,"Th藅 ng筰 qu�,  ta ki觤 tra l筰!/no");
			return
		else
			if gf_Judge_Room_Weight(1,20) == 0 then
				Talk(1,"","<color=green>Thng nh﹏ tr竔 c﹜<color>: H穣 m b秓 h祅h trang  ch� tr鑞g v� tr鋘g lng  tr竛h l穘g ph� kh玭g c莕 thi誸.");
				return
			end;
			if del_item_ex("Nho",2,1,30009,3) == 1 then
				add_item_ex("M穘g c莡",2,1,30010,1)
			else
				Say("<color=green>Thng nh﹏ tr竔 c﹜<color>: Nguy猲 li謚 mang theo kh玭g .",1,"Th藅 ng筰 qu�,  ta ki觤 tra l筰!/no");
				return
			end
		end
	elseif nType == 2 then
		if GetItemCount(2,1,30009) < 1 or GetItemCount(2,1,30010) < 3 then
			Say("<color=green>Thng nh﹏ tr竔 c﹜<color>: Nguy猲 li謚 mang theo kh玭g .",1,"Th藅 ng筰 qu�,  ta ki觤 tra l筰!/no");
			return
		else
			if gf_Judge_Room_Weight(1,20) == 0 then
				Talk(1,"","<color=green>Thng nh﹏ tr竔 c﹜<color>: H穣 m b秓 h祅h trang  ch� tr鑞g v� tr鋘g lng  tr竛h l穘g ph� kh玭g c莕 thi誸.");
				return
			end;
			if del_item_ex("Nho",2,1,30009,1) == 1 and del_item_ex("M穘g c莡",2,1,30010,3) then
				add_item_ex("M╪g c魌",2,1,30011,1)
			else
				Say("<color=green>Thng nh﹏ tr竔 c﹜<color>: Nguy猲 li謚 mang theo kh玭g .",1,"Th藅 ng筰 qu�,  ta ki觤 tra l筰!/no");
				return
			end
		end
	elseif nType == 3 then
		if GetItemCount(2,1,30009) < 1 or GetItemCount(2,1,30010) < 1 or GetItemCount(2,1,30011) < 3 or GetCash() < 1000 then
			Say("<color=green>Thng nh﹏ tr竔 c﹜<color>: Nguy猲 li謚 mang theo kh玭g .",1,"Th藅 ng筰 qu�,  ta ki觤 tra l筰!/no");
			return
		else
			if gf_Judge_Room_Weight(1,20) == 0 then
				Talk(1,"","<color=green>Thng nh﹏ tr竔 c﹜<color>: H穣 m b秓 h祅h trang  ch� tr鑞g v� tr鋘g lng  tr竛h l穘g ph� kh玭g c莕 thi誸.");
				return
			end;
			if del_item_ex("Nho",2,1,30009,1) == 1 and del_item_ex("M穘g c莡",2,1,30010,1) and del_item_ex("M╪g c魌",2,1,30011,3) and pay_ex(1000) then
				add_item_ex("V� s鱝",2,1,30012,1)
			else
				Say("<color=green>Thng nh﹏ tr竔 c﹜<color>: Nguy猲 li謚 mang theo kh玭g .",1,"Th藅 ng筰 qu�,  ta ki觤 tra l筰!/no");
				return
			end
		end
	elseif nType == 4 then
		if GetItemCount(2,1,30009) < 1 or GetItemCount(2,1,30010) < 1 or GetItemCount(2,1,30011) < 1 or GetItemCount(2,1,30012) < 3 or GetCash() < 8000 then
			Say("<color=green>Thng nh﹏ tr竔 c﹜<color>: Nguy猲 li謚 mang theo kh玭g .",1,"Th藅 ng筰 qu�,  ta ki觤 tra l筰!/no");
			return
		else
			if gf_Judge_Room_Weight(1,20) == 0 then
				Talk(1,"","<color=green>Thng nh﹏ tr竔 c﹜<color>: H穣 m b秓 h祅h trang  ch� tr鑞g v� tr鋘g lng  tr竛h l穘g ph� kh玭g c莕 thi誸.");
				return
			end;
			if del_item_ex("Nho",2,1,30009,1) == 1 and del_item_ex("M穘g c莡",2,1,30010,1) and del_item_ex("M╪g c魌",2,1,30011,1) and del_item_ex("V� s鱝",2,1,30012,3) and pay_ex(8000) then
				add_item_ex("S莡 ri猲g",2,1,30013,1)
			else
				Say("<color=green>Thng nh﹏ tr竔 c﹜<color>: Nguy猲 li謚 mang theo kh玭g .",1,"Th藅 ng筰 qu�,  ta ki觤 tra l筰!/no");
				return
			end
		end
	else
		WriteLog("["..g_LogTitle.."]: [Account: "..GetAccount().."][Role Name:"..GetName().."] function exchange_fruit(nType), parameter nType error, nType = "..nType);
	end
	fruit_event()
end


function add_item_ex(szItemName, genre, detail, particular, nItemNum)
	local nRetCode = 0;
	nRetCode = AddItem(genre, detail, particular, nItemNum);
	if nRetCode == 1 then
		Msg2Player("B筺 nh薾 頲  "..nItemNum.." c竔 "..szItemName);
		WriteLog("["..g_LogTitle.."]: [Account: "..GetAccount().."][Role Name:"..GetName().."] Obtain "..nItemNum.." "..szItemName);
	else
		WriteLog("["..g_LogTitle.."]: [Account: "..GetAccount().."][Role Name:"..GetName().."] Obtain "..nItemNum.." "..szItemName.." Failed, return value = "..nRetCode);
	end
end

function del_item_ex(szItemName, genre, detail, particular, nItemNum)
	local nRetCode = 0;
	nRetCode = DelItem(genre, detail, particular, nItemNum);
	if nRetCode == 1 then
		return 1;
	else
		WriteLog("["..g_LogTitle.."]: [Account: "..GetAccount().."][Role Name:"..GetName().."] delete "..nItemNum.." "..szItemName.." Failed, DelItem("..genre..", "..detail..", "..particular..", "..nItemNum..") return value = "..nRetCode);
		return 0;
	end
end

function pay_ex(nNum)
	local nRetCode = 0;
	nRetCode = Pay(nNum)
	if nRetCode == 1 then
		return 1
	else
		WriteLog("["..g_LogTitle.."]: [Account: "..GetAccount().."][Role Name:"..GetName().."] Pay("..nNum..") Failed, return value = "..nRetCode);
		return 0
	end
end

function no()
end

