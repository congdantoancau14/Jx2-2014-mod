--召回老玩家活动
--by vivi
--2008/07/07

--任务变量
TASK_GET_OLD = 916;      --是否领取了老玩家奖励 存入领取日期
TASK_KILL_PLAYER = 917;  --杀死别的门派的玩家次数
TASK_KILLED_NUM = 918;   --被别的门派玩家杀死的次数
TASK_EXP_DATE = 919;     --称号给经验的日期 每天更新
TASK_EXP_NUM = 920;      --称号给经验的次数，1个小时，给60次
TASK_KILL_DATE = 921;    --记录争霸战的杀人日期
TASK_AWARD_NUM = 922;    --记录第几次领取奖励
TASK_AWARD_WEEK = 923;   --记录领取奖励的周的序数
TASK_MENPAI_AWARD = 924; --记录领取门派奖励周的序数 
TASK_TIANDI_CHOUJIANG = 925; --是否抽过奖

--触发器ID
CALLBACK_TIME_ID = 51;
CALLBACK_TRIGGER_ID = 2022;

--杀手武器
tShashou = {
	[0] = {{0,3,63,3,85,5,95,4,63},{0,8,96,3,86,5,98,4,64},{0,0,13,3,86,5,98,4,64},{0,1,52,3,85,5,96,4,63},{0,2,26,6,42,5,98,2,99},{0,10,74,3,86,5,98,4,64},{0,0,13,3,85,5,95,4,63},{0,5,39,3,85,5,95,4,63},{0,2,26,3,86,5,98,4,64},{0,9,85,3,85,5,97,4,63},{0,6,107,3,85,5,95,4,63},{0,4,118,3,85,5,96,4,63},{0,7,11,3,85,5,96,4,63},{0,11,11,3,86,5,98,4,64}},
	[1] = {{0,3,63,3,85,5,95,4,63},{0,8,96,3,86,5,98,4,64},{0,0,13,3,86,5,98,4,64}},
	[2] = {{0,3,63,3,85,5,95,4,63}},
	[3] = {{0,8,96,3,86,5,98,4,64}},
	[4] = {{0,0,13,3,86,5,98,4,64}},
	[5] = {{0,1,52,3,85,5,96,4,63}},
	[6] = {{0,1,52,3,85,5,96,4,63}},
	[7] = {{0,2,26,6,42,5,98,2,99},{0,10,74,3,86,5,98,4,64}},
	[8] = {{0,2,26,6,42,5,98,2,99}},
	[9] = {{0,10,74,3,86,5,98,4,64}},
	[10] = {{0,0,13,3,85,5,95,4,63},{0,5,39,3,85,5,95,4,63}},
	[11] = {{0,0,13,3,85,5,95,4,63}},
	[12] = {{0,5,39,3,85,5,95,4,63}},
	[13] = {{0,2,26,3,86,5,98,4,64},{0,9,85,3,85,5,97,4,63}},
	[14] = {{0,2,26,3,86,5,98,4,64}},
	[15] = {{0,9,85,3,85,5,97,4,63}},
	[16] = {{0,6,107,3,85,5,95,4,63},{0,4,118,3,85,5,96,4,63}},
	[17] = {{0,6,107,3,85,5,95,4,63}},
	[18] = {{0,4,118,3,85,5,96,4,63}},
	[19] = {{0,7,11,3,85,5,96,4,63},{0,11,11,3,86,5,98,4,64}},
	[20] = {{0,7,11,3,85,5,96,4,63}},
	[21] = {{0,11,11,3,86,5,98,4,64}}
};

--炎帝装备
tYandi = {
	{"Vi猰 д kh玦",0,103,8000},
	{"Vi猰 д gi竝",0,100,8000},
	{"Vi猰 д trang",0,101,8000}
};

tXuanyuanZhan = 
{
	[0] = {{"Hi猲 Vi猲 Chi課",0,102,8801},{"Hi猲 Vi猲 Chi課",0,102,8803},{"Hi猲 Vi猲 Chi課",0,102,8805},{"Hi猲 Vi猲 Chi課",0,102,8807},{"Hi猲 Vi猲 Chi課",0,102,8809},{"Hi猲 Vi猲 Chi課",0,102,8811},{"Hi猲 Vi猲 Chi課",0,102,8813},{"Hi猲 Vi猲 Chi課",0,102,8815},{"Hi猲 Vi猲 Chi課",0,102,8817},{"Hi猲 Vi猲 Chi課",0,102,8819},{"Hi猲 Vi猲 Chi課",0,102,8821},{"Hi猲 Vi猲 Chi課",0,102,8823},{"Hi猲 Vi猲 Chi課",0,102,8825},{"Hi猲 Vi猲 Chi課",0,102,8827}},
	[1] = {{"Hi猲 Vi猲 Chi課",0,102,8801},{"Hi猲 Vi猲 Chi課",0,102,8803},{"Hi猲 Vi猲 Chi課",0,102,8805}},
	[2] = {{"Hi猲 Vi猲 Chi課",0,102,8801}},
	[3] = {{"Hi猲 Vi猲 Chi課",0,102,8803}},
	[4] = {{"Hi猲 Vi猲 Chi課",0,102,8805}},
	[5] = {{"Hi猲 Vi猲 Chi課",0,102,8807}},
	[6] = {{"Hi猲 Vi猲 Chi課",0,102,8807}},
	[7] = {{"Hi猲 Vi猲 Chi課",0,102,8809},{"Hi猲 Vi猲 Chi課",0,102,8811}},
	[8] = {{"Hi猲 Vi猲 Chi課",0,102,8809}},
	[9] = {{"Hi猲 Vi猲 Chi課",0,102,8811}},
	[10] = {{"Hi猲 Vi猲 Chi課",0,102,8813},{"Hi猲 Vi猲 Chi課",0,102,8815}},
	[11] = {{"Hi猲 Vi猲 Chi課",0,102,8813}},
	[12] = {{"Hi猲 Vi猲 Chi課",0,102,8815}},
	[13] = {{"Hi猲 Vi猲 Chi課",0,102,8817},{"Hi猲 Vi猲 Chi課",0,102,8819}},
	[14] = {{"Hi猲 Vi猲 Chi課",0,102,8817}},
	[15] = {{"Hi猲 Vi猲 Chi課",0,102,8819}},
	[16] = {{"Hi猲 Vi猲 Chi課",0,102,8821},{"Hi猲 Vi猲 Chi課",0,102,8823}},
	[17] = {{"Hi猲 Vi猲 Chi課",0,102,8821}},
	[18] = {{"Hi猲 Vi猲 Chi課",0,102,8823}},
	[19] = {{"Hi猲 Vi猲 Chi課",0,102,8825},{"Hi猲 Vi猲 Chi課",0,102,8827}},
	[20] = {{"Hi猲 Vi猲 Chi課",0,102,8825}},
	[21] = {{"Hi猲 Vi猲 Chi課",0,102,8827}},
}
	
tXuanyuanDou = 
{
	[0] = {{"Hi猲 Vi猲 u",0,102,8802},{"Hi猲 Vi猲 u",0,102,8804},{"Hi猲 Vi猲 u",0,102,8806},{"Hi猲 Vi猲 u",0,102,8808},{"Hi猲 Vi猲 u",0,102,8810},{"Hi猲 Vi猲 u",0,102,8812},{"Hi猲 Vi猲 u",0,102,8814},{"Hi猲 Vi猲 u",0,102,8816},{"Hi猲 Vi猲 u",0,102,8818},{"Hi猲 Vi猲 u",0,102,8820},{"Hi猲 Vi猲 u",0,102,8822},{"Hi猲 Vi猲 u",0,102,8824},{"Hi猲 Vi猲 u",0,102,8826},{"Hi猲 Vi猲 u",0,102,8828}},
	[1] = {{"Hi猲 Vi猲 u",0,102,8802},{"Hi猲 Vi猲 u",0,102,8804},{"Hi猲 Vi猲 u",0,102,8806}},
	[2] = {{"Hi猲 Vi猲 u",0,102,8802}},
	[3] = {{"Hi猲 Vi猲 u",0,102,8804}},
	[4] = {{"Hi猲 Vi猲 u",0,102,8806}},
	[5] = {{"Hi猲 Vi猲 u",0,102,8808}},
	[6] = {{"Hi猲 Vi猲 u",0,102,8808}},
	[7] = {{"Hi猲 Vi猲 u",0,102,8810},{"Hi猲 Vi猲 u",0,102,8812}},
	[8] = {{"Hi猲 Vi猲 u",0,102,8810}},
	[9] = {{"Hi猲 Vi猲 u",0,102,8812}},
	[10] = {{"Hi猲 Vi猲 u",0,102,8814},{"Hi猲 Vi猲 u",0,102,8816}},
	[11] = {{"Hi猲 Vi猲 u",0,102,8814}},
	[12] = {{"Hi猲 Vi猲 u",0,102,8816}},
	[13] = {{"Hi猲 Vi猲 u",0,102,8818},{"Hi猲 Vi猲 u",0,102,8820}},
	[14] = {{"Hi猲 Vi猲 u",0,102,8818}},
	[15] = {{"Hi猲 Vi猲 u",0,102,8820}},
	[16] = {{"Hi猲 Vi猲 u",0,102,8822},{"Hi猲 Vi猲 u",0,102,8824}},
	[17] = {{"Hi猲 Vi猲 u",0,102,8822}},
	[18] = {{"Hi猲 Vi猲 u",0,102,8824}},
	[19] = {{"Hi猲 Vi猲 u",0,102,8826},{"Hi猲 Vi猲 u",0,102,8828}},
	[20] = {{"Hi猲 Vi猲 u",0,102,8826}},
	[21] = {{"Hi猲 Vi猲 u",0,102,8828}},
}

tHuangDiWeapon = 
{
	[0] = {{"Hi猲 Vi猲 To竔 V� o",0,3,8801},{"Hi猲 Vi猲 To竔 V� C玭",0,5,8802},{"Hi猲 Vi猲 C鰑 Nh� Trng",0,8,8803},{"Hi猲 Vi猲 H筼 Nhi猲 Th�",0,0,8804},{"Hi猲 Vi猲 Gi韎 T� Kim",0,1,8805},{"Hi猲 Vi猲 T� Tinh Ki誱",0,2,8806},{"Hi猲 Vi猲 Ph鬾g Ho祅g C莔",0,10,8807},{"Hi猲 Vi猲 Ng� Nh筩 Th�",0,0,8808},{"Hi猲 Vi猲 Ph� Thi猲 C玭",0,5,8809},{"Hi猲 Vi猲 H錸g Qu﹏ Ki誱",0,2,8810},{"Hi猲 Vi猲 Sinh T� B髏",0,9,8811},{"Hi猲 Vi猲 Ph� Qu﹏ Thng",0,6,8812},{"Hi猲 Vi猲 Khai Thi猲 Cung",0,4,8813},{"Hi猲 Vi猲  Dng Nh蒼",0,7,8814},{"Hi猲 Vi猲 U Minh Tr秓",0,11,8815}},
	[1] = {{"Hi猲 Vi猲 To竔 V� o",0,3,8801},{"Hi猲 Vi猲 To竔 V� C玭",0,5,8802},{"Hi猲 Vi猲 C鰑 Nh� Trng",0,8,8803},{"Hi猲 Vi猲 H筼 Nhi猲 Th�",0,0,8804}},
	[2] = {{"Hi猲 Vi猲 To竔 V� o",0,3,8801},{"Hi猲 Vi猲 To竔 V� C玭",0,5,8802}},
	[3] = {{"Hi猲 Vi猲 C鰑 Nh� Trng",0,8,8803}},
	[4] = {{"Hi猲 Vi猲 H筼 Nhi猲 Th�",0,0,8804}},
	[5] = {{"Hi猲 Vi猲 Gi韎 T� Kim",0,1,8805}},
	[6] = {{"Hi猲 Vi猲 Gi韎 T� Kim",0,1,8805}},
	[7] = {{"Hi猲 Vi猲 T� Tinh Ki誱",0,2,8806},{"Hi猲 Vi猲 Ph鬾g Ho祅g C莔",0,10,8807}},
	[8] = {{"Hi猲 Vi猲 T� Tinh Ki誱",0,2,8806}},
	[9] = {{"Hi猲 Vi猲 Ph鬾g Ho祅g C莔",0,10,8807}},
	[10] = {{"Hi猲 Vi猲 Ng� Nh筩 Th�",0,0,8808},{"Hi猲 Vi猲 Ph� Thi猲 C玭",0,5,8809}},
	[11] = {{"Hi猲 Vi猲 Ng� Nh筩 Th�",0,0,8808}},
	[12] = {{"Hi猲 Vi猲 Ph� Thi猲 C玭",0,5,8809}},
	[13] = {{"Hi猲 Vi猲 H錸g Qu﹏ Ki誱",0,2,8810},{"Hi猲 Vi猲 Sinh T� B髏",0,9,8811}},
	[14] = {{"Hi猲 Vi猲 H錸g Qu﹏ Ki誱",0,2,8810}},
	[15] = {{"Hi猲 Vi猲 Sinh T� B髏",0,9,8811}},
	[16] = {{"Hi猲 Vi猲 Ph� Qu﹏ Thng",0,6,8812},{"Hi猲 Vi猲 Khai Thi猲 Cung",0,4,8813}},
	[17] = {{"Hi猲 Vi猲 Ph� Qu﹏ Thng",0,6,8812}},
	[18] = {{"Hi猲 Vi猲 Khai Thi猲 Cung",0,4,8813}},
	[19] = {{"Hi猲 Vi猲  Dng Nh蒼",0,7,8814},{"Hi猲 Vi猲 U Minh Tr秓",0,11,8815}},
	[20] = {{"Hi猲 Vi猲  Dng Nh蒼",0,7,8814}},
	[21] = {{"Hi猲 Vi猲 U Minh Tr秓",0,11,8815}},
}

tTiandi = {
	{{"Thi猲 мa Huy襫 Ho祅g Kh玦",0,103,85},{"Thi猲 мa Huy襫 Ho祅g Kh玦",0,103,86},{"Thi猲 мa Huy襫 Ho祅g Kh玦",0,103,87},{"Thi猲 мa Huy襫 Ho祅g Kh玦",0,103,88}},
	{{"Thi猲 мa Huy襫 Ho祅g Gi竝 ",0,100,85},{"Thi猲 мa Huy襫 Ho祅g Gi竝 ",0,100,86},{"Thi猲 мa Huy襫 Ho祅g Gi竝 ",0,100,87},{"Thi猲 мa Huy襫 Ho祅g Gi竝 ",0,100,88}},
	{{"Thi猲 мa Huy襫 Ho祅g Trang",0,101,85},{"Thi猲 мa Huy襫 Ho祅g Trang",0,101,86},{"Thi猲 мa Huy襫 Ho祅g Trang",0,101,87},{"Thi猲 мa Huy襫 Ho祅g Trang",0,101,88}},
	{[0]={{"Thi猲 мa Huy襫 Ho祅g Th�",0,0,17},{"Thi猲 мa Huy襫 Ho祅g Ki誱 ",0,2,39},{"Thi猲 мa Huy襫 Ho祅g C玭",0,5,43},{"Thi猲 мa Huy襫 Ho祅g Kh� ",0,1,56},{"Thi猲 мa Huy襫 Ho祅g Dao",0,3,67},{"Thi猲 мa Huy襫 Ho祅g C莔",0,10,78},{"Thi猲 мa Huy襫 Ho祅g B髏 ",0,9,89},{"Thi猲 мa Huy襫 Ho祅g Trng",0,8,100},{"Thi猲 мa Huy襫 Ho祅g Thng ",0,6,111},{"Thi猲 мa Huy襫 Ho祅g Cung ",0,4,122},{"Thi猲 мa Huy襫 Ho祅g Tr秓",0,11,15},{"Thi猲 мa Huy襫 Ho祅g Nh蒼 ",0,7,15}},
	 [1]={{"Thi猲 мa Huy襫 Ho祅g Th�",0,0,17},{"Thi猲 мa Huy襫 Ho祅g C玭",0,5,43},{"Thi猲 мa Huy襫 Ho祅g Dao",0,3,67},{"Thi猲 мa Huy襫 Ho祅g Trng",0,8,100}},
	 [2]={{"Thi猲 мa Huy襫 Ho祅g Dao",0,3,67},{"Thi猲 мa Huy襫 Ho祅g C玭",0,5,43}},
	 [3]={{"Thi猲 мa Huy襫 Ho祅g Trng",0,8,100}},
	 [4]={{"Thi猲 мa Huy襫 Ho祅g Th�",0,0,17}},
	 [5]={{"Thi猲 мa Huy襫 Ho祅g Kh� ",0,1,56}},
	 [6]={{"Thi猲 мa Huy襫 Ho祅g Kh� ",0,1,56}},
	 [7]={{"Thi猲 мa Huy襫 Ho祅g Ki誱 ",0,2,39},{"Thi猲 мa Huy襫 Ho祅g C莔",0,10,78}},
	 [8]={{"Thi猲 мa Huy襫 Ho祅g Ki誱 ",0,2,39}},
	 [9]={{"Thi猲 мa Huy襫 Ho祅g C莔",0,10,78}},
	 [10]={{"Thi猲 мa Huy襫 Ho祅g Th�",0,0,17},{"Thi猲 мa Huy襫 Ho祅g C玭",0,5,43}},
	 [11]={{"Thi猲 мa Huy襫 Ho祅g Th�",0,0,17}},
	 [12]={{"Thi猲 мa Huy襫 Ho祅g C玭",0,5,43}},
	 [13]={{"Thi猲 мa Huy襫 Ho祅g Ki誱 ",0,2,39},{"Thi猲 мa Huy襫 Ho祅g B髏 ",0,9,89}},
	 [14]={{"Thi猲 мa Huy襫 Ho祅g Ki誱 ",0,2,39}},
	 [15]={{"Thi猲 мa Huy襫 Ho祅g B髏 ",0,9,89}},
	 [16]={{"Thi猲 мa Huy襫 Ho祅g Thng ",0,6,111},{"Thi猲 мa Huy襫 Ho祅g Cung ",0,4,122}},
	 [17]={{"Thi猲 мa Huy襫 Ho祅g Thng ",0,6,111}},
	 [18]={{"Thi猲 мa Huy襫 Ho祅g Cung ",0,4,122}},
	 [19]={{"Thi猲 мa Huy襫 Ho祅g Tr秓",0,11,15},{"Thi猲 мa Huy襫 Ho祅g Nh蒼 ",0,7,15}},
	 [20]={{"Thi猲 мa Huy襫 Ho祅g Nh蒼 ",0,7,15}},
	 [21]={{"Thi猲 мa Huy襫 Ho祅g Tr秓",0,11,15}}}
	};


--传送至掌门处
tShifu	=	{
		{"Thi誹 L﹎",204,1599,3182,"<color=green>Huy襫 T�<color>:"},
		{"V� ng",312,1825,3323,"<color=green>T� H筩 Ch﹏ Nh﹏<color>:"},
		{"Nga My",303,1645,3159,"<color=green>Ch﹏ Nh� S� Th竔<color>:"},
		{"C竔 Bang",209,1547,3183,"<color=green>Long T筰 Thi猲<color>:"},
		{"Л阯g M玭",305,1598,2824,"<color=green>Л阯g S� H錸g<color>:"},
		{"Dng M玭",219,1538,3151,"<color=green>Xa Th竔 Qu﹏<color>:"},
		{"Ng� чc",407,1609,3193,"<color=green>B筩h Doanh Doanh<color>:"}
};

--函数名称：周几计算函数
--功        能：返回今天是星期几
function Zgc_pub_week_day()
	local num_return = 0
	num_return = floor((GetTime() - 57600)/86400)
	num_return = num_return - (floor(num_return/7) * 7)
	if num_return >= 2 then
		num_return = num_return - 2
	else
		num_return = num_return + 5
	end
	return num_return
end

--武林争霸战日前检索
function callback_date_check()
	if Zgc_pub_week_day() == 0 then --星期天
		return 1;
	else
		return 0;
	end
end

--玩家创建日期
function callback_player_date()
	local nYear,nMonth = GmTime(GetCreateTime()); --免费区精确到月
	if nYear == 2007 and nMonth <= 6 then
		return 1;
	elseif nYear == 2007 and nMonth <=12 then
		return 2;
	elseif nYear == 2008 and nMonth <= 4 then
		return 3;
	else
		return 0;
	end
end

--给玩家称号
function callback_add_title(nType)
	if nType ~= 1 and nType ~= 2 and nType ~= 3 then
		return
	end
	if IsTitleExist(3,nType+4) > 0 then
		return
	end	
	if AddTitle(3, nType+4) > 0 then
		SetCurTitle(3, nType+4)
	end
end

--给予cj紫装和杀手武器 参数表示强化度
function callback_add_item(nQianghua)
	local nBody = GetBody();
	local nRoute = GetPlayerRoute();
	AddItem(0,103,90+nBody,1,4,-1,-1,-1,-1,-1,-1,0,nQianghua);
	AddItem(0,100,90+nBody,1,4,-1,-1,-1,-1,-1,-1,0,nQianghua);
	AddItem(0,101,90+nBody,1,4,-1,-1,-1,-1,-1,-1,0,nQianghua);
	AddItem(0,102,36,1,4,-1,-1,-1,-1,-1,-1);
	AddItem(0,102,37,1,4,-1,-1,-1,-1,-1,-1);
	local nRand = random(1,getn(tShashou[nRoute]));
	AddItem(tShashou[nRoute][nRand][1],tShashou[nRoute][nRand][2],tShashou[nRoute][nRand][3],1,4,tShashou[nRoute][nRand][4],tShashou[nRoute][nRand][5],tShashou[nRoute][nRand][6],tShashou[nRoute][nRand][7],tShashou[nRoute][nRand][8],tShashou[nRoute][nRand][9],0,nQianghua);
end

--对当前玩家可否正常添加物品进行检测 
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

function nothing()

end

function callback_talk()
	local strtab = {
		"Ta mu鑞 nh薾 ph莕 thng ngi ch琲 c�/get_old_award",
		"Ta mu鑞 r髏 th╩ Vi猰 Ho祅g Thi猲 мa/tiandi_choujiang",
		"C竎 lo筰 ph莕 thng tng 鴑g v韎 ngi ch琲 c�/about_old_award",
		"Ta t筸 th阨 kh玭g nh薾 ph莕 thng/nothing"}
	Say("<color=green>D� T萿<color>: Х l﹗ kh玭g g苝, ta v蒼 nh� l莕 u g苝 ngi, tuy v� l﹎ phong ba bi課 i li猲 t鬰 nh璶g l穙 y v蒼 nh� ngi, ta  chu萵 b� v礽 m鉵  gi竝, c� th� gi髉 ngi h祅h hi謕 giang h�! Ta c騨g 頲 g鋓 l� 萵 gi� trong giang h�, c� th� d箉 cho ngi v礽 chi猽!",
		getn(strtab),
		strtab)
end

function get_old_award()
	if GetTask(TASK_GET_OLD) ~= 0 then
		Talk(1,"","<color=green>D� T萿<color>: M鏸 nh﹏ v藅 ch� c� th� nh薾 1 l莕 ph莕 thng ngi ch琲 c�.");
		return
	end
	if GetLevel() < 11 then
		Talk(1,"","<color=green>D� T萿<color>: Ъng c蕄 th蕄 qu�, n c蕄 11 h穣 quay l筰.");
		return
	end
	local nDate = tonumber(date("%Y%m%d")); 
	local nType = callback_player_date();
	if nType == 1 then
		if Zgc_pub_goods_add_chk(6,500) ~= 1 then
			return
		end		
		SetTask(TASK_GET_OLD,nDate);
		callback_add_item(6);
		callback_add_title(1);
		back_to_shifu();
	elseif nType == 2 then
		if Zgc_pub_goods_add_chk(6,500) ~= 1 then
			return
		end		
		SetTask(TASK_GET_OLD,nDate);
		callback_add_item(4);
		callback_add_title(2);
		back_to_shifu();		
	elseif nType == 3 then
		SetTask(TASK_GET_OLD,nDate);
		callback_add_title(3);
		back_to_shifu();		
	else
		Talk(1,"","<color=green>D� T萿<color>: Xin l鏸,  � y u chu萵 b� cho nh鱪g ngi trong giang h�, kh玭g c�  ngi d飊g 頲, nh璶g kh玭g sao, hi謓 V� l﹎ tranh b� 產ng ti課 h祅h, h穣 n s� ph� m玭 ph竔 h醝 th�, �  c� chu萵 b� v礽 m鉵, nghe n鉯 trong tranh b� c� ph莕 thng t輓 v藅 trang b� cao c蕄 c馻 s� m玭.");
	end
end

function back_to_shifu()
	local nRoute = GetPlayerFaction();
	if nRoute == 0 then
		Talk(1,"","<color=green>D� T萿<color>: Hi謓 Чi h閕 t� v� Thi猲 h�  nh蕋 產ng tri謚 t藀, m� V� l﹎ tranh b� c騨g s緋 b総 u, nghe n鉯 l� cu鑙 tu莕 g莕 nh蕋, c竎 s� ph� v� mong c竎   c� th� x璶g h飊g trong V� l﹎ tranh b� n猲  chu萵 b� r蕋 nhi襲 trang b� cao c蕄, mau n gia nh藀 m玭 ph竔 m� ngi 璶g � nh蕋 甶.");
	else
		Say("<color=green>D� T萿<color>: Hi謓 Чi h閕 t� v� Thi猲 h�  nh蕋 產ng tri謚 t藀, m� V� l﹎ tranh b� c騨g s緋 b総 u, nghe n鉯 l� cu鑙 tu莕 g莕 nh蕋, c竎 s� ph� v� mong c竎   c� th� x璶g h飊g trong V� l﹎ tranh b� n猲  chu萵 b� r蕋 nhi襲 trang b� cao c蕄, nghe n鉯  cng h鉧 to祅 b� l� trang b� 10, d飊g cho V� l﹎ tranh b�, mau n s� m玭 xem th�, h醝 r� t譶h h譶h!",
			1,
			"Bi誸 r錳!/nothing")
	end
end

function about_old_award()
	Say("<color=green>D� T萿<color>: Ngi mu鑞 xem ph莕 thng n祇?",
		4,
		"Ta l� ngi ch琲 c� trc th竛g 7 n╩ 2007/about_2005_award",
		"Ta l� ngi ch琲 c� trc th竛g 1 n╩ 2008/about_2006_award",
		"Ta l� ngi ch琲 c� trc th竛g 5 n╩ 2008/about_2007_award",
		"Ta mu鑞 甶 l穘h thng/callback_talk")
end

function about_2005_award()
	Talk(1,"about_2005_award2","<color=green>D� T萿<color>: Ngi  � trong giang h� l﹗ v藋, ta  chu萵 b� cho ngi 1 b�  h祅h t萿 giang h�, b� n祔 do trang ch� T祅g Ki誱 s琻 trang t苙g ta, c閚g th猰 m鉵 v� kh� ta s� d鬾g khi m韎 gia nh藀 giang h�, b� n祔 ph﹏ th祅h\nTrang Ch� M穙 t鑓  nh 15%, t蕋 c� n╪g l鵦 + 4-7\nT鎛g Qu秐 Ngo筰 Trang n閕 ngo筰 c玭g 8%, sinh l鵦 t鑙 產 + 5%, t蕋 c� n╪g l鵦 4-7\nT鎛g Qu秐 Kh� n閕 ngo筰 ph遪g - 5%, n閕 ngo筰 c玭g + 10%, t蕋 c� n╪g l鵦 4-7\nTi觰 Th� Gi韎 Ch� sinh l鵦 n閕 l鵦 + 8%, t蕋 c� n╪g l鵦 1-4\nTrng L穙 Ch� Ho祅 ch輓h x竎 + 40-55, n� tr竛h + 30-35, t蕋 c� n╪g l鵦 9-12")
end

function about_2005_award2() --免费区经验不同
	Talk(1,"about_old_award","<color=green>D� T萿<color>: B� trang b� n祔 ta  n﹏g c蕄 n 6, ngo礽 ra ta s� trao t蕋 c� nh鱪g kinh nghi謒 giang h� m� ta  tr秈 qua v� V� l﹎ b秓 甶觧 cho ngi. (Danh hi謚 c bi謙, D� T萿 V� l﹎ b秓 甶觧 truy襫 nh﹏, sau khi m� m鏸 ph髏 t╪g 0.5% kinh nghi謒, khi 0.5% kinh nghi謒 l韓 h琻 845235, nh薾 nhi襲 nh蕋 845235, m鏸 ng祔 t竎 d鬾g 1 gi�, sau 15 ng祔 s� m蕋 danh hi謚)\nSau khi ngi  tham gia t蕋 c� ho箃 ng V� l﹎ tranh b� th� c� th� r髏 1 l莕 th╩ � y, n誹 r髏 tr髇g s� c� th� nh薾 頲 to祅 b� trang b� Vi猰 Ho祅g д ho芻 trang b� Thi猲 мa Huy襫 Ho祅g, th薽 ch� kh玭g r髏 tr髇g c騨g c� th� nh薾 2 l莕 v藅 ph萴 B錸g Lai, ch骳 may m緉!")
end

function about_2006_award()
	Talk(1,"about_2006_award2","<color=green>D� T萿<color>: Ngi  � trong giang h� l﹗ v藋, ta  chu萵 b� cho ngi 1 b�  h祅h t萿 giang h�, b� n祔 do trang ch� T祅g Ki誱 s琻 trang t苙g ta, c閚g th猰 m鉵 v� kh� ta s� d鬾g khi m韎 gia nh藀 giang h�, b� n祔 ph﹏ th祅h\nTrang Ch� M穙 t鑓  nh 15%, t蕋 c� n╪g l鵦 + 4-7\nT鎛g Qu秐 Ngo筰 Trang n閕 ngo筰 c玭g 8%, sinh l鵦 t鑙 產 + 5%, t蕋 c� n╪g l鵦 4-7\nT鎛g Qu秐 Kh� n閕 ngo筰 ph遪g - 5%, n閕 ngo筰 c玭g + 10%, t蕋 c� n╪g l鵦 4-7\nTi觰 Th� Gi韎 Ch� sinh l鵦 n閕 l鵦 + 8%, t蕋 c� n╪g l鵦 1-4\nTrng L穙 Ch� Ho祅 ch輓h x竎 + 40-55, n� tr竛h + 30-35, t蕋 c� n╪g l鵦 9-12")
end

function about_2006_award2() --免费区经验不同
	Talk(1,"about_old_award","<color=green>D� T萿<color>: B� v� kh� n祔 ta  n﹏g c蕄 n 4, ngo礽 ra ta s� trao t蕋 c� nh鱪g kinh nghi謒 giang h� m� ta  tr穒 qua v� V� l﹎ m藅 t﹏ cho ngi. (Danh hi謚 c bi謙, D� T萿 V� l﹎ m藅 t﹏ truy襫 nh﹏, sau khi m� m鏸 ph髏 t╪g 0.4% kinh nghi謒, khi 0.4% l韓 h琻 676188, nh薾 nhi襲 nh蕋 676188, m鏸 ng祔 t竎 d鬾g 1 gi�, sau 15 ng祔 s� m蕋 danh hi謚)\nSau khi ngi  tham gia t蕋 c� ho箃 ng V� l﹎ tranh b� th� c� th� r髏 1 l莕 th╩ � y, n誹 r髏 tr髇g s� c� th� nh薾 頲 to祅 b� trang b� Vi猰 Ho祅g д ho芻 trang b� Thi猲 мa Huy襫 Ho祅g, th薽 ch� kh玭g r髏 tr髇g c騨g c� th� nh薾 2 l莕 v藅 ph萴 B錸g Lai, ch骳 may m緉!")
end

function about_2007_award() --免费区经验不同
	Talk(1,"about_old_award","<color=green>D� T萿<color>: Ngi  trong giang h� l﹗ nh� v藋, ta s� trao t蕋 c� nh鱪g kinh nghi謒 giang h� m� ta  tr穒 qua v� V� l﹎ m藅 v蕁 cho ngi. (Danh hi謚 c bi謙, D� T萿 V� l﹎ m藅 v蕁 truy襫 nh﹏, sau khi m� m鏸 ph髏 t╪g 0.3% kinh nghi謒, khi 0.3% l韓 h琻 507141, nh薾 nhi襲 nh蕋 507141, m鏸 ng祔 t竎 d鬾g 1 gi�, sau 15 ng祔 s� m蕋 danh hi謚)\nSau khi ngi  tham gia t蕋 c� ho箃 ng V� l﹎ tranh b� th� c� th� r髏 1 l莕 th╩ � y, n誹 r髏 tr髇g s� c� th� nh薾 頲 to祅 b� trang b� Vi猰 Ho祅g д ho芻 trang b� Thi猲 мa Huy襫 Ho祅g, th薽 ch� kh玭g r髏 tr髇g c騨g c� th� nh薾 2 l莕 v藅 ph萴 B錸g Lai, ch骳 may m緉!")
end

function goto_shifu()
	local nFaction = GetPlayerFaction();
	if nFaction ~= 0 then
		NewWorld(tShifu[nFaction][2],tShifu[nFaction][3],tShifu[nFaction][4]);
	end
end

function restore_all()
	CureWound(2);
	RestoreAll();
end

function tiandi_choujiang()
	local nNum = GetTask(TASK_AWARD_NUM);
	if nNum < 4 then
		Talk(1,"","<color=green>D� T萿<color>: Ch� c� ngi ch琲 tham gia 4 l莕 s� c蕄,  M玭 ph竔 tranh b� b総 u t� 20 th竛g 7, m韎 c� th� r髏 th╩!");
	else
		if GetTask(TASK_TIANDI_CHOUJIANG) ~= 0 then
			Talk(1,"","<color=green>D� T萿<color>: Ngi  r髏 thng r錳.");
			return
		end
		if Zgc_pub_goods_add_chk(6,600) ~= 1 then
			return
		end
		SetTask(TASK_TIANDI_CHOUJIANG,1);
		local nRoute = GetPlayerRoute();
		local nBody = GetBody();
		local nRand = random(1,10000);
		if nRand <= 1 then
			AddItem(tYandi[1][2],tYandi[1][3],tYandi[1][4]+nBody,1,1,-1,-1,-1,-1,-1,-1);
			AddItem(tYandi[2][2],tYandi[2][3],tYandi[2][4]+nBody,1,1,-1,-1,-1,-1,-1,-1);
			AddItem(tYandi[3][2],tYandi[3][3],tYandi[3][4]+nBody,1,1,-1,-1,-1,-1,-1,-1);
			local nRandOne = random(1,getn(tXuanyuanZhan[nRoute]));
			AddItem(tXuanyuanZhan[nRoute][nRandOne][2],tXuanyuanZhan[nRoute][nRandOne][3],tXuanyuanZhan[nRoute][nRandOne][4],1,1,-1,-1,-1,-1,-1,-1);
			AddItem(tXuanyuanDou[nRoute][nRandOne][2],tXuanyuanDou[nRoute][nRandOne][3],tXuanyuanDou[nRoute][nRandOne][4],1,1,-1,-1,-1,-1,-1,-1);
			AddItem(tHuangDiWeapon[nRoute][nRandOne][2],tHuangDiWeapon[nRoute][nRandOne][3],tHuangDiWeapon[nRoute][nRandOne][4],1,1,-1,-1,-1,-1,-1,-1);
			Msg2Player("Ch骳 m鮪g b筺 nh薾 頲 1 b� trang b� Vi猰 Ho祅g!");
			Msg2Global("Ngi ch琲"..GetName().."Tham gia r髏 th╩ may m緉 V� l﹎ tranh b� nh薾 頲 1 b� Vi猰 Ho祅g!");
			AddGlobalCountNews("Ngi ch琲"..GetName().."Tham gia r髏 th╩ may m緉 V� l﹎ tranh b� nh薾 頲 1 b� Vi猰 Ho祅g!",2);
			WriteLog("[V� l﹎ tranh b竇: Ngi ch琲"..GetName().."Tham gia r髏 th╩ may m緉 V� l﹎ tranh b� nh薾 頲 1 b� Vi猰 Ho祅g!");
		elseif nRand <= 2 then
			AddItem(2,0,1055,1);
			AddItem(2,0,1056,1);
			AddItem(2,0,1057,1);
			AddItem(2,0,1058,1);
			Msg2Player("Ch骳 m鮪g b筺 nh薾 頲 1 b� Thi猲 мa Huy襫 Ho祅g!");
			Msg2Global("Ngi ch琲"..GetName().."Tham gia r髏 th╩ may m緉 V� l﹎ tranh b� nh薾 頲 1 b� Thi猲 мa Huy襫 Ho祅g!");
			AddGlobalCountNews("Ngi ch琲"..GetName().."Tham gia r髏 th╩ may m緉 V� l﹎ tranh b� nh薾 頲 1 b� Thi猲 мa Huy襫 Ho祅g!",2);
			WriteLog("[V� l﹎ tranh b竇: Ngi ch琲"..GetName().."Tham gia r髏 th╩ may m緉 V� l﹎ tranh b� nh薾 頲 1 b� Thi猲 мa Huy襫 Ho祅g!");			
		else
			AddItem(2,0,109,2,4); 
			Msg2Player("Ch骳 m鮪g b筺 nh薾 頲 2 B錸g Lai Ti猲 L�");
			Talk(1,"","<color=green>D� T萿<color>: Ngi  r髏 1 l莕 th╩, xin xem nh綾 nh� h� th鑞g, xem ngi r髏 頲 g�!")
		end
	end
end

--=================== 武林争霸战 ============================
--给第3套师门装备
--nRoute：路线
--nBody：体形
--nGeneration：指明为第几套
--nSpecFlag：专为少林俗家留的特殊标记。0为给刀和棍，1给棍，2给刀
--新用函数主要原因在于这里给的第3套师门设置为邦定装备，即AddItem第4个参数填为4。
function fe_AddFactionEquipmentTHree(nRoute,nBody,nGeneration,nSpecFlag)
	if callback_date_check() ~= 1 then
		return
	end
	nSpecFlag = nSpecFlag or 0; 
	local nYears,nMonths,nDays = GmTime(GetTime()+28800);
	local nFlag,nIdx = 0,0;
	local nID2,nID3 = 0,0;
	local tbWeaponID2 = {nil,5,8,0,nil,1,nil,2,10,nil,0,5,nil,2,9,nil,6,4,nil,7,11};
	if nRoute == 8 or nRoute == 9 then	--峨嵋特殊处理
		nID3 = nRoute*1000+(nGeneration-1)*100+(nBody-2)*10+9;
	else
		nID3 = nRoute*1000+(nGeneration-1)*100+nBody*10+9;
	end;
	nFlag,nIdx = AddItem(0,103,nID3,1,4,-1,-1,-1,-1,-1,-1,0,10);
	gf_SetItemExpireTime(nIdx,nYears,nMonths,nDays,23,59,0);
	nFlag,nIdx = AddItem(0,100,nID3,1,4,-1,-1,-1,-1,-1,-1,0,10);
	gf_SetItemExpireTime(nIdx,nYears,nMonths,nDays,23,59,0);
	nFlag,nIdx = AddItem(0,101,nID3,1,4,-1,-1,-1,-1,-1,-1,0,10);
	gf_SetItemExpireTime(nIdx,nYears,nMonths,nDays,23,59,0);
	nFlag,nIdx = AddItem(0,102,nID3,1,4,-1,-1,-1,-1,-1,-1);
	gf_SetItemExpireTime(nIdx,nYears,nMonths,nDays,23,59,0);
	if nRoute == 2 then	--该死的少林俗家
		if nSpecFlag == 0 or nSpecFlag == 1 then
			nFlag,nIdx = AddItem(0,5,nID3,1,4,-1,-1,-1,-1,-1,-1,0,10);
			gf_SetItemExpireTime(nIdx,nYears,nMonths,nDays,23,59,0);
		end;
		if nSpecFlag == 0 or nSpecFlag == 2 then
			nFlag,nIdx = AddItem(0,3,nID3,1,4,-1,-1,-1,-1,-1,-1,0,10);
			gf_SetItemExpireTime(nIdx,nYears,nMonths,nDays,23,59,0);
		end;
	else
		nID2 = tbWeaponID2[nRoute];
		if nID2 ~= nil then
			nFlag,nIdx = AddItem(0,nID2,nID3,1,4,-1,-1,-1,-1,-1,-1,0,10);
			gf_SetItemExpireTime(nIdx,nYears,nMonths,nDays,23,59,0);
		end;
	end;
	if nGeneration >= 3 then	--第三套开始才有2个戒指
		--另一个戒指		
		if nRoute == 2 or nRoute == 3 or nRoute == 4 then
			nID3 = nRoute*1000+(nGeneration-1)*100+(nBody+2)*10+9;
		elseif nRoute == 8 or nRoute == 9 then	
			nID3 = nRoute*1000+(nGeneration-1)*100+(nBody)*10+9;
		else
			nID3 = nRoute*1000+(nGeneration-1)*100+(nBody+4)*10+9;
		end	
			nFlag,nIdx = AddItem(0,102,nID3,1,4,-1,-1,-1,-1,-1,-1);	
			gf_SetItemExpireTime(nIdx,nYears,nMonths,nDays,23,59,0);
	end
end;

--根据物品索引设置物品的存在时间
--如果参数数量为2,则功能如SetItemExpireTime
--如果参数数量大于2,则为直接设置物品的到期时间
function gf_SetItemExpireTime(nItem, ...)
	if nItem == nil or nItem == 0 then
		return 0;
	end
	local nArgSize = getn(arg);
	if nArgSize == 1 then
		SetItemExpireTime(nItem,arg[1]);
		return 0;
	end;
	
	for i=1, 6 do
		arg[i] = arg[i] or 0;
	end;
	local nCurTime = GetTime();
	local nThatTime = MkTime(arg[1],arg[2],arg[3],arg[4],arg[5],arg[6]);
	local nTimePassed = nThatTime - nCurTime;
	if nTimePassed < 0 then
		nTimePassed = 0;
	end;
	SetItemExpireTime(nItem,nTimePassed);
	return nTimePassed;
end;

--函数名称：NPC索引值设定
--功        能：直接设定NPC索引位置的值
function gf_SetUnitCurState(Npc_index,att_seq,number)
	if number > 99 and att_seq ~= 1 and att_seq ~= 4 and att_seq ~= 5 and att_seq ~= 6 then
		return 0
	end
	local num_save = GetUnitCurStates(Npc_index,att_seq)
	num_save = number - num_save
	AddUnitStates(Npc_index,att_seq,num_save)
	return 1
end

function wulin_zhengba()
	Say("V� l﹎ tranh b� ch璦 b総 u!",0)
	do return end
	local strtab = {
		"Ta mu鑞 nh薾 trang b� chuy猲 d鬾g V� l﹎ tranh b� (1 b� trang b�  cng h鉧 10, ch� d飊g trong ng祔 V� l﹎ tranh b�)/get_wulin_zhuangbei", --免费区为强10
		"Ta mu鑞 xem th祅h t輈h b鎛 m玭, nh薾 ph莕 thng tranh b�/#get_wulin_award(1)",
		"Ta mu鑞 nh薾 ph莕 thng m玭 ph竔 tu莕 n祔/#get_wulin_award(2)",
		"T譵 hi觰 chi ti誸 V� l﹎ tranh b�/about_wulin_zhengba",
		"Kh玭g v蕁  g�/nothing"
		}
	local nPos = GetWorldPos();
	local nIdx = 0;
	for i=1,getn(tShifu) do
		if tShifu[i][2] == nPos then
			nIdx = i;
			break
		end
	end
	if nIdx ~= 0 then
		Say(tShifu[nIdx][5].."Чi h閕 v� l﹎ Thi猲 h�  nh蕋 s緋 b総 u, c� h閕 cho ngi ch琲 m韎 thi u V� l﹎ tranh b� c騨g s緋 b総 u, ch� nh藅 m鏸 tu莕 u ti課 h祅h V� l﹎ tranh b�, n閕 dung chi ti誸 ta s� gi秈 th輈h! N誹 b鎛 m玭 t th祅h qu� nh蕋 nh trong V� l﹎ tranh b� s� c� l頸 cho t蕋 c�  t� trong m玭 ph竔! <color=yellow>Xin ch� �, t� th� kh玭g th� t╪g th猰 th祅h t輈h!<color>",
			getn(strtab),
			strtab)
	end
end

function get_wulin_zhuangbei()
	local nLv = GetLevel();
	local nFaction = GetPlayerFaction();
	local nRoute = GetPlayerRoute();
	local nBody = GetBody();
	local nPos = GetWorldPos();
	local nIdx = 0;
	for i=1,getn(tShifu) do
		if tShifu[i][2] == nPos then
			nIdx = i;
			break
		end
	end	
	if nFaction ~= nIdx then
		Talk(1,"",tShifu[nIdx][5].."Ngi kh玭g ph秈  t� b鎛 m玭");
		return
	end
	if nLv < 70 then	
		Talk(1,"",tShifu[nIdx][5].."Ta c騨g mu鑞 t苙g ngi, nh璶g ng c蕄 c馻 ngi qu� th蕄, kh玭g th� m芻 頲! дn c蕄 70 h絥 n t譵 ta!");
		return
	end
	if nRoute == 0 or nRoute == 1 or	nRoute == 5 or nRoute == 7 or nRoute == 10 or nRoute == 13 or nRoute == 16 or nRoute == 19 then
		Talk(1,"",tShifu[nIdx][5].."Ngi ch璦 gia nh藀 l璾 ph竔, l蕐 trang b� n祔 c騨g kh玭g d飊g 頲.");
		return
	end
	if callback_date_check() ~= 1 then
		Talk(1,"",tShifu[nIdx][5].."V� l﹎ tranh b� tr薾 s� 頲 t� ch鴆 v祇 ch� nh藅 m鏸 tu莕, xin nh薾 v祇 ch� nh藅.");
		return
	end
	if Zgc_pub_goods_add_chk(6,600) ~= 1 then
		return
	end
	fe_AddFactionEquipmentTHree(nRoute,nBody,3);
end


function get_wulin_award(nType)
	local nFaction = GetPlayerFaction();
	local nPos = GetWorldPos();
	local nLv = GetLevel();
	local nIdx = 0;
	for i=1,getn(tShifu) do
		if tShifu[i][2] == nPos then
			nIdx = i;
			break
		end
	end	
	if nFaction ~= nIdx then
		Talk(1,"",tShifu[nIdx][5].."Ngi kh玭g ph秈  t� b鎛 m玭");
		return
	end	
	local nDate = tonumber(date("%Y%m%d"));
--	if nDate < 20080720 or nDate > 20080816 then
--		Talk(1,"",tShifu[nIdx][5].."武林争霸战在7月20日，7月27日，8月3日，8月10日举行，请在这段时间领取。");
--		return
--	end
	if nLv < 70 then
		Talk(1,"",tShifu[nIdx][5].."Tham gia V� l﹎ tranh b� tr薾 y猽 c莡 c蕄 70 tr� l猲");
		return
	end
	local nNpcIdx = GetTargetNpc();
	local nWeek = GetWeekSequence(7,0);
	local nNpcWeek = GetUnitCurStates(nNpcIdx,1);
	local nKillDate = GetTask(TASK_KILL_DATE);
	if nType == 1 then 
		if GetTask(TASK_AWARD_WEEK) == nWeek then
			Talk(1,"",tShifu[nIdx][5].."B筺  nh薾 ph莕 thng tranh b� tr薾 tu莕 n祔. Tu莕 n祔 b筺  th緉g m玭 ph竔 kh竎 <color=yellow>"..GetTask(TASK_KILL_PLAYER).."<color> ngi.");
			return
		end
		if Zgc_pub_goods_add_chk(1,20) ~= 1 then
			return
		end
		if nNpcWeek ~= nWeek then
			gf_SetUnitCurState(nNpcIdx,1,nWeek);
			gf_SetUnitCurState(nNpcIdx,4,0);
			gf_SetUnitCurState(nNpcIdx,5,0);
		end
		if nKillDate ~= nWeek then
			SetTask(TASK_KILL_DATE,nWeek);
			SetTask(TASK_KILL_PLAYER,0);
			SetTask(TASK_KILLED_NUM,0);
		end
		local nKillNum = GetTask(TASK_KILL_PLAYER);
		local nKilledNum = GetTask(TASK_KILLED_NUM);
		local nExp = floor(nLv^3*10);
		
		if nKilledNum+nKillNum >= 10 then
			SetTask(TASK_AWARD_WEEK,nWeek);
			gf_SetUnitCurState(nNpcIdx,4,(GetUnitCurStates(nNpcIdx,4)+nKillNum));
			if nKillNum >= nKilledNum then
				gf_SetUnitCurState(nNpcIdx,5,(GetUnitCurStates(nNpcIdx,5)+1));
				if nLv ~= 99 then
					ModifyExp(nExp);
					Msg2Player("B筺 nh薾 頲 "..nExp.."Kinh nghi謒");
					Talk(1,"",tShifu[nIdx][5].."H玬 nay b筺  th緉g m玭 ph竔 kh竎 <color=yellow>"..nKillNum.."<color> ngi, b鎛 m玭  c� <color=yellow>"..GetUnitCurStates(nNpcIdx,5).."<color>  t� d祅h th緉g l頸 khi t� v� v韎  t� m玭 ph竔 kh竎. е t� b鎛 m玭 qu� nhi猲 tinh anh,  ta ch� cho ngi m閠 輙 v� c玭g!");
				else
					AddItem(2,1,3210,20);
					Talk(1,"",tShifu[nIdx][5].."H玬 nay b筺  th緉g m玭 ph竔 kh竎 <color=yellow>"..nKillNum.."<color> ngi, b鎛 m玭  c� <color=yellow>"..GetUnitCurStates(nNpcIdx,5).."<color>  t� d祅h th緉g l頸 khi t� v� v韎  t� m玭 ph竔 kh竎. V� c玭g c馻 ngi  ti課 b� nhi襲, ta kh玭g c遪 g�  d箉 ngi n鱝, y l� m閠 s� k� n╪g t﹎ c c馻 ta, t苙g cho ngi !");
				end
			else
				if nLv ~= 99 then
					ModifyExp(nExp);
					Msg2Player("B筺 nh薾 頲 "..nExp.."Kinh nghi謒");
					Talk(1,"",tShifu[nIdx][5].."H玬 nay b筺  th緉g m玭 ph竔 kh竎 <color=yellow>"..nKillNum.."<color> ngi, b鎛 m玭  c� <color=yellow>"..GetUnitCurStates(nNpcIdx,5).."<color>  t� d祅h th緉g l頸 khi t� v� v韎  t� m玭 ph竔 kh竎. Ngi m芻 d� th蕋 th� h琲 nhi襲, nh璶g kh玭g n猲 n秐 l遪g, ta s� d箉 cho ngi m閠 s� v� c玭g!");
				else
					AddItem(2,1,3210,20);
					Msg2Player("B筺 nh薾 頲 20 quy觧 Thi猲 Th阨 Ch� Gi秈.");
					Talk(1,"",tShifu[nIdx][5].."H玬 nay b筺  th緉g m玭 ph竔 kh竎 <color=yellow>"..nKillNum.."<color> ngi, b鎛 m玭  c� <color=yellow>"..GetUnitCurStates(nNpcIdx,5).."<color>  t� d祅h th緉g l頸 khi t� v� v韎  t� m玭 ph竔 kh竎. V� c玭g c馻 ngi  ti課 b� nhi襲, ta kh玭g c遪 g�  d箉 ngi n鱝, y l� m閠 s� k� n╪g t﹎ c c馻 ta, t苙g cho ngi !");
				end
			end
		else
			Talk(1,"",tShifu[nIdx][5].."B鎛 m玭  c� <color=yellow>"..GetUnitCurStates(nNpcIdx,5).."<color>  t� d祅h th緉g l頸 khi t� v� v韎  t� m玭 ph竔 kh竎. B蕋 lu薾 th緉g thua c騨g n猲 th� s鴆 m閠 phen! C� th� xem sao, th� th竎h v礽 l莕!");
		end
	elseif nType == 2 then
		if GetTask(TASK_MENPAI_AWARD) == nWeek then
			Talk(1,"",tShifu[nIdx][5].."B筺  nh薾 ph莕 thng m玭 ph竔 tu莕 n祔. B鎛 m玭  c� <color=yellow>"..GetUnitCurStates(nNpcIdx,5).."<color>  t� d祅h th緉g l頸 khi t� v� v韎  t� m玭 ph竔 kh竎.");
			return
		end
		if Zgc_pub_goods_add_chk(3,40) ~= 1 then
			return
		end	
		if GetTask(TASK_AWARD_WEEK) ~= nWeek then
			Talk(1,"",tShifu[nIdx][5].."B筺 ph秈 nh薾 ph莕 thng V� l﹎ tranh b� trc sau  m韎 nh薾 ph莕 thng m玭 ph竔.");
			return
		end
		if GetUnitCurStates(nNpcIdx,4) >= 100 then
			local tItem = {	
			[1] = {2,0,448,"Ph� Hi襫 X� L頸"},	--少林
			[2] = {2,0,469,"Thi猲 C� M閏"},--武当
			[3] = {2,0,457,"Kim Li猲 Hoa"},--峨嵋
			[4] = {2,0,466,"T� Kim B竧"},--丐帮
			[5] = {2,0,454,"B� чc phng"},--唐门	
			[6] = {2,0,477,"Tinh B� Ti詎 Чi"},	--杨门
			[7] = {2,0,484,"R誸 c"},--五毒
			[8] = {2,0,491,"Mai Qu� L�"},--翠烟
			[9] = {2,0,495,"Khu Ma Hng"},--昆仑
			[10] = {2,0,499,"Th竛h H醓 L謓h"}--明教
			};			
			SetTask(TASK_MENPAI_AWARD,nWeek);
			AddItem(2,0,141,2,4);
			AddItem(tItem[nFaction][1],tItem[nFaction][2],tItem[nFaction][3],20);
			Talk(1,"",tShifu[nIdx][5].."B鎛 m玭  c� <color=yellow>"..GetUnitCurStates(nNpcIdx,5).."<color>  t� d祅h th緉g l頸 khi t� v� v韎  t� m玭 ph竔 kh竎. Chng  m玭 r蕋 h穘h di謓, quy誸 nh cho m鏸  t� 2 Ti猽 Ki誴 t竛 v� 20 t輓 v藅 trang b� S� M玭 4, hy v鋘g m鋓 ngi ti誴 t鬰 c� g緉g!");
		else
			Talk(1,"",tShifu[nIdx][5].."M芻 d� ngi  c� g緉g, nh璶g v� h鋍 b鎛 m玭 n誹 ch� d鵤 v祇 n╪g l鵦 c� nh﹏ th� kh玭g . Nh鱪g  t� h錳 b竜 chi課 t輈h c馻 m譶h, s� 頲 chng m玭 ban thng!");
		end
	end
end

function about_wulin_zhengba()
	local nPos = GetWorldPos();
	local nIdx = 0;
	for i=1,getn(tShifu) do
		if tShifu[i][2] == nPos then
			nIdx = i;
			break
		end
	end		
	Talk(2,"wulin_zhengba",tShifu[nIdx][5].."Чi h閕 t� v� s緋 b総 u, m鏸 ng祔 trong tu莕 b筺 c� th� m芻 Th﹏ Gi竝 Tr� ta ban cho  t� th� v韎 c竎 h祇 ki謙 kh竎, ng  h� xem thng b鎛 m玭, Th﹏ Gi竝 Tr� n祔 n誹 b� h� c� th� t譵 ta  nh薾. Ngo礽 ra D� T萿 s� gi髉 m鋓 ngi tr� thng trong th阨 gian di詎 ra cu閏 thi.\n    T蕋 c� th祅h t輈h � chi課 trng, i h閕 t� v� v� PK ngo礽 th祅h s� 頲 a v祇 th祅h t輈h Tranh B� tr薾! цi th� ph秈 l� ngi c馻 m玭 ph竔 kh竎! (c蕄 60 tr� l猲)\n    L璾 �, khi ti課 h祅h t� th� kh玭g th� t╪g th祅h t輈h!","    я 甶襲 ki謓, s� nh薾 頲 kinh nghi謒 tng 鴑g (c蕄 80 l� 512 v筺, dao ng t飝 theo ng c蕄 ngi ch琲), ngi ch琲 c蕄 99 c� th� nh薾 頲 20 quy觧 Thi猲 Th阨 Ch� Gi秈.\n    я 甶襲 ki謓 nh薾 ph莕 thng m玭 ph竔, c� th� nh薾 2 Ti猽 Ki誴 t竛, 20 t輓 v藅 S� M玭 4.")
end