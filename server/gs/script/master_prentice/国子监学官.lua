-- 国子监学官

Include("\\script\\master_prentice\\some_op.lua")
Include("\\script\\online\\zgc_public_fun.lua")		--村长的公共函数

function main()
	-- do return end
	if MPUpdate("\\script\\master_prentice\\国子监学官.lua", "main_cb", 0) == 0 then
		main_cb()
	end
end

function main_cb()
	local tInfo = GetMPBaseInfo()
	if tInfo["master"] ~= "" then
		Say("S� ph� c� m閠 ch髏 qu� cho b筺. Mu鑞 nh薾 ch�?",
			6,
			"T骾 H藆 sinh kh� 髖 (c� th� nh薾 khi tr� th祅h  t� ch輓h th鴆)/#lin_bao(10)",
			"T骾 Ti襫 tr譶h t� c萴 ( c� th� nh薾 sau khi  t� ch輓h th鴆 t c蕄 45)/#lin_bao(45)",
			"T骾 S�  t譶h th﹎ (c� th� nh薾 sau khi  t� ch輓h th鴆 t c蕄 60)/#lin_bao(60)",
			"Thuy誸 minh H� th鑞g S� /see_info2",
			"Nh薾 1 Thi謕 b竔 s�/baishitie",
			"Kh玭g vi謈 g�, ch� xem th玦./no_say")
	elseif tInfo["ismaster"] == 0 then
		Say("Qu鑓 T� gi竚 ch輓h l� n琲  d箉 h鋍 c馻 tri襲 nh匔h� c莕 ng c蕄 t n <color=yellow>75<color>, n Qu鑓 T� gi竚 -Th莕 V� vi謓 ng k� l� c� th� thu nh薾  ",
			5,
			"Ta mu鑞 th祅h s� ph�/yes_make_master",
			"T玦 mu鑞 l祄  /yes_be_prentice",
			"Thuy誸 minh H� th鑞g S� /see_info2",
			"Nh薾 1 Thi謕 b竔 s�/baishitie",
			"Kh玭g vi謈 g�, ch� xem th玦./no_say")
	elseif tInfo["ismaster"] > 0 then
		Say("C竎 h�  ng k� trong h� s� l� S� ph� v� h鋍 Qu鑓 T� gi竚 Th莕 v� vi謓, mu鑞 gi髉 g� c� n鉯 ",
			9,
			"c玭g b� Nhi謒 v� S� /create_task",
			"D飊g 觤 S�  nh薾 ph莕 thng/use_point",
			"Mua hoa h錸g cho   n祔/buy_fund",
			"D飊g b鎛g l閏 mua v藅 ph萴 Qu鑓 T� gi竚/#use_fenglu(1)",
			"Nh薾 1 nhi謒 v� xu蕋 s�/get_graduate_item",
			"Ta mu鑞 b竔 玭g ta l祄 s� ph�, Ta ph秈 h駓 b� ng k� � Qu鑓 T� gi竚/disband_master",
			"Thuy誸 minh H� th鑞g S� /see_info2",
			"Nh薾 1 Thi謕 b竔 s�/baishitie",
			"Kh玭g vi謈 g�, ch� xem th玦./no_say")
	end
end

function lin_bao(nLevel)
	local tInfo = GetMPBaseInfo()
	if GetLevel() < nLevel then
		Say("t n c蕄 "..nLevel.." r錳 h穣 t韎.", 0)
		return
	end
	
	if tInfo["istemp"] == 0 then
		Say("Tr� th祅h   ch輓h th鴆 trc r錳 h穣 t韎.", 0)
		return
	end
	local n1, n2, n3 = CustomDataRead("mp_p_award")
	local tLeveltoIdx =
	{
		[10] = {n1, " t骾 H藆 Sinh Kh� 髖"},
		[45] = {n2, "Ti襫 Tr譶h T� C萴 B祇"},
		[60] = {n3, "T骾 S� у T譶h Th﹎"},
	}
	for index, value in tLeveltoIdx do
		if value[1] == nil then
			value[1] = 0
		end
	end
	
	if tLeveltoIdx[nLevel][1] == 1 then
		Say("Ngi  nh薾 "..tLeveltoIdx[nLevel][2].."1 l莕 r錳.", 0)
		return
	end
	
	if Zgc_pub_goods_add_chk(1,1) == 0 then
		return
	end
	
	local tItem =
	{
		[10] = {2,1,591," t骾 H藆 Sinh Kh� 髖"},
		[45] = {2,1,592,"Ti襫 Tr譶h T� C萴 B祇"},
		[60] = {2,1,597,"T骾 S� у T譶h Th﹎"},
	}
	
	AddItem(tItem[nLevel][1], tItem[nLevel][2], tItem[nLevel][3], 1, 1)
	tLeveltoIdx[nLevel][1] = 1
	CustomDataSave("mp_p_award", "ddd", tLeveltoIdx[10][1], tLeveltoIdx[45][1], tLeveltoIdx[60][1])
	WriteLog("[S� -hoa h錸g  ]:"..GetName().."Nh薾 頲 1 "..tItem[nLevel][4])
end

function see_info2()
	local tInfo = GetMPBaseInfo()
	Say("C竎 h� mu鑞 bi誸 thuy誸 minh v� ph莕 s� ph� hay  ? R蕋 nhi襲 thao t竎 c馻 H� th鑞g S�  u ph秈 m� <color=yellow>B秐g th玭g tin s� <color>, sau  <color=yellow>nh蕄 ph秈 v祇 t猲 m閠 ngi trong danh s竎h<color> s� xu蕋 hi謓 giao di謓  thao t竎.",
		3,
		"N閕 dung v� m苩 s� ph�/shifu",
		"N閕 dung v� m苩  /tudi",
		"Kh玭g vi謈 g�, ch� xem th玦./no_say")
end

function shifu()
	local tInfo = GetMPBaseInfo()
	Say("V� m苩 s� ph� c� nh鱪g n閕 dung b猲 di. R蕋 nhi襲 thao t竎 c馻 H� th鑞g S�  u ph秈 m� <color=yellow>B秐g th玭g tin s� <color>, sau  <color=yellow>nh蕄 ph秈 v祇 t猲 m閠 ngi trong danh s竎h<color> s� xu蕋 hi謓 giao di謓  thao t竎.",
		9,
		"L祄 sao  nh薾  t�/shoutu",
		"Nhi謒 V� S� у sau khi nh薾  t� l� g�/shirenwu",
		"觤 S�  l� g�/shitudianshu",
		"觤 S� c l� g�/shidedianshu",
		"Th� Nghi謕 Ъng C蕄 l� g�/shouyedengji",
		"Hoa H錸g Qu鑓 T� Gi竚 l� g�?/huahong",
		"B鎛g L閏 Qu鑓 T� gi竚 l� g�, c� th� mua 頲 nh鱪g g�/fenglu",
		"L祄 sao ch蕀 d鴗 quan h� S� /shichushi",
		"Kh玭g vi謈 g�, ch� xem th玦./no_say"
		)
end
	
function shoutu()
	local tInfo = GetMPBaseInfo()
	Talk(4,"shifu","N誹 C竎 h� mu鑞 nh薾  , ph秈 n ch� ta ng k�, sau  m� b秐g <color=yellow>'th玭g tin s� '<color>","Жng k� xong, nh蕁 F3 s� xu蕋 hi謓 b秐g <color=yellow>'trang b� thu閏 t輓h'<color>trong giao di謓 s� c� <color=yellow>'th玭g tin s� '<color>, c� th� ki觤 tra t譶h tr筺g s�  hi謓 t筰 c馻 b筺. Ch鋘 m� <color=white>'Nh薾  '<color>  xem v� t譵 n nh鱪g ai mu鑞 b竔 s�.","Khi b筺 g苝 <color=white>ngi ch琲 c� ng c蕄 th蕄 h琻<color>, nh蕁 <color=white>Ctrl<color> v� nh蕄 chu閠 ph秈 ch鋘 'Nh薾 l祄  '. N誹 i phng ng � th� s� tr� th祅h <color=white> t� t筸 th阨<color> c馻 b筺.","Khi <color=green>у  t筸 th阨<color>t n <color=yellow>c蕄 10<color>, c� th� ch輓h th鴆 b竔 s�. Ch� c莕 hai ngi h頿 th祅h t�, anh ta s� <color=white>'B竔'<color> b筺 � c� ly g莕  xin tr� th祅h <color=white>  ch輓h th鴆<color>.")
end
	
function shirenwu()
	local tInfo = GetMPBaseInfo()
	Talk(3,"shifu","Sau khi C竎 h� tr� th祅h s� ph�, m鏸 ng祔 c� th� n ch� ta c玭g b� <color=yellow>Nhi謒 v� S� <color>, c� 7 nhi謒 v�  ch鋘. Sau khi c玭g b� nhi謒 v�, l謓h  c� th� ti誴 nh薾 nhi謒 v� trong <color=yellow>b秐g th玭g tin s� <color>.","K� h筺 sau khi truy襫 l謓h l� <color=yellow>24 ti課g<color>, ngh躠 l� ph秈 ho祅 th祅h xong nhi謒 v� trong v遪g 24 ti課g. уng th阨 ch� 頲 truy襫 1 nhi謒 v� trong v遪g 24 ti課g  m� th玦.","Nhi謒 v� ho祅 th祅h xong, l謓h  s� nh薾 頲 ph莕 thng nhi謒 v�, n誹 l� s� ph� s� nh薾 頲 <color=yellow>觤 S� <color>. 1   ho祅 th祅h nhi謒 v� trong ng祔 c� th� gi髉 s� ph� c� <color=green>10 甶觤<color> S� . <color=yellow>у  c祅g nhi襲, b筺 c祅g 頲 nhi襲 甶觤 S� <color>.")
end
	
function shitudianshu()
	local tInfo = GetMPBaseInfo()
	Talk(5,"shifu",	"<color=yellow>觤 S� <color> l� ph莕 thng m� s� ph� nh薾 頲 sau khi  t� ho祅 th祅h Nhi謒 v� S� . 1  t� ho祅 th祅h xong nhi謒 v� trong th阨 gian qui nh s� t苙g cho s� ph� <color=green>10<color> 觤 S� . T竎 d鬾g c馻 觤 S�  <color=yellow> chuy觧 th祅h ph莕 thng c馻 s� ph�<color> ho芻 <color=yellow>chuy觧 th祅h 觤 S� c<color>.","S� ph� c� th� n ch� ta i 觤 S�  th祅h ph莕 thng<color=yellow>M鏸 1 甶觤 i m閠 ph莕 thng<color>. фi 甶觤 s� ph秈 ti猽 hao <color=yellow>S�  ph� ch�<color>, m鏸 1 甶觤 S�  s� ti猽 hao 1 S�  ph� ch�. <color=green>C╪ c� v祇 ng c蕄 th� nghi謕 c馻 s� ph� cao hay th蕄 m� c� th� tr鵦 ti誴 i m閠 ph莕 gi秈 thng<color>.","S� ph� c騨g c� th� l蕐 觤 S�  chuy觧 th祅h <color=yellow>觤 S� c<color>, c騨g ph秈 ti猽 hao<color=yellow>S�  ph� ch�<color> m鏸 l莕 chuy觧 1 甶觤 S�  ph秈 m蕋 1 t� s� . Xin l璾 �, <color=green>L骳 chuy觧 觤 S�  c莕 c� S�  ph� ch�, kh玭g th� c╪ c� ng c蕄 th� nghi謕 c馻 s� ph� m� chuy觧 i<color>.","T� khi t輓h Nhi謒 v� S�  c馻 s� ph� giao cho , <color=green>觤 S�  s� b籲g 0 sau 24 ti課g<color>. Ngh躠 l� 甶觤 s�  t 頲 sau m鏸 nhi謒 v� s� kh玭g l璾 l筰 trong nhi謒 v� l莕 sau.","Ъng c蕄 th� nghi謕 c祅g cao, 甶觤 s�  nh薾 頲 c祅g nhi襲.")
end
	
function shidedianshu()
	local tInfo = GetMPBaseInfo()
	Talk(2,"shifu",	"觤 s� c quy誸 nh tr� s� <color=yellow>ng c蕄 th� nghi謕<color>, do 觤 S�  c閚g S�  ph� ch�.","觤 S�  m鏸 ng祔 s� gi秏 甶 <color=green>1%<color>.")
end
	
function shouyedengji()
	local tInfo = GetMPBaseInfo()
	Talk(2,"shifu",	"Ъng c蕄 th� nghi謕 bi觰 th� ng c蕄 b筺 l� s� ph� v� h鋍, do tr� s� 甶觤 s� c quy誸 nh <color=yellow>觤 s� c c祅g cao, ng c蕄 th� nghi謕 c祅g cao, b筺 c祅g thu nh薾 頲 nhi襲  <color>. Ъng c蕄 th� nghi謕 cao nh蕋 hi謓 nay l� c蕄 10, c� th� thu nh薾 頲 15  .","Di y l� thuy誸 minh c馻 10 Th� Nghi謕 Ъng C蕄 c� b秐: \n\nC蕄 1 觤 S� c <color=yellow>0<color> d蒼 頲 <color=yellow>3<color>  . C蕄 6 觤 S� c <color=yellow>1200<color> d蒼 頲 <color=yellow>8<color>  \nC蕄 2 觤 S� c <color=yellow>100<color> d蒼 頲 <color=yellow>4<color>  . C蕄 7 觤 S� c <color=yellow>1600<color> d蒼 頲 <color=yellow>9<color>  \n C蕄 3 觤 S� c <color=yellow>300<color> d蒼 頲 <color=yellow>5<color>  . C蕄 8 觤 S� c <color=yellow>2000<color> d蒼 頲 <color=yellow>10<color>  \n蔯p 4 觤 S� c <color=yellow>550<color> d蒼 頲 <color=yellow>6<color>  . C蕄 9 觤 S� c <color=yellow>2500<color> d蒼 頲 <color=yellow>12<color>  \nC蕄 5 觤 S� c <color=yellow>850<color> d蒼 頲 <color=yellow>7<color>  . C蕄 10 觤 S� c <color=yellow>3000<color> d蒼 頲 <color=yellow>15<color>  ")
end
	
function huahong()
	local tInfo = GetMPBaseInfo()
	Talk(3,"shifu",	"<color=yellow>Hoa h錸g Qu鑓 T� gi竚<color> l� do tri襲 nh x﹜ d鵱g nh籱 kh輈h l� tinh th莕 v� h鋍. C竎 h� c� th� n ch� ta mua <color=yellow>hoa h錸g<color> cho l辬h , khi   trng th祅h, c竎 h� c� th� nh薾 <color=yellow>b鎛g l閏<color> tng 鴑g. N誹   xu蕋 s� v� t 頲 m鋓 y猽 c莡, c竎 h� c� th� nh薾 頲 b鎛g l閏 nhi襲 h琻 hoa h錸g g蕄 <color=green>6 l莕<color>.","Xin l璾 �, <color=yellow>t� khi b竔 s� tr� th祅h  t� ch輓h th鴆, nh鱪g b鎛g l閏 trc y s� ph� kh玭g nh薾 頲<color>. N誹 nh�  t� c蕄 65 ch輓h th鴆 b竔 s� tr� th祅h  t� ch輓h th鴆, b鎛g l閏 trc c蕄 65 nh� c蕄 30, 40, 50 v� 60, s� ph� s� kh玭g nh薾 頲.","<color=yellow>M鏸 s� ph� ch� c� th� l穘h b鎛g l閏 ch璦 b� l穘h c馻   hi謓 t筰<color>. V� s� ph� sau kh玭g th� l穘h b鎛g l閏 c馻   n誹 s� ph� trc y  l穘h. Sau khi 2 ngi ch琲 k誸 h頿 m鑙 quan h� s� , s� ph� c� th� nh蕄 v祇 'ki觤 ta hoa h錸g' trong b秐g s�   ki觤 tra nh鱪g b鎛g l閏 m� s� ph� trc c馻   n祔  l穘h.")
end
	
function fenglu()
	local tInfo = GetMPBaseInfo()
	Talk(3,"shifu",	"<color=white>B鎛g l閏 Qu鑓 T� gi竚 <color> l� ph莕 thng sau khi b筺 mua hoa h錸g  hu蕁 luy謓 cho  t�, d飊g  mua nh鱪g v藅 ph萴 qu� hi誱","Ch� ta c� b竛 r蕋 nhi襲 lo筰 v藅 ph萴, nh璶g ph秈 d飊g B鎛g l閏 Qu鑓 T� gi竚 m韎 c� th� mua.","<color=yellow>B鎛g l閏 Qu鑓 T� gi竚<color> nh薾 tr鵦 ti誴 trong <color=yellow> giao di謓 s� <color>. Nh蕄 chu閠 ph秈 t猲  t� ch鋘 <color=yellow>Ki觤 tra hoa h錸g<color> v祇 <color=yellow>giao di謓 hoa h錸g<color> xem t譶h h譶h trng th祅h c馻  t� ho芻 <color=yellow>Nh薾 b鎛g l閏<color>.")
end

function shichushi()
	local tInfo = GetMPBaseInfo()
	Say("C� 3 c竎h k誸 th骳 quan h� s� , xu蕋 s�, tr鬰 xu蕋 s� m玭 v� ph秐 b閕 s� m玭",
		4,
		"L祄 th� n祇  xu蕋 s�/shichushi1",
		"L祄 th� n祇  tr鬰 xu蕋 s� m玭/shichushi2",
		"Ph秐 b閕 s� m玭 l� nh� th� n祇/shichushi3",
		"Kh玭g vi謈 g�, ch� xem th玦./no_say"	
		)
end
	
function shichushi1()
	local tInfo = GetMPBaseInfo()	
	Talk(4,"shichushi",	"Khi l謓h  t <color=green>c蕄 73<color>, ngi c� th� n g苝 ta nh薾 nhi謒 v� xu蕋 s�. Nh薾 頲 <color=yellow>'Xu蕋 S� Ti猽'<color>, t� i v韎   ra ngo礽 th祅h, d飊g Xu蕋 S� Ti猽 g鋓 ra <color=yellow>Tu莕 kh秓 Qu鑓 T� gi竚<color>, l� ngi c馻 tri襲 nh ph竔 n  ki觤 tra xu蕋 s�.","Sau khi g鋓 tu莕 kh秓 Qu鑓 T� Gi竚 ra, ph秈 <color=yellow>nh b筰<color> h緉. Xin l璾 �, <color=green> bc cu鑙 c飊g ph秈 do l謓h  ho祅 th祅h<color>.","Sau khi nh b筰 tu莕 kh秓 Qu鑓 T� Gi竚, b筺 v� nh鉳 l謓h  d飊g ng t竎 <color=yellow>'B竔'<color> � c� li g莕  xu蕋 s�.","N誹 c竎 h� mua <color=yellow>Qu鑓 T� gi竚 hoa h錸g<color> cho l謓h , <color=green>b鎛g l閏 s� t 100% khi   xu蕋 s�<color>; <color=green>qua 15 ng祔 sau<color>, <color=green>ti誴 t鬰 l穘h 100% b鎛g l閏<color>; <color=green>15 ng祔 ti誴 theo<color>, <color=green>v蒼 c� th� nh薾 100% b鎛g l閏<color>. <color=green>t鎛g c閚g l� 300% b鎛g l閏<color>. Xin ch� � nh薾 b鎛g l閏 trong b秐g th玭g tin s� .")
end

function shichushi2()
	local tInfo = GetMPBaseInfo()	
	Talk(3,"shichushi",	"Khi c竎 h� kh玭g h礽 l遪g v韎   c� th�<color=yellow>tr鬰 xu蕋 s� m玭<color>, nh蕄 <color=yellow>chu閠 ph秈<color> l猲 t猲 c馻   mu鑞 tr鬰 xu蕋 trong <color=yellow>b秐g s� <color>,  l� c竎h tr鬰 xu蕋 s� m玭.","L骳 tr鬰 xu蕋  t� ph秈 ti猽 hao <color=yellow>99 t� s� <color>, ng th阨 kh玭g 頲 nh薾  t� trong v遪g <color=yellow>24 ti課g<color>. \n Tr鬰 xu蕋  t� t筸 th阨 kh玭g c� m苩 h筺 ch� n祔. <color=yellow>е t� ch輓h th鴆 r阨 m筺g t� 7 ng祔 tr� l猲 c騨g kh玭g c� h筺 ch� <color>.","N誹   t� n祔 mua <color=yellow>Hoa H錸g Qu鑓 T� Gi竚<color>, sau khi b� tr鬰 xu蕋<color=green>nh鱪g b鎛g l閏 li猲 quan m�  t�  ch璦 nh薾 s� b� h駓 b�<color>. \n в n b�, <color=green>sau khi b� tr鬰 xu蕋 15 ng祔,  t� n祔 nh薾 頲 80% b鎛g l閏<color>, <color=green>h琻 15 ng祔<color>, <color=green>nh薾 th猰 80% b鎛g l閏<color>, <color=green>t鎛g c閚g 160% b鎛g l閏<color>. Xin l璾 � ch� 頲 nh薾 trong giao di謓 th玭g tin s� .")
end

function shichushi3()
	local tInfo = GetMPBaseInfo()	
	Talk(2,"shichushi",	"у  c� th� s� <color=yellow>ph秐 b閕 s� m玭<color>, c竎 h� c莕 ch� � 甶觤 n祔, n猲 suy ngh� nhi襲 n c秏 nh薾 c馻  .","N誹   t� n祔 mua<color=yellow>Hoa H錸g Qu鑓 T� Gi竚<color>, sau khi ph秐 b閕 s� m玭, <color=green>nh鱪g b鎛g l閏 m�  t� n祔 ch璦 nh薾 s� b� h駓 b�<color>. \n в n b�, <color=green>15 ng祔 sau khi ph秐 b閕 s� m玭 頲 nh薾 100% b鎛g l閏<color>, <color=green>h琻 15 ng祔<color>, <color=green>nh薾 頲 100% b鎛g l閏<color>,<color=green>t鎛g c閚g 200% b鎛g l閏<color>. Ch� 頲 nh薾 trong giao di謓 th玭g tin s� .")
end


function tudi()
	local tInfo = GetMPBaseInfo()
	Say("N閕 dung li猲 quan n  , R蕋 nhi襲 thao t竎 c馻 H� th鑞g S�  u ph秈 m� <color=yellow>B秐g th玭g tin s� <color>, sau  <color=yellow>nh蕄 ph秈 v祇 t猲 m閠 ngi trong danh s竎h<color> s� xu蕋 hi謓 giao di謓  thao t竎.",
		5,
		"L祄 c竎h n祇  b竔 s�/baishi",
		"Nhi謒 v� S�  sau khi b竔 s� l� g�/turenwu",
		"Sau khi b竔 s� c� th� nh薾 頲 ph莕 thng n祇/jiangli",
		"L祄 sao ch蕀 d鴗 quan h� S� /tuchushi",
		"Kh玭g vi謈 g�, ch� xem th玦./no_say")
end

function baishi()
	local tInfo = GetMPBaseInfo()
	Talk(4,"tudi","Xem l筰 h祅h trang c馻 b筺: 1 <color=white>Thi謕 b竔 s�<color>. nh蕄 chu閠 ph秈  s� d鬾g, c� th� g鰅 tin t鴆 b竔 s�, c竎 cao th� l﹏ c薾 s� nh薾 頲. N誹 c� ngi mu鑞 nh薾 b筺 l祄  t�, ch� c莕 x竎 nh薾  tr� th祅h <color=white> t� t筸 th阨<color>.","Sau khi th祅h  t� t筸 th阨, trong F3 giao di謓 s� c� nhi襲 <color=yellow>giao di謓 th玭g tin s� <color>. Xin ch� �!","Khi ng c蕄 c馻 b筺 t <color=green>c蕄 10<color>, c� th� chuy觧 th祅h  t� ch輓h th鴆. T� i v韎 s� ph�, sau  l秏 ng t竎 <color=yellow>'b竔'<color> � kho秐g c竎h g莕, s� tr� th祅h <color=green> t� ch輓h th鴆<color>.","N誹 b筺  ng k� l祄 s� ph�, b筺 kh玭g 頲 b竔 ngi kh竎 l祄 s� ph�, ph秈 h駓 b� ng k� trc.")
end
	
function turenwu()
	local tInfo = GetMPBaseInfo()
	Talk(4,"tudi","B竔 s� xong, m鏸 ng祔 s� ph� c玭g b� 1 <color=yellow>Nhi謒 v� S� <color>, t鎛g c閚g c� 7 nhi謒 v�  ch鋘, b筺 c� th� thng lng v韎 s� ph� s� c玭g b� nhi謒 v� n祇. C玭g b� nhi謒 v� xong, b筺 c� th� nh譶 th蕐 nhi謒 v� 頲 c玭g b� trong <color=yellow>B秐g tin t鴆 s� <color>, sau  ch鋘 <color=yellow>ti誴 nh薾 nhi猰 v�<color>.","K� h筺 sau khi truy襫 l謓h l� <color=green>24 ti課g<color>, ph秈 ho祅 th祅h nhi謒 v� trong v遪g 24 ti課g, trong th阨 h筺  kh玭g 頲 giao nhi謒 v� kh竎.","Nhi謒 v� ho祅 th祅h xong, b筺 s� nh薾 頲 <color=yellow>Ph莕 thng nhi謒 v�<color>. Ph莕 thng kh竎 nhau t飝 theo nhi謒 v� s� .","Ch� �: khi t 頲 <color=green>c蕄 73<color>, ph莕 thng b筺 nh薾 頲 s� gi秏 c遪 m閠 n鯽, khi t n <color=green>c蕄 80<color>, b筺 s� kh玭g c遪 頲 nh薾 thng n鱝.")
end
	
function jiangli()
	local tInfo = GetMPBaseInfo()
	Talk(5,"tudi","L頸 輈h l韓 nh蕋 l� c� s� ph�, gi髉 b筺 r蕋 nhi襲 trong i s鑞g giang h�, c竎 s� mu閕, s� , s� huynh, s� t� c騨g l� b筺 ng h祅h tr猲 bc 阯g h祅h t萿 giang h� c馻 b筺.","Ngay khi tr� th祅h <color=white> t� ch輓h th鴆<color>, b筺 s� nh薾 頲 t骾 <color=white>'H藆 Sinh Kh� 髖'<color> � <color=white>Qu鑓 T� gi竚<color>, y l� qu� g苝 m苩 r蕋 th鵦 d鬾g c馻 s� ph� t苙g b筺.","Khi b筺 t c蕄<color=green>45<color>, n <color=green>Qu鑓 T� gi竚<color> nh薾 t骾 <color=green>'Ti襫 Tr譶h T� C萴'<color>.","Khi b筺 t c蕄<color=green>60<color>, n <color=green>Qu鑓 T� gi竚<color> nh薾 t骾 <color=green>'S�  t譶h th﹎'<color>.","Khi b筺 t c蕄 <color=green>73<color>, c� th� xu蕋 s�, s� ph� c� th� c飊g b筺 ho祅 th祅h <color=green>Nhi謒 v� xu蕋 s�<color>. Sau khi ho祅 th祅h nhi謒 v� s� nh薾 頲 t骾 <color=green>'S�  kh� qu猲'<color> l� ph莕 thng khi xu蕋 s�.")
end


function tuchushi()
	local tInfo = GetMPBaseInfo()
	Say("C� 3 c竎h k誸 th骳 quan h� s� , xu蕋 s�, tr鬰 xu蕋 s� m玭 v� ph秐 b閕 s� m玭",
	4,
		"L祄 th� n祇  xu蕋 s�/tuchushi1",
		"L祄 th� n祇  tr鬰 xu蕋 s� m玭/tuchushi2",
		"Ph秐 b閕 s� m玭 l� nh� th� n祇/tuchushi3",
		"Kh玭g vi謈 g�, ch� xem th玦./no_say"	
		)
end
	
function tuchushi1()
	local tInfo = GetMPBaseInfo()	
	Talk(3,"tuchushi",	"Khi t c蕄<color=green>73<color>, b筺 n<color=green>Qu鑓 T� gi竚<color> t譵 s� ph� nh薾 nhi謒 v� xu蕋 s�. Nh薾 頲 <color=yellow>'Xu蕋 S� Ti猽'<color>, t� i v韎   ra ngo礽 th祅h, d飊g Xu蕋 S� Ti猽 g鋓 ra <color=yellow>Tu莕 kh秓 Qu鑓 T� gi竚<color>, l� ngi c馻 tri襲 nh ph竔 n  ki觤 tra xu蕋 s�.","Sau khi g鋓 tu莕 kh秓 Qu鑓 T� gi竚 ra, ph秈 <color=yellow>nh b筰 h緉<color>. <color=green> Chi猽 cu鑙 c飊g ph秈 do b筺 ho祅 th祅h<color>!","Sau khi nh b筰 tu莕 kh秓 Qu鑓 T� gi竚, b筺 v� s� ph� t� i, l祄 ng t竎 <color=yellow>'B竔'<color> s� ph�  xu蕋 s�.")
end

function tuchushi2()
	local tInfo = GetMPBaseInfo()	
	Talk(1,"tuchushi",	"S� ph� c� th� <color=yellow>tr鬰 xu蕋  <color> ra kh醝 s� m玭. \nN誹 b� tr鬰 xu蕋 s� m玭, b筺 c� th� b竔 s� kh竎.")
end

function tuchushi3()
	local tInfo = GetMPBaseInfo()	
	Talk(2,"tuchushi",	"N誹 b筺 b蕋 m穘 v韎 s� ph�, c� th� <color=yellow>Ph秐 b閕 s� m玭<color>. Trong<color=yellow>Giao di謓 s� <color>, nh蕄 <color=yellow>chu閠 ph秈<color> ngay t猲 s� ph�  ch鋘 Ph秐 b閕 s� m玭.","Ph秐 b閕 s� m玭 ph秈 ti猽 hao <color=yellow>99 S�  ph� ch�<color>, ng th阨 trong <color=yellow>24 gi�<color> sau khi ph秐 b閕 kh玭g 頲 b竔 s�. \n N誹 b筺 l� у  t筸 th阨, kh玭g c� h筺 ch� n祔. <color=yellow>S� ph� kh玭g l猲 m筺g t� 7 ng祔 tr� l猲 c騨g kh玭g b� h筺 ch� n祔<color>.")
end



function baishitie()
	if BigGetItemCount(2,1,587) == 0 then
		if Zgc_pub_goods_add_chk(1,1) ~= 1 then
			return
		else
			AddItem(2,1,587,1)
		end
	else
		Talk(1,"","C竎 h�  c� 1 thi謕 b竔 s� r錳 , kh玭g c莕 l穘h n鱝.")	
		return
	end	
end
		