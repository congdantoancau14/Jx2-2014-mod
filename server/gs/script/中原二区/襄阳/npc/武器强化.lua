Include("\\settings\\static_script\\gem\\imp_npc_gem.lua")
Include("\\script\\online\\viet_event\\vng_task_control.lua");
FILE_NAME = "\\script\\中原二区\\襄阳\\npc\\武器强化.lua"

szNpcName = "<color=green>Th� r蘮 L璾<color>: ";
function main()
	if random(1,20) == 1 then
		NpcChat(GetTargetNpc(),"T鑞 m蕐 mi n╩ t﹎ huy誸, r鑤 cu閏 c飊g v韎 nh鱪g ngi c馻 th� gia  nghi猲 c鴘 ra trang b� b竧 qu竔 n祔, ng ti誧 m蕐 xe thi猲 th筩h c馻 ta th玦!");
	end;
	
	local tSay = {
		"Nhi謒 v� M秐h Thi猲 Th筩h th蕋 l筩/get_ManhThienThach",
		"T╪g c蕄 trang b�/qianghua",
		"S鯽 c bi謙/xiuli",
		"Ta mu鑞 trao i m閠 s� v藅 ph萴/showExchangeList",
		"H醝 th╩ tin t鴆 v� cng h鉧/dating",
		"H醝 th╩ nh鱪g 甶襲 li猲 quan v� trang b� B竧 Qu竔/bagua",
		"N﹏g c蕄 trang b� T祅g Ki誱 Ho祅g Kim/UpgradeSwordCollector",
	}
	tinsert(tSay, "\nR阨 kh醝/zhaohu");
	local szSayHead  = "Nghe n鉯 trong thi猲 h� c� m閠 lo筰 k� th筩h c� th� l祄 thay i thu閏 t輓h trang b�. N誹 ngi t譵 頲 ta c� th� gi髉 ngi t╪g c蕄 trang b�. <color=red>B﹜ gi� ngi c� th� s鯽 ngo筰 trang r錳!<color>"
	Say(szNpcName..szSayHead,getn(tSay),tSay);
end;

function showExchangeList()
	local nCount = GetItemCount(2, 2, 8);
	local tSay = {
		format("* Ta mu鑞 i Thi猲 Th筩h l蕐 M秐h Thi猲 Th筩h (t� l� 80:100) /#_on_exchange(%d)", nCount),
		"* фi N� Oa Tinh Th筩h (c莕 1 N� Oa Tinh Th筩h (kh鉧) v� 1 C祅 Kh玭 Ph�)/change_nott",
		"* Ta mu鑞 nh薾 10 Phi Y課 Th筩h (ti猽 hao 1 trang b� T祅g Ki誱 + 1 N� oa tinh th筩h + 1 Ho祅g kim h錸g bao)/#get_PhiYen(1)",
		"* Ta mu鑞 nh薾 19 Phi Y課 Th筩h (ti猽 hao 1 trang b� Thi猲 Chi T祅g Ki誱 + 1 N� oa tinh th筩h + 1 Ho祅g kim h錸g bao)/#get_PhiYen(2)",
		"* Ta mu鑞 nh薾 7 Phi Y課 Th筩h (ti猽 hao 1 v� kh� B� Phi Y猲 + 1 N� oa tinh th筩h)/#get_PhiYen(3)",
		}
	tinsert(tSay, "\nR阨 kh醝/zhaohu");
	Say(szNpcName.."B籲g h鱱 mu鑞 trao i nh鱪g g�?",getn(tSay),tSay);
end;

function _on_exchange(nCount)
	if gf_JudgeRoomWeight(1, 100, "") ~= 1 then
		return 0;
	end
	AskClientForNumber("_request_number_call_back", 1, nCount, "H穣 nh藀 v祇 s� lng c莕 i")
end

-- Modified from item_juyi_tongtian_ling.lua
function _request_number_call_back(nNum)
	if gf_JudgeRoomWeight(1, 100, "") ~= 1 then
		return 0;
	end
	if nNum < 1 then
		Msg2Player("Х h駓 b� giao d譪h.")
		return 0;
	end
	if nNum < 2 then
		Talk(1, "", "<color=green>Th� r蘮 L璾<color>: C竎 h� a ra s� lng qu� it. B鎛 ti謒 kh玭g th� i cho c竎 h� 頲.")
		Msg2Player("Х h駓 b� giao d譪h.")
		return 0;
	end
	
	local nDelResult = DelItem(2, 2, 8, nNum)
	if  nDelResult and nDelResult == 1 then
		AddItem(2,2,7, nNum*80/100)
		local szMsg = format("фi th祅h c玭g. Nh薾 頲 %d c竔 %s", nNum*80/100, "M秐h Thi猲 Th筩h")
		Talk(1, "", szMsg)
		Msg2Player(szMsg)
		--WriteLog(format("%s exchange %d %s(%d,%d,%d) using %d",GetName(),nNum, target_item[4], target_item[1], target_item[2], target_item[3], nType));
	end
end

function UpgradeSwordCollector()
	UpgradeSwordCollectorEquipment();
end

--==========免费区新技能装备等级提升=========
	TaskID_equipment_uped = 1249
	Tb_quipment_part = {
		{0,"u kh玦"},
		{1,"Ngo筰 trang"},
		{3,"Qu莕 "},
	}
--=========================================
function qianghua()
	Say("Cng h鉧 v藅 ph萴 chia th祅h cng h鉧 v藅 ph萴 th玭g thng, cng h鉧 v藅 ph萴 cao c蕄 v� nh h錸.", 5, 
	"Cng h鉧 thng/#qianghua_(0)",
	"Cng h鉧 cao c蕄/#qianghua_(1)",
		"V藅 ph萴 Ti觰 мnh H錸 (+7)/#qianghua_(-1)",
		"V藅 ph萴 nh h錸 (+10)/#qianghua_(-3)",
	"R阨 kh醝/zhaohu")
end;

function qianghua_(t)
	local nType = tonumber(t)
	EnhanceItem(nType)
end

function xiuli()
Say("<color=green>Th� r蘮 L璾<color>: Tinh Luy謓 B╪g Th筩h r蕋 qu�, kh竎h quan xem k� trang b� khi s鯽 ch鱝. <color=yellow>Ch� �, s鯽 ngo筰 trang ch� c� th� ti課 h祅h khi ch璦 t鎛 h筰.<color>",
	5,
	"S鯽 mi詎 ph�( b襫 trc y >0)/fix1",
	"S鯽 mi詎 ph� ( b襫 trc y =0)/fix3",
	"T╪g c蕄/fix2",
	"D飊g 2 T� v� i h閕 b礽  t╪g ch豱h s鯽/fix4",
	"tr� l筰/main")
end;


function fix1()
AdvanceRepair(1)
end;

function fix2()
AdvanceRepair(2)
end;

function fix3()
AdvanceRepair(3)
end;

function fix4()
	AdvanceRepair(4)
end

function dating()
Say("Ngi c莕 ta gi髉 g�?",3,"T譵 hi觰 t╪g c蕄/dating1","T╪g c蕄 c bi謙/dating2","tr� l筰/main")
end;

function dating1()
Say("Trang b� di c蕄 3 c� th� d飊g m秐h b╪g th筩h  n﹏g c蕄, n誹 cao h琻 ph秈 d飊g i b╪g th筩h m韎 c� t竎 d鬾g.",1,"Ta hi觰 r錳!/dating")
end;

function dating2()
Say("S鯽 c bi謙 c� 3 c竎h: 1.D飊g m秐h b╪g th筩h c� th� ph鬰 h錳 l筰  b襫 ban u. 2. D飊g b╪g th筩h c� th� t╪g  b襫 t鑙 產 c馻 trang b�.3. D飊g b╪g th筩h thu莕 khi誸 c� th� ph鬰 h錳 l筰 to祅 b� t鎛 h筰 c馻 trang b�",1,"Ta hi觰 r錳!/dating")
end;
function zhaohu()
end

function bagua()
	Say("<color=red>trang b� b竧 qu竔<color>l� ta c飊g huynh  M筩 gia ta v� C萴 Nng  to祅 l鵦 c飊g nhau nghi猲 c鴘 ra t﹎ huy誸. L祄 th� n祇 nh薾 頲 nh鱪g m鉵 c� linh th筩h ngi 甶 h醝 truy襫 nh﹏ s� r�, ch� t筼 trang b� c� l� ngi 甶 h醝 huynh  M筩 gia, n誹 ngi mu鑞 t譵 hi觰 l祄 th� n祇 <color=yellow>kh秏 linh th筩h<color>, th� n ch� ta t譵 hi觰 nh�.",
	4,
	"L祄 th� n祇 kh秏 linh th筩h v祇 trang b�/Xiangqian",
	"L祄 sao kh秏 linh th筩h m韎 c� th� h譶h th祅h trang b� b竧 qu竔/Xiangbagua",
	"Trang b� b竧 qu竔 c� cng h鉧 kh玭g/Baguaqianghua",
	"дn h醝 th╩ th玦 m�!/SayHello"
	)
end
function SayHello()
end

function Xiangqian()
	Talk(1,"","Vi謈 n祔 r蕋 n gi秐, k� thu藅 c馻 l穙 L璾 ta kh玭g gi鑞g nh鱪g ngi c馻 th� gia, nh蕄 ph秈 v祇 linh th筩h l� c� th� ti課 h祅h thao t竎 kh秏, kh玭g c莕 ph秈 t譵 ngi kh秏 gi髉.")
end

function Xiangbagua()
	Talk(1,"","Sau khi t trang b� v祇 giao di謓 kh秏 xem chi ti誸, do 甶觤 linh kh� trang b� t鑙 產 l� m閠 s� l� ho芻 s� ch絥, 頲 chia th祅h ﹎ dng, v� th� m鏸 trang b� ch� c� th� xu蕋 hi謓 2 lo筰 thu閏 qu� trong <color=yellow>B竧 qu竔<color>, xem thu閏 qu� trong giao di謓 kh秏 nh綾 nh� c� qu� n祇 ngi c莕 kh玭g. Sau khi c 1 linh th筩h kh秏 v祇 th� x竎 nh薾 bc 1, thu閏 qu� m� n� c� th� xu蕋 hi謓 ch� c遪 l筰 <color=yellow>2<color>. Sau khi t linh th筩h th� hai v祇 c� b秐  x竎 nh薾 thu閏 qu� m� trang b� n祔 s� xu蕋 hi謓, v� th� nh蕋 nh ph秈 xem cho k�!")
end

function Baguaqianghua()
	Talk(1,"","Trang b� b竧 qu竔 t� nhi猲 c騨g c� th� cng h鉧, s総 c馻 l穙 L璾 ta kh玭g ph秈 mi詎 ph�. Nh璶g n誹 ngi k輈h ho箃 trang b� b竧 qu竔 th祅h  b竧 qu竔,  b竧 qu竔 th� ta kh玭g c� c竎h. Nh璶g sau khi ngi mang  b竧 qu竔 v祇 ngi, t� c閠 trang b� t trang b� b竧 qu竔 trong b� b竧 qu竔 v祇 c閠 cng h鉧, l穙 L璾 ta s� cng h鉧. ")
end

function change_nott()
	if GetItemCount(2,1,504) < 1 then
		Talk(1,"","Kh玭g c� N� Oa Tinh Th筩h trong h祅h trang n猲 kh玭g th� ti課 h祅h i!")
		return
	end
	if GetItemCount(2,0,555) < 1 then
		Talk(1,"","Kh玭g c� C祅 Kh玭 Ph� trong h祅h trang n猲 kh玭g th� ti課 h祅h i!")
		return
	end
	PutinItemBox("M� kh鉧 v藅 ph萴" , 2, "X竎 nh薾 mu鑞 th鵦 hi謓?", FILE_NAME, 1)
end

function OnPutinCheck(param, idx, genre, detail, particular)
	local tbItem = {{2,0,555}, {2,1,504}}
	if gf_JudgeRoomWeight(2,200,"") == 0 then
		return 0;
	end
	if param ~= 1 then
		return 0;
	end
	for i = 1, getn(tbItem) do
		if genre == tbItem[i][1] and detail == tbItem[i][2] and particular == tbItem[i][3] then
			return 1
		end
	end
	Talk(1, "", "Ch� c� th� b� v祇 N� Oa Tinh Th筩h v� C祅 Kh玭 Ph�!");
	return 0
end

function OnPutinComplete(param)
	if param ~= 1 then
		Talk(1, "","B� v祇 v藅 ph萴 kh玭g ng");
		return 0
	end
	local itemList = GetPutinItem()
	if get_item_count(itemList, 2,0,555) ~= 1 or get_item_count(itemList, 2,1,504) ~= 1 then
		Talk(1, "","B� v祇 v藅 ph萴 kh玭g ng");
		return 0		
	end
	local nResult = 1
	local nExpireTime = 0
	for i = 1, getn(itemList) do
		local nG, nD, nP = itemList[i][2], itemList[i][3], itemList[i][4]
		if nG == 2 and nD == 1 and nP == 504 then
			nExpireTime = GetItemExpireTime(itemList[i][1]) or 2*24*3600
		end
		if DelItemByIndex(itemList[i][1], -1) ~= 1 then
			nResult = 0
			break;
		end
	end
	if nResult == 1 then
		gf_AddItemEx2({2,1,504,1}, "N� Oa Tinh Th筩h", "Chuyen Doi NOTT", "i th祅h c玭g", nExpireTime)
	end
end

function get_item_count(t, id1, id2, id3)
	local nCount = 0;
	local nQianghua, nDing, nRandSeed, nLock = 0,0,0,0
	local nMofa1,nLv1 = 0,0
	local nMofa2,nLv2 = 0,0
	local nMofa3,nLv3 = 0,0
	for i = 1, getn(t) do
		if (t[i][2] == id1 and t[i][3] == id2 and t[i][4] == id3) then
			nCount = nCount + 1;
			if t[i][2] == 0 then
				nQianghua = GetEquipAttr(t[i][1],2)
				nDing = GetItemSpecialAttr(t[i][1],"DING7")
				nLock = GetItemSpecialAttr(t[i][1],"LOCK") 
				nRandSeed = GetItemRandSeed(t[i][1])				
				nMofa1,nLv1 = GetItemAttr(t[i][1],1)
				nMofa2,nLv2 = GetItemAttr(t[i][1],2)
				nMofa3,nLv3 = GetItemAttr(t[i][1],3)		
			end
		end
	end
	return nCount, nQianghua, nDing, nMofa1, nLv1, nMofa2, nLv2, nMofa3, nLv3, nRandSeed,nLock;
end

tCheck = {
	[1] =  {10, 1, 1, {{0,102,38}, {0,102,39}, {0,102,40}, {0,100,95}, {0,100,96}, {0,100,97}, {0,100,98}, {0,103,95}, {0,103,96}, {0,103,97}, {0,103,98}, {0,101,95}, {0,101,96}, {0,101,97}, {0,101,98}}},	
	[2] =  {19, 1, 1, {{0,102,30001}, {0,102,30002}, {0,102,30003}, {0,102,30004}, {0,102,30005}, {0,102,30006}, {0,102,30007}, {0,102,30008}, {0,102,30009}, {0,102,30010}, {0,102,30011}, {0,102,30011}, {0,103,30001}, {0,103,30002}, {0,103,30003}, {0,103,30004}, {0,101,30001}, {0,101,30002}, {0,101,30003}, {0,101,30004}, {0,100,30001}, {0,100,30002}, {0,100,30003}, {0,100,30004}}},	
	[3] =  {7, 1, 0, {{0,3,6001}, {0,5,6002}, {0,8,6003}, {0,0,6004}, {0,1,6005}, {0,2,6006}, {0,10,6007}, {0,0,6008}, {0,5,6009}, {0,2,6010}, {0,9,6011}, {0,6,6012}, {0,4,6013}, {0,7,6014}, {0,11,6015}}},	
}
function get_PhiYen(nSelected)
	if gf_Judge_Room_Weight(tCheck[nSelected][1], 500, "") == 0 then
        	return 0;
     end
     if GetItemCount(2, 1, 504) < tCheck[nSelected][2] then
		Talk(1, "", "B筺 kh玭g mang theo N� oa tinh th筩h!")
		return 0
	end
	if GetItemCount(2, 1, 539) < tCheck[nSelected][3] then
		Talk(1, "", "B筺 kh玭g mang theo Ho祅g Kim Чi H錸g Bao (ch鴄 999 v祅g)!")
		return 0
	end
	
	local nCheck = 0
	for i = 1, getn(tCheck[nSelected][4]) do
		local nG, nD, nP = gf_UnPack(tCheck[nSelected][4][i])
		if (DelItem(nG, nD, nP, 1) == 1) then
			nCheck = 1
			break
		end	
	end
	if nCheck < 1 then
		Talk(1, "", "Чi hi謕 kh玭g mang theo v藅 ph萴 c莕 ph﹏ r�, vui l遪g ki觤 tra l筰 !!!")
		return 0
	end
	
     if DelItem(2, 1, 504, tCheck[nSelected][2]) == 1 and DelItem(2, 1, 539, tCheck[nSelected][3]) == 1 then
		gf_AddItemEx2({2,1,30130,tCheck[nSelected][1]}, "Phi Y猲 Th筩h (t竎h)", "TACH TRANG BI", "nh薾 th祅h c玭g")	 
		Msg2Player("B筺 nh薾 頲 "..tCheck[nSelected][1].." Phi Y課 Th筩h")    		
     end
     
end

function get_ManhThienThach()
	local nNV = mod(floor(GetTask(TSK_MTT_COUNT) / 10000000),10)
	local tbSayDialog = {};
	local szSayHead = "<color=green>Th� r蘮 L璾<color>: Ta 產ng t譵 m秐h thi猲 th筩h b� th蕋 l筩, i hi謕 gi髉 ta th� s� c� h藆 t� !!!."
	if nNV == 0 then
--		tinsert(tbSayDialog, "Nh薾 nhi謒 v�/accept_MTT")
	else
		tinsert(tbSayDialog, "Ho祅 th祅h nhi謒 v�/finish_MTT")
	end
	tinsert(tbSayDialog, "Ki觤 tra ti課  ho祅 th祅h nhi謒 v�/get_infor_MTT")	
	tinsert(tbSayDialog, "Quy襫 l頸/rule_MTT")
	tinsert(tbSayDialog, "T筰 h� ch� gh� qua !/zhaohu")
	
	Say(szSayHead, getn(tbSayDialog), tbSayDialog);
end
function accept_MTT()
	if GetLevel() < 79 then
		Talk(1, "", "Чi hi謕 ph秈 c� ng c蕄 79 tr� l猲 m韎 tham gia t輓h n╪g n祔 頲 !!!")
		return
	end
	local nMTT_NV = floor(GetTask(TSK_MTT_COUNT) / 10000000)
	local nNum_MTT = mod(GetTask(TSK_MTT_COUNT),10000000)
	if mod(nMTT_NV,10) == 0 then
		nMTT_NV = (nMTT_NV + 1) * 10000000 + nNum_MTT
		SetTask(TSK_MTT_COUNT, nMTT_NV)
		gf_WriteLogEx("CHUOI NHIEM VU MTT", "nh薾 th祅h c玭g", 1, "Nh薾 nhi謒 v� ")		
	end
	local tbSayDialog = {};
	local szSayHead = "<color=green>Th� r蘮 L璾<color>: Ch骳 m鮪g i hi謕  nh薾 nhi謒 v� th祅h c玭g !!!."
	tinsert(tbSayDialog, "Ki觤 tra ti課  ho祅 th祅h nhi謒 v�/get_infor_MTT")	
	tinsert(tbSayDialog, "Quy襫 l頸/rule_MTT")
	tinsert(tbSayDialog, "T筰 h� ch� gh� qua !/zhaohu")	
	Say(szSayHead, getn(tbSayDialog), tbSayDialog);
end
function rule_MTT()
	Talk(1,"","<color=green>Th� r蘮 L璾<color>: Hng d蒼 nhi謒 v� !!! \nNh薾 nhi謒 v� <color=red>1 l莕/tu莕<color> \nReset nhi謒 v� v祇 th� 2 h祅g tu莕 \nPh秈 c�  500 Thi猲 Th筩h + 3000 v祅g m韎 c� th� nh薾 thng \nPh莕 thng: 100 tri謚 甶觤 kinh nghi謒 (c� nh) v� nh薾 v藅 ph萴 ng蓇 nhi猲 <color=red>(M秐h thi猲 th筩h ho芻 Thi猲 Th筩h Tinh Th筩h)<color>")
end

function get_infor_MTT()
	local nMTT_HG = mod(GetTask(TSK_MTT_COUNT), 1000)
	local nMTT_CT = mod(floor(GetTask(TSK_MTT_COUNT) / 1000),100)
	local nMTT_TL = mod(floor(GetTask(TSK_MTT_COUNT) / 100000),100)
	local nNV = mod(floor(GetTask(TSK_MTT_COUNT) / 10000000),10)
	local nPT = mod(floor(GetTask(TSK_MTT_COUNT) / 100000000),10)
	if nPT == 0 then
		Talk(1,"","<color=green>Th� r蘮 L璾<color>: C竎 nhi謒 v�  ho祅 th祅h !!! \nTr錸g h箃 gi鑞g: <color=red>"..nMTT_HG.."/150<color> \nNhi謒 v� C髇g T�: <color=red>"..nMTT_CT.."/6<color> \nNhi謒 v� Th駓 L琲: <color=red>"..nMTT_TL.."/6<color>\nTr筺g th竔 nhi謒 v�: <color=red>產ng l祄 nhi謒 v�<color>")
	else
		Talk(1,"","<color=green>Th� r蘮 L璾<color>: C竎 nhi謒 v�  ho祅 th祅h !!! \nTr錸g h箃 gi鑞g: <color=red>"..nMTT_HG.."<color> \nNhi謒 v� C髇g T�: <color=red>"..nMTT_CT.."<color> \nNhi謒 v� Th駓 L琲: <color=red>"..nMTT_TL.."<color>\nTr筺g th竔 nhi謒 v�: <color=red>ho祅 th祅h v�   nh薾 thng<color>")
	end		
end
function finish_MTT()
	local tbAward = {
						{1, 9980, "M秐h Thi猲 Th筩h ", {2, 2, 7, 1}, 0},
						{1, 20, "Thi猲 Th筩h Tinh Th筩h ", {2, 1, 1009, 1}, 0},						
					}
	local nMTT_HG = mod(GetTask(TSK_MTT_COUNT), 1000)
	local nMTT_CT = mod(floor(GetTask(TSK_MTT_COUNT) / 1000),100)
	local nMTT_TL = mod(floor(GetTask(TSK_MTT_COUNT) / 100000),100)
	
	local nMTT_NT = floor(GetTask(TSK_MTT_COUNT) / 100000000)
	local nNum_MTT_NT = mod(GetTask(TSK_MTT_COUNT),100000000)
	if mod(nMTT_NT,10) == 1 then
		Talk(1,"","Чi hi謕  nh薾 thng r錳. Tu莕 sau h穣 n t譵 ta  nh薾 nhi謒 v� m韎")
		return 0
	end	
	if gf_Judge_Room_Weight(3, 100," ") ~= 1 then
        	return
    end
--    if GetExp() + 100000000 > 2000000000 then
--		Talk(1,"","觤 kinh nghi謒 c馻 i hi謕 qu� nhi襲, s� d鬾g b韙 甶觤 kinh nghi謒 r錳 h穣 nh薾 thng !!!.")
--		return 0	    
--    end
	if nMTT_HG < 150 then
		Talk(1,"","Чi hi謕 ch璦 ho祅 th祅h xong s� lng tr錸g c﹜.")
		return 0	
	end
	if nMTT_CT < 6 then
		Talk(1,"","Чi hi謕 ch璦 ho祅 th祅h xong s� lng nhi謒 v� C髇g T�.")
		return 0	
	end
	if nMTT_TL < 6 then
		Talk(1,"","Чi hi謕 ch璦 ho祅 th祅h xong s� lng nhi謒 v� Th駓 L頸.")
		return 0	
	end
	if GetItemCount(2,2,8) < 500 then
		Talk(1,"","Чi hi謕 kh玭g c�  500 Thi猲 Th筩h  nh薾 thng.")
		return 0		
	end
	if GetCash() < 30000000 then
		Talk(1,"","Чi hi謕 kh玭g c�  3000 v祅g  nh薾 thng.")
		return 0			
	end
		
	if mod(nMTT_NT,10) == 0 then
		nMTT_NT = (nMTT_NT + 1) * 100000000 + nNum_MTT_NT
		SetTask(TSK_MTT_COUNT, nMTT_NT)
	end	
	if DelItem(2,2,8,500) == 1 and Pay(30000000) == 1 then
		ModifyExp(100000000)
		local tbAwardRate = {[1] = 0, [2] = 0}
		local nIndex = 0
		for i=1,500 do
			if random(0,10000) < 20 then
				nIndex = 1
			else
				nIndex = 2
			end
			tbAwardRate[nIndex] = tbAwardRate[nIndex] + 1
		end
		if tbAwardRate[1] > 0 then
			gf_AddItemEx2({2, 1, 1009, tbAwardRate[1]}, "Thi猲 Th筩h Tinh Th筩h", "CHUOI NHIEM VU MTT - 1" , "nh薾")
		end
		if tbAwardRate[2] > 0 then
			gf_AddItemEx2({2, 2, 7, tbAwardRate[2]}, "M秐h Thi猲 Th筩h", "CHUOI NHIEM VU MTT - 2" , "nh薾")
		end
		gf_WriteLogEx("CHUOI NHIEM VU MTT", "nh薾 th祅h c玭g", 1, "Ph莕 thng")
	end
	
end