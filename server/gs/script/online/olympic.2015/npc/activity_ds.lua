--奥运活动大使
Include("\\script\\online\\olympic\\oly_head.lua")
Include("\\settings\\static_script\\global\\regular_clear_task.lua")
Include("\\script\\lib\\talktmp.lua")
Include("\\script\\lib\\globalfunctions.lua");
Include("\\script\\vng\\lib\\vnglib_textdata.lua") 
Include("\\script\\vng\\lib\\vnglib_award.lua") 

tbSay_201207 = {
	"Gi韎 thi謚 ho箃 ng/introduce_201207",
	"Gh衟 Ng� S綾 Th竛h H醓 Th筩h/combining_flame_201207",
	"竛 s� tr髇g Lam S綾 Th竛h H醓 Th筩h/guess_flame_201207",
	"дn H醓 V鵦 C鰑 Ch﹗ thu th藀 Th竛h H醓 Th筩h/goto_caji_map_201207",
	"дn Thi猲 S� B� C秐h thu th藀 Th竛h H醓 Th筩h/goto_tianshimijing",
	"R髏 thng H筺h V薾/oly_lucky_star_201207",
	"фi Ng� Th竔 Th竛h H醓 sang Ng� S綾 Th竛h H醓 Th筩h/ExchangeItem",
}

sTitle_201207 = "Ch祇 m鮪g phi猲 b秐 m韎, th緋 s竛g Th竛h H醓 Уn  nh薾 ph莕 thng t鑤. Ngi ch琲 t c蕄 80,  gia nh藀 l璾 ph竔 v� h鋍 h誸 k� n╪g c蕄 55 c� th� tham gia.";

Activity_Ds_Name = "<color=green>Чi S� ho箃 ng: <color>";

sTitle_201207_1 = "T筰 m鏸 th祅h Thuy襫 Ch﹗ (165/192), Th祅h Й (180/179), Чi L� ( 231/222), Tng Dng (221/195), Phng Tng (221/195), Bi謓 Kinh ( 183/173) u c� m閠 Th竛h H醓 Уn";

function introduce_201207()
	if oly_IsActivityOpen() ~= 1 then
		Talk(1,"","Event  h誸 h筺");
		return 0;
	end
	local tbSay = {
		"Ngu錸 g鑓 v� ch駈g lo筰 Th竛h H醓/source_201207",
		"Ph莕 thng v� s� l莕 s� d鬾g 5 lo筰 Th竛h H醓  th緋 s竛g/danse_award_201207",
		"Ph莕 thng v� s� l莕 s� d鬾g Ng� Th竔 Th竛h H醓  th緋 s竛g/wucai_award_201207",
		"R髏 thng H筺h V薾 Tinh m鏸 ng祔/lucky_star_201207",
		"H籲g ng祔 th緋 l鯽 g鋓 BOSS/lucky_call_boss",
		"\n r髏 lui/nothing",
	}
	Say(Activity_Ds_Name..sTitle_201207_1,getn(tbSay),tbSay);
end

function source_201207()
	local tbBody = "  \n H綾 S綾 Th竛h H醓棗R琲 ra t� Boss 秈 Lng S琻, V筺 Ki誱 Tr騨g;  \n Ho祅g S綾 Th竛h H醓棗Nh薾 頲 khi gi誸 qu竔 � Qu� M玭 H錳 Lang;  \n H錸g S綾 Th竛h H醓棗R琲 ra t� Thi猲 M玭 Tr薾;  \n L鬰 S綾 Th竛h H醓棗Thu th藀 U Minh Hoa � Qu� M玭 H錳 Lang (c� x竎 su蕋 sinh ra khi gi誸 ch誸 qu竔 v藅);   \n Lam S綾 Th竛h H醓棗Nh薾 頲 khi tham gia 畂竛 s�;  \n Ng� Th竔 Th竛h H醓棗Gh衟 � Чi S� ho箃 ng ho芻 c� th� nh薾 頲 khi gi誸 qu竔 chi猽 d� Minh H醓 Qu� Linh";
	local tbSay = {};
	tbSay.msg = Activity_Ds_Name..tbBody;
	tbSay.sel = {
		{"\n r髏 lui","nothing"},
	};
	temp_Talk(tbSay);
end

function danse_award_201207()
	local tbBody = format("S� l莕: Th竛h H醓 Уn � m鏸 th祅h th� 頲 th緋 s竛g 3 l莕/ng祔. Ph莕 thng:\n   S� l莕 th緋 s竛g +1;\n   S� l莕 th緋 s竛g trong ng祔 c馻 server +1;\n   exp <color=green>%d<color>;\n   H閜 Trang Tr� Gi竛g Sinh;\n   ho芻 1 o c� ng蓇 nhi猲.", OLY_EXP_2);
	local tbSay = {
		"S� l莕 th緋 s竛g c閚g d錸 c� l頸 輈h g� kh玭g?/fire_used_201207",
		"\n tr� v� t莕g trc/introduce_201207",
		"Tho竧/nothing",
	}
	Say(Activity_Ds_Name..sTitle_201207_1..tbBody,getn(tbSay),tbSay);
end

function wucai_award_201207()
	local tbBody = format("S� l莕: C� th� th緋 s竛g Th竛h H醓 Уn t鑙 產 2000 l莕. Ph莕 thng:\n   S� l莕 th緋 s竛g +1;\n   S� l莕 th緋 s竛g trong ng祔 c馻 server +3;\n   exp <color=green>%d<color>;\n   H閜 Trang Tr� Gi竛g Sinh*3;\n   ho芻 1 o c� ng蓇 nhi猲.", OLY_EXP_3);
	local tbSay = {
		"S� l莕 th緋 s竛g c閚g d錸 c� l頸 輈h g� kh玭g?/fire_used_201207",
		"\n tr� v� t莕g trc/introduce_201207",
		"Tho竧/nothing",
	}
	Say(Activity_Ds_Name..sTitle_201207_1..tbBody,getn(tbSay),tbSay);
end

function fire_used_201207()
	local tbSay = {};
	tbSay.msg = Activity_Ds_Name.."S� l莕 th緋 s竛g t n c竎 m鑓 kh竎 nhau s� nh薾 頲 nh鱪g ph莕 thng sau:\n";
	tbSay.sel = {
		{"\n r髏 lui","nothing"},
	};
	temp_Talk(tbSay);
end

function combining_flame_201207()
	if oly_IsActivityOpen() ~= 1 then
		Talk(1,"","Event  h誸 h筺");
		return 0;
	end
	local tbSay = {
		"Gh衟 b籲g Ng� Th竔 Th莕 Th筩h (b竛 � Ng� C竎)/combining_1_201207",
		--"Gh衟 Th竛h H醓 v� V祅g/combining_2_201207",
		"\n r髏 lui/nothing",
	}
	Say(Activity_Ds_Name.."C竎 h� mu鑞 ch鋘 c竎h th鴆 n祇  gh衟 Ng� Th竔 Th竛h H醓 v藋?",getn(tbSay),tbSay);
end

function combining_1_201207()
	local tbSay = {
		format("Gh衟 %d H錸g S綾 Th竛h H醓+%d Ng� Th竔 Th莕 Th筩h/#begin_combining_1(1)",Compose_ShengHuo_Num_1,Compose_ShenShi_Num_1),
		format("Gh衟 %d L鬰 S綾 Th竛h H醓+%d Ng� Th竔 Th莕 Th筩h/#begin_combining_1(2)",Compose_ShengHuo_Num_1,Compose_ShenShi_Num_1),
		format("Gh衟 %d Ho祅g S綾 Th竛h H醓+%d Ng� Th竔 Th莕 Th筩h/#begin_combining_1(3)",Compose_ShengHuo_Num_1,Compose_ShenShi_Num_1),
		format("Gh衟 %d Lam S綾 Th竛h H醓+%d Ng� Th竔 Th莕 Th筩h/#begin_combining_1(4)",Compose_ShengHuo_Num_1,Compose_ShenShi_Num_1),
		format("Gh衟 %d H綾 S綾 Th竛h H醓+%d Ng� Th竔 Th莕 Th筩h/#begin_combining_1(5)",Compose_ShengHuo_Num_1,Compose_ShenShi_Num_1),
		"\n tr� v� t莕g trc/combining_flame_201207",
		"Tho竧/nothing",
	}
	Say(Activity_Ds_Name.."5 Th竛h H醓 Th筩h n s綾 b蕋 k� + 1 Ng� S綾 Th莕 Th筩h (Mua trong Ng� C竎) = 1 Ng� S綾 Th竛h H醓 Th筩h",getn(tbSay),tbSay);
end

function combining_2_201207()
	local tbSay = {
		format("Gh衟 %d H錸g S綾 Th竛h H醓+%d V祅g/#begin_combining_2(1)",Compose_ShengHuo_Num_2,Compose_Coin_Num_2),
		format("Gh衟 %d L鬰 S綾 Th竛h H醓+%d V祅g/#begin_combining_2(2)",Compose_ShengHuo_Num_2,Compose_Coin_Num_2),
		format("Gh衟 %d Ho祅g S綾 Th竛h H醓+%d V祅g/#begin_combining_2(3)",Compose_ShengHuo_Num_2,Compose_Coin_Num_2),
		format("Gh衟 %d Lam S綾 Th竛h H醓+%d V祅g /#begin_combining_2(4)",Compose_ShengHuo_Num_2,Compose_Coin_Num_2),
		format("Gh衟 %d H綾 S綾 Th竛h H醓+%d V祅g/#begin_combining_2(5)",Compose_ShengHuo_Num_2,Compose_Coin_Num_2),
		"\n tr� v� t莕g trc/combining_flame_201207",
		"Tho竧/nothing",
	}
	Say(Activity_Ds_Name.."9 Th竛h H醓 Th筩h n s綾 b蕋 k� + 30 v祅g = 1 Ng� S綾 Th竛h H醓 Th筩h",getn(tbSay),tbSay);
end

function guess_flame_201207()
	if oly_IsActivityOpen() ~= 1 then
		Talk(1,"","Event  h誸 h筺");
		return 0;
	end
	local tbBody = "T筰 h� ra 1 ch� s� (t� 1-100)  c竎 h� 畂竛 5 l莕, s� l莕 畂竛 tr髇g c祅g 輙 th� ph莕 thng c祅g l韓. S� l莕 tham gia tr� ch琲 m鏸 ng祔 l� t飝 �, nh璶g ch� 頲 nh薾 thng 3 l莕.";
	local tbSay = {
		"H穣 b総 u 甶 /oly_begin_guess",
		"Nh薾 ph莕 thng l莕 trc/oly_get_last_guess_award",
		"\n r髏 lui/nothing",
	}
	Say(Activity_Ds_Name..tbBody,getn(tbSay),tbSay);
end

function lucky_star_201207()
	local tbSay = {};
	tbSay.msg = Activity_Ds_Name.."S� l莕 th緋 s竛g t 6 l莕/ng祔, s� c� th� tham gia ho箃 ng R髏 Th╩ May M緉:\n   C竎h th鴆: Nh藀 1 con s� trong kho秐g 1-9999;\n   Quy tr譶h nh薾 thng: 21:00 h籲g ng祔 m� thng, t� 21:00-21:30 ngi ch琲 tr髇g thng ph秈 n ch� c馻 ta  ng k� tr髇g thng, 10 ngi ch琲 u ti猲 ng k� c� th� chia u ph莕 thng. Sau 21:30 c� th� nh薾 thng, n 22:00 th� k誸 th骳 nh薾 thng, qu� gi� s� kh玭g th� nh薾.\n   Ph莕 thng: M鏸 ng祔 50 Thi猲 Ki猽 L謓h, trong ng祔 kh玭g ai tr髇g thng (nh薾 thng), th� ph莕 thng s� t輈h l騳 cho n khi c� ngi tr髇g thng ho芻 ho箃 ng k誸 th骳.\n   Ch� �: Con s� may m緉 ch� c� hi謚 l鵦 trong ng祔.";
	tbSay.sel = {
		{"\n r髏 lui","nothing"},
	};
	temp_Talk(tbSay);
end

function lucky_call_boss()
	local tbSay = {};
	tbSay.msg = Activity_Ds_Name.."Sau khi s� l莕 th緋 s竛g trong ng祔 c馻 server t 5000 l莕, v祇 l骳 20:00 � T﹜ Th祅h Й s� xu蕋 hi謓 Ph� Th駓 B╪g Gi�, sau khi ti猽 di謙 s� r琲 ra nhi襲 ph莕 thng. D飊g Th竛h H醓 Th筩h thng  th緋 s竛g, s� l莕 th緋 s竛g +1, n誹 d飊g Ng� S綾 Th竛h H醓 Th筩h  th緋 s竛g, s� l莕 th緋 s竛g +3.";
	tbSay.sel = {
		{"\n r髏 lui","nothing"},
	};
	temp_Talk(tbSay);
end

function oly_lucky_star_201207()
	if oly_IsActivityOpen() ~= 1 then
		Talk(1,"","Event  h誸 h筺");
		return 0;
	end
	CheckAndDoRegularClear(EM_REGULAR_CLEAR_TYPE_DAILY);
	local tbBody = "S� l莕 th緋 s竛g t 6 l莕/ng祔, s� c� th� tham gia ho箃 ng R髏 Th╩ May M緉.\n    Ph莕 thng t輈h l騳 hi謓 t筰 l�: <color=green>%d Thi猲 Ki猽 L謓h<color>;\n    Con s� may m緉 h玬 nay l�: <color=green>%s<color>;\n    Con s� may m緉 c馻 b筺 l�: <color=green>%d<color>;\n    Ph莕 thng: M鏸 ng祔 50 Thi猲 Ki猽 L謓h, trong ng祔 kh玭g ai tr髇g thng (nh薾 thng), th� ph莕 thng s� t輈h l騳 cho n khi c� ngi tr髇g thng ho芻 ho箃 ng k誸 th骳.";
	local tbSay = oly_CreateDlgTable();
	local nTglNum,strNum,nMyluckNum = oly_GetBaseInfo();	
	tinsert(tbSay,"Tho竧/nothing");
	Say(Activity_Ds_Name..format(tbBody,nTglNum,strNum,nMyluckNum),getn(tbSay),tbSay);
end

function input_luck_num_201207()
	if gf_GetMyTaskByte(VET_OLY_TASK1,2,3) == 0 then
		AskClientForNumber("input_luck_num_cb_201207",1,OLY_MAX_LUCK_NUM,"Nh藀 ch� s� may m緉 c馻 c竎 h�");
	end
end

function input_luck_num_cb_201207(nNum)
	local nDayTime = oly_GetDayCurrTime(); --当天时间
	if nDayTime >= 0 and nDayTime < OLY_TIME_START then
		gf_SetMyTaskByte(VET_OLY_TASK1,2,3,nNum,TASK_ACCESS_CODE_OLYMPIC);
		Msg2Player(format("Ch� s� may m緉 c馻 c竎 h� l� %d",nNum));
	else
		Msg2Player("B﹜ gi� kh玭g th� nh藀 ch� s� may m緉 , h穣 quay l筰 v祇 ng祔 mai.");
	end
end

function goto_caji_map_201207()
	if oly_IsActivityOpen() ~= 1 then
		Talk(1,"","Event  h誸 h筺");
		return 0;
	end
	local tbSay = {
		"уng �/sure_201207",
		"Tho竧/nothing",
	}
	Say(Activity_Ds_Name.."уng � n b秐  thu th藀  t譵 L鬰 S綾 Th竛h H醓 Th筩h?",getn(tbSay),tbSay);
end

function sure_201207()
	if oly_IsActivityOpen() ~= 1 then
		Talk(1,"","Event  h誸 h筺");
		return 0;
	end
	if oly_Is_LevelSkill()	~= 1 then
		return 0;
	end
	NewWorld(328,1628,3981);
	SetFightState(1);
end

function goto_tianshimijing()
	if oly_IsActivityOpen() ~= 1 then
		Talk(1,"","Event  h誸 h筺");
		return 0;
	end
	local tbSay = {
		"уng �/sure_goto_tianshimijing",
		"Ra kh醝/nothing",
	}
	Say(Activity_Ds_Name.."уng � n b秐  thu th藀  t譵 L鬰 S綾 Th竛h H醓 Th筩h?",getn(tbSay),tbSay);
end

function sure_goto_tianshimijing()
	if oly_IsActivityOpen() ~= 1 then
		Talk(1,"","Event  h誸 h筺");
		return 0;
	end
	if oly_Is_LevelSkill()	~= 1 then
		return 0;
	end
	NewWorld(329, 1734, 3428);
	SetFightState(1);
end

--登记
function register_mylucknum_201207()
	ApplyRelayShareData(Oly_Record3.szKey,Oly_Record3.nKey1,Oly_Record3.nKey2,Oly_CallBack_Script,"oly_CallBack_Rigister");
end

--领奖
function get_lucknum_award_201207()
	if gf_GetTaskByte(VET_OLY_TASK1,4) == 0 then
		Talk(1,"","C竎 h� ch璦 ng k� kh玭g th� nh薾 ph莕 thng");
	end
	--领奖
	ApplyRelayShareData(Oly_Record3.szKey,Oly_Record3.nKey1,Oly_Record3.nKey2,Oly_CallBack_Script,"oly_CallBack_GetLuckPersonNum");
end

function ExchangeItem()
	nItem = GetItemCount(2,1,30402)
	
	if  IsPlayerDeath() ~= 0 then
		Talk(1,"",Activity_Ds_Name.."Tr筺g th竔 hi謓 t筰 kh玭g th� i v藅 ph萴!")
		return
	end	
	
	if gf_Judge_Room_Weight(2, 200) == 0 then
		Talk(1,"", Activity_Ds_Name.."S鴆 l鵦 ho芻 h祅h trang kh玭g , c竎 h� h穣 s緋 x誴 l筰 nh�.")
		return 
	end

	if nItem < 1 then
		Talk(1,"",Activity_Ds_Name.."C竎 h� kh玭g c� Ng� Th竔 Th竛h H醓 trong ngi!")
		return
	end
	
	if DelItem(2,1,30402,nItem) == 1 then
		gf_AddItemEx2({2,1,30753,nItem}, "Ng� Th竔 Th竛h H醓", "фi Item Ng� Th竔 Th竛h H醓", "nh薾")
		Talk(1,"",Activity_Ds_Name.."C竎 h�  i th祅h c玭g <color=yellow>"..nItem.."<color> Ng� Th竔 Th竛h H醓 sang Ng� S綾 Th竛h H醓 th筩h")
	end
end