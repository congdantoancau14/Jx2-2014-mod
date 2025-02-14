-- 越南2008 51活动

Include("\\script\\lib\\globalfunctions.lua");
Include("\\script\\lib\\randomitem.lua");

SWITCH_2008_51			= 1;
DATE_2008_51_START_V	= 20080430;		-- 51活动开始日期(战场&烟花)
DATE_2008_51_END_V		= 20480501;		-- 51活动结束日期(战场&烟花)

DATE_2008_51_START_GEM	= 20080426;		-- 51活动开始日期(宝石)
DATE_2008_51_END_GEM	= 20480518;		-- 51活动开始日期(宝石)

DATE_2008_51_ITEM_END	= 20480530;		-- 物品使用截至日期

TASK_ID_VIET_2008_51_GEM_EXP	= 2422;	-- 宝石活动经验变量

G_MAX_EXP	= 30000000;

function viet_51_battle_award(is_main_batter, is_winner)
	if is_viet_51_opened() == 1 then
		gf_SetLogCaption("20080501");
		Msg2Player("Nh薾 頲 ph莕 thng chi課 trng T鑞g Li猽.");
		gf_Modify( "Exp", 500000 * (1 + is_winner) * (1 + is_main_batter) );
		gf_SetLogCaption("");
	end
end

function is_viet_51_opened(is_gem)
	local nDate = tonumber(date("%Y%m%d"));

	if is_gem == nil or is_gem == 0 then
		if nDate >= DATE_2008_51_START_V and nDate <= DATE_2008_51_END_V then
			return SWITCH_2008_51;
		end
	else
		if nDate >= DATE_2008_51_START_GEM and nDate <= DATE_2008_51_END_GEM then
			return SWITCH_2008_51;
		end
	end
	return 0;
end

function viet_2008_51_business_award(nFinishedTimes)
	if is_viet_51_opened(1) == 0 then
		return
	end
	if nFinishedTimes > 0 and mod(nFinishedTimes, 2) == 0 then
		gf_SetLogCaption("viet_2008_51_business_award");
		gf_AddItemEx( {2,1,30004, 1, 1}, "Rng B秓 Th筩h");
		gf_SetLogCaption("");
	end
end

function viet_2008_51_faction_award(nTimes)
	if is_viet_51_opened(1) == 0 then
		return
	end
	if nTimes >= 20 then
		return
	end
	local tAward = {3,3,6,6,9,12,15,18};
	local nAward = floor(GetLevel()/10 - 1);
	if nAward == 0 then
		return
	end

	gf_SetLogCaption("viet_2008_51_faction_award");
	gf_AddItemEx( {2,1,30004,tAward[nAward], 1}, "Rng B秓 Th筩h");
	gf_SetLogCaption("");
end

-- 藏剑杀死1个怪
function viet_2008_51_cangjian_award(nNpcIdx)
	if is_viet_51_opened(1) == 0 then
		return
	end
	if random(100) < 3 then
		gf_SetLogCaption("viet_2008_51_cangjian_award");
--		gf_AddItemEx( {2,1,30004,1, 1}, "宝石箱");
		DropItem(2,1,30004,GetNpcWorldPos(nNpcIdx));
		gf_SetLogCaption("");
	end
end

-- 神秘商人对话
function viet_2008_51_gem_talk()
	if is_viet_51_opened(1) == 0 then
		Say("Ha ha, cu閏 i v蒼 p sao...", 0);
		return
	end
	Say("Ch骳 m鮪g ng祔 l� 30 th竛g 4 v� Qu鑓 t� lao ng.",
		3,
		"\nфi ph莕 thng/talk_award",
		"\nN閕 dung ho箃 ng/talk_help_1",
		"R阨 kh醝/nothing");
end
function talk_help_1()
	Say( "Trong th阨 gian ho箃 ng, tham gia ho箃 ng thng h閕, nhi謒 v� s� m玭 ho芻 T祅g Ki誱 S琻 Trang c� th� nh薾 頲 Rng b秓 th筩h, b猲 trong c� ch鴄 1 vi猲 Ng� Linh Th筩h, Lam Tinh Th筩h ho芻 Ho祅g B秓 Th筩h, c� th� d飊g c竎 lo筰 b秓 th筩h n祔  i ph莕 thng t筰 y.",
		2,
		"Ph莕 thng g錷 nh鱪g g�?/talk_help_2",
		"Ch糿g c� g� vui c�/nothing()");
end
function talk_help_2()
	Say( " 2 Lam Tinh Th筩h + 2 Ho祅g B秓 Thach + 10 b筩 = 20.000 甶觤 kinh nghi謒\n 1 Ng� Linh Th筩h + 2 Lam Tinh Th筩h + 2Ho祅g B秓 Th筩h + 50 b筩 = 80.000 甶觤 kinh nghi謒, c� kh� n╪g nh薾 頲 ph莕 thng kh竎.\nNgi ch琲 <color=red>c蕄 20<color> tr� l猲 m韎 c� th� tham gia ho箃 ng n祔, th阨 gian ho箃 ng t� <color=red>26-04-2008 n 24h00 18-05-2008<color>..",
		1,
		"Ta  hi觰 r錳./viet_2008_51_gem_talk",
		"R阨 kh醝/nothing");
end
function talk_award()
	if GetLevel() < 20 then
		Say("ьi n c蕄 20 h穣 gh� l筰..", 0);
		return
	end
	if GetTask(TASK_ID_VIET_2008_51_GEM_EXP) >= 30000000 then
		Say("Th玭g qua ho箃 ng n祔, m鏸 ngi ch琲 ch� c� th� nh薾 頲 t鑙 產 30 tri謚 甶觤 kinh nghi謒.", 0);
		return
	end
	Say("Mu鑞 i ph莕 thng n祇??",
		3,
		"\n2 Lam Tinh Th筩h + 2 Ho祅g B秓 Th筩h + 10 b筩 = 20.000 甶觤 kinh nghi謒./talk_award_1",
		"\n1 Ng� Linh Th筩h + 2 Lam Tinh Th筩h + 2 Ho祅g B秓 Th筩h + 50 b筩 = 80.000 甶觤 kinh nghi謒, ngo礽 ra c� kh� n╪g nh薾 頲 ph莕 thng kh竎../talk_award_2",
		"R阨 kh醝/nothing");
end

function talk_award_1()
	local gem_exp = GetTask(TASK_ID_VIET_2008_51_GEM_EXP);
	local msg = "C� ng � d飊g 2 Lam Tinh Th筩h + 2 Ho祅g B秓 Th筩h + 10 b筩 i l蕐 20.000 甶觤 kinh nghi謒 kh玭g??";
	if gem_exp + 20000 > G_MAX_EXP then
		local exp = G_MAX_EXP - gem_exp;
		msg = "Th玭g qua ho箃 ng n祔, m鏸 ngi ch琲 ch� c� th� nh薾 頲 t鑙 產 30 tri謚 甶觤 kinh nghi謒."..gem_exp.." 甶觤 kinh nghi謒, v� th� l莕 trao i n祔 ch� c� th� nh薾 頲 "..exp.." 甶觤 kinh nghi謒.\nуng � d飊g 2 Lam Tinh Th筩h + 2 Ho祅g B秓 Th筩h + 10 b筩 i l蕐 "..exp.." 甶觤 kinh nghi謒 kh玭g??";
	end
	Say(msg,
		2,
		"Ta ng � i./talk_award_1_yes",
		"Ta suy ngh� l筰!/talk_award");
end

function talk_award_1_yes()
	if GetItemCount(2, 1, 30006) < 2 then
		Say("Lam Tinh Th筩h mang theo kh玭g .!", 0);
		return
	end
	if GetItemCount(2, 1, 30007) < 2 then
		Say("Ho祅g B秓 Th筩h mang theo kh玭g .!", 0);
		return
	end
	if GetCash() < 1000 then
		Say("Kh玭g  ng﹏ lng..", 0);
		return
	end
	local gem_exp = GetTask(TASK_ID_VIET_2008_51_GEM_EXP);
	local exp = 20000;
	if gem_exp + 20000 > G_MAX_EXP then
		exp = G_MAX_EXP - gem_exp;
	end

	if DelItem(2, 1, 30006,2) and DelItem(2, 1, 30007,2) and Pay(1000) then
		SetTask(TASK_ID_VIET_2008_51_GEM_EXP, GetTask(TASK_ID_VIET_2008_51_GEM_EXP) + exp);
		gf_SetLogCaption("viet_2008_51_gem_award");
		gf_Modify("Exp", exp);
		gf_SetLogCaption("");
	end
end

function talk_award_2()
	local gem_exp = GetTask(TASK_ID_VIET_2008_51_GEM_EXP);
	local msg = "C� ng � d飊g 1 Ng� Linh Th筩h + 2 Lam Tinh Th筩h + 2 Ho祅g B秓 Th筩h + 50 b筩 = 80.000 甶觤 kinh nghi謒 kh玭g? Ngo礽 ra c遪 c� th� nh薾 頲 ph莕 thng kh竎..";
	if gem_exp + 80000 > G_MAX_EXP then
		local exp = G_MAX_EXP - gem_exp;
		msg = "Th玭g qua ho箃 ng n祔, m鏸 ngi ch琲 ch� c� th� nh薾 頲 t鑙 產 30 tri謚 甶觤 kinh nghi謒."..gem_exp.." 甶觤 kinh nghi謒, v� th� l莕 trao i n祔 ch� c� th� nh薾 頲 "..exp.." 甶觤 kinh nghi謒.\nуng � d飊g 1 Ng� Linh Th筩h + 2 Lam Tinh Th筩h + 2 Ho祅g B秓 Th筩h + 10 b筩 i l蕐 "..exp.." 甶觤 kinh nghi謒 kh玭g? Ngo礽 ra c遪 c� x竎 su蕋 nh薾 頲 ph莕 thng kh竎..";
	end
	Say(msg,
		2,
		"Ta ng � i./talk_award_2_yes",
		"Ta suy ngh� l筰!/talk_award");
end
t_gem_item_award = {
	{68489,         "Ch璦", {0,0,0,1,1} },
	{    1,     "Chi猰 Y Ph�", {0,107,66,1,1} },
	{    5,   "Thi猲 H� M藅 t辌h", {0,107,64,1,1} },
	{    5,   "T� H� M藅 t辌h", {0,107,65,1,1} },
	{  500,   "B� Kim M藅 t辌h", {0,107,61,1,1} },
	{  500,   "B� Th筩h M藅 t辌h", {0,107,62,1,1} },
	{  500,   "Ng� Qu� M藅 t辌h", {0,107,63,1,1} },
	{  500,   "M秐h Thi猲 th筩h", {2,2,7,1,1} },
	{  500,       "Thi猲 th筩h", {2,2,8,1,1} },
	{ 5000,       "B╪g th筩h", {2,1,149,1,1} },
	{ 5000,   "M秐h B╪g th筩h", {2,1,148,1,1} },
	{ 3500,   "C﹜ B竧 Nh�", {2,0,398,1,1} },
	{ 5500, "C﹜ B竧 Nh� nh�", {2,0,504,1,1} },
	{10000,       "L� th駓", {2,0,351,1,1} },
}
function talk_award_2_yes()
	if GetItemCount(2, 1, 30005) < 1 then
		Say("Ng� Linh Th筩h mang theo kh玭g .!", 0);
		return
	end
	if GetItemCount(2, 1, 30006) < 2 then
		Say("Lam Tinh Th筩h mang theo kh玭g .!", 0);
		return
	end
	if GetItemCount(2, 1, 30007) < 2 then
		Say("Ho祅g B秓 Th筩h mang theo kh玭g .!", 0);
		return
	end
	if GetCash() < 5000 then
		Say("Kh玭g  ng﹏ lng..", 0);
		return
	end

	local gem_exp = GetTask(TASK_ID_VIET_2008_51_GEM_EXP);
	local nItem = get_random_item(t_gem_item_award);
	if nItem == 0 then
		print("error table: t_gem_item_award!!!");
		return
	end

	local exp = 80000;
	if gem_exp + 80000 > G_MAX_EXP then
		exp = G_MAX_EXP - gem_exp;
	end

	if DelItem(2, 1, 30005,1) and DelItem(2, 1, 30006,2) and DelItem(2, 1, 30007,2) and Pay(5000) then
		SetTask(TASK_ID_VIET_2008_51_GEM_EXP, GetTask(TASK_ID_VIET_2008_51_GEM_EXP) + exp);
		gf_SetLogCaption("viet_2008_51_gem_award");
		gf_Modify("Exp", exp);
		if nItem ~= 1 then
			gf_AddItemEx( t_gem_item_award[nItem][3], t_gem_item_award[nItem][2] );
		end
		gf_SetLogCaption("");
	end
end

function nothing()
end
