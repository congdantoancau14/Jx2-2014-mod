--圣火传递活动头文件
--by vivi
--2008/05/28

--任务变量
--TASK_AOYUN_HUOJUSHOU = 905;  --火炬手资格，存入该区传递活动时间
TASK_AOYUN_HUOJU_DATE = 906; --是否领取过日常活动时奖励，存入最后圣火台服务器日期
TASK_AOYUN_TEMP_NUM = 907;  --日常活动中，记录当前点亮哪个圣火台
TASK_AOYUN_HUOJU_NUM = 908; --火炬手的任务编号，即需要点亮哪个圣火台
TASK_AOYUN_ZHUWEI_NUM = 909; --助威者的任务编号。1-31。31表示盛世火炬台旁
TASK_AOYUN_GET_SHENGHUO = 910; --火炬手是否已取得圣火，存入时间GetTime
TASK_AOYUN_DIAN_SHENGHUO = 911; --是否点亮圣火
TASK_AOYUN_ZHUWEI_LABA = 912;  --是否领取助威喇叭
TASK_AOYUN_USE_LABA = 913;    --是否使用过助威喇叭，防刷
TASK_AOYUN_HUOJU_IDX = 914;   --记录对应火炬台的索引，用于与玩家距离判断。 
TASK_AOYUN_FINAL_AWARD = 915; --是否领取了最终奖励


--服务器变量 注意，更改服务器变量记得去改gmscript和autoexec下的相应变量
GLB_AOYUN_TIME_STATE = 200; --传递活动开始状态
GLB_AOYUN_HUOJUTAI_NUM = 201; --记录顺序点亮到第几台火炬台了
GLB_AOYUN_NPC_YI = 202;     --记录圣火台索引，以下类推
GLB_AOYUN_NPC_ER = 203;
GLB_AOYUN_NPC_SAN = 204;
GLB_AOYUN_NPC_SI = 205;
GLB_AOYUN_NPC_WU = 206;
GLB_AOYUN_NPC_LIU = 207;
GLB_AOYUN_NPC_QI = 208;
GLB_AOYUN_NPC_BA = 209;
GLB_AOYUN_NPC_JIU = 210;
GLB_AOYUN_NPC_SHI = 211;
GLB_AOYUN_NPC_SHIYI = 212;
GLB_AOYUN_NPC_SHIER = 213;
GLB_AOYUN_NPC_SHISAN = 214;
GLB_AOYUN_NPC_SHISI = 215;
GLB_AOYUN_NPC_SHIWU = 216;
GLB_AOYUN_NPC_SHILIU = 217;
GLB_AOYUN_NPC_SHIQI = 218;
GLB_AOYUN_NPC_SHIBA = 219;
GLB_AOYUN_NPC_SHIJIU = 220;
GLB_AOYUN_NPC_ERSHI = 221;
GLB_AOYUN_NPC_ERYI = 222;
GLB_AOYUN_NPC_ERER = 223;
GLB_AOYUN_NPC_ERSAN = 224;
GLB_AOYUN_NPC_ERSI = 225;
GLB_AOYUN_NPC_ERWU = 226;
GLB_AOYUN_NPC_ERLIU = 227;
GLB_AOYUN_NPC_ERQI = 228;
GLB_AOYUN_NPC_ERBA = 229;
GLB_AOYUN_NPC_ERJIU = 230;
GLB_AOYUN_NPC_SANSHI = 231;
GLB_AOYUN_NPC_SANYI = 232;

--全局变量
TRIGER_AOYUN_TIME_ID = 300; --时间触发器ID
TIME_TABLE_ID = 50; --表里ID

tHuojuName = {
	[1] = {"Th竛h H醓 Уi","Уi 畊鑓 1"},
	[2] = {"Уi 畊鑓 1","Уi 畊鑓 2"},
	[3] = {"Уi 畊鑓 2","Уi 畊鑓 3"},
	[4] = {"Уi 畊鑓 3","Уi 畊鑓 4"},
	[5] = {"Уi 畊鑓 4","Уi 畊鑓 5"},
	[6] = {"Уi 畊鑓 5","Уi 畊鑓 6"},
	[7] = {"Уi 畊鑓 6","Уi 畊鑓 7"},
	[8] = {"Уi 畊鑓 7","Уi 畊鑓 8"},
	[9] = {"Уi 畊鑓 8","Уi 畊鑓 9"},
	[10] = {"Уi 畊鑓 9","Уi 畊鑓 10"},
	[11] = {"Уi 畊鑓 10","Уi 畊鑓 11"},
	[12] = {"Уi 畊鑓 11","Уi 畊鑓 12"},
	[13] = {"Уi 畊鑓 12","Уi 畊鑓 13"},
	[14] = {"Уi 畊鑓 13","Уi 畊鑓 14"},
	[15] = {"Уi 畊鑓 14","Уi 畊鑓 15"},
	[16] = {"Уi 畊鑓 15","Уi 畊鑓 16"},
	[17] = {"Уi 畊鑓 16","Уi 畊鑓 1-7"},
	[18] = {"Уi 畊鑓 1-7","Уi 畊鑓 18"},
	[19] = {"Уi 畊鑓 18","Уi 畊鑓 19"},
	[20] = {"Уi 畊鑓 19","Уi 畊鑓 20"},
	[21] = {"Уi 畊鑓 20","Уi 畊鑓 21"},
	[22] = {"Уi 畊鑓 21","Уi 畊鑓 22"},
	[23] = {"Уi 畊鑓 22","Уi 畊鑓 23"},
	[24] = {"Уi 畊鑓 23","Уi 畊鑓 24"},
	[25] = {"Уi 畊鑓 24","Уi 畊鑓 25"},
	[26] = {"Уi 畊鑓 25","Уi 畊鑓 26"},
	[27] = {"Уi 畊鑓 26","Уi 畊鑓 27"},
	[28] = {"Уi 畊鑓 27","Уi 畊鑓 28"},
	[29] = {"Уi 畊鑓 28","Уi 畊鑓 29"},
	[30] = {"Уi 畊鑓 29","L� nng b竛h"},
	[31] = {"L� nng b竛h"}  --助威者
	}
	
--火炬台pos	
tHuoJuPos = {
		{"Th竛h H醓 Уi","Th竛h H醓 Уi",500,1829,3065},{"Уi 畊鑓","Уi 畊鑓 1",500,1678,3214},{"Уi 畊鑓","Уi 畊鑓 2",500,1662,3099},{"Уi 畊鑓","Уi 畊鑓 3",500,1778,3203},
		{"Уi 畊鑓","Уi 畊鑓 4",350,1538,2870},{"Уi 畊鑓","Уi 畊鑓 5",350,1417,2790},{"Уi 畊鑓","Уi 畊鑓 6",350,1346,2878},{"Уi 畊鑓","Уi 畊鑓 7",350,1366,3052},{"Уi 畊鑓","Уi 畊鑓 8",350,1514,3051},
		{"Уi 畊鑓","Уi 畊鑓 9",300,1676,3676},{"Уi 畊鑓","Уi 畊鑓 10",300,1705,3487},{"Уi 畊鑓","Уi 畊鑓 11",300,1861,3490},{"Уi 畊鑓","Уi 畊鑓 12",300,1764,3553},{"Уi 畊鑓","Уi 畊鑓 13",300,1866,3632},
		{"Уi 畊鑓","Уi 畊鑓 14",400,1534,2920},{"Уi 畊鑓","Уi 畊鑓 15",400,1431,2963},{"Уi 畊鑓","Уi 畊鑓 16",400,1451,3094},{"Уi 畊鑓","Уi 畊鑓 1-7",400,1560,3112},
		{"Уi 畊鑓","Уi 畊鑓 18",100,1352,2894},{"Уi 畊鑓","Уi 畊鑓 19",100,1353,3051},{"Уi 畊鑓","Уi 畊鑓 20",100,1513,3053},{"Уi 畊鑓","Уi 畊鑓 21",100,1507,2899},
		{"Уi 畊鑓","Уi 畊鑓 22",150,1625,3060},{"Уi 畊鑓","Уi 畊鑓 23",150,1626,3185},{"Уi 畊鑓","Уi 畊鑓 24",150,1747,3182},{"Уi 畊鑓","Уi 畊鑓 25",150,1736,3076},
		{"Уi 畊鑓","Уi 畊鑓 26",200,1270,2974},{"Уi 畊鑓","Уi 畊鑓 27",200,1468,2946},{"Уi 畊鑓","Уi 畊鑓 28",200,1465,2783},{"Уi 畊鑓","Уi 畊鑓 29",200,1302,2755},{"L� nng b竛h","L� nng b竛h",200,1364,2875}}
		
			
--活动时间 指日常活动 传递活动时间由reyal控制
function get_aoyun_state()
	--活动状态判断
	local nDate = tonumber(date("%Y%m%d"));
	if nDate < 20080630 then
		return 0;
	elseif nDate >= 20080630 and nDate <= 20480806 then
		return 1;
	else 
		return 2;
	end 	
	
end

--函数名称：物品添加检查函数
--功        能：对当前玩家可否正常添加物品进行检测
--村长 
function Zgc_pub_goods_add_chk(goods_num,goods_weight)
		if GetFreeItemRoom() < goods_num then
			Talk (1,"","<color=red>kho秐g tr鑞g<color> trong h祅h trang kh玭g !")
			return 0
		elseif (GetMaxItemWeight() - GetCurItemWeight()) < goods_weight then			--判断玩家负重和空间
			Talk (1,"","<color=red>S鴆 l鵦<color> c馻 b筺 kh玭g !")
			return 0
		else 
			return 1
		end
end

--宝石包裹概率
function aoyun_baoshi_prob()
	local nRand = random(1,1000);
	if nRand <= 249 then
		lspf_AddLingShiInBottle(1,1);
		Msg2Player("Ch骳 m鮪g b筺 nh薾 頲 1 Linh Th筩h C蕄 1, n� trong T� linh nh.");
	elseif nRand <= 479 then
		lspf_AddLingShiInBottle(2,1);
		Msg2Player("Ch骳 m鮪g b筺 nh薾 頲 1 Linh Th筩h c蕄 2,  nh藀 v祇 T� linh nh.");		
	elseif nRand <= 709 then
		lspf_AddLingShiInBottle(3,1);
		Msg2Player("Ch骳 m鮪g b筺 nh薾 頲1 Linh Th筩h c蕄 3,  nh藀 v祇 T� linh nh.");		
	elseif nRand <= 939 then
		lspf_AddLingShiInBottle(4,1);
		Msg2Player("Ch骳 m鮪g b筺 nh薾 頲 1 Linh Th筩h c蕄 4,  nh藀 v祇 T� linh nh.");		
	elseif nRand <= 989 then
		lspf_AddLingShiInBottle(5,1);
		Msg2Player("Ch骳 m鮪g b筺 nh薾 頲 1 Linh Th筩h c蕄 5,  nh藀 v祇 T� linh nh.");		
	elseif nRand <= 999 then
		lspf_AddLingShiInBottle(6,1);
		Msg2Player("Ch骳 m鮪g b筺 nh薾 頲 1 Linh Th筩h c蕄 6,  nh藀 v祇 T� linh nh.");
		Msg2Global("Ngi ch琲"..GetName().."Tham gia ho箃 ng Rc 畊鑓 nh薾 頲 1 Linh th筩h c蕄 6");
		WriteLog("Ho箃 ng qu鑓 t� lao ng 08: Ngi ch琲"..GetName().."Tham gia ho箃 ng Rc 畊鑓 nh薾 頲 1 Linh th筩h c蕄 6.");		
	else
		lspf_AddLingShiInBottle(7,1);
		Msg2Player("Ch骳 m鮪g b筺 nh薾 頲 1 Linh Th筩h c蕄 7,  nh藀 v祇 T� linh nh.");		
		Msg2Global("Ngi ch琲"..GetName().."Tham gia ho箃 ng Rc 畊鑓 nh薾 頲 1 Linh th筩h c蕄 7");
		WriteLog("Ho箃 ng qu鑓 t� lao ng 08: Ngi ch琲"..GetName().."Tham gia ho箃 ng Rc 畊鑓 nh薾 頲 1 Linh th筩h c蕄 7.");
	end
end

--传送至火炬台
function goto_huojutai()
	local nPos = GetWorldPos();
	if nPos >= 700 then
		Talk(1,"","B秐  hi謓 t筰 kh玭g th� d飊g ch鴆 n╪g di chuy觧 n祔!");
		return
	end
	if GetFightState() == 1 then
		Talk(1,"","Xin d飊g ch鴆 n╪g di chuy觧 n祔 � khu v鵦 h遖 b譶h (th祅h tr蕁)!");
		return
	end
	local nTask = 1;
	if GetTask(TASK_AOYUN_HUOJU_NUM) ~= 0 then
		nTask = GetTask(TASK_AOYUN_HUOJU_NUM);
	elseif GetTask(TASK_AOYUN_ZHUWEI_NUM) ~= 0 then
		nTask = GetTask(TASK_AOYUN_ZHUWEI_NUM);
	end
	if PrePay(5000)==0 then 
		Talk(1,"","C� ti襫 th� h穣 ng錳 xe!")
	else 
		CleanInteractive();	
		NewWorld(tHuoJuPos[nTask][3],tHuoJuPos[nTask][4],tHuoJuPos[nTask][5]);
		SetFightState(0);
	end		
end

function nothing()

end