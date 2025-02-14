--File name:	shop_manager.lua
--Describe:		中秋活动秦大婶npc文件
--Create Date:	2008-08-25
--Author:		chenbenqian

Include("\\script\\online\\viet_event\\mooncake_08\\mooncake_head.lua")
Include("\\script\\lib\\globalfunctions.lua")

g_szLogTitle = "Ho箃 ng trung thu : ".."T莕 i th萴"		--此处分为2段只是为了不增加新的翻译
g_szInfoHead = "<color=green>T莕 i th萴<color>: "


function main()
	if is_mooncake_viet_open() == 0 then
		return
	end
	local selTab = {
				"Nh� Чi Th萴 gi髉 t筰 h� l祄 ra B竛h trung thu ch璦 nng lo筰 thng./#make_mooncake(1)",
				"Nh� Чi Th萴 gi髉 t筰 h� l祄 ra B竛h trung thu ch璦 nng lo筰 c bi謙./#make_mooncake(2)",
				"C竎h l祄 B竛h trung thu/mooncake_guide",
				"T筰 h� mu鑞 mua 1 b� c駃 (1 b� c駃 = 10 b筩)/bug_wood",
				"Ta ch� n xem th�/no",
				}
	Say(g_szInfoHead.."L祄 b竛h kh玭g kh�, ch� c莕 ch╩ ch� l� 頲. B筺 tr� mu鑞 ta gi髉 g� n祇?",getn(selTab),selTab);
end

function bug_wood()
	if GetCash() < 1000 then
		Say(g_szInfoHead.."1 B� C駃 = 10 B筩, c竎 h� mang theo kh玭g  B筩 th� ph秈!",1,"Th藅 ng筰 qu�,  ta ki觤 tra l筰!/no")
		return
	end
	if gf_Judge_Room_Weight(1,20) == 0 then
		Talk(1,"",g_szInfoHead.."Kho秐g tr鑞g h祅h trang ho芻 s鴆 l鵦 kh玭g , xin ki觤 tra l筰!")
		return
	end
	if pay_ex(1000) == 1 then
		add_item_ex("C駃",2,1,30022,1)
	else
		Say(g_szInfoHead.."1 B� C駃 = 10 B筩, c竎 h� mang theo kh玭g  B筩 th� ph秈!",1,"Th藅 ng筰 qu�,  ta ki觤 tra l筰!/no")
		return
	end
end

function mooncake_guide()
	Say(g_szInfoHead.."Nguy猲 li謚 c莕 thi誸:\n- 1 B竛h trung thu ch璦 nng lo筰 thng c莕 c�: 2 B閠 M� + 1 Л阯g C竧 + 1 Tr鴑g Mu鑙 + 1 Nguy猲 Li謚 Th藀 C萴 + 40B筩\n- 1 B竛h trung thu ch璦 nng lo筰 c bi謙 c莕 c�: 2 B閠 M� + 1 Л阯g C竧 + 1 Tr鴑g Mu鑙 + 1 Nguy猲 Li謚 Th藀 C萴 + 1 G鉯 Gia V轡nB筺 tr� h穣 mua m閠 輙 B� C駃  nng b竛h, m閠 l莕 c� th� nng 8 B竛h. T飝 theo s� l莕 b� c駃 th祅h c玭g trong qu� tr譶h nng b竛h m� ngi s� nh薾 頲 nh鱪g chi誧 B竛h trung thu th琺 ngon.",1,"C竚 琻 T莕 Чi Th萴  t薾 t譶h hng d蒼!/no");
end

function make_mooncake(nType)
	if GetLevel() < 20 then
		Talk(1,"",g_szInfoHead.."Ngi ph秈 c蕄 20 tr� l猲 m韎 c� th� ti課 h祅h nng B竛h trung thu");
		return
	end

	local nRetCode = 0;
	if nType == 1 then
		if GetItemCount(2,1,30017) < 2 or GetItemCount(2,1,30018) < 1 or GetItemCount(2,1,30019) < 1 or GetItemCount(2,1,30020) < 1 or GetCash() < 4000 then
			Say(g_szInfoHead.."Kh玭g  c竎 nguy猲 li謚 c莕 thi誸 th� ta kh玭g th� l祄 ra nh鱪g chi誧 B竛h trung thu ch璦 nng 頲. H穣 c� g緉g t譵 th猰 nguy猲 li謚 nh�!",1,"V﹏g! T筰 h� s� quay l筰 sau khi c�  nguy猲 li謚!!/no");
			return
		else
			if gf_Judge_Room_Weight(1,20) == 0 then
				Talk(1,"",g_szInfoHead.."Kho秐g tr鑞g h祅h trang ho芻 s鴆 l鵦 kh玭g , xin ki觤 tra l筰!");
				return
			end;
			if del_item_ex("B閠 m�",2,1,30017,2) == 1 and del_item_ex("Л阯g c竧",2,1,30018,1) == 1 and del_item_ex("Tr鴑g mu鑙",2,1,30019,1) == 1 and del_item_ex("Nguy猲 li謚 th藀 c萴",2,1,30020,1) == 1 and pay_ex(4000) == 1 then
				add_item_ex("B竛h ch璦 nng thng",2,1,30023,1)
			else
				Say(g_szInfoHead.."Kh玭g  c竎 nguy猲 li謚 c莕 thi誸 th� ta kh玭g th� l祄 ra nh鱪g chi誧 B竛h trung thu ch璦 nng 頲. H穣 c� g緉g t譵 th猰 nguy猲 li謚 nh�!",1,"V﹏g! T筰 h� s� quay l筰 sau khi c�  nguy猲 li謚!!/no");
				return
			end
		end
	elseif nType == 2 then
		if GetItemCount(2,1,30017) < 2 or GetItemCount(2,1,30018) < 1 or GetItemCount(2,1,30019) < 1 or GetItemCount(2,1,30020) < 1 or GetItemCount(2,1,30021) < 1 then
			Say(g_szInfoHead.."Kh玭g  c竎 nguy猲 li謚 c莕 thi誸 th� ta kh玭g th� l祄 ra nh鱪g chi誧 B竛h trung thu ch璦 nng 頲. H穣 c� g緉g t譵 th猰 nguy猲 li謚 nh�!",1,"V﹏g! T筰 h� s� quay l筰 sau khi c�  nguy猲 li謚!!/no");
			return
		else
			if gf_Judge_Room_Weight(1,20) == 0 then
				Talk(1,"",g_szInfoHead.."Kho秐g tr鑞g h祅h trang ho芻 s鴆 l鵦 kh玭g , xin ki觤 tra l筰!");
				return
			end;
			if del_item_ex("B閠 m�",2,1,30017,2) == 1 and del_item_ex("Л阯g c竧",2,1,30018,1) == 1 and del_item_ex("Tr鴑g mu鑙",2,1,30019,1) == 1 and del_item_ex("Nguy猲 li謚 th藀 c萴",2,1,30020,1) == 1 and del_item_ex("G鉯 gia v�",2,1,30021,1) == 1 then
				add_item_ex("B竛h ch璦 nng ",2,1,30024,1)
			else
				Say(g_szInfoHead.."Kh玭g  c竎 nguy猲 li謚 c莕 thi誸 th� ta kh玭g th� l祄 ra nh鱪g chi誧 B竛h trung thu ch璦 nng 頲. H穣 c� g緉g t譵 th猰 nguy猲 li謚 nh�!",1,"V﹏g! T筰 h� s� quay l筰 sau khi c�  nguy猲 li謚!!/no");
				return
			end
		end
	else
		WriteLog("["..g_szLogTitle.."]: [Account: "..GetAccount().."][Role Name:"..GetName().."] function make_mooncake(nType), parameter nType error, nType = "..nType);
	end
end


function add_item_ex(szItemName, genre, detail, particular, nItemNum)
	local nRetCode = 0;
	nRetCode = AddItem(genre, detail, particular, nItemNum);
	if nRetCode == 1 then
		Msg2Player("B筺 nh薾 頲  "..nItemNum.." c竔 "..szItemName);
		WriteLogEx(szLogTrungThuName,"nh薾",nItemNum,szItemName)
	else
		WriteLog("["..g_szLogTitle.."]: [Account: "..GetAccount().."][Role Name:"..GetName().."] Obtain "..nItemNum.." "..szItemName.." Failed, return value = "..nRetCode);
	end
end

function del_item_ex(szItemName, genre, detail, particular, nItemNum)
	local nRetCode = 0;
	nRetCode = DelItem(genre, detail, particular, nItemNum);
	if nRetCode == 1 then
		return 1;
	else
		WriteLog("["..g_szLogTitle.."]: [Account: "..GetAccount().."][Role Name:"..GetName().."] delete "..nItemNum.." "..szItemName.." Failed, DelItem("..genre..", "..detail..", "..particular..", "..nItemNum..") return value = "..nRetCode);
		return 0;
	end
end

function pay_ex(nNum)
	local nRetCode = 0;
	nRetCode = Pay(nNum)
	if nRetCode == 1 then
		return 1
	else
		WriteLog("["..g_szLogTitle.."]: [Account: "..GetAccount().."][Role Name:"..GetName().."] Pay("..nNum..") Failed, return value = "..nRetCode);
		return 0
	end
end

function no()
end

