--File name:laborday_head.lua
--Describe:劳动节活动脚本头文件
--Create Date:2006-4-3
--Author:yanjun
Include("\\script\\lib\\string.lua");
--全局常量
FALSE = 0;	--相信定义这样的常量会使代码容易理解一点吧
TRUE = 1;
-- Original data -- Added 22/08/2020
-- START_DATE = 20060428
-- STATE_1_DATE = 20060507
-- STATE_2_DATE = 20060514
-- Modified data -- Added 22/08/2020
START_DATE = 07
STATE_1_DATE = 14
STATE_2_DATE = 28

tNpcName = {
		"Nh� bu玭 T� B秓 Trai",
		"g ch� T� B秓 Trai",
		"S竎h c玭g lao T� B秓 Trai",
		};

tNumTab = {	--要不要用大写呢？壹贰叁肆伍陆柒捌镹
		"Th藀",
		"ch輓",
		"t竚",
		"b秠",
		"s竨",
		"Ng� ",
		"b鑞",
		"ba",
		"hai",
		"m閠",
		};

ItemTab = {
	{2,1,322,1,"C竛h A Tu La"},--1
	{2,1,26,20,"竚 Y猲"},--2
	{2,1,82,1,"Quy Hoa K輓h"},--3
	{2,1,156,1,"Tr鴑g B筩h 猽"},--4
	{2,1,314,1,"B筩h L﹏"},--5
	{2,1,170,20,"B筩h Ng� L﹏"},--6
	{2,1,93,20,"V遪g B筩h Ng鋍"},--7
	{2,1,81,20,"B筩h V﹏ b玦"},--8
	{2,1,40,20,"Thng g穣"},--9
	{2,1,29,20,"B秓 B譶h"},--10
	{2,1,326,1,"B輈h Ng鋍 gi韎 ch�"},--11
	{2,1,18,1,"C竛h d琲"},--12
	{2,1,46,20,"B輓h M閏 B礽"},--13
	{2,1,303,20,"G╪g tay"},--14
	{2,1,299,20,"T祅 ki誱"},--15
	{2,1,301,20,"T祅 thng"},--16
	{2,1,166,20,"da Thng Vi猲"},--17
	{2,1,43,20,"Th秓 h礽"},--18
	{2,1,55,20,"B譶h tr�"},--19
	{2,1,288,20,"Trng 產o"},--20
	{2,1,193,1,"Tranh M筩 H醓 Di謒"},--21
	{2,1,189,1,"Tranh S綾 Y猲 Hoa"},--22
	{2,1,320,1,"Xi H醓 Trng 蕁"},--23
	{2,1,169,20,"Xi H醓 c玭"},--24
	{2,1,282,20,"Xi H醓 M藅 T輓"},--25
	{2,1,321,1,"Xi H醓 Th竛h 蕁"},--26
	{2,1,313,1,"Xi H醓 蕁"},--27
	{2,1,191,1,"X輈h M筩 H醓 Di謒"},--28
	{2,1,6,20,"No穘 tr飊g"},--29
	{2,1,317,1,"Th� b� Trng B祇"},--30
	{2,1,295,20,"Чi Cang 產o"},--31
	{2,1,67,20,"Чi T鑞g a ch�"},--32
	{2,1,312,1,"Чi Thi誸 Ba"},--33
	{2,1,297,20,"Da voi"},--34
	{2,1,330,1,"Чi Tu Vi猲 K輓h"},--35
	{2,1,21,20,"Bao 產o"},--36
	{2,1,59,20,"nh M閏 B礽"},--37
	{2,1,73,20,"nh Ba"},--38
	{2,1,100,1,"Йng L╪g"},--39
	{2,1,162,20,"D穒 c鉩"},--40
	{2,1,176,20,"чc Phong th輈h"},--41
	{2,1,324,1,"祅 Th鮝  th� th�"},--42
	{2,1,161,20,"Ng筩 v� c鑤"},--43
	{2,1,180,1,"Ng筩 Ng� Nh穘 C莡"},--44
	{2,1,13,20,"T� ong"},--45
	{2,1,304,20,"Ph藅 Kinh"},--46
	{2,1,302,20,"Ph� 蕁"},--47
	{2,1,308,1,"H� C鑤"},--48
	{2,1,315,1,"Lng kh�"},--49
	{2,1,327,1,"D﹜ th衟"},--50
	{2,1,70,20,"Canh M閏 B礽"},--51
	{2,1,56,10,"C玭g V╪"},--52
	{2,1,63,20,"M鉩 C﹗"},--53
	{2,1,290,20,"Tranh ch�"},--54
	{2,1,160,1,"Qu竔 d� th筩h"},--55
	{2,1,34,20,"Quan ph鬰"},--56
	{2,1,92,20,"Qu� H錸"},--57
	{2,1,179,1,"Qu� u Trng"},--58
	{2,1,32,1,"H錸g Tinh"},--59
	{2,1,300,20,"T� n"},--60
	{2,1,171,20,"H錸g ng� l﹏"},--61
	{2,1,16,20,"H莡 Nhi Qu�"},--62
	{2,1,155,20,"L玭g c竜"},--63
	{2,1,104,1,"H� ph�"},--64
	{2,1,292,20,"Da h�"},--65
	{2,1,19,20,"H� v�"},--66
	{2,1,84,1,"H� Ph竎h"},--67
	{2,1,284,20,"H� Ph竝 L謓h B礽"},--68
	{2,1,90,1,"Nh蒼 H� Ph藅"},--69
	{2,1,310,1,"Hoa Ban H� 謕"},--70
	{2,1,99,1,"Huy詎 Quang"},--71
	{2,1,107,1,"Ho祅g д N閕 Kinh"},--72
	{2,1,48,1,"玦 H� v祅g"},--73
	{2,1,69,20,"Ho祅g Kim Ban Ch�"},--74
	{2,1,318,1,"C錸"},--75
	{2,1,178,10,"H醓 秐h Th莕 產o"},--76
	{2,1,319,1,"C竛h Ph鬾g Ho祅g"},--77
	{2,1,36,20,"Gia Ph竝 b鎛g"},--78
	{2,1,272,20,"X竎 gi竝 tr飊g"},--79
	{2,1,177,20,"Gi竝 x竎 phi課"},--80
	{2,1,25,20,"Gi竝 M閏 B礽"},--81
	{2,1,80,20,"Ki誱 H錸"},--82
	{2,1,41,20,"Kim Thoa"},--83
	{2,1,79,1,"Kim X鴑g X�"},--84
	{2,1,86,1,"Kim Cang"},--85
	{2,1,329,1,"u l﹗ Kh萵 Na La"},--86
	{2,1,44,20,"T鰑 B玦"},--87
	{2,1,85,20,"Qu� M閏 B礽"},--88
	{2,1,192,1,"Lam M筩 H醓 Di謒"},--89
	{2,1,190,1,"Lam S綾 Y猲 Hoa"},--90
	{2,1,37,1,"Lang H錸"},--91
	{2,1,5,20,"L玭g s鉯"},--92
	{2,1,187,10,"Linh мch"},--93
	{2,1,184,10,"Linh Qu�"},--94
	{2,1,186,10,"Linh C莔"},--95
	{2,1,185,10,"Linh T秐"},--96
	{2,1,183,10,"Linh Ti猽"},--97
	{2,1,74,1,"Bao tay Da hu"},--98
	{2,1,62,20,"L鬰 Ph竎h"},--99
	{2,1,91,1,"L鬰 Tr�"},--100
	{2,1,287,20,"Mao Ng璾 b�"},--101
	{2,1,311,1,"Minh H醓 Ph�"},--102
	{2,1,323,1,"u l﹗ Ma H� La Ca"},--103
	{2,1,76,20,"M蓇 Кn"},--104
	{2,1,31,20,"M閏 Th�"},--105
	{2,1,75,20,"M鬰 L玦 V╪ o"},--106
	{2,1,28,20,"Tr鴑g chim"},--107
	{2,1,65,20,"B莡 ru da d�"},--108
	{2,1,279,20,"Ch譨 kh鉧 s総"},--109
	{2,1,278,20,"Ch譨 kh鉧 ng"},--110
	{2,1,280,20,"Ch譨 kh鉧 b筩"},--111
	{2,1,172,1,"D� o"},--112
	{2,1,154,1,"Ng鋍 Kh�"},--113
	{2,1,157,20,"Cung"},--114
	{2,1,106,10,"V秠 K� L﹏"},--115
	{2,1,17,20,"Thanh Kim"},--116
	{2,1,102,1,"Nh﹏ у Ph�"},--117
	{2,1,83,20,"Nh﹎ M閏 B礽"},--118
	{2,1,195,1,"S竧 Th� L謓h"},--119
	{2,1,97,20,"Thng H祅 lu薾"},--120
	{2,1,38,20,"H祅g h鉧"},--121
	{2,1,8,1,"L玭g s鉯 thng ng"},--122
	{2,1,14,1,"Nanh heo thng h筺g"},--123
	{2,1,35,20,"B竛h nng"},--124
	{2,1,12,20,"Thi猽 t鰑"},--125
	{2,1,194,1,"Th莕 b� Y猲 Hoa"},--126
	{2,1,181,1,"Th莕 b� ph�"},--127
	{2,1,182,1,"Ki誱 th莕 b�"},--128
	{2,1,49,20,"Th莕 Ma ch�"},--129
	{2,1,298,20,"Thu鑓 n�"},--130
	{2,1,276,20,"M莔 Th鵦 nh﹏ th秓"},--131
	{2,1,50,20,"Th� C鑤"},--132
	{2,1,57,20,"H閜 trang s鴆"},--133
	{2,1,24,20,"S璾 Th莕 K�"},--134
	{2,1,293,20,"To竔 c鑤"},--135
	{2,1,316,1,"To竔 th筩h"},--136
	{2,1,168,20,"Ng﹏ thng h醤g"},--137
	{2,1,101,1,"M苩 n� Thi猲 Vng"},--138
	{2,1,158,20,"M秐h b秐  Thi猲  gi竜"},--139
	{2,1,159,20,"Thi猲  M藅 T輓"},--140
	{2,1,71,20,"Thi誸 B竧 Qu竔"},--141
	{2,1,10,20,"Thi誸 Ban Ch�"},--142
	{2,1,47,20,"Thi誸 Xoa"},--143
	{2,1,61,20,"D﹜ x輈h"},--144
	{2,1,20,20,"Thi誸 Thng u"},--145
	{2,1,30,20,"уng ki誱"},--146
	{2,1,42,20,"Mi課g ng"},--147
	{2,1,3,20,"R╪g s鉯"},--148
	{2,1,4,1,"Th� Nhi Qu�"},--149
	{2,1,2,20,"玦 th�"},--150
	{2,1,23,20,"Th鑙 C鑤"},--151
	{2,1,305,20,"У La trng"},--152
	{2,1,103,1,"B譶h  d辌h"},--153
	{2,1,274,20,"C竛h mu鏸"},--154
	{2,1,9,20,"V蕁 L� th筩h"},--155
	{2,1,273,20,"Ch﹏ r誸"},--156
	{2,1,105,1,"V� Kinh T鎛g Y誹"},--157
	{2,1,173,20,"V� s� 產o"},--158
	{2,1,175,20,"M苩 n� V� s�"},--159
	{2,1,174,20,"V� s� y猽 i"},--160
	{2,1,64,20,"M藆 M閏 B礽"},--161
	{2,1,58,20,"C竛h d琲"},--162
	{2,1,89,20,"T� Ng璾 Cung"},--163
	{2,1,98,20,"Kh� S琻 ch�"},--164
	{2,1,277,20,"玦 чc t輈h"},--165
	{2,1,309,1,"Ti觰 чc Nang"},--166
	{2,1,289,20,"Kh╪ tay"},--167
	{2,1,163,20,"H箃 Ch﹎"},--168
	{2,1,94,20,"T� Ph藅 Ban Ch�"},--169
	{2,1,77,20,"T﹏ M閏 B礽"},--170
	{2,1,296,20,"R╪g Tinh Tinh"},--171
	{2,1,15,20,"G蕀 lam"},--172
	{2,1,78,1,"H飊g V╪"},--173
	{2,1,54,20,"G蕀 v祅g"},--174
	{2,1,11,20,"T� hoa h礽"},--175
	{2,1,95,1,"Tuy誸 Hoa Gi韎 C�"},--176
	{2,1,22,20,"Tuy誸 Tinh"},--177
	{2,1,45,20,"Tuy誸 Ph竎h"},--178
	{2,1,286,20,"Huy誸 bao"},--179
	{2,1,307,1,"Huy誸 L﹏"},--180
	{2,1,285,20,"Huy誸 Nha v�"},--181
	{2,1,306,1,"H閜 trang 甶觤"},--182
	{2,1,60,20,"B莡 ru da d�"},--183
	{2,1,7,20,"Nanh heo r鮪g"},--184
	{2,1,39,1,"D� Minh Ch﹗"},--185
	{2,1,328,1,"Tr祅g h箃"},--186
	{2,1,331,1,"Nh蕋 Dng Ch� T祅 chng 2"},--187
	{2,1,53,20,"Di T綾 Chung"},--188
	{2,1,33,20,"蕋 M閏 B礽"},--189
	{2,1,66,20,"D� M閏 B礽"},--190
	{2,1,164,20,"D� T閏 Qu秈 Li猲"},--191
	{2,1,165,1,"D� T閏 b� ngoa"},--192
	{2,1,27,20," Ph竎h"},--193
	{2,1,294,20," dng k輓h"},--194
	{2,1,167,20,"Ng﹏ H� n"},--195
	{2,1,72,1,"蕁 Th筩h"},--196
	{2,1,51,20,"U H錸"},--197
	{2,1,291,20,"V� nhung"},--198
	{2,1,88,20,"B譶h Ng鋍"},--199
	{2,1,87,20,"Ng鋍 Nh� �"},--200
	{2,1,68,20,"Ch﹎ c鴘 ng nh﹏"},--201
	{2,1,52,20,"Tr穖 T鰑"},--202
	{2,1,96,20,"Ch� Nam Ng�"},--203
}
g_TotalItemNum = getn(ItemTab);

PrizeTab = {	--奖励内容
	{"觤 kinh nghi謒 v� danh v鋘g.",5000,5},	--EXP5000	声望5
	{"觤 kinh nghi謒, danh v鋘g v� 1 Quy觧 m藅 t辌h.",50000,10,{{1,50},{2,100}}},	--EXP50000	声望10	随机一本秘籍
	{"觤 kinh nghi謒, danh v鋘g, 1 Quy觧 m藅 t辌h v� Thi猲 th筩h.",200000,10,{{1,40},{2,80},{3,100}},3},	--EXP200000	声望20	随机一本秘籍	陨铁3个
	{"觤 kinh nghi謒, danh v鋘g, 1 Quy觧 m藅 t辌h v� Thi猲 th筩h.",1000000,30,{{1,15},{2,30},{3,60},{4,80},{5,100}},3},	--EXP1000000	声望30	随机一本秘籍	陨铁3个
	{"觤 kinh nghi謒, danh v鋘g, 1 Quy觧 m藅 t辌h v� Thi猲 th筩h.",3000000,50,{{3,20},{4,40},{5,60},{6,80},{7,90},{8,100}},8},	--EXP3000000	声望50	随机一本秘籍	陨铁8个
	{"觤 kinh nghi謒, danh v鋘g, 1 Quy觧 m藅 t辌h v� Thi猲 th筩h.",7000000,100,{{6,20},{7,50},{8,80},{9,100}},15},	--EXP7000000	声望100	随机一本秘籍	陨铁15个
	{"觤 kinh nghi謒, danh v鋘g, 1 Quy觧 m藅 t辌h v� Thi猲 th筩h.",15000000,150,{{6,20},{7,50},{8,80},{9,100}},30},	--EXP15000000	声望150	随机一本秘籍	陨铁30个
	{"觤 kinh nghi謒, danh v鋘g, Thi猲 th筩h, c鵦 ph萴 m藅 t辌h v� n鉵 c鵦 ph萴.",20000000,200,{{6,20},{7,50},{8,80},{9,100}},40,1},	--EXP20000000	声望200	随机一本秘籍	陨铁40个	固定属性帽子
	{"觤 kinh nghi謒, danh v鋘g, Thi猲 th筩h, c鵦 ph萴 m藅 t辌h v� qu莕 c鵦 ph萴.",30000000,300,{{7,35},{8,70},{9,100}},50,2},	--EXP30000000	声望300	随机一本秘籍	陨铁50个	固定属性裤子
	{"觤 kinh nghi謒, danh v鋘g, Thi猲 th筩h, c鵦 ph萴 m藅 t辌h v� v� kh� c鵦 ph萴.",50000000,500,{{7,30},{8,60},{9,80},{10,100}},60,3},	--EXP50000000	声望500	随机一本秘籍	陨铁60个	固定属性武器
	};

BookTab = {
	{0,107,57,"T� Nguy謓 C玭g Ph�"},--1
	{0,107,58,"Huy襫 Th筩h C玭g Ph�"},--2
	{0,107,59,"Kim Thi襫 Ph�"},--3
	{0,107,61,"B� Kim M藅 t辌h"},--4
	{0,107,62,"B� Th筩h M藅 t辌h"},--5
	{0,107,63,"Ng� Qu� M藅 t辌h"},--6
	{0,107,64,"Thi猲 H� M藅 t辌h"},--7
	{0,107,65,"T� H� M藅 t辌h"},--8
	{0,107,66,"Chi猰 y ph�"},--9
	{0,107,155,"Ng� H祅h M藅 t辌h"},--10
	}

--任务变量号
LABORDAY_ITEM_BEGIN = 1877;	--记录上交过的物品
LABORDAY_ITEM2 		= 1878;
LABORDAY_ITEM3 		= 1879;
LABORDAY_ITEM4 		= 1880;
LABORDAY_ITEM5 		= 1881;
LABORDAY_ITEM6 		= 1882;
LABORDAY_ITEM_END  	= 1883;

ITEMNUM = 1884; --记录玩家上交的材料的数量
GET_PRIZE = 1885;	--记录玩家领取奖励的情况。1字节记录领取日期，2字节记录四奖领取次数，3字节记录五奖领取次数，4字节记录六奖领取次数
GET_PRIZE2 = 1886 	--记录玩家领取奖励的情况。1字节记录七奖领取次数，2字节记录八奖领取次数，3字节记录九奖领取次数，4字节记录十奖领取次数
BIG_PRIZE = 1887;	--记录玩家领取大奖的情况。1字节是一奖，2字节是二奖，3字节是3奖，4字节是免打扰标记
TSK_LABORDAY_WEEK = 1356; --记录周的序数 取代上面1885变量的第一字节

tPrizeMapByte = {	--奖励类型与任务变量字节的对应关系
			{GET_PRIZE2,4},	--类型1对应GET_PRIZE2的第4个字节(十奖)
			{GET_PRIZE2,3},	--类型2对应GET_PRIZE2的第3个字节(九奖)
			{GET_PRIZE2,2},	--类型3对应GET_PRIZE2的第2个字节(八奖)
			{GET_PRIZE2,1},	--类型4对应GET_PRIZE2的第1个字节(七奖)
			{GET_PRIZE,4},	--类型5对应GET_PRIZE的第4个字节(六奖)
			{GET_PRIZE,3},	--类型6对应GET_PRIZE的第3个字节(五奖)
			{GET_PRIZE,2},	--类型7对应GET_PRIZE的第2个字节(四奖)
			{BIG_PRIZE,3},	--类型8对应BIG_PRIZE的第3个字节(三奖)
			{BIG_PRIZE,2},	--类型9对应BIG_PRIZE的第2个字节(二奖)
			{BIG_PRIZE,1},	--类型10对应BIG_PRIZE的第1个字节(一奖)
			};
			
tPrizeJifen = { --奖励对应的次数（每周）和换取的积分
	{1,35},{1,30},{1,22},{1,20},{1,18},{1,15},{1,12},{1,10},{1,8},{1,5}
};			
--=============================================================================================
--==================================相关函数===================================================
--判断当前的节日状态
function Get_Laborday_State()	
	-- local nDate = tonumber(date("%Y%m%d"));
	local nDate = tonumber(date("%d"));
	if nDate < START_DATE then
		return 0;	--活动未开始
	elseif nDate > STATE_2_DATE then
		return 3;	--领奖截止
	elseif nDate > STATE_1_DATE  then
	 	return 2;	--截止材料收集
	else 
		return 1;	--正处于活动期间（既能上交物品也能换取奖励）
	end; 
end;
--得到玩家身上某样物品的数量
function Get_Item_Count(nItemNo)
	return GetItemCount(ItemTab[nItemNo][1],ItemTab[nItemNo][2],ItemTab[nItemNo][3]);
end;
--上交一样物品。物品对应位置1,上交物品计数加1
function Hand_In_Item(nItemNo)
	local nGroup = floor((nItemNo-1)/30);
	local nBit = mod((nItemNo-1),30)+1;
	if GetBit(GetTask(LABORDAY_ITEM_BEGIN+nGroup),nBit) == 1 then	--已交过这种材料
		return FALSE;
	end;
	if Get_Item_Count(nItemNo) < ItemTab[nItemNo][4] then	--数量不够
		return FALSE;
	end;
	if DelItem(ItemTab[nItemNo][1],ItemTab[nItemNo][2],ItemTab[nItemNo][3],ItemTab[nItemNo][4]) == 1 then
		SetTask(LABORDAY_ITEM_BEGIN+nGroup,SetBit(GetTask(LABORDAY_ITEM_BEGIN+nGroup),nBit,1));
		SetTask(ITEMNUM,GetTask(ITEMNUM)+1);
		return TRUE;
	else
		return FALSE;
	end;
end;
--领取奖励后清除所有上交情况的状态
function Clear_HandIn_State()
	for i=LABORDAY_ITEM_BEGIN,LABORDAY_ITEM_END do
		SetTask(i,0);
	end;
	SetTask(ITEMNUM,0);
end;
--得到所上交的材料的字符串Table
function Get_Info_Table(nType)
	local nGroup = 0;
	local nBit = 0;
	local sContent = "";
	local nTab = 0;
	for i=1,g_TotalItemNum do
		nGroup = floor((i-1)/30);
		nBit = mod(i-1,30)+1;
		if mod(i,31) ~=0 or mod(i,32) ~= 0 then
			if GetBit(GetTask(LABORDAY_ITEM_BEGIN+nGroup),nBit) == nType then
				nTab = nTab + 1;
				if mod(nTab,50) == 0 then
					sContent = sContent..ItemTab[i][5].."|";
				else
					sContent = sContent..ItemTab[i][5]..", ";
				end;
			end;
		end;
	end;
	sContent = strsub(sContent,1,strlen(sContent)-2);
	return split(sContent,"|");
end;

--自定义写日志函数。第一个参数为事件名，第二个参数为事件内容
function Write_Log(Event,Content)	
	WriteLog("["..Event.."]:"..GetName()..Content);
end;

--得到玩家的性别字符串。从\script\task\world\task_head.lua里面copy过来的。
--Copyright◎2005peres
function GetPlayerSex()	
	local mySex -- 用以显示人物性别的字符
	if (GetSex() == 1) then
		mySex = "Thi誹 hi謕";
	elseif (GetSex() == 2) then
		mySex = "C� nng";
	end;
	return mySex;
end;

--设置某任务变量的某一字节的值
function Set_Task_Byte(TaskID,Byte,Value)	
	SetTask(TaskID,SetByte(GetTask(TaskID),Byte,Value));
	return GetTask(TaskID);
end;

--得到某任务变量某一字节的值
function Get_Task_Byte(TaskID,Byte)	
	return GetByte(GetTask(TaskID),Byte);
end;
--活动详细说明。输入参数指明是哪一个NPC
function knowdetail(npcNo)
	local sCmd = "main";
	if npcNo == 3 then
		sCmd = "OnUse";
	end;
	Talk(1,sCmd,"<color=green>"..tNpcName[npcNo]..": <color>G莕 y b鎛 ti謒 chu萵 b� thu th藀 nh鱪g b秓 v藅 trong giang h�, v藅 thu th藀 s� thu th藀 theo nh鉳 v韎 s� lng kh玭g b籲g nhau. Sau khi giao n閜  s� lng s� nh薾 頲 ph莕 thng. Ng礽 c� th� nh薾 l蕐 1 quy觧 s竎h c玭g lao T� B秓 Trai, c� ghi r� danh m鬰 v藅 thu th藀, ph莕 thng c� th� nh薾 l蕐. H穣 n Tng Dng, Dng Ch﹗ g苝 g ch� T� B秓 Trai  i ph莕 thng. ");
end;
--介绍换取奖励规则。输入参数同上
function knowrule(npcNo)
	local sCmd = "main";
	if npcNo == 3 then
		sCmd = "OnUse";
	end;
	local selTab = {
			"Trang k�/#nextrule1("..npcNo..")",
			"Quay l筰 i tho筰 ch輓h./"..sCmd,
			"K誸 th骳 i tho筰/nothing",
			};
	local sContent = "";
	local rule10 = "<color=green>Ph莕 thng 10<color>: N閜 7 lo筰 c� th� i "..tPrizeJifen[10][2].." 甶觤 t輈h l騳, m鏸 tu莕 c� th� i "..tPrizeJifen[10][1].." l莕<enter>";
	local rule9 = "<color=green>Ph莕 thng 9<color>: N閜 1-7 lo筰 c� th� i "..tPrizeJifen[9][2].." 甶觤 t輈h l騳, m鏸 tu莕 c� th� i "..tPrizeJifen[9][1].." l莕<enter>";
	local rule8 = "<color=green>Ph莕 thng 8<color>: N閜 31 lo筰 c� th� i "..tPrizeJifen[8][2].." 甶觤 t輈h l騳, m鏸 tu莕 c� th� i "..tPrizeJifen[8][1].." l莕<enter>";
	local rule7 = "<color=green>Ph莕 thng 7<color>: N閜 60 lo筰 c� th� i "..tPrizeJifen[7][2].." 甶觤 t輈h l騳, m鏸 tu莕 c� th� i "..tPrizeJifen[7][1].." l莕<enter>";
	local rule6 = "<color=green>Ph莕 thng 6<color>: N閜 90 lo筰 c� th� i "..tPrizeJifen[6][2].." 甶觤 t輈h l騳, m鏸 tu莕 c� th� i "..tPrizeJifen[6][1].." l莕";
	sContent = rule10..rule9..rule8..rule7..rule6;
	Say(sContent,getn(selTab),selTab);
end;
function nextrule1(npcNo)
	local sCmd = "main";
	if npcNo == 3 then
		sCmd = "OnUse";
	end;
	local selTab = {
			"Trang trc/#knowrule("..npcNo..")",
			"Quay l筰 i tho筰 ch輓h./"..sCmd,
			"K誸 th骳 i tho筰/nothing",
			};
	local rule5 = "<color=green>Ph莕 thng 5<color>: N閜 106 lo筰 c� th� i "..tPrizeJifen[5][2].." 甶觤 t輈h l騳, m鏸 tu莕 c� th� i "..tPrizeJifen[5][1].." l莕<enter>";
	local rule4 = "<color=green>Ph莕 thng 4<color>: N閜 125 lo筰 c� th� i "..tPrizeJifen[4][2].." 甶觤 t輈h l騳, m鏸 tu莕 c� th� i "..tPrizeJifen[4][1].." l莕<enter>";
	local rule3 = "<color=green>Ph莕 thng 3<color>: N閜 144 lo筰 c� th� i "..tPrizeJifen[3][2].." 甶觤 t輈h l騳, m鏸 tu莕 c� th� i "..tPrizeJifen[3][1].." l莕<enter>";
	local rule2 = "<color=green>Ph莕 thng 2<color>: N閜 185 lo筰 c� th� i "..tPrizeJifen[2][2].." 甶觤 t輈h l騳, m鏸 tu莕 c� th� i "..tPrizeJifen[2][1].." l莕<enter>";
	local rule1 = "<color=green>Ph莕 thng 1<color>: N閜 203 lo筰 c� th� i "..tPrizeJifen[1][2].." 甶觤 t輈h l騳, m鏸 tu莕 c� th� i "..tPrizeJifen[1][1].." l莕";	
	sContent = rule5..rule4..rule3..rule2..rule1;
	Say(sContent,getn(selTab),selTab);
end;

--查询上交收集品情况。输入参数同上
function queryinfor(npcNo)
	local selTab = {
				"Tra xem v藅 ph萴  giao./#seemoreinfo("..npcNo..",1)",
				"Tra xem nh鱪g v藅 ph萴 ch璦 giao n閜./#seemoreinfo("..npcNo..",0)",
				"Tra theo s� hi謚 v藅 ph萴./requestno",
				"Trang trc./main",
				"K誸 th骳 i tho筰/nothing",
				}
	Say("<color=green>"..tNpcName[npcNo]..":<color> B筺  giao n閜 <color=yellow>"..GetTask(ITEMNUM).."<color>\/"..g_TotalItemNum.." lo筰 v藅 thu th藀.",getn(selTab),selTab);
end;

function seemoreinfo(npcNo,nType)
	local nItemNum = GetTask(ITEMNUM);
	local tInfoTab = {};
	if nType == 1 then
		if nItemNum == 0 then
			Talk(1,"main","<color=green>"..tNpcName[npcNo]..":<color> B筺 v蒼 ch璦 giao n閜 v藅 ph萴.");
			return FALSE;
		end;
	end;
	tInfoTab = Get_Info_Table(nType);
	local nSize = getn(tInfoTab);
	nextpage(1,nSize,nType);
end;

function nextpage(nPageNo,nSize,nType)
	local nItemNum = GetTask(ITEMNUM);
	local tInfoTab = {};
	if nPageNo > nSize then
		main();
		return 1;
	end;
	nPageNo = nPageNo + 1;
	tInfoTab = Get_Info_Table(nType);
	Talk(1,"#nextpage("..nPageNo..","..nSize..","..nType..")",tInfoTab[nPageNo-1]);	--递归
end;
--要求输入数字
function requestno()
	AskClientForString("searchbyno","",1,3,"H穣 nh藀 s� hi謚 v藅 ph萴:");
end;
--AskClientForString的回调函数
function searchbyno(sItemNo)
	local nItemNo = tonumber(sItemNo);	
	if not nItemNo or nItemNo <= 0 or nItemNo > g_TotalItemNum then
		Talk(1,"main","<color=green>G頸 �<color>: H穣 nh藀 s� <color=yellow>t� 1 n"..g_TotalItemNum.."<color> (s� trung gian)");
		return FALSE;
	end;	
	nItemNo = nItemNo - 1;
	local nGroup = 0;
	local nBit = 0;
	nGroup = floor(nItemNo/30);
	nBit = mod(nItemNo,30)+1;
	if GetBit(GetTask(LABORDAY_ITEM_BEGIN+nGroup),nBit) == 1 then
		Talk(1,"main","V藅 ph萴 b筺 mu鑞 xem l�: <color=green>"..ItemTab[nGroup*30+nBit][5].."<color>. Tr筺g th竔: <color=yellow>Х giao n閜<color>.");
		return 1;
	else
		Talk(1,"main","V藅 ph萴 b筺 mu鑞 xem l�: <color=green>"..ItemTab[nGroup*30+nBit][5].."<color>. Tr筺g th竔: <color=red>Ch璦 giao n閜<color>.");
		return 1;
	end;
end;
--领取《聚宝斋功劳册》
function getbook(npcNo)
	if GetItemCount(2,0,391) >=1 then
		Talk(1,"","<color=green>"..tNpcName[npcNo]..":<color> V� "..GetPlayerSex().."c� s竎h c玭g lao T� B秓 Trai sao?");
		return FALSE;
	end;
	if AddItem(2,0,391,1) == 1 then
		Msg2Player("B筺 nh薾 頲 s竎h c玭g lao T� B秓 Trai.");
	end;
end;
--颁奖
function giveprize(nPrizeType)
	local sContent = "Ngi i 頲 <color=yellow>";
	ModifyExp(PrizeTab[nPrizeType][2]);
	sContent = sContent..PrizeTab[nPrizeType][2].." 甶觤 kinh nghi謒,";
	Msg2Player("B筺 nh薾 頲 "..PrizeTab[nPrizeType][2].." 甶觤 kinh nghi謒");
	ModifyReputation(PrizeTab[nPrizeType][3],0);
	sContent = sContent..PrizeTab[nPrizeType][3].." 甶觤 danh v鋘g, ";
	Msg2Player("B筺 nh薾 頲 "..PrizeTab[nPrizeType][3].." 甶觤 danh v鋘g");
	if PrizeTab[nPrizeType][4] then
		local nBookID = giverandombook(PrizeTab[nPrizeType][4]);
		sContent = sContent..BookTab[nBookID][4]..", ";
		Msg2Player("B筺 nh薾 頲 "..BookTab[nBookID][4]);
	end;
	if PrizeTab[nPrizeType][5] then
		AddItem(2,2,8,PrizeTab[nPrizeType][5]);
		sContent = sContent..PrizeTab[nPrizeType][5].."Thi猲 th筩h,";
		Msg2Player("B筺 nh薾 頲 "..PrizeTab[nPrizeType][5].."Thi猲 th筩h");
	end;
	if PrizeTab[nPrizeType][6] then
		giverandomequipment(PrizeTab[nPrizeType][6]);
		sContent = sContent.."1 m鉵 trang b�.";
		Msg2Player("B筺 nh薾 頲 1 m鉵 trang b�.");
	end;
	sContent = strsub(sContent,1,strlen(sContent)-2);
	sContent = sContent.."<color>";
	Talk(1,"",sContent);
	if nPrizeType >= 1 and nPrizeType <= 7 then
		Talk(1,"","Ch骳 m鮪g, ngi  nh薾 頲 gi秈"..tNumTab[nPrizeType]..". Ch� �, <color=red>Trong th阨 gian di詎 ra ho箃 ng m鏸 ng祔, m鏸 nh﹏ v藅 ch� c� th� nh薾 3 gi秈 thng"..tNumTab[nPrizeType].."<color>. Зy l� l莕 th� <color=yellow>"..Get_Task_Byte(tPrizeMapByte[nPrizeType][1],tPrizeMapByte[nPrizeType][2]).."<color> nh薾"..tNumTab[nPrizeType].."gi秈 thng.");
	end
	if nPrizeType == 8 then
		Talk(1,"","Ch骳 m鮪g, b筺 nh薾 頲 gi秈 ba. Ch� �, <color=red>trong th阨 gian di詎 ra ho箃 ng m鏸 nh﹏ v藅 t鑙 產 c� th� nh薾 頲 3 gi秈 ba<color>, b筺  nh薾 <color=yellow>"..GetByte(GetTask(BIG_PRIZE),3).."<color> l莕 gi秈 ba.");
	elseif nPrizeType == 9 then
		Talk(1,"","Ch骳 m鮪g, b筺 nh薾 頲 gi秈 hai!");
	elseif nPrizeType == 10 then
		Talk(1,"","Ch骳 m鮪g, b筺 nh薾 頲 gi秈 nh蕋!");
		local sSex = "秐h/ch�";
		if GetSex() == 1 then
			sSex = "Tha";
		elseif GetSex() == 2 then
			sSex = "Ngi ch琲";
		end;
		AddGlobalNews(GetName().."  nh薾 頲 gi秈 nh蕋, xin ch骳 m鮪g!"..sSex.."!");
		Msg2SubWorld(GetName().."  nh薾 頲 gi秈 nh蕋, xin ch骳 m鮪g!"..sSex.."!");
	end;
	Write_Log("фi ph莕 thng t誸 lao ng",". Lo筰 ph莕 thng:"..nPrizeType);
end;
--随机给一本秘籍。秘籍类型和概率由输入参数决定
function giverandombook(tBookInfo)
	local nTabSize = getn(tBookInfo);
	local nRandomNum = random(1,100);
	if nRandomNum <= tBookInfo[1][2] then
		nResult = 1;
	elseif nRandomNum > tBookInfo[nTabSize-1][2] then
		nResult = nTabSize;
	else
		for i=1,nTabSize-1 do
			if nRandomNum > tBookInfo[i][2] and nRandomNum <= tBookInfo[i+1][2] then
				nResult = i+1;
			end;
		end;
	end;
	AddItem(BookTab[tBookInfo[nResult][1]][1],BookTab[tBookInfo[nResult][1]][2],BookTab[tBookInfo[nResult][1]][3],1,1);
	return tBookInfo[nResult][1];
end;
--给装备
function giverandomequipment(nType)
	if nType == 1 then
		giverandomhat();
	elseif nType == 2 then
		giverandomtrousers();
	elseif nType == 3 then
		giverandomweapon();
	end;
end;
--给随机帽子
function giverandomhat()
	local HatTab = {
		{0,103,17},	
		{0,103,18},
		{0,103,35},
		{0,103,36},
		{0,103,53},
		{0,103,54},
		{0,103,71},
		{0,103,72},
		};
	local nRandomNum = random(1,getn(HatTab));
	if AddItem(HatTab[nRandomNum][1],HatTab[nRandomNum][2],HatTab[nRandomNum][3],1,1,2,random(131,132),2,102,-1,-1) == 1 then
		Write_Log("фi ph莕 thng t誸 lao ng","Nh薾 頲 n鉵, ID l�:"..nRandomNum);
	end;
end;
--给随机裤子
function giverandomtrousers()
	local TrousersTab = {
		{0,101,17},
		{0,101,18},
		{0,101,35},
		{0,101,36},
		{0,101,53},
		{0,101,54},
		{0,101,71},
		{0,101,72},
		};
	local nRandomNum = random(1,getn(TrousersTab));
	if AddItem(TrousersTab[nRandomNum][1],TrousersTab[nRandomNum][2],TrousersTab[nRandomNum][3],1,1,3,random(131,132),2,102,-1,-1) == 1 then
		Write_Log("фi ph莕 thng t誸 lao ng","Nh薾 頲 qu莕, ID l�:"..nRandomNum);
	end;
end;
--给随机武器
function giverandomweapon()
	local WeaponTab = {
		{0,0,13},	--1手
		{0,2,26},	--2剑
		{0,5,39},	--3棍
		{0,1,52},	--4暗器
		{0,3,63},	--5单刀
		{0,10,74},	--6琴
		{0,9,85},	--7笔
		{0,8,96},	--8杖
		{0,6,107},	--9枪
		{0,4,118},	--10弓
		{0,11,11},	--11爪
		{0,7,11},	--12双刀
		};
	local nRandomNum = random(1,getn(WeaponTab));
	local nAttribute;
	if nRandomNum == 3 or nRandomNum == 4 or nRandomNum == 5 or nRandomNum == 7 or nRandomNum == 9 or nRandomNum == 10 or nRandomNum == 12 then
		nAttribute = 131;	--棍,暗器,单刀,笔,枪,弓,双刀
	elseif nRandomNum == 2 or nRandomNum == 6 or nRandomNum == 8 or nRandomNum == 11 then
		nAttribute = 132	--剑,琴,杖,爪
	else	--手
		nAttribute = random(131,132);
	end;
	if AddItem(WeaponTab[nRandomNum][1],WeaponTab[nRandomNum][2],WeaponTab[nRandomNum][3],1,1,3,nAttribute,3,102,2,251) == 1 then
		Write_Log("фi ph莕 thng t誸 lao ng","Nh薾 頲 v� kh�, ID l�:"..nRandomNum);
	end;
end;
--do nothing函数
function nothing()

end;

--=====================公元2008年10月20日新加=========================
function GetTimeZoneInfo()
	local nCurTime = GetTime();
	local nTimeZoneDiff = floor((nCurTime - MkTime(GmTime(nCurTime)))/3600);
	return nTimeZoneDiff;
end;

--计算周的序数
function GetWeekSequence(nWeekDay,nHour,nCurTime)
	nWeekDay = nWeekDay or 1;
	nHour = nHour or 0;
	nCurTime = nCurTime or GetTime();
	local nTimeZoneDiff = GetTimeZoneInfo();
	nCurTime = nCurTime + nTimeZoneDiff*3600;		--处理时差
	nCurTime = nCurTime - 4*24*3600;	--对齐到1970年1月1日（星期四）后的第一个周一凌晨。
	local nWeekSecond = 7*24*3600;	--一周多少秒
	local nOffset = ((nWeekDay-1)*24+nHour)*3600;	--计算偏移时间
	local nTotalTime = nCurTime - nOffset;	--计算后的总时间
	local nWeekSeq = floor(nTotalTime/nWeekSecond);	--计算周的序数
	return nWeekSeq;
end;
