--date:2007-3-6
--author:yanjun
--describe:this script define some constant values and some public functions,is the header file of killer hall task;
Include("\\script\\lib\\globalfunctions.lua");
Include("\\script\\lib\\lingshi_head.lua");
Include("\\script\\task\\happiness_bag\\happiness_bag.lua");
Include("\\script\\online_activites\\shimen_tier4\\tier4.lua")
--========================================================================================
SETTING_DYNAMIC_MISSION = 0;	--是否支持动态开启的Mission
DEBUG_VERSION = 0;				--需要输出调试信息吗？

THIS_FILE_NAME = "\\script\\task\\killer_hall\\killer_hall_head.lua";
MAP_ID = 885;					--杀手堂地图ID
PLAY_TIME = 60;					--刷杀手的总时间，也等于Mission中的STARTED_TIME时间。这个常量设计得很没水平
--任务变量================================================================================
KH_TASK_GOT_MASK_DATE = 433;	--领取人皮面具的日期
KH_TASK_MSUID = 434;			--记录玩家之前进入的是哪一场Mission
KH_TASK_OPEN_BOX_TIME = 435;	--记录当场开箱子的次数
KH_TASK_USE_MIHAN_TIME = 436;	--记录上次使用杀手堂秘函的时间
--临时任务变量============================================================================
KH_TASK_TEMP_BOX_INDEX = 115;	--记录所点箱子的NPC索引
--服务器变量==============================================================================
GLB_KILLER_HALL_FORBIDEN = 600;	--是否禁止杀手堂任务
--地图变量================================================================================
MAPV_BEGIN = 1;
MAPV_OPENED_BOX1_COUNT = 1;		--记录开香主箱子的数量  
MAPV_OPENED_BOX2_COUNT = 2;     --记录开副堂主箱子的数量
MAPV_OPENED_BOX3_COUNT = 3;     --记录开李大嘴箱子的数量
MAPV_OPEN_BOX_FORBIDDEN = 4;	--设置是否可以开箱子，用来预防刷箱子
MAPV_END = 4;
--========================================================================================
XIANGZHU_KILLER_COUNT = 10
FUTANGZHU_KILLER_COUNT = 20;	--杀死副堂主后产生的杀手数量
LIDAZUI_KILLER_COUNT = 40;		--杀死李大嘴后产生的杀手数量
--========================================================================================
NPC_TYPE_XIANGZHU = 1;
NPC_TYPE_FUTANGZHU = 2;
NPC_TYPE_LIDAZUI = 3;
NPC_TYPE_KILLER = 4;
--========================================================================================
tItemInfo = --定义杀手堂任务相关物品信息
--2、3项改为送太易混元功图鉴 edited by vivi
{
	[1] = {"M苩 n� S竧 Th� Л阯g",2,1,1087},
	[2] = {"Th竔 D辌h H鏽 Nguy猲 C玭g у",2,0,1082},
	[3] = {"Th竔 D辌h H鏽 Nguy猲 C玭g у",2,0,1082},
}

tExpAward = {	--箱子所给的经验
	[NPC_TYPE_XIANGZHU] = {500000},
	[NPC_TYPE_FUTANGZHU] = {1000000},
	[NPC_TYPE_LIDAZUI] = {2000000},
	}

tTaoAward = {	--箱子所给的经验
	[NPC_TYPE_XIANGZHU] = {1},
	[NPC_TYPE_FUTANGZHU] = {2},
	[NPC_TYPE_LIDAZUI] = {4},
	}
	
tbThuongMoRuong = {
	[NPC_TYPE_XIANGZHU] = {2,1,30340,100},
	[NPC_TYPE_FUTANGZHU] = {2,1,30341,2},
	[NPC_TYPE_LIDAZUI] = {2,1,30341,3},
}
	
tMysticThing = 	--兔小丫神秘物品
{
	{"Ho祅g Kim b秓 rng",2,1,108},
	{"X� L頸 Truy襫 C玭g",2,1,109},
	{"M秐h b秐  SHXT",2,1,110},
	{"Hoa h錸g",2,1,111},
	{"Ch﹏ th�",2,1,112},
	{"Nanh s鉯",2,1,113},
	{"T� kh竛g Th駓",2,1,114},
	{"Ph� Thi猲 Cung",2,1,115},
	{"Xng r錸g",2,1,116},
	{"T髖 Ti猲 C骳",2,1,117},
	{"Thi Vng L芻 C鑤",2,1,118},
	{"Thi Kh� B譶h",2,1,119},
	{"Qu秐 T�",2,1,120},
	{"T骾 Phi Ng�",2,1,121},
	{"B譶h Song Tinh",2,1,122},
	{"Th� Vng T﹎",2,1,123},
	{"Xng s�",2,1,124},
	{"T� H錸 nh",2,1,125},
	{"L筽 Ho祅",2,1,126},
	{"D琲 c",2,1,127},
	{"Quan m穙",2,1,128},
	{"M藅 S竧 L謓h",2,1,129},
	{"Ch蕁 Thi猲 Tuy誸",2,1,130},
	{"T祅g B秓 у",2,1,131},
	{"Di襲",2,1,132},
	{"Con r鑙",2,1,133},
	{"T祇 Ng﹏",2,1,134},
	{"Hoa Th筩h Cng",2,1,135},
	{"D莡 甧n",2,1,136},
	{"Trng Th祅h K輓h",2,1,137},
	{"B秐 ch� T蕋 Th╪g",2,1,138},
	{"Nh﹏ u Ni謒 Ch﹗",2,1,139},
	{"Kh� S琻 ch�",2,1,140},
	{"Y猽 Vng chi課 k�",2,1,141},
	{"Ho祅g Tri襲 Ng鋍 T�",2,1,142},
	{"Thi猲 Cng Ng� L玦 Чi Ph竝",2,1,143},
	{"Kim Chuy猲",2,1,144},
	{"L玦 Vi猰 Kim Sa",2,1,146},
	{"Thi猲 Y V� Phong",2,1,147},
	{"B� б",2,1,151},
	{"B� Ng﹏",2,1,152},
	{"Ph萴 m祏",2,1,153},
}

tFactionTokenRing = --门派对应的师门令牌
{
	[1] = {2,0,205},	--少林
	[2] = {2,0,206},	--武当
	[3] = {2,0,207},	--峨嵋
	[4] = {2,0,208},	--丐帮
	[5] = {2,0,209},	--唐门
	[6] = {2,0,350},	--杨门
	[7] = {2,0,390},	--五毒
}

tRouteInfo = --技能ID，技能最高等级，武器信息
{
	[0] = {0,0,{}},--"无门无派",
	[1] = {0,0,{}},--少林
	[2] = {31,7,{{"C� лnh ch璦 gi竚 nh",2,1,379},{"Li謙 Di謒 ch璦 gi竚 nh",2,1,377}}},--"俗家",
	[3] = {56,7,{{"A La H竛 Trng ch璦 gi竚 nh",2,1,382}}},--"禅僧",
	[4] = {43,7,{{"V筺 Nh蒼 ch璦 gi竚 nh",2,1,375}}},--"武僧",
	[5] = {0,0,{}},--"唐门",
	[6] = {73,7,{{"M穘 Thi猲 Hoa V� ch璦 gi竚 nh",2,1,378}}},--"唐门",
	[7] = {0,0,{}},--"峨嵋",
	[8] = {88,7,{{"H醓 Tinh ch璦 gi竚 nh",2,1,376}}},--"峨嵋佛家",
	[9] = {101,7,{{"Hi Nh﹏ C莔 ch璦 gi竚 nh",2,1,380}}},--"峨嵋俗家",
	[10] = {0,0,{}},--"丐帮",
	[11] = {112,7,{{"V筺 Nh蒼 ch璦 gi竚 nh",2,1,375}}},--"丐帮净衣",
	[12] = {123,7,{{"Li謙 Di謒 ch璦 gi竚 nh",2,1,377}}},--"丐帮污衣",
	[13] = {0,0,{}},--"武当",
	[14] = {145,7,{{"H醓 Tinh ch璦 gi竚 nh",2,1,376}}},--"武当道家",
	[15] = {158,7,{{"Th莕 H祅h ch璦 gi竚 nh",2,1,381}}},--"武当俗家",
	[16] = {0,0,{}},--"杨门",
	[17] = {731,7,{{"Чi H祇 L玦 Thng ch璦 gi竚 nh",2,1,383}}},--"杨门枪骑",
	[18] = {744,7,{{"Th莕 Cung ch璦 gi竚 nh",2,1,384}}},--"杨门弓骑",
	[19] = {0,0,{}},--"五毒",
	[20] = {377,7,{{"L╪g Phong ch璦 gi竚 nh",2,1,386}}},--"五毒邪侠",
	[21] = {363,7,{{"M穘h H� ch璦 gi竚 nh",2,1,385}}},--"五毒蛊师",
	[23] = {1030,8,{{"M穘h H� ch璦 gi竚 nh",2,1,385}}},
	[29] = {1176,7,{{"M穘h H� ch璦 gi竚 nh",2,1,385}}},
	[30] = {1229,7,{{"M穘h H� ch璦 gi竚 nh",2,1,385}}},
}

tNpcInfo = --定义NPC的模板名与名字与生存时间
{
	[NPC_TYPE_XIANGZHU] = {"Hng ch� S竧 Th� Л阯g","Hng ch� S竧 Th� Л阯g",5*60-30},
	[NPC_TYPE_FUTANGZHU] = {"Ph� Л阯g ch� S竧 Th� Л阯g","Ph� Л阯g ch� S竧 Th� Л阯g",5*60-30},
	[NPC_TYPE_LIDAZUI] = {"Nh﹏  ph� -Qu� Ngc","Nh﹏  ph� -L� Чi Ch駓",15*60-30},
	[NPC_TYPE_KILLER] = {"Kim b礽 s竧 th�","Kim b礽 s竧 th�",5*60-30},
}

tNpcRegion = --定义各个区域的刷新点
{
	[NPC_TYPE_XIANGZHU] = 	--利益独享区域
		  {	
			[1] = {{MAP_ID,1533,3137}},	--某个利益独享区域中可能会有多个刷新点
			[2] = {{MAP_ID,1565,3106}}, 
			[3] = {{MAP_ID,1593,3077}},
			[4] = {{MAP_ID,1682,3165}},
			[5] = {{MAP_ID,1653,3194}},
			[6] = {{MAP_ID,1629,3222}},
			[7] = {{MAP_ID,1711,2960}},
			[8] = {{MAP_ID,1738,2986}},
			[9] = {{MAP_ID,1770,3016}},
		  },
	[NPC_TYPE_FUTANGZHU] = --利益竞争独享区域
		  {
		  	[1] = {{MAP_ID,1630,3039}},
		  	[2] = {{MAP_ID,1718,3126}},
		  	[3] = {{MAP_ID,1784,3070}},
		  	[4] = {{MAP_ID,1734,3048}},
		  	[5] = {{MAP_ID,1700,3026}},
		  	[6] = {{MAP_ID,1682,2990}},
		  },
	[NPC_TYPE_LIDAZUI] = 	--利益最集中区域
		  {	
			[1] = {{MAP_ID,1672,3082}},
		  },
	[NPC_TYPE_KILLER] = 	--利益分散区域
		  {	
		  	[1] = {{MAP_ID,1611,3147}},
		  },
}

tEntrancePos = --进入点
{
	[1] = {MAP_ID,1573,3186},
	[2] = {MAP_ID,1586,3204},
	[3] = {MAP_ID,1548,3168},
	--上面三个是门口传送点，下面9个是房间传送点
	[4] = {MAP_ID,1533,3137},
	[5] = {MAP_ID,1565,3106},
	[6] = {MAP_ID,1593,3077},
	[7] = {MAP_ID,1682,3165},
	[8] = {MAP_ID,1653,3194},
	[9] = {MAP_ID,1629,3222},
	[10] = {MAP_ID,1711,2960},
	[11] = {MAP_ID,1738,2986},
	[12] = {MAP_ID,1770,3016},
}

tExitPos = --出口点
{
	[1] = {300,1654,3643},
	[2] = {300,1893,3648},
	[3] = {300,1908,3449},
	[4] = {300,1679,3463},
}
--=========================================================================================
BOSS1_POS_COUNT = getn(tNpcRegion[NPC_TYPE_XIANGZHU]);
BOSS2_POS_COUNT = getn(tNpcRegion[NPC_TYPE_FUTANGZHU]);
BOSS3_POS_COUNT = getn(tNpcRegion[NPC_TYPE_LIDAZUI]);
MAX_BOX1_COUNT = ceil(PLAY_TIME/5)*BOSS1_POS_COUNT;	--香主箱子的总数
MAX_BOX2_COUNT = ceil(PLAY_TIME/5)*BOSS2_POS_COUNT;	--副堂主箱子的总数
MAX_BOX3_COUNT = ceil(PLAY_TIME/15)*BOSS3_POS_COUNT;	--李大嘴箱子的总数
--=========================================================================================
--检查是否把本门最高武学练到了极至
function KH_Check_Skill_Level()
	local nRoute = GetPlayerRoute();
	local nSkillID = tRouteInfo[nRoute][1];
	local nMaxLevel = tRouteInfo[nRoute][2];
	if tRouteInfo[nRoute][1] == 0 then
		return 0;
	else
		if GetSkillLevel(nSkillID) >= nMaxLevel then
			return 1
		else
			return 0;
		end;
	end;
end;
--函数名称：NPC索引值设定
--功        能：直接设定NPC索引位置的值
function KH_SetUnit_CurStates(Npc_index,att_seq,number)
	if number > 99 and att_seq ~= 1 and att_seq ~= 4 and att_seq ~= 5 and att_seq ~= 6 then
		print("Thi誸 l藀 tr� s� NPC nh莔: V� tr�:"..att_seq.."Tr�:"..number)
		return 0
	end
	local num_save = GetUnitCurStates(Npc_index,att_seq)
	num_save = number - num_save
	AddUnitStates(Npc_index,att_seq,num_save)
	return 1
end
--给奖励
function KH_Give_Award(nType)
	if GetMapTaskTemp(MAP_ID,MAPV_OPEN_BOX_FORBIDDEN) == 1 then
		local nNpcIdx = GetTaskTemp(KH_TASK_TEMP_BOX_INDEX);
		SetNpcLifeTime(nNpcIdx,0);
		gf_Msg2Team("S� lng rng  vt gi韎 h筺!");
		return 0;
	end;
--	local nFrui = tTaoAward[nType][1];
	local tbAward = tbThuongMoRuong[nType]
	local nTeamSize = GetTeamSize();
	local nOldPlayerIdx = PlayerIndex;
	local tMPVID = {
					[1] = MAPV_OPENED_BOX1_COUNT,
					[2] = MAPV_OPENED_BOX2_COUNT,
					[3] = MAPV_OPENED_BOX3_COUNT,
					}
	if nTeamSize > 1 then
		for i=1,nTeamSize do
			PlayerIndex = GetTeamMember(i);
			KH_Normal_Award(nType);
			VIET_0908_Aword(nType);		--2009年8月活动奖励
			VIET_1009_DoQuest(nType)
--			gf_AddItemEx2({2,1,30176,nFrui}, "T竜", "Nhiem vu STD", "nh薾")
--			gf_AddItemEx2(	tbAward, "Mo ruong", "Nhiem vu STD", "nh薾")
		end;
		PlayerIndex = nOldPlayerIdx;
	else
		KH_Normal_Award(nType);
		VIET_0908_Aword(nType);		--2009年8月活动奖励
		VIET_1009_DoQuest(nType)
	end;
	if tonumber(date("%y%m%d")) >= 100716 and tonumber(date("%y%m%d")) <= 400815 then
		VIET_1005_Award(nType)
	end
	if tonumber(date("%y%m%d")) >= 101008 and tonumber(date("%y%m%d")) <= 401025 then
		VIET_1010_Bhta4(nType)
	end
	-- Bang h閕 tinh anh 6 , ngu錸 ra hoa h錸g
	if tonumber(date("%y%m%d")) >= 110930 and tonumber(date("%y%m%d")) <= 411023 then
		VIET_1103_BHTA6(nType)
	end
	KH_Special_Award(nType);	--针对所有人的奖励
	VIET_0908_Aword(nType);		--2009年8月活动奖励
	-- B� ph莕 thng v� kh�
--	VET_Tier4GiveKillerHallAward(nType);-- 师门4套
	local nMapVID = tMPVID[nType];
	--< Added by SunZhuoshi
	if 1 == GetMapTaskTemp(MAP_ID, nMapVID) then
		HBRewardInKillerHall();
	end
	-->
	SetMapTaskTemp(MAP_ID,nMapVID,GetMapTaskTemp(MAP_ID,nMapVID)+1);	--开启过的箱子计数
	KH_Check_Box_Count();	--检查箱子数量
end;
--宝箱普通奖励
function KH_Normal_Award(nType)
	local nCurMapID = GetWorldPos();
	if nCurMapID ~= MAP_ID then	--如果不在杀手堂地图就不能获得奖励
		return 0;
	end;
	if IsPlayerDeath() == 0 then --不是死亡状态
		KH_Exp_Award(nType);	--经验奖励
	end;
	KH_LingShiPF_Award(nType);	--灵石配方奖励
	SetTask(KH_TASK_OPEN_BOX_TIME,GetTask(KH_TASK_OPEN_BOX_TIME)+1);	--获得奖励次数加1
end;
--灵石奖励
function KH_LingShiPF_Award(nType)
	local nGotAwardTime = GetTask(KH_TASK_OPEN_BOX_TIME);
	local nRandPro = {30,50,100};
	local nRand = random(1,100);
	local nPFLevel = 0;
	local nLevel = GetLevel();
	if nGotAwardTime >= 7 and nGotAwardTime <= 11 then
		if nRand <= floor(nRandPro[nType]*2/3) then	--第7至第11次，衰减为原来的2/3
			if nLevel < 80 then
				nPFLevel = random(1,5);
			else
				nPFLevel = random(2,5);
			end;
		end;
	elseif nGotAwardTime >= 12 and nGotAwardTime <= 17 then
		if nRand <= floor(nRandPro[nType]*1/2) then	--第12至第17次，衰减为原来的1/2
			if nLevel < 80 then
				nPFLevel = random(1,5);
			else
				nPFLevel = random(2,5);
			end;
		end;
	elseif nGotAwardTime >= 18 then
		if nRand <= floor(nRandPro[nType]*1/4) then	--第18次之后，衰减为原来的1/4
			if nLevel < 80 then
				nPFLevel = random(1,5);
			else
				nPFLevel = random(2,5);
			end;
		end;
	else
		if nLevel < 80 then
			nPFLevel = random(1,5);
		else
			nPFLevel = random(2,5);
		end;
	end;
	if nPFLevel ~= 0 then
		lspf_AddPeiFangInBottle(nPFLevel,1);
		Msg2Player("B筺 nh薾 頲 1 "..nPFLevel.." (c蕄) Linh th筩h ph鑙 phng,  nh藀 v祇 T� Linh жnh");
	end;
end;
--箱子普通奖励中的经验奖励
function KH_Exp_Award(nType)
	local nGotAwardTime = GetTask(KH_TASK_OPEN_BOX_TIME);
	local nExp = tExpAward[nType][1];
	if nGotAwardTime >= 7 and nGotAwardTime <= 11 then
		nExp = floor(nExp*2/3);	--第7至第11次，衰减为原来的2/3
	elseif nGotAwardTime >= 12 and nGotAwardTime <= 17 then
		nExp = floor(nExp*1/2);	--第12至第17次，衰减为原来的1/2
	elseif nGotAwardTime >= 18 then
		nExp = floor(nExp*1/4);	--第18次之后，衰减为原来的1/4
	end; 
	ModifyExp(nExp);
	Msg2Player("B筺 nh薾 頲 "..nExp.." 甶觤 kinh nghi謒");
end;
--宝箱特殊奖励
function KH_Special_Award(nType)
	local nRand = 0;
	local nTeamSize = GetTeamSize();
	local nOldPlayerIdx = PlayerIndex;
	local tProb1 = {10,15,50};	--得武器的概率
	local tProb2 = {0,0,1};	--得师门武器的图纸碎片的概率，单位万分之一
	local tProb3 = {0,0,20};	--得秘籍碎片的概率
	nRand = random(1,100);
	if nRand <= tProb1[nType] then	--给武器
		if nTeamSize <= 1 then
--			KH_Add_Weapon();
		else
			for i=1,nTeamSize do
				PlayerIndex = GetTeamMember(i);
--				KH_Add_Weapon();
			end;
			PlayerIndex = nOldPlayerIdx;
		end;
	end;
	nRand = random(1,100);
	if nRand <= tProb3[nType] then	--给秘籍碎片
		if nTeamSize <= 1 then
			KH_Book_Frag();
		else
			for i=1,nTeamSize do
				PlayerIndex = GetTeamMember(i);
				KH_Book_Frag();
			end;
			PlayerIndex = nOldPlayerIdx;
		end;
	end;	
	nRand = random(1,100);
	local nNpcIdx = GetTaskTemp(KH_TASK_TEMP_BOX_INDEX);
	if nRand <= tProb2[nType] then	--给师门武器的图纸碎片
		KH_Drop_Weapon_Map(nNpcIdx);	--会在掷色子后删除NPC
	else
		SetTaskTemp(KH_TASK_TEMP_BOX_INDEX,0);
		SetNpcLifeTime(nNpcIdx,0);	--如果不用掷色子就删除NPC
	end;
	PlayerIndex = nOldPlayerIdx;
end;
--给一张秘籍碎片
--改为给予一张太易混元功图鉴 edited by vivi
function KH_Book_Frag()
	local nCurMapID = GetWorldPos();
	local nRetCode = 0;
	if nCurMapID ~= MAP_ID then	--如果不在杀手堂地图就不能获得奖励
		return 0;
	end;
	nRetCode = AddItem(tItemInfo[2][2],tItemInfo[2][3],tItemInfo[2][4],1);
	if nRetCode == 1 then
		Msg2Player("B筺 頲 1 "..tItemInfo[2][1]);
		WriteLog("[S竧 Th� Л阯g]::"..GetName().."Nh薾 頲 "..tItemInfo[2][1]);
	else
		WriteLog("[S竧 Th� Л阯g b竜 l鏸]:"..GetName().."Nh薾 頲"..tItemInfo[2][1].." th蕋 b筰, nRetCode:"..nRetCode);
	end;
end;
--增加一个神秘物品
function KH_Add_Random_Mystic_Thing(nCount)
	local nRand = 0;
	for i=1,nCount do
		nRand = random(1,getn(tMysticThing));
		if AddItem(tMysticThing[nRand][2],tMysticThing[nRand][3],tMysticThing[nRand][4],1) == 1 then
			Msg2Player("B筺 nh薾 頲 m閠 v藅 ph萴 th莕 b�:"..tMysticThing[nRand][1]);
		end;
	end;
end;
--获得与路线相对应的武器
function KH_Add_Weapon()
	local nCurMapID = GetWorldPos();
	if nCurMapID ~= MAP_ID then	--如果不在杀手堂地图就不能获得奖励
		return 0;
	end;
	local nRoute = GetPlayerRoute();
	local tWeaponList = tRouteInfo[nRoute][3];
	local nWeaponCount = getn(tWeaponList);
	local nRetCode = 0;
	if nWeaponCount > 0 then
		local nRand = random(1,nWeaponCount);
		nRetCode = AddItem(tWeaponList[nRand][2],tWeaponList[nRand][3],tWeaponList[nRand][4],1)
		if nRetCode == 1 then
			Msg2Player("B筺 nh薾 頲 1 "..tWeaponList[nRand][1]);
			WriteLog("[S竧 Th� Л阯g]::"..GetName().."Nh薾 頲"..tWeaponList[nRand][1]);
		else
			WriteLog("[S竧 Th� Л阯g b竜 l鏸]:"..GetName().."Nh薾 v� kh� th蕋 b筰, nRetCode:"..nRetCode);
		end;
	end;
end;
--获得队伍里面在杀手堂地图的队员人数
function KH_Get_InMap_Member_Count()
	local nTeamSize = GetTeamSize();
	local nTeamMemberCount = 0;
	local nOldPlayerIdx = PlayerIndex;
	for i=1,nTeamSize do
		PlayerIndex = GetTeamMember(i);
		local nCurMapID = GetWorldPos()
		if nCurMapID == MAP_ID then
			nTeamMemberCount = nTeamMemberCount + 1;
		end;
	end;
	PlayerIndex = nOldPlayerIdx;
	return nTeamMemberCount;
end;
--掉落神兵锻造图碎片
--改为10张太乙混元功图鉴 edited by vivi 
function KH_Drop_Weapon_Map(nNpcIdx)
	local nInMapMemberCount = KH_Get_InMap_Member_Count();
	local nTeamSize = GetTeamSize();
	local nRetCode = 0;
	if nTeamSize <= 1 then	--如果没组队或队伍只有自己一个人
		nRetCode = AddItem(tItemInfo[3][2],tItemInfo[3][3],tItemInfo[3][4],10);
		if nRetCode == 1 then
			Msg2Player("B筺 nh薾 頲 10 t蕀 "..tItemInfo[3][1]);
			WriteLog("[S竧 Th� Л阯g]::"..GetName().."Nh薾 頲 "..tItemInfo[3][1]);
		else
			WriteLog("[S竧 Th� Л阯g b竜 l鏸]:"..GetName().."Nh薾 頲"..tItemInfo[3][1].." th蕋 b筰, nRetCode:"..nRetCode);
		end;
		SetTaskTemp(KH_TASK_TEMP_BOX_INDEX,0);
		SetNpcLifeTime(nNpcIdx,0);
		return 0;
	end;
	if nNpcIdx <= 0 then
		return
	end
	local dwID = GetUnitCurStates(nNpcIdx, 3)	--1,2号属性已经被用
	if dwID == 0 then
		local nRet = ApplyItemDice(1, 100, 40, THIS_FILE_NAME, "KH_Time_Over", nInMapMemberCount,nNpcIdx)
		AddDiceItemInfo(nRet,tItemInfo[3][2],tItemInfo[3][3],tItemInfo[3][4],10);
		AddUnitStates(nNpcIdx, 3, nRet);
		local nPlayerOld = PlayerIndex;
		local nCurMapID = 0;
		for i=1, nTeamSize do
			PlayerIndex = GetTeamMember(i)
			nCurMapID = GetWorldPos();
			if nCurMapID == MAP_ID then
				RollItem(nRet);
			end;
		end
		PlayerIndex = nPlayerOld;
		return
	end
	local nState = GetItemDiceState(dwID)
	if nState == 0 then
		Msg2Player("ng gi竚 nh thu閏 t輓h v藅 ph萴!")
	elseif nState == 1 then
		local n = DiceLootItem(dwID)
		if n == 0 then
			gf_Msg2Team(GetName().."Nh薾 頲 "..tItemInfo[3][1],1)
		elseif n == 1 then
			Msg2Player("H祅h trang kh玭g c遪 tr鑞g, kh玭g th� nh薾 v藅 ph萴")
		end
	elseif nState == 2 then
		--Msg2Player("箱子中已经没有物品了")
	end
end
--色子完成处理
function KH_Time_Over(dwID)
	local t, nSize = GetItemDiceRollInfo(dwID)
	local bAllGiveUp = 1
	for index, value in t do
		local str = value[1].."N衜"..value[2].." 甶觤"
		if value[3] == 0 then
			str = value[1].."Ph鉵g"
		elseif value[3] == 1 then
			str = str.." (Tuy誸 c莡)"
			if value[4] == 1 then
				str = str.." -- Nh薾 頲 "..tItemInfo[3][1]
				WriteLog("[S竧 Th� Л阯g]::"..value[1].."Nh薾 頲 "..tItemInfo[3][1]);
			end
			bAllGiveUp = 0
		elseif value[3] == 2 then
			str = str.." (Tham lam)"
			if value[4] == 1 then
				str = str.." -- Nh薾 頲 "..tItemInfo[3][1]
				WriteLog("[S竧 Th� Л阯g]::"..value[1].."Nh薾 頲 "..tItemInfo[3][1]);
			end
			bAllGiveUp = 0
		end
		Msg2Player(str)
	end
	if bAllGiveUp == 1 then
		Msg2Player("T蕋 c� ngi ch琲  b� cu閏")
	elseif nSize ~= getn(t) then
		Msg2Player("Nh鱪g ngi ch琲 kh竎  vt qu� th阨 gian, xem nh� b� cu閏")
	end
	local nNpcIdx = GetTaskTemp(KH_TASK_TEMP_BOX_INDEX);
	if nNpcIdx > 0 then
		if GetNpcWorldPos(nNpcIdx) == MAP_ID then
			SetNpcLifeTime(nNpcIdx,0);
		else
			WriteLog("[S竧 Th� Л阯g b竜 l鏸]:"..GetName().."Л阯g d蒼 t譵 NPC b� sai:"..GetNpcName(nNpcIdx));
		end;
		SetTaskTemp(KH_TASK_TEMP_BOX_INDEX,0);
	end
end
--清除所有地图变量
function KH_Clear_Map_Value()
	for i=MAPV_BEGIN,MAPV_END do
		SetMapTaskTemp(MAP_ID,i,0);
	end;
end;
--检查开箱子数是否异常
function KH_Check_Box_Count()
	local nBox1Count = GetMapTaskTemp(MAP_ID,MAPV_OPENED_BOX1_COUNT);
	local nBox2Count = GetMapTaskTemp(MAP_ID,MAPV_OPENED_BOX2_COUNT);
	local nBox3Count = GetMapTaskTemp(MAP_ID,MAPV_OPENED_BOX3_COUNT);
	--由于加入了IB道具可以创建BOSS，所以这个检查就没必要了0
	if nBox1Count > MAX_BOX1_COUNT or nBox2Count > MAX_BOX2_COUNT or nBox3Count > MAX_BOX3_COUNT then
		--SetMapTaskTemp(MAP_ID,MAPV_OPEN_BOX_FORBIDDEN,1);
		--gf_ShowDebugInfor("箱子数量异常！！！！nBox1Count:"..nBox1Count.."，nBox2Count:"..nBox2Count.."，nBox3Count:"..nBox3Count);
	end;
end;

--2009年8月活动奖励
function VIET_0908_Aword(nType)
	if tonumber(date("%y%m%d")) >= 090807 and tonumber(date("%y%m%d")) < 490907 then
		local nDayWeek = tonumber(date("%w"));
		if nDayWeek == 0 or nDayWeek == 1 or nDayWeek == 5 or nDayWeek == 6 then 
			if GetTask(2081) < tonumber(date("%y%m%d")) then
				SetTask(2082, 0);
			end
			if GetTask(2082) >= 5000000 then return end;
			local nRand = random(1, 100);
			local nExp = 0;
			if nType == NPC_TYPE_XIANGZHU then
				if nRand <= 20 then
					nExp = 100000;
				elseif nRand > 20 and nRand <= 40 then
					nExp = 200000;
				else
					nExp = 300000;
				end
			elseif nType == NPC_TYPE_FUTANGZHU then
				if nRand <= 40 then
					nExp = 100000;
				elseif nRand > 40 and nRand <= 80 then
					nExp = 200000;
				else
					nExp = 300000;
				end
			elseif nType == NPC_TYPE_LIDAZUI then
				if nRand <= 45 then
					nExp = 100000;
				elseif nRand > 45 and nRand <= 90 then
					nExp = 200000;
				else
					nExp = 300000;
				end
			end
			ModifyExp(nExp);
			SetTask(2082, GetTask(2082) + nExp);
			SetTask(2081, tonumber(date("%y%m%d")));
		end
	end
end

tFruitAward = {
	{"Cam", 2, 1, 30166},
	{"Bi", 2, 1, 30169},
	{"D﹗", 2, 1, 30170},
}

function VIET_1005_Award(nType)
	local nRand = random(1, 100)
	local nAward = 0
	local nQuanlity = 0
	
	if nType == NPC_TYPE_XIANGZHU then
		nAward = 1
		nQuanlity = 1
	elseif nType == NPC_TYPE_FUTANGZHU then
		if nRand <= 60 then
			nAward = 1
			nQuanlity = 2
		else
			nAward = 2
			nQuanlity = 2
		end
	elseif nType == NPC_TYPE_LIDAZUI then
		if nRand <= 40 then
			nAward = 1
			nQuanlity = 3
		elseif nRand <= 70 then
			nAward = 2
			nQuanlity = 3
		else
			nAward = 3
			nQuanlity = 3
		end
	end
	
	local nTeamSize = GetTeamSize();
	local nOldPlayerIdx = PlayerIndex;
	if nTeamSize > 1 then
		for i=1,nTeamSize do
			PlayerIndex = GetTeamMember(i)
			if GetWorldPos() ~= MAP_ID then
				break
			end
			if IsPlayerDeath() == 0 then
				gf_AddItemEx2({tFruitAward[nAward][2], tFruitAward[nAward][3], tFruitAward[nAward][4], nQuanlity}, tFruitAward[nAward][1], "Sat Thu Duong", "nh薾")
			end
		end
		PlayerIndex = nOldPlayerIdx
	else
		if GetWorldPos() ~= MAP_ID then
			return 0
		end
		if IsPlayerDeath() == 0 then
			gf_AddItemEx2({tFruitAward[nAward][2], tFruitAward[nAward][3], tFruitAward[nAward][4], nQuanlity}, tFruitAward[nAward][1], "Sat Thu Duong", "nh薾")
		end
	end
end

function VIET_1009_DoQuest(nType)
	local nStatus = floor(mod(GetTask(KH_QUEST_TSK), 100)/10)
	if nStatus > 0 then
		if nStatus < 2 then
			SetTask(KH_QUEST_TSK, GetTask(KH_QUEST_TSK) + 10)
		end
		local nBox1 = floor(mod(GetTask(KH_QUEST_TSK), 1000)/100)
		local nBox2 = floor(mod(GetTask(KH_QUEST_TSK), 10000)/1000)
		local nBox3 = floor(mod(GetTask(KH_QUEST_TSK), 100000)/10000)
	
		if nType == NPC_TYPE_XIANGZHU and nBox1 == 0 then
			SetTask(KH_QUEST_TSK, GetTask(KH_QUEST_TSK) + 100)
			--gf_AddItemEx2({2,1,30176,1}, "T竜", "Nhiem vu STD", "nh薾")
		elseif nType == NPC_TYPE_FUTANGZHU and nBox2 == 0 then
			SetTask(KH_QUEST_TSK, GetTask(KH_QUEST_TSK) + 1000)
			--gf_AddItemEx2({2,1,30176,2}, "T竜", "Nhiem vu STD", "nh薾")
		elseif nType == NPC_TYPE_LIDAZUI and nBox3 == 0 then
			SetTask(KH_QUEST_TSK, GetTask(KH_QUEST_TSK) + 10000)
			--gf_AddItemEx2({2,1,30176,4}, "T竜", "Nhiem vu STD", "nh薾")
		end
		Msg2Player("Ho祅 th祅h nhi謒 v� m� rng!")
	end
end

function VIET_1010_Bhta4(nType)
	local nTeamSize = GetTeamSize();
	local nOldPlayerIdx = PlayerIndex;
	if nTeamSize > 1 then
		for i=1,nTeamSize do
			PlayerIndex = GetTeamMember(i)
			if GetWorldPos() ~= MAP_ID then
				break
			end
			if IsPlayerDeath() == 0 then
				if nType == NPC_TYPE_XIANGZHU then
					gf_AddItemEx2({2,0,1162,5}, "Hoa H錸g п", "Bang Hoi Tinh Anh 4", "m� rng Hng Ch�")
				elseif nType == NPC_TYPE_FUTANGZHU then
					gf_AddItemEx2({2,0,1162,10}, "Hoa H錸g п", "Bang Hoi Tinh Anh 4", "m� rng Ph� Л阯g Ch�")
				elseif nType == NPC_TYPE_LIDAZUI then
					gf_AddItemEx2({2,0,1164,1}, "Hoa H錸g Ph蕁", "Bang Hoi Tinh Anh 4", "m� rng L� Чi Ch駓")
				end
			end
		end
		PlayerIndex = nOldPlayerIdx
	else
		if GetWorldPos() ~= MAP_ID then
			return 0
		end
		if IsPlayerDeath() == 0 then
			if nType == NPC_TYPE_XIANGZHU then
				gf_AddItemEx2({2,0,1162,5}, "Hoa H錸g п", "Bang Hoi Tinh Anh 4", "m� rng Hng Ch�")
			elseif nType == NPC_TYPE_FUTANGZHU then
				gf_AddItemEx2({2,0,1162,10}, "Hoa H錸g п", "Bang Hoi Tinh Anh 4", "m� rng Ph� Л阯g Ch�")
			elseif nType == NPC_TYPE_LIDAZUI then
				gf_AddItemEx2({2,0,1164,1}, "Hoa H錸g Ph蕁", "Bang Hoi Tinh Anh 4", "m� rng L� Чi Ch駓")
			end
		end
	end
end

function VIET_1103_BHTA6(nType)
	local nTeamSize = GetTeamSize();
	local nOldPlayerIdx = PlayerIndex;
	if nTeamSize > 1 then
		for i=1,nTeamSize do
			PlayerIndex = GetTeamMember(i)
			if GetWorldPos() ~= MAP_ID then
				break
			end
			if IsPlayerDeath() == 0 then
				if nType == NPC_TYPE_XIANGZHU then
					gf_AddItemEx2({2,0,1164,5}, "Hoa H錸g Ph蕁", "Bang Hoi Tinh Anh 6", "m� rng Hng Ch�")
				elseif nType == NPC_TYPE_FUTANGZHU then
					gf_AddItemEx2({2,0,1164,10}, "Hoa H錸g Ph蕁", "Bang Hoi Tinh Anh 6", "m� rng Ph� Л阯g Ch�")
				elseif nType == NPC_TYPE_LIDAZUI then
					gf_AddItemEx2({2,1,30255,5}, "Hoa H錸g V祅g", "Bang Hoi Tinh Anh 6", "m� rng L� Чi Ch駓")
				end
			end
		end
		PlayerIndex = nOldPlayerIdx
	else
		if GetWorldPos() ~= MAP_ID then
			return 0
		end
		if IsPlayerDeath() == 0 then
			if nType == NPC_TYPE_XIANGZHU then
				gf_AddItemEx2({2,0,1164,5}, "Hoa H錸g Ph蕁", "Bang Hoi Tinh Anh 6", "m� rng Hng Ch�")
			elseif nType == NPC_TYPE_FUTANGZHU then
				gf_AddItemEx2({2,0,1164,10}, "Hoa H錸g Ph蕁", "Bang Hoi Tinh Anh 6", "m� rng Ph� Л阯g Ch�")
			elseif nType == NPC_TYPE_LIDAZUI then
				gf_AddItemEx2({2,1,30255,5}, "Hoa H錸g V祅g", "Bang Hoi Tinh Anh 6", "m� rng L� Чi Ch駓")
			end
		end
	end
end