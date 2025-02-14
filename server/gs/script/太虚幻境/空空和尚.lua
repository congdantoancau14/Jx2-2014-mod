--2007年2月28日修改
--修改内容：增加太虚首饰任务相关对话
--策划人：沈洋
--代码编写人：村长
Include("\\script\\online\\plant\\tree_head.lua");
Include("\\script\\太虚幻境\\head.lua")
Include("\\script\\太虚幻境\\award.lua")
--太虚任务增加
Include("\\script\\online\\zgc_public_fun.lua")		--村长的公共函数
taixu_jwl_taskID = 998
--结束

--八卦换取数量 对应GetEquipBaGua()返回值，注意返回5为太极
tBaguaNum = {--第2，3，4为物品id，第5位为灵气值81-120需要的数量  第六位灵气值61-80需要的数量
	[1]={"Kh秏",2,1,471,10,10},
	[2]={"Kh玭",2,1,470,10,10},
	[3]={"Ch蕁",2,1,474,9,2},
	[4]={"T鑞",2,1,476,9,2},
	[6]={"C祅",2,1,469,10,10},
	[7]={"礽",2,1,472,10,10},
	[8]={"C蕁",2,1,475,9,3},
	[9]={"Ly",2,1,473,9,3}
	}
tWood = {
	{0,0,0,0,0,0,0,5,5},	--100灵气神木八卦
	{0,0,5,5,0,0,0,0,0},	--100灵气紫金八卦
	{0,0,0,0,0,0,0,0,0},	--80灵气神木八卦
	{0,0,0,0,0,0,0,0,0},	--80灵气紫金八卦
}

function main()
	local tbSay = {}
	local nCount =	mod(GetTask(TSK_THAIHU_DAY),100)
	if nCount >= 6 and floor(GetTask(TSK_THAIHU_DAY)/100) < 1 then
		tinsert(tbSay, "Nh薾 thng ho祅 th祅h 6 l莕 Th竔 H� Huy詎 C秐h/Award_Max");
	end
	tinsert(tbSay, "Th竔 H� Huy詎 C秐h l� sao?/Hewei");
	tinsert(tbSay, "L祄 sao v祇 頲 Th竔 H� Huy詎 C秐h?/Ruhe");
	tinsert(tbSay, "\n>> Xin ch﹏ nh﹏ a v祇 Th竔 H� Huy詎 C秐h\n\n/EnterTx");
--	tinsert(tbSay, "领取太虚般若树种/WantSeed");	
	tinsert(tbSay, "S� d鬾g Th竔 H� B竧 Qu竔 b礽 i ph莕 thng/GetAwardPai");
	tinsert(tbSay, "Ta mu鑞 t╪g c蕄 Trang s鴆 Th竔 H�/taixu_jwl_up_inf");		
	
	if GetLevel() >= 70 then
		tinsert(tbSay, "Ta mu鑞 k輈h ho箃 l鵦 b竧 qu竔 c馻 trang b�/choose_lingqi");
	end
	tinsert(tbSay,"K誸 th骳 i tho筰/do_nothing");
	Say("B莕 o ph鬾g m謓h C鰑 Thi猲 Huy襫 N� n nh﹏ gian  h鉧 m鋓 ngi n Th竔 H� Huy詎 C秐h. Th� ch� xem ra ngi h鱱 duy猲 n y c� chuy謓 g� kh玭g?",
		getn(tbSay),tbSay)
end

function WantSeed()
	if GetPlayerRoute() == 0 then
		Talk(1,"main","Ch璦 gia nh藀 m玭 ph竔 kh玭g 頲 nh薾 h箃 gi鑞g.");
		return 0;
	end;
	local nDate = tonumber(date("%y%m%d"));
	if nDate > 060630 then
		Talk(1,"main","H箃 gi鑞g  b� l蕐 h誸, b籲g h鱱 ph秈 ngh� c竎h kh竎 th玦!");
		return 0;
	end;
	local nHour = tonumber(date("%H"));
	local nMapID = GetWorldPos();
	if nHour ~= 14 and nHour ~= 16 and nHour ~= 20 and nHour ~= 22 then
		SetMapTaskTemp(nMapID,2,0);
		Talk(1,"main","Th阨 gian ph竧 h箃 gi鑞g ch璦 n. <color=yellow>M鏸 ng祔 t� 14h - 16h; 20h - 22h<color> c� th� n ch� ta nh薾 h箃 gi鑞g Th竔 H� B竧 Nh�, s� lng c� h筺 nh�!");
		return 0;
	end;
	if GetLevel() < 10 then
		Talk(1,"","Kinh nghi謒 giang h� ngi c遪 k衜, i ngi r蘮 luy謓 gi醝 r錳 quay l筰!");
		TaskTip("Tr猲 c蕄 10 m韎 c� th� nh薾 h箃 gi鑞g");
		return 0;
	end;
	if GetMapTaskTemp(nMapID,2) >= 10 then
		Talk(1,"main","V� s� lng h箃 gi鑞g c� h筺, b籲g h鱱 khi kh竎 gh� l筰!");
		return 0;
	end;
	local selTab = {
				"Ta mu鑞 c� m閠 h箃 gi鑞g/GiveSeed",
				"Kh玭g h鴑g th�/main",
				}
	Say("S緋 n gi� m� c鯽 Th竔 h�. B莕 o l骳 trc 頲 cao nh﹏ ban t苙g h箃 gi鑞g c﹜ Th竔 H� B竧 Nh�, nay mu鑞 t苙g l筰 cho c竎 anh h飊g, kh玭g bi誸 � ki課 b籲g h鱱 ra sao:",getn(selTab),selTab);
end;

function GiveSeed()
	local nMapID = GetWorldPos();
	local nDate = tonumber(date("%y%m%d"));
	local nHour = tonumber(date("%H"));
	if GetMapTaskTemp(nMapID,2) >= 10 then
		Talk(1,"main","V� s� lng h箃 gi鑞g c� h筺, b籲g h鱱 ng祔 mai h穣 quay l筰!");
		return 0;
	end;
	if GetTask(TASK_GETSEEDDATE) < nDate then
		SetTask(TASK_GETSEEDCOUNT,0);
		SetTask(TASK_GETSEEDHOUR,0);
	end;
	local nGetSeedCount = GetTask(TASK_GETSEEDCOUNT);
	if GetTask(TASK_GETSEEDHOUR) == nHour then
		Talk(1,"","M鏸 l莕 ch� nh薾 頲 1 h箃 gi鑞g, b籲g h鱱 khi kh竎 h穣 quay l筰!");
		return 0;
	end;
	if nGetSeedCount >= 2 then
		Talk(1,"","Xin l鏸! H玬 nay ngi  nh薾 2 h箃 gi鑞g, kh玭g th� nh薾 ti誴!");
		return 0;
	end;
	if AddItem(2,0,398,1) == 1 then
		Msg2Player("B筺 nh薾 頲 1 h箃 gi鑞g c﹜ Th竔 H� B竧 Nh�");
		SetMapTaskTemp(nMapID,2,GetMapTaskTemp(nMapID,2)+1);
		SetTask(TASK_GETSEEDCOUNT,nGetSeedCount+1);
		SetTask(TASK_GETSEEDDATE,nDate);
		SetTask(TASK_GETSEEDHOUR,nHour);
		Talk(1,"","Th阨 gian nh薾 h箃 gi鑞g t� <color=yellow>13h - 14h; 21h - 22h<color>, b籲g h鱱 c� th� n <color=red>Ph� t﹜ Th祅h Й, ph� ng Bi謓 Kinh, B綾 Tuy襫 Ch﹗<color> gieo h箃 gi鑞g. Ngo礽 ra, h箃 gi鑞g  l﹗ s� m蕋 linh kh�, c莕 ph秈 tr錸g trc ng祔 <color=yellow>30/6<color>.")
	end;
end;
--=========================================================以下为太虚任务增加函数===================================================
function taixu_jwl_up_inf()
	local jwl_chk_flag = 0
	for i = 29,35 do
		if GetItemCount(0,102,i) ~= 0 then
			jwl_chk_flag = 1 
			break
		end
	end
	if jwl_chk_flag == 0 then
		Talk(1,"","T╪g c蕄 <color=yellow>Trang s鴆 Th竔 H�<color> hi謚 qu�, ngi"..Zgc_pub_sex_name()..", ngi kh玭g mang theo <color=yellow>Trang s鴆 Th竔 H�<color>�?")
	else
		if GetTask(taixu_jwl_taskID) ~= nil and GetTask(taixu_jwl_taskID) ~= 0 then
			Talk(1,"","V� <color=yellow>Trang s鴆 Th竔 H�<color>,"..Zgc_pub_sex_name().."n猲 n <color=yellow>Tng Dng <color> t譵 <color=yellow>M筩 Tam<color> h醝 nh�, 玭g 蕐 c� th� gi髉 頲 ngi!")
		else
		Talk(4,"taixu_jwl_up_inf_2",
			"V� "..Zgc_pub_sex_name().."c騨g  � n �?",
			"K� th鵦 nh鱪g lo筰 <color=yellow>Trang s鴆 Th竔 H�<color> m� ngi mang n c玭g hi謚 c馻 ch髇g kh玭g cao.",
			"<color=yellow>Trang s鴆 Th竔 H�<color> kh玭g ph竧 huy c玭g l鵦.",
			"Ch糿g l� kh玭g c遪 c竎h n祇  ph竧 huy hi謚 qu� c馻 ch髇g sao? Nh鱪g trang s鴆 n祔 ta ph秈 v蕋 v� l緈 m韎 c� 頲 ch髇g.")
		end
	end
end
function taixu_jwl_up_inf_2()
	Talk(	4,"taixu_jwl_dia_set",
			"<color=green>Th莕 Du Ch﹏ Nh﹏<color>:"..Zgc_pub_sex_name().."ng n鉵g, kh玭g ph秈 l� kh玭g c� c竎h, nh璶g c� 甶襲 ta ch璦 ngh� ra",
			"Ngi mau ngh� ra 甶.",
			"Ngi n <color=yellow>Tng Dng <color> t譵 <color=yellow>M筩 Tam<color>. Ngi  n祔 tinh th玭g ch� thu藅 c� th� gi髉 <color=yellow>Trang s鴆 Th竔 H�<color> c馻 ngi ph竧 huy hi謚 l鵦.",
			" t�  ch� gi竜, ta l藀 t鴆 n ch� <color=yellow>M筩 Tam<color> y.")
end
function taixu_jwl_dia_set()
	TaskTip("B筺  nh薾 nhi謒 v� Trang s鴆 Th竔 H� n Tng Dng t譵 M筩 Tam.")
	SetTask(taixu_jwl_taskID,1)
end
--===================================================================结束==========================================================
function do_nothing()
	--do nothing
end

function choose_lingqi()
	local strtab = {
		"Ta mu鑞 k輈h ho箃 trang b� b竧 qu竔 c� 甶觤 linh kh� di 60/mianfei_jihuo",
		"Ta mu鑞 k輈h ho箃 trang b� b竧 qu� 甶觤 linh kh� 61-79/#jihuo_bagua(2)",
		"Ta mu鑞 k輈h ho箃 trang b� b竧 qu� 甶觤 linh kh� 80-120/#jihuo_bagua(1)",
		"ьi ch髏,  ta xem 甶觤 linh kh� trang b� c馻 ngi/do_nothing"
		}
	Say("Mu鑞 k輈h ho箃 b竧 qu竔 tr猲 trang b�, c莕 Th竔 H� B竧 Qu竔 B礽 tng 鴑g, n誹 a  s� lng ta s� kh輈h ho箃 cho ngi. H穣 ch鋘 tr� linh kh� mu鑞 k輈h ho箃, tr� linh kh� <color=yellow>di 60<color>, ngo礽 trang b� qu� <color=yellow>Ch蕁 v� T鑞<color>, ta c� th� k輈h ho箃 <color=yellow>mi詎 ph�<color> nh鱪g c竔 kh竎 cho ngi. Kho秐g tr� linh kh� l韓 h琻 60 kh竎 nhau s� c莕 s� lng Th竔 H� B竧 Qu竔 kh竎 nhau.",
		getn(strtab),
		strtab)
end

function mianfei_jihuo()
	local strtab = {
		"u/#mianfei_jihuo_weizhi(0)",
		"Y ph鬰/#mianfei_jihuo_weizhi(1)",
		"H� y/#mianfei_jihuo_weizhi(3)",
		"V� kh�/#mianfei_jihuo_weizhi(2)",
		"ьi ta m芻 trang b� c莕 k輈h ho箃 v祇./do_nothing"
		}
	Say("N誹 tr� linh kh� c馻 trang b� t� <color=yellow>60 tr� xu鑞g<color>, k輈h ho箃 <color=yellow>Ch蕁 v� T鑞<color> qu竔 trang b� c莕 <color=yellow>1<color> Th竔 H� B竧 Qu竔 b礽 tng 鴑g, c遪 l筰 ta c� th� k輈h ho箃 mi詎 ph� cho ngi. Ch� �, ta kh玭g r秐h ki觤 tra h祅h trang c馻 ngi, h穣 甧m trang b� c莕 k輈h ho箃 n g苝 ta. Ngi mu鑞 k輈h ho箃 trang b� � b� ph薾 n祇?",
		getn(strtab),
		strtab)
end

function jihuo_bagua(nType)
	local strtab = {};

	if nType == 2 then
		tinsert(strtab,"Ta mu鑞 d飊g "..tBaguaNum[3][6].."M秐h Th竔 H� B竧 Qu竔 b礽-Ch蕁,  k輈h ho箃 Ch蕁 qu竔 trang b�/#check_bagua(3,2)");
		tinsert(strtab,"Ta mu鑞 d飊g "..tBaguaNum[4][6].."M秐h Th竔 H� B竧 Qu竔 b礽-T鑞,  k輈h ho箃 T鑞 qu竔 trang b�/#check_bagua(4,2)");
		tinsert(strtab,"Ta mu鑞 d飊g "..tBaguaNum[1][5].."M秐h Th竔 H� B竧 Qu竔 b礽-Kh秏,  k輈h ho箃 Kh秏 qu竔 trang b�/#check_bagua(1,2)");
		tinsert(strtab,"Ta mu鑞 d飊g "..tBaguaNum[2][5].."M秐h Th竔 H� B竧 Qu竔 b礽-Kh玭,  k輈h ho箃 Kh玭 qu竔 trang b�/#check_bagua(2,2)");
	elseif nType == 1 then
		tinsert(strtab,"Ta mu鑞 d飊g "..tBaguaNum[3][5].."c竔 Th竔 H� B竧 Qu竔 B礽 - Ch蕁 + 5 c竔 T� Kim B竧 Qu竔  k輈h ho箃 m閠 chi誧 trang b� Tr薾 Qu竔/#check_bagua(3,1)");
		tinsert(strtab,"Ta mu鑞 d飊g "..tBaguaNum[4][5].."c竔 Th竔 H� B竧 Qu竔 B礽 - T鑞 + 5 c竔 T� Kim B竧 Qu竔  k輈h ho箃 m閠 chi誧 trang b� T鑞 Qu竔/#check_bagua(4,1)");
		tinsert(strtab,"Ta mu鑞 d飊g "..tBaguaNum[1][5].."M秐h Th竔 H� B竧 Qu竔 b礽-Kh秏,  k輈h ho箃 Kh秏 qu竔 trang b�/#check_bagua(1,1)");
		tinsert(strtab,"Ta mu鑞 d飊g "..tBaguaNum[2][5].."M秐h Th竔 H� B竧 Qu竔 b礽-Kh玭,  k輈h ho箃 Kh玭 qu竔 trang b�/#check_bagua(2,1)");
	end
	tinsert(strtab,"Trang k�/#jihuo_bagua2("..nType..")");
	tinsert(strtab,"Ta kh玭g c� trang b� b竧 qu竔 ch璦 k輈h ho箃./do_nothing");
	Say("Ngi mu鑞 k輈h ho箃 trang b� thu閏 t輓h b竧 qu竔 n祇? Ch� �, ta kh玭g r秐h ki觤 tra h祅h trang c馻 ngi, h穣 甧m trang b� c莕 k輈h ho箃 n g苝 ta.",
		getn(strtab),
		strtab);
end

function mianfei_jihuo_weizhi(nWz)
	local nIndex = GetPlayerEquipIndex(nWz);
	if nIndex == 0 then
		Talk(1,"","Ngi kh玭g m芻 n� tr猲 ngi!");
		return
	end
	if GetEquipBaGua(nIndex) == 0 then
		Talk(1,"","Trang b� ngi 產ng m芻 kh玭g ph秈 trang b� b竧 qu竔 ch璦 k輈h ho箃.");
		return
	end
	local nLingqi = GetItemMaxLingQi(nIndex);
	if GetEquipBaGuaJiHuo(nIndex) ~= 0 then
		Talk(1,"","Trang b� tr猲 ngi ngi  k輈h ho箃 r錳.")
		return
	end
	if nLingqi > 60 then
		Talk(1,"","Tr� linh kh� t� <color=yellow>60 tr� xu鑞g<color>, ta c� th� mi詎 ph� k輈h ho箃 n╪g l鵦 trang b� b竧 qu竔 cho ngi. Nh璶g trang b� b竧 qu竔 ngi 產ng m芻 c莕 Th竔 H� B竧 Qu竔 b礽  k輈h ho箃.");
		return
	elseif nLingqi == 0 then
		Talk(1,"","Trang b� ngi 產ng m芻 kh玭g ph秈 trang b� b竧 qu竔.")
		return
	end
	if GetEquipBaGua(nIndex) == 3 then
		if GetItemCount(tBaguaNum[3][2],tBaguaNum[3][3],tBaguaNum[3][4]) < 1 then
			Talk(1,"","Mu鑞 k輈h ho箃 Ch蕁 qu竔 trang b�, c莕 1 Ch蕁 B祅, ngi kh玭g c� Ch蕁 B祅.");
			return
		else
			Say("Ngi quy誸 nh k輈h ho箃 <color=yellow>Ch蕁<color> qu竔 trang b�? Ti猽 hao 1 Ch蕁 B祅.",
				2,
				"ng, ta mu鑞 k輈h ho箃/#jihuo_zhengua(3,"..nWz..")",
				"в ta suy ngh� l筰/do_nothing")
			return
		end
	end
	if GetEquipBaGua(nIndex) == 4 then
		if GetItemCount(tBaguaNum[4][2],tBaguaNum[4][3],tBaguaNum[4][4]) < 1 then
			Talk(1,"","Mu鑞 k輈h ho箃 T鑞 qu竔 trang b�, c莕 1 T鑞 B祅, ngi kh玭g c� T鑞 B祅.");
			return
		else
			Say("Ngi quy誸 nh k輈h ho箃 <color=yellow>T鑞<color> qu竔 trang b�? Ti猽 hao 1 T鑞 B祅.",
				2,
				"ng, ta mu鑞 k輈h ho箃/#jihuo_zhengua(4,"..nWz..")",
				"в ta suy ngh� l筰/do_nothing")
			return
		end
	end
	if nLingqi > 0 and nLingqi <= 60 and GetEquipBaGuaJiHuo(nIndex) == 0 then
		local tZhuangBei = {"u","Y ph鬰","V� kh�","H� y"};
		SetEquipBaGuaJiHuo(nIndex,1);
		Msg2Player("Ch骳 m鮪g b筺  k輈h ho箃."..tZhuangBei[nWz+1].."Trang b� thu閏 t輓h b竧 qu竔");
	end
end

function check_bagua(nType,nLqType)
	if nLqType == 1 then
		if GetItemCount(tBaguaNum[nType][2],tBaguaNum[nType][3],tBaguaNum[nType][4]) < tBaguaNum[nType][5] then
			Talk(1,"","thu th藀  Th竔 H� B竧 Qu竔 b礽 r錳 quay l筰 t譵 ta, b蕐 nhi猽  sao c� th� k輈h ho箃.");
			return
		end
	elseif nLqType == 2 then
		if GetItemCount(tBaguaNum[nType][2],tBaguaNum[nType][3],tBaguaNum[nType][4]) < tBaguaNum[nType][6] then
			Talk(1,"","thu th藀  Th竔 H� B竧 Qu竔 b礽 r錳 quay l筰 t譵 ta, b蕐 nhi猽  sao c� th� k輈h ho箃.");
			return
		end
	end
	local nCount1 = tWood[nLqType * 2 - 1][nType];
	if GetItemCount(2,95,550) < nCount1 then
		Talk(1, "", "<color=green>Th莕 Du Tr﹏ Nh﹏<color>: c�  Th莕 M閏 B竧 Qu竔  r錳 n g苝 t玦, ch� c� m蕐 c竔 n祔 l祄 sao k輈h ho箃 頲.");
		return
	end
	local nCount2 = tWood[nLqType * 2][nType];
	if GetItemCount(2,95,551) < nCount2 then
		Talk(1, "", "<color=green>Th莕 Du Tr﹏ Nh﹏<color>: c�  T� Kim B竧 Qu竔  r錳 n g苝 t玦, ch� c� m蕐 c竔 n祔 l祄 sao k輈h ho箃 頲.");
		return
	end
		local nMaoziIndex = GetPlayerEquipIndex(0);
		local nYifuIndex = GetPlayerEquipIndex(1);
		local nKuziIndex = GetPlayerEquipIndex(3);
		local nWuqiIndex = GetPlayerEquipIndex(2);
		local strtab = {} ;
		if GetEquipBaGua(nMaoziIndex) == nType and GetEquipBaGuaJiHuo(nMaoziIndex) == 0 then
			tinsert(strtab,"u/#item_jihuo("..nMaoziIndex..","..nLqType..","..nType..")");
		end
		if GetEquipBaGua(nYifuIndex) == nType and GetEquipBaGuaJiHuo(nYifuIndex) == 0 then
			tinsert(strtab,"Y ph鬰/#item_jihuo("..nYifuIndex..","..nLqType..","..nType..")");
		end
		if GetEquipBaGua(nKuziIndex) == nType and GetEquipBaGuaJiHuo(nKuziIndex) == 0 then
			tinsert(strtab,"H� y/#item_jihuo("..nKuziIndex..","..nLqType..","..nType..")");
		end
		if GetEquipBaGua(nWuqiIndex) == nType and GetEquipBaGuaJiHuo(nWuqiIndex) == 0 then
			tinsert(strtab,"V� kh�/#item_jihuo("..nWuqiIndex..","..nLqType..","..nType..")");
		end
		if getn(strtab) == 0 then
			Talk(1,"","Ngi kh玭g c� trang b� ch璦 k輈h ho箃 tng 鴑g v韎 thu閏 t輓h b竧 qu竔 n祔.");
		else
			tinsert(strtab,"Th玦 ta kh玭g k輈h ho箃 n鱝./do_nothing");
			Say("Ngi quy誸 nh k輈h ho箃 thu閏 t輓h b竧 qu竔 n祇? H穣 ch鋘 trang b� c莕 k輈h ho箃 tr猲 ngi ngi.",getn(strtab),strtab) --..tBaguaNum[nType][1].."
		end
end

function jihuo_bagua2(nType)
	if nType == 1 then
		local strtab = {
			"Ta mu鑞 d飊g "..tBaguaNum[6][5].."M秐h Th竔 H� B竧 Qu竔 b礽-C祅,  k輈h ho箃 C祅 qu竔 trang b�/#check_bagua(6,1)",
			"Ta mu鑞 d飊g "..tBaguaNum[7][5].."M秐h Th竔 H� B竧 Qu竔 b礽-礽,  k輈h ho箃 礽 qu竔 trang b�/#check_bagua(7,1)",
			"Ta mu鑞 d飊g "..tBaguaNum[8][5].."c竔 Th竔 H� B竧 Qu竔 B礽 - C蕁 + 5 c竔 Th莕 M閏 B竧 Qu竔  k輈h ho箃 m閠 chi誧 trang b� C蕁 Qu竔/#check_bagua(8,1)",
			"Ta mu鑞 d飊g "..tBaguaNum[9][5].."c竔 Th竔 H� B竧 Qu竔 B礽 - Ly + 5 c竔 Th莕 M閏 B竧 Qu竔  k輈h ho箃 m閠 chi誧 trang b� Ly Qu竔/#check_bagua(9,1)",
			"Trang trc/#jihuo_bagua("..nType..")",
			"Ta kh玭g c� trang b� b竧 qu竔 ch璦 k輈h ho箃./do_nothing"
			}
		Say("Ngi mu鑞 k輈h ho箃 trang b� thu閏 t輓h b竧 qu竔 n祇? Ch� �, ta kh玭g r秐h ki觤 tra h祅h trang c馻 ngi, h穣 甧m trang b� c莕 k輈h ho箃 n g苝 ta.",
			getn(strtab),
			strtab);
	elseif nType == 2 then
		local strtab = {
			"Ta mu鑞 d飊g "..tBaguaNum[6][6].."M秐h Th竔 H� B竧 Qu竔 b礽-C祅,  k輈h ho箃 C祅 qu竔 trang b�/#check_bagua(6,2)",
			"Ta mu鑞 d飊g "..tBaguaNum[7][6].."M秐h Th竔 H� B竧 Qu竔 b礽-礽,  k輈h ho箃 礽 qu竔 trang b�/#check_bagua(7,2)",
			"Ta mu鑞 d飊g "..tBaguaNum[8][6].."M秐h Th竔 H� B竧 Qu竔 b礽-C蕁,  k輈h ho箃 C蕁 qu竔 trang b�/#check_bagua(8,2)",
			"Ta mu鑞 d飊g "..tBaguaNum[9][6].."M秐h Th竔 H� B竧 Qu竔 b礽-Ly,  k輈h ho箃 Ly qu竔 trang b�/#check_bagua(9,2)",
			"Trang trc/#jihuo_bagua("..nType..")",
			"Ta kh玭g c� trang b� b竧 qu竔 ch璦 k輈h ho箃./do_nothing"
			}
		Say("Ngi mu鑞 k輈h ho箃 trang b� thu閏 t輓h b竧 qu竔 n祇? Ch� �, ta kh玭g r秐h ki觤 tra h祅h trang c馻 ngi, h穣 甧m trang b� c莕 k輈h ho箃 n g苝 ta.",
			getn(strtab),
			strtab);
	end
end

function item_jihuo(nIndex,nLqType,nType)
	local tZhuangBei = {"u","Y ph鬰","V� kh�","H� y"};
	local nLingqi = GetItemMaxLingQi(nIndex);
	if nLqType == 1 then
		if nLingqi < 80 or nLingqi > 120 then
			Talk(1,"","Sai r錳, linh kh� trang b� c馻 ngi kh玭g ph秈 t� 80-120.");
			return
		end
	end
	if nLqType == 2 then
		if nLingqi <= 60 or nLingqi >= 80 then
			Talk(1,"","Sai r錳, linh kh� trang b� c馻 ngi kh玭g ph秈 t� 60-80.");
			return
		end
	end

	local nCount1 = tWood[nLqType * 2 - 1][nType];
	if nCount1 > 0 and DelItem(2,95,550, nCount1) ~= 1 then
		Talk(1, "", "<color=green>Th莕 Du Tr﹏ Nh﹏<color>: c�  Th莕 M閏 B竧 Qu竔  r錳 n g苝 t玦, ch� c� m蕐 c竔 n祔 l祄 sao k輈h ho箃 頲.");
		return
	end
	local nCount2 = tWood[nLqType * 2][nType];
	if nCount2 > 0 and DelItem(2,95,551, nCount2) ~= 1 then
		Talk(1, "", "<color=green>Th莕 Du Tr﹏ Nh﹏<color>: c�  T� Kim B竧 Qu竔  r錳 n g苝 t玦, ch� c� m蕐 c竔 n祔 l祄 sao k輈h ho箃 頲.");
		return
	end

	if nLqType == 1 then
		if DelItem(tBaguaNum[GetEquipBaGua(nIndex)][2],tBaguaNum[GetEquipBaGua(nIndex)][3],tBaguaNum[GetEquipBaGua(nIndex)][4],tBaguaNum[GetEquipBaGua(nIndex)][5]) == 1 then
			for i=1,4 do
				if GetPlayerEquipIndex(i-1) == nIndex then
				  SetEquipBaGuaJiHuo(nIndex,1);
					Msg2Player("Ch骳 m鮪g b筺  k輈h ho箃."..tZhuangBei[i].."Trang b� thu閏 t輓h b竧 qu竔");
					break;
				end
			end
		end
	elseif nLqType == 2 then
		if DelItem(tBaguaNum[GetEquipBaGua(nIndex)][2],tBaguaNum[GetEquipBaGua(nIndex)][3],tBaguaNum[GetEquipBaGua(nIndex)][4],tBaguaNum[GetEquipBaGua(nIndex)][6]) == 1 then
			for i=1,4 do
				if GetPlayerEquipIndex(i-1) == nIndex then
					SetEquipBaGuaJiHuo(nIndex,1);
					Msg2Player("Ch骳 m鮪g b筺  k輈h ho箃."..tZhuangBei[i].."Trang b� thu閏 t輓h b竧 qu竔");
					break;
				end
			end
		end
	end
end

function jihuo_zhengua(nType,nWz)
	local nIndex = GetPlayerEquipIndex(nWz);
	if DelItem(tBaguaNum[nType][2],tBaguaNum[nType][3],tBaguaNum[nType][4],1) == 1 then
		local tZhuangBei = {"u","Y ph鬰","V� kh�","H� y"};
		SetEquipBaGuaJiHuo(nIndex,1);
		Msg2Player("Ch骳 m鮪g b筺  k輈h ho箃."..tZhuangBei[nWz+1].."Trang b� thu閏 t輓h b竧 qu竔");
	end
end