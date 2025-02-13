---------------------------------------------------------
--村长说：我相信凡事都有解决的办法
--不能解决的事情只能求心而已。--2006-12-04
---------------------------------------------------------
--函数名称：轮次返回函数
--功       能：返回当前的轮次
function zgc_pub_day_turn(day_num)
	if day_num == nil then day_num = 1 end
	if day_num <= 0 then day_num = 1 end
	day_num = day_num or 1
	local time_return = floor((GetTime()-57600)/(86400 * day_num))
	return time_return
end
--函数名称：日期返回函数
--函数功能：返回当前的日期（天）
function zgc_pub_date_num()
	return tonumber(date("%Y%m%d"))
end
--函数名称：物品添加检查函数
--功        能：对当前玩家可否正常添加物品进行检测 
function Zgc_pub_goods_add_chk(goods_num,goods_weight)
		if GetFreeItemRoom() < goods_num then
			Talk (1,"end_dialog","<color=red>kho秐g tr鑞g<color> trong h祅h trang kh玭g !")
			return 0
		elseif (GetMaxItemWeight() - GetCurItemWeight()) < goods_weight then			--判断玩家负重和空间
			Talk (1,"end_dialog","<color=red>S鴆 l鵦<color> c馻 b筺 kh玭g !")
			return 0
		else 
			return 1
		end
end
function Zgc_pub_goods_add_chk_mod(goods_num,goods_weight)
		if GetFreeItemRoom() < goods_num then
			-- Talk (1,"end_dialog","<color=red>kho秐g tr鑞g<color> trong h祅h trang kh玭g !")
			return 0
		elseif (GetMaxItemWeight() - GetCurItemWeight()) < goods_weight then			--判断玩家负重和空间
			-- Talk (1,"end_dialog","<color=red>S鴆 l鵦<color> c馻 b筺 kh玭g !")
			return 2
		else 
			return 1
		end
end
--功能函数：数字按位返回
--功        能：将数字按位返回,位置计算：......3<--2<--1<--
function Zgc_pub_num_apart(num,num_att)
	local num_return = 0
	local num_att = strlen(tostring(num)) - num_att + 1
	if num_att <= 0 or strlen(tostring(num)) < num_att then
		return 10
	else
		return tonumber(strsub(tostring(num),num_att,num_att))
	end
end
--函数名称：数字处理函数 
--功       能：利用数字和字符串的转换将某位数字从母数据的剥离,位置计算：--> 1-->2-->3........
function Zgc_pub_num_peel(num,num_att)
	local num_return = 0
	local str_num = tostring(num)
	if num_att <= 0 or strlen(str_num) < num_att then
		return "erro"
	else
		if num_att ~= 1 and num_att ~= strlen(str_num) then
			num_return = strsub(str_num,1,num_att - 1)..strsub(str_num,num_att +1,strlen(str_num))
		elseif num_att == 1 then
			num_return = strsub(str_num,2,strlen(str_num))
		elseif num_att == strlen(str_num) then
			num_return = strsub(str_num,1,(strlen(str_num)-1))
		end
	end
	return tonumber(num_return)
end
--时间处理函数（1）
function Zgc_pub_time_sec_change(sec_num,flag)
	--flag = 1 表示：返回小时、分钟和秒
	--flag = 0 表示：只返回分钟和秒
	if sec_num <= 0 or (flag ~=0 and flag ~= 1) then
		return 0
	end
	local num_h = 0
	local num_m = 0
	local num_s = 0
	if flag == 0 then
		if sec_num > 3600 then
			num_h = floor(sec_num/3600)
			sec_num = sec_num - (num_h *3600)
		end
		if sec_num > 60 then
			num_m = floor(sec_num/60)
			sec_num = sec_num - (num_m * 60)
		end
		num_s = sec_num
	elseif flag == 1 then
		if sec_num > 60 then
			num_m = floor(sec_num/60)
			sec_num = sec_num - (num_m * 60)
		end
		num_s = sec_num
	end
	local dialog_rtn = ""
	if num_h ~= 0 then
		dialog_rtn = dialog_rtn..num_h.."h "
	end
	if num_m ~= 0 then
		dialog_rtn = dialog_rtn..num_m.." ph髏 "
	end
	if num_s ~= 0 then
		dialog_rtn = dialog_rtn..num_s.." Gi﹜ "
	end
	return dialog_rtn
end
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
--函数名称：周序数计算函数
--函数功能：返回周的序数
function Zgc_pub_week_seq()
	return floor((zgc_pub_day_turn(1) - 2)/7)
end

--函数名称：NPC索引值设定
--功        能：直接设定NPC索引位置的值
function SetUnitCurStates(Npc_index,att_seq,number)
	if number > 99 and att_seq ~= 1 and att_seq ~= 4 and att_seq ~= 5 and att_seq ~= 6 then
		return 0
	end
	local num_save = GetUnitCurStates(Npc_index,att_seq)
	num_save = number - num_save
	AddUnitStates(Npc_index,att_seq,num_save)
	return 1
end
--函数名称：获得玩家性名
--功        能：判断为少侠还是女侠
function Zgc_pub_sex_name()
	local sex_name = ""
	if GetSex() == 1 then
		sex_name = "Thi誹 hi謕"
	else
		sex_name = "N� hi謕 "
	end
	return sex_name
end
--函数名称：活动等级判断
--功        能：判断玩家等级是否达到11级
function Zgc_pub_action_level_chk()
	local npc_name = GetNpcName(GetTaskTemp(164))
	if npc_name == "" then
		npc_name = "nh綾 nh�"
	end
	if GetLevel() < 11 then
		Talk(1,"end_dialog","<color=green>"..npc_name.."<color>: "..Zgc_pub_sex_name().."c莕 r蘮 luy謓 th猰 m閠 th阨 gian!")
		SetTaskTemp(164,0)
		return 0
	else
		SetTaskTemp(164,0)
		return 1
	end
end
--函数名称：地图名称返回函数
--功        能：把地图ID和地图名称进行相互转换
function Zgc_pub_mapID_name_change(data_in,change_flag)
	--change_flag为1的时候ID->名字
	--change_flag为2的时候名字->ID
	local find_flag = 0
	for i = 1,getn(Zgc_pub_table_map_name) do
		if Zgc_pub_table_map_name[i][change_flag] == data_in then
			if change_flag == 1 then
				return Zgc_pub_table_map_name[i][2]
			elseif change_flag == 2 then
				return Zgc_pub_table_map_name[i][1]
			end
			find_flag = 1
			break
		end
	end
	if find_flag == 0 then
		return 0 
	end
end
--函数名称：地图名称返回函数
--功        能：把地图ID和地图名称进行相互转换
function Zgc_pub_money_name_change(money)
	if money == 0 then
		return "0 lng"
	end
	local money_gold = floor(money/10000)
	local money_silver = floor((money-(money_gold*10000))/100)
	local money_copper = floor(money-(money_gold*10000)-(money_silver*100))
	local money_name = ""
	if money_gold ~= 0 then
		money_name = money_gold.." Kim "
	end
	if money_silver ~= 0 then
		money_name = money_name..money_silver.." b筩 "
	end
	if money_copper ~= 0 then
		money_name = money_name..money_copper.." уng "
	end
	return money_name
end
--函数名称：返回当前时间（秒树）
--功       能：返回当前时间是今天的第多少秒
function Zgc_pub_today_sec_num_rtn()
	local sec_num = (GetTime() - 57600)
	sec_num = sec_num - ((floor(sec_num/86400))*86400)
	return sec_num
end
--函数名称：玩家升级信息
--功	    能：返回玩家当前生机所需要的经验和当前等级可获得的潜能点数
--备        注：num_diff为1时返回经验点数、为2时返回潜能点数
function Zgc_pub_player_uplevel(num_diff)
	local player_uplevel_num = {
	{10,3},{20,3},{40,3},{80,3},{140,3},
	{245,3},{429,3},{643,3},{965,4},{1302,4},
	{1758,4},{2373,4},{3086,4},{3857,4},{4725,4},
	{5670,4},{6662,4},{7661,4},{8695,5},{9782,5},
	{11005,5},{12381,5},{13928,5},{15669,5},{17628,5},
	{19832,5},{22311,5},{25099,5},{28237,6},{32049,6},
	{36375,6},{41286,6},{46860,6},{53186,6},{60366,6},
	{68515,6},{77765,6},{88263,6},{100178,7},{117710,7},
	{138309,7},{162513,7},{190953,7},{224369,7},{263634,7},
	{309770,7},{363980,7},{427676,7},{502519,8},{585435,8},
	{682032,8},{794567,8},{925671,8},{1078406,8},{1256343,8},
	{1463640,8},{1705140,8},{1986489,8},{2314259,9},{2672969,9},
	{3087280,9},{3565808,9},{4118508,9},{4756877,9},{5494193,9},
	{6345793,9},{7329390,9},{8465446,9},{9777590,10},{12710867,10},
	{16524127,10},{21481365,10},{27925775,10},{37699796,10},{50894725,10},
	{68707878,10},{92755636,10},{125220108,10},{169047146,11},{196094689,11},
	{227469839,11},{263865014,11},{306083416,11},{355056762,11},{411865844,11},
	{477764379,11},{554206680,11},{642879749,11},{745740509,12},{857601585,12},
	{986241823,12},{1134178096,12},{1304304811,12},{1499950532,12},{1724943112,12},
	{1950000000,12},{1950000000,12},{1950000000,12},{1950000000,12}
	}
	if num_diff == 1 then
		return player_uplevel_num[GetLevel()][1]
	elseif num_diff == 2 then
		return player_uplevel_num[GetLevel()][2]
	else
		return 0
	end
end
--函数名称：NPC距离计算函数
--函数功能：计算玩家与当前NPC的X+Y的绝对值
function Zgc_pub_npc_distance()
	local npc_index = GetTargetNpc()
	local npc_map_id,npc_att_x,npc_att_y = GetNpcWorldPos(npc_index)
	local player_map_id,player_att_x,player_att_y = GetWorldPos()
	return (abs(npc_att_x - player_att_x) + abs(npc_att_y - player_att_y))
end
--函数名称：帮会数据get
--功        能：按位取得帮会数据
function Zgc_pub_getconftask(id,fun_id)
	SetTaskTemp(158,id)
	SetTaskTemp(160,fun_id)
	ApplyRelayShareData(GetTongName(),0,0,File_name,"CallBackGetConfTask")
end
function CallBackGetConfTask(szKey, nKey1, nKey2, nCount)
	local id = GetTaskTemp(158)
	local fun_id = tostring(GetTaskTemp(160))
	local suit_id = tostring(floor(id/10)+1)
	local conf_data	= {}
	conf_data[0],conf_data[1],conf_data[2],conf_data[3],conf_data[4],conf_data[5],conf_data[6],conf_data[7],conf_data[8],conf_data[9] = GetRelayShareDataByKey(szKey, nKey1, nKey2,suit_id)
	if conf_data[id] == nil then
		conf_data[id] = 0 
	end
	local return_fun = "ConfDataGetReturn_"..fun_id.."("..conf_data[id]..")"
	dostring(return_fun)
end
--函数名称：帮会数据set
--功        能：按位设置帮会数据
function Zgc_pub_setconftask(id,value,fun_id)
	SetTaskTemp(158,id)
	SetTaskTemp(159,value)
	SetTaskTemp(160,fun_id)
	ApplyRelayShareData(GetTongName(),0,0,File_name,"CallBackSetConfTask")
end
function CallBackSetConfTask(szKey, nKey1, nKey2, nCount)
	local id = GetTaskTemp(158)
	local value = GetTaskTemp(159)
	local fun_id = tostring(GetTaskTemp(160))
	local suit_id = ""
	suit_id = tostring(floor(id/10) + 1)			--计算大位置
													--取值]
	local conf_data	= {}
	conf_data[0],conf_data[1],conf_data[2],conf_data[3],conf_data[4],conf_data[5],conf_data[6],conf_data[7],conf_data[8],conf_data[9] = GetRelayShareDataByKey(szKey, nKey1, nKey2,suit_id)
	DelRelayShareDataCopy(szKey,nKey1,nKey2)
	for i = 0, 9 do
		if conf_data[i] == nil then
			conf_data[i] = 0 
		end
	end
	local save_id = (id - (floor(id/10)*10))
	conf_data[save_id] = value
	local rtn_flag = AddRelayShareData(GetTongName(),0,0, File_name, "end_dialog", 0,suit_id, "dddddddddd", conf_data[0],conf_data[1],conf_data[2],conf_data[3],conf_data[4],conf_data[5],conf_data[6],conf_data[7],conf_data[8],conf_data[9])
	local return_fun = "ConfDataSetReturn_"..fun_id.."()"
	dostring(return_fun)
end
--函数名称：对话函数的翻页统一处理
--函数功能：传入需要处理的对话，对对话进行自动翻页的处理
--传入参数：tb_deal:需要处理的table；page_seq:需要处理的页数；npp:每页的数量；fun_str：原函数的函数名称；add_dia：附带在最后的对话，可以增加比如退出（”退出/end_dialog“）完成对话
function zgc_pub_dialog_page_deal(tb_deal,page_seq,npp,fun_str,add_dia)
	local tb_dia_rtn = {}
	--判断传入参数是否正确
	if getn(tb_deal) <= ((page_seq-1) * npp) or page_seq < 1 then
		tb_dia_rtn = {"err"}
	else
		--开始整合
		local num_this_page = (getn(tb_deal) - ((page_seq-1) * npp))
		local next_page_flag = 0
		--判断本页显示的次数
		if num_this_page > npp then
			num_this_page = npp
			next_page_flag = 1
		end
		--判断是否需要下一页
		--if (num_this_page) > (2 * npp) then
		--	next_page_flag = 1
		--end
		--写入”上一页“
		if page_seq > 1 then
			tinsert(tb_dia_rtn,"Trang trc/#"..fun_str.."("..(page_seq-1)..")")
		end
		--写入主题
		for i = 1,num_this_page do
			tinsert(tb_dia_rtn,tb_deal[((page_seq-1) * npp)+i])
		end
		--写入”下一页”
		if next_page_flag == 1 then
			tinsert(tb_dia_rtn,"Trang k�/#"..fun_str.."("..(page_seq+1)..")")
		end
		if add_dia ~= "" then
			tinsert(tb_dia_rtn,add_dia)
		end
	end
	return tb_dia_rtn
end
--函数名称：table的非重复性随机选择
--函数功能：对传入的table按制定的个数进行非重复性随机选取
function zgc_pub_table_sel_norepeat(table_name,sel_num)
	table_length = getn(table_name)
	local table_temp = zgc_pub_table_copy(table_name)
	local table_return = {}
	if  not(table_length < sel_num) then
		--开始正式处理
		for i = table_length ,(table_length - sel_num + 1), -1 do
			local insert_seq = random(1,i)
			tinsert(table_return,table_temp[insert_seq])
			table_temp[insert_seq] = table_temp[i]
		end
	end
	return table_return
end
--函数名称：table复制函数
--函数功能：创建一个新的一样的table，返回这个table的copy
function zgc_pub_table_copy(table_name)
	local table_rtn = {}
	for i = 1,getn(table_name) do
		tinsert(table_rtn,table_name[i])
	end
	return table_rtn
end
--函数名称：组队检测函数
--函数功能：检测传入的player_index是否和当前的PlayerIdex在同一个队伍中
function zgc_pub_same_team_chk(player_index)
	local team_member_num = GetTeamSize()
	local chk_flag = 0
	if team_member_num ~= 0 then
		for i = 1, team_member_num do
			if GetTeamMember(i) == player_index then
				chk_flag = 1
			end
		end
	end	
	return chk_flag
end
--函数名称：玩家名称过滤函数
--函数功能：替换玩家名称中的非法字符
function zgc_pub_name_replace(str,pattern,s)
	local startS,endS = strfind(str,pattern)
	while(startS) do
		str = strsub(str,1,startS-1)..s..strsub(str,endS+1,strlen(str))
		startS,endS = strfind(str,pattern)
	end
	return str
end
--函数名称：对话空函数
--功        能：对话空函数，快捷结束
function end_dialog()

end
--==================================================================单次针对性函数=======================================================================
--道具使用时间判断
function Xmas_goods_use_date_chk()
	if zgc_pub_day_turn(1) < Xmas_start_day or zgc_pub_day_turn(1) > Xmas_end_day then
		Talk(1,"end_dialog","    V藅 ph萴 n祔 ch� c� th� s� d鬾g v祇 ho箃 ng Gi竛g sinh.")
		return 0
	end
	return 1
end
--个人圣诞树归属判断
function Xmas_tree_name_chk(Xmas_tree_index)
	local name_len = strlen(GetName())
	local Xmas_tree_name = strsub(GetNpcName(Xmas_tree_index),1,name_len)
	if GetName() == Xmas_tree_name and strlen(GetName()) == GetUnitCurStates(Xmas_tree_index,8) then
		return 1
	end
	return 0
end
--帮会圣诞树归属判断
function Conf_Xmas_tree_name_chk(conf_Xmas_tree_index)
	local name_long = strlen(GetTongName())
	local conf_Xmas_tree_name = strsub(GetNpcName(conf_Xmas_tree_index),1,name_long)
	if GetTongName() == conf_Xmas_tree_name and strlen(GetTongName()) == GetUnitCurStates(conf_Xmas_tree_index,8) then
		return 1
	end
	return 0
end
--是否可以种树的判断
function Xmas_tree_create_time_con()
	local old_time = GetTask(962)
	local old_index = GetTask(963)
	if old_time == 0 or old_index == 0 then
		return 1
	elseif (GetTime() - old_time) > 900 then
		return 1
	end
	return 0
end
--****************************春节活动*****************************
function spring_2007_date_chk()
	local date_seq = zgc_pub_day_turn(1)
	if date_seq < 13552 or date_seq > 13569 then
		return 0
	else
		return 1
	end
end
--****************************年兽增加函数*************************
function spring2007_spring_goods_add()
	local add_odds_coat = 25
	local add_flag = AddItem(0,105,33,1,1,-1,-1,-1,-1,-1,-1)
	if add_flag == 1 then
	Msg2Player("Ch骳 m鮪g b筺  nh薾 頲 th� ci: Ni猲 Th�!")
	end
	if random(1,100) >= add_odds_coat then
		local TaskID_spring2007_cap = 973
		local TaskID_spring2007_coat = 974
		local TaskID_spring2007_trou = 975
		local coat_id_list = {
		{{"Thu Thi qu竛",0,108,195},{"Йng H祅 m穙",0,108,196},{"H� Vinh k誸",0,108,197},{"Xu﹏ No穘 tr﹎",0,108,198}},
		{{"Thu Thi b祇",0,109,255},{"Йng H祅 gi竝",0,109,256},{"H� Vinh trang",0,109,257},{"Xu﹏ No穘 thng",0,109,258}},
		{{"Thu Thi ngoa",0,110,85},{"Йng H祅 ngoa",0,110,86},{"H� Vinh qu莕",0,110,87},{"Xu﹏ No穘 qu莕",0,110,88}},	
		}
		local not_get = {}
		local not_get_num = 1
		for i = TaskID_spring2007_cap,TaskID_spring2007_trou do
			if GetTask(i) ~= 1 then
				not_get[not_get_num] = i
				not_get_num = not_get_num + 1
			end
		end
		if getn(not_get) <= 0 then
			return
		else
			local coat_seq = random(1,getn(not_get))
			coat_seq = not_get[coat_seq]
			local player_body = GetBody()
			local add_flag = AddItem(coat_id_list[coat_seq - 972][player_body][2],coat_id_list[coat_seq - 972][player_body][3],coat_id_list[coat_seq - 972][player_body][4],1)
			if add_flag == 1 then
				Msg2Player("Ch骳 m鮪g b筺  nh薾 頲 1:"..coat_id_list[coat_seq - 972][player_body][1].."!")
			end
			SetTask(coat_seq,1)
		end
	end
	return
end
--*******************************2007年清明节活动************************
function tomb_sweep_2007_date_chk()
	local date_save = zgc_pub_day_turn(1)
	if date_save >= 13601 and date_save <= 13610 then
		return 1
	elseif date_save < 13601 then
		return -1
	else
		return 0
	end
end
--*****************************2007年五一活动时间*************************
function labor_day_2007_date_chk()
	local date_seq = zgc_pub_day_turn(1)
	if date_seq < 13628 then
		return -1
	elseif date_seq >= 13628 and date_seq <=13642 then
		return 0
	else
		return 1
	end
end
--*****************************五一活动师门历练时间*************************
function labor_2007_teach_date_chk()
	local date_seq = zgc_pub_day_turn(1)
	if date_seq < 13628 then
		return -1
	elseif date_seq >= 13628 and date_seq <=13649 then
		return 0
	else
		return 1
	end
end
--******************************结婚二期相关******************************

--***************************五一活动师门历练任务对话**********************
TaskID_up_book_week_seq = 1202
TaskID_up_book_diff = 1245
TaskID_up_book_num = 1246
TaskID_Temp_book_diff = 173
Tb_teacher_name = {"<color=green>Huy襫 T�<color>:","<color=green>T� H筩 Ch﹏ Nh﹏<color>:","<color=green>Ch﹏ Nh� S� Th竔<color>:","<color=green>Long T筰 Thi猲<color>:","<color=green>Л阯g S� H錸g<color>:","<color=green>Xa Th竔 Qu﹏<color>:","<color=green>B筩h Doanh Doanh<color>:",}
Tb_teacher_name[0] = "<color=green>c s� V� L﹎<color>:"
Tb_book = {	{75,"Th鵦 chi課 t﹎ c",1101,20},
			{10,"Quan chi課 t﹎ c",1102,40},
			{10,"Th鵦 chi課 kinh nghi謒 t藀",1103,6},
			}
Sever_diff_lilian = 2
function labor_07_dia_main(sver_flag)
	-- do
		-- Say(Tb_teacher_name[GetPlayerFaction()].."Ho箃 ng S� m玭 r蘮 luy謓 hi謓 ch璦 b総 u!",0);
		-- return
	-- end
	Sever_diff_lilian = sver_flag
	if GetPlayerFaction() ~= 0 then
		-- Say(Tb_teacher_name[GetPlayerFaction()].."Ngi  h鋍 v� ngh� nhi襲 n╩ r錳, b﹜ gi� ng ng筰 h� s琻 t譵 ngi kh竎  tu luy謓 v� h鋍, ho芻 t� th� v� c玭g v韎 ngi kh竎. X璦 nay  h鋍 頲 nhi襲 r錳, n誹 trong tay ngi v蒼 c遪 '<color=yellow>Quan Chi課 T﹎ Ьc<color>', th� c� th� n ch� ta  i ph莕 thng.",
		local nNpcIndex = GetTargetNpc();
		local szNpcName = format("<color=green>%s<color>:",GetNpcName(nNpcIndex));
		Say(szNpcName.." Ngi  h鋍 v� ngh� nhi襲 n╩ r錳, b﹜ gi� ng ng筰 h� s琻 t譵 ngi kh竎  tu luy謓 v� h鋍, ho芻 t� th� v� c玭g v韎 ngi kh竎. X璦 nay  h鋍 頲 nhi襲 r錳, n誹 trong tay ngi v蒼 c遪 '<color=yellow>Quan Chi課 T﹎ Ьc<color>', th� c� th� n ch� ta  i ph莕 thng.",
		6,
		--"我要上交“实战心得”/#book_hand_in(1)",
		-- "Ta mu鑞 giao 'Th鵦 chi課 t﹎ c'/#book_hand_in(1)",
		"Ta mu鑞 n閜'Quan Chi課 T﹎ Ьc'/#book_hand_in(2)",
		"Ta mu鑞 n閜 'Th鵦 chi課 kinh nghi謒 t藀'/#book_hand_in(3)",
		"L祄 sao  nh薾 頲 Th鵦 chi課 t﹎ c v� Quan chi課 t﹎ c/how_2_get_book",
		"T竎 d鬾g c馻 Th鵦 chi課 kinh nghi謒 t藀/fight_exp_book_inf",
		"C� th� nh薾 頲 nh鱪g ph莕 thng n祇?/what_prize",
		"Ta ch� n xem th�/end_dialog"
		)
		return
	else
		Say(Tb_teacher_name[GetPlayerFaction()].."Ngi tuy v� m玭 v� ph竔, nh璶g c騨g l� nh﹏ s� giang h�, b﹜ gi� ngi ng ng筰 tu luy謓 v� c玭g ho芻 t� th� v� ngh� v韎 ngi kh竎. X璦 nay  h鋍 頲 nhi襲 r錳, n誹 trong tay ngi v蒼 c遪 '<color=yellow>Quan Chi課 T﹎ Ьc<color>', th� c� th� n ch� ta  i ph莕 thng.",
		6,
		"Ta ph秈 n閜'Quan Chi課 T﹎ Ьc'/#book_hand_in(2)",
		"Ta ph秈 n閜 'Th鵦 chi課 kinh nghi謒 t藀'/#book_hand_in(3)",
		"L祄 sao  nh薾 頲 Th鵦 chi課 t﹎ c v� Quan chi課 t﹎ c/how_2_get_book",
		"T竎 d鬾g c馻 Th鵦 chi課 kinh nghi謒 t藀/fight_exp_book_inf",
		"C� th� nh薾 頲 nh鱪g ph莕 thng /what_prize",
		"Ta ch� n xem th�/end_dialog"
		)
	end
end
--*************************上交心得*********************
function book_hand_in(book_diff)
	local player_level = GetLevel()
	--等级判断
	if player_level < Tb_book[book_diff][1] then
		Talk(1,"",Tb_teacher_name[GetPlayerFaction()].."<color=yellow>"..Tb_book[book_diff][1].."<color>е t� tr猲 c蕄<color=yellow>"..Tb_book[book_diff][2].."<color> m韎 c� th� giao n閜!")
		return
	end
	--今天是否已经交过了心得
	local book_uped_diff = GetTask(TaskID_up_book_diff)
	if GetTask(TaskID_up_book_week_seq) == Zgc_pub_week_seq() and (book_uped_diff ~= 0 and book_uped_diff ~= nil)then
		if GetTask(TaskID_up_book_num) >= Tb_book[book_uped_diff][4] then
			Talk(1,"",Tb_teacher_name[GetPlayerFaction()].."Ngi   b秐 l躰h h穣 t� m譶h r蘮 luy謓 th猰, kh玭g c莕 a nh鱪g th�  cho ta n鱝")
			return
		end
		if book_diff ~= book_uped_diff then
			Talk(1,"",Tb_teacher_name[GetPlayerFaction()].."Tu莕 n祔 ngi  n閜 <color=yellow>"..Tb_book[book_uped_diff][2].."<color>, kh玭g th� n閜 n鱝.")
			return
		end
	end
	--输入上交的本数
	local book_num_get = GetItemCount(2,1,Tb_book[book_diff][3])
	if book_num_get <= 0 then
		Talk(1,"",Tb_teacher_name[GetPlayerFaction()].."H穣 mau ho祅 th祅h nhi謒 v�, ngi ch璦 c� <color=yellow>"..Tb_book[book_diff][2].."<color>!")
		return
	end
	local book_num_need = Tb_book[book_diff][4]
	if GetTask(TaskID_up_book_week_seq) == Zgc_pub_week_seq() then
		book_num_need = book_num_need - GetTask(TaskID_up_book_num)
	end
	local book_num_up = min(book_num_need,book_num_get)
	SetTaskTemp(TaskID_Temp_book_diff,book_diff)
	AskClientForNumber("prize_get",1,book_num_up,"Xin nh藀 th� b筺 mu鑞 n閜"..Tb_book[book_diff][2].."!")
end
--**************************奖励给于************************
function prize_get(book_num)
	local book_diff = GetTaskTemp(TaskID_Temp_book_diff)
	if book_diff == 0 or book_diff == nil then
		return
	end
	SetTaskTemp(TaskID_Temp_book_diff,0)
	if Sever_diff_lilian ~= 2 then
		local golden_exp_num = GetGoldenExp()
		if golden_exp_num == 0 then
			Talk(1,"",Tb_teacher_name[GetPlayerFaction()].."Hi謓 <color=yellow>kinh nghi謒 s鴆 kh醗<color> l� <color=red>0<color>, kh玭g chuy觧 頲!")
			return
		end
	end
	--携带检测
	if GetItemCount(2,1,Tb_book[book_diff][3]) < book_num then
		Talk(1,"",Tb_teacher_name[GetPlayerFaction()].."H穣 mau ho祅 th祅h nhi謒 v�, ngi ch璦 c� <color=yellow>"..Tb_book[book_diff][2].."<color>!")
		return
	end
	--奖励给于
	local player_level = GetLevel()
	local chg_num = floor((player_level * player_level * player_level * player_level) * 0.1953125 * book_num/Tb_book[book_diff][4])
	if Sever_diff_lilian == 2 then				--IB服务器
		--删除检测
		if DelItem(2,1,Tb_book[book_diff][3],book_num) ~= 1 then
			Talk(1,"",Tb_teacher_name[GetPlayerFaction()].."H穣 mau ho祅 th祅h nhi謒 v�, ngi ch璦 c� <color=yellow>"..Tb_book[book_diff][2].."<color>!")
			return
		end
		chg_num = floor((player_level * player_level * player_level * player_level) * book_num /(20 * Tb_book[book_diff][4]))
		ModifyExp(chg_num)
		Msg2Player("Ch骳 m鮪g b筺 nh薾 頲 "..chg_num.." 甶觤 kinh nghi謒!")
	else								--收费服务器
		local golden_exp_num = GetGoldenExp()
		if chg_num > golden_exp_num then
			Say(Tb_teacher_name[GetPlayerFaction()].."C╪ c� ng c蕄 hi謓 t筰 c馻 b筺, b筺 c� th� i <color=yellow>"..chg_num.."<color> 甶觤 s鴆 kh醗 th祅h 甶觤 kinh nghi謒 nh璶g 甶觤 s鴆 kh醗 c馻 b筺 kh玭g , b筺 x竎 nh薾 mu鑞 i?",
			2,
			"Ta x竎 nh薾/#chg_dtm("..golden_exp_num..","..book_diff..","..book_num..")",
			"в ta suy ngh� l筰/end_dialog")
			return
		end
		--删除检测
		if DelItem(2,1,Tb_book[book_diff][3],book_num) ~= 1 then
			Talk(1,"",Tb_teacher_name[GetPlayerFaction()].."H穣 mau ho祅 th祅h nhi謒 v�, ngi ch璦 c� <color=yellow>"..Tb_book[book_diff][2].."<color>!")
			return
		end
		ModifyGoldenExp(-chg_num)
		ModifyExp(chg_num)
		Msg2Player("Ch骳 m鮪g b筺 chuy觧"..chg_num.."甶觤 s鴆 kh醗 th祅h 甶觤 kinh nghi謒!")
	end
	--完成后的处理
	finish_deal(book_diff,book_num)
end
function chg_dtm(golden_exp_num,book_diff,book_num)
	if DelItem(2,1,Tb_book[book_diff][3],book_num) ~= 1 then
		Talk(1,"",Tb_teacher_name[GetPlayerFaction()].."H穣 mau ho祅 th祅h nhi謒 v�, ngi ch璦 c� <color=yellow>"..Tb_book[book_diff][2].."<color>!")
		return
	end
	ModifyGoldenExp(-golden_exp_num)
	ModifyExp(golden_exp_num)
	Msg2Player("Ch骳 m鮪g b筺 chuy觧"..golden_exp_num.."甶觤 s鴆 kh醗 th祅h 甶觤 kinh nghi謒!")
	finish_deal(book_diff,book_num)
end
--*************************完成后的处理*****************
function finish_deal(book_diff,book_num)
	local week_save = GetTask(TaskID_up_book_week_seq)
	local week_now = Zgc_pub_week_seq()
	local book_uped_num = GetTask(TaskID_up_book_num)
	if week_save >= week_now then
		SetTask(TaskID_up_book_num,(book_uped_num+book_num))
		SetTask(TaskID_up_book_diff,book_diff)			--这里保存上交的种类是为了避免外网已经交过的玩家出现数据错误
	else
		SetTask(TaskID_up_book_week_seq,week_now)
		SetTask(TaskID_up_book_num,book_num)
		SetTask(TaskID_up_book_diff,book_diff)
		book_uped_num = 0
	end
	local num_remain = (Tb_book[book_diff][4]-(book_uped_num+book_num))
	if num_remain ~= 0 then
		Talk(1,"",Tb_teacher_name[GetPlayerFaction()].."L莕 n祔 ngi  n閜 <color=yellow>"..book_num.."<color> quy觧 <color=yellow>"..Tb_book[book_diff][2].."<color>, tu莕 n祔 ngi c� th� n閜 <color=yellow>"..num_remain.."<color> quy觧!")
	else
		Talk(1,"",Tb_teacher_name[GetPlayerFaction()].."L莕 n祔 ngi  n閜 <color=yellow>"..book_num.."<color> quy觧 <color=yellow>"..Tb_book[book_diff][2].."<color>, tu莕 n祔 ngi kh玭g th� n閜 n鱝!")
	end
end
--*************************奖励列表*********************
function what_prize()
	if Sever_diff_lilian == 2 then				--IB服务器
		Talk(1,"",Tb_teacher_name[GetPlayerFaction()].."Ho祅 th祅h nhi謒 v� <color=yellow>Th� luy謓 s� m玭<color> ngi c� th� n ch� ta nh薾 ph莕 thng 甶觤 kinh nghi謒")
	else	
		Talk(1,"",Tb_teacher_name[GetPlayerFaction()].." Ho祅 th祅h nhi謒 v� <color=yellow>Th� luy謓 s� m玭<color> ngi c� th� n ch� ta nh薾 ph莕 thng 甶觤 s鴆 kh醗 chuy觧 sang 甶觤 kinh nghi謒")
	end
end
--*************************如何获得书*******************
function how_2_get_book()
	Talk(2,"",	Tb_teacher_name[GetPlayerFaction()].."Tham gia t� v� i h閕 s� c� c� h閕 nh薾 頲 '<color=yellow>Th鵦 Chi課 T﹎ Ьc<color>'. B﹜ gi� kh玭g th� nh薾 '<color=yellow>Quan Chi課 T﹎ Ьc<color>', n誹 c遪 Quan Chi課 T﹎ Ьc, th� c� th� n ch� ta  i ph莕 thng. Th鵦 Chi課 T﹎ Ьc c� th� nh蕁 chu閠 ph秈  s� d鬾g.",
				Tb_teacher_name[GetPlayerFaction()].."N猲 nh� ph秈 giao u trc <color=red>24h th� 7 m鏸 tu莕<color>"
	)
end
--**********************实战心得集的作用******************
function fight_exp_book_inf()
	Talk(1,"",Tb_teacher_name[GetPlayerFaction()].."N誹 kh玭g c� th阨 gian c� th� n Ng� c竎 mua <color=yellow>Th鵦 Chi課 Kinh Nghi謒 T藀<color> c馻 c竎 b薱 ti襫 b鑙, xem xong a ta c騨g 頲. Nh璶g <color=yellow>Th鵦 Chi課 Kinh Nghi謒 T藀<color> ch� c� th� l穘h m鏸 tu莕 do ngi ch璦 n閜 <color=yellow>Th鵦 Chi課 T﹎ Ьc<color> v� <color=yellow>Quan Chi課 T﹎ Ьc<color> ph莕 thng s鉻 l筰 kh玭g th� nh薾 ngo礽 nh m鴆. N誹 mu鑞 nh薾 ph莕 thng tu莕 n祔, <color=yellow>Th鵦 Chi課 Kinh Nghi謒 T藀<color> c騨g ph秈 n閜 trc <color=red>24 gi� Th� 7<color>.")
end 
--====================================2007端午节相关=============================
--*********************是否是活动期间*********************
function dragon_boat_date_chk()
	--if zgc_pub_day_turn(1) >= 13681 then
		return 1
	--else
	--	return 0
	--end
end
-- append by lizhi
-- 计算距离
function distance_between_points(MapID1, MapX1, MapY1, MapID2, MapX2, MapY2)
	if MapID1 ~= MapID2 then
		return -1
	else
		local dx = MapX2 - MapX1
		local dy = MapY2 - MapY1
		local nDist = (dx * dx + dy * dy)^(1/2)
		return nDist
	end
end

function mp_goods_add_chk(goods_num,goods_weight)
	if GetFreeItemRoom() < goods_num then
		Msg2Player("H祅h trang c馻 b筺 kh玭g  ch� tr鑞g!")					-- 一定要用Msg2Player
		return 0
	elseif (GetMaxItemWeight() - GetCurItemWeight()) < goods_weight then			--判断玩家负重和空间
		Msg2Player("S鴆 l鵦 c馻 b筺 kh玭g , h穣 thu x誴 l筰 甶.")
		return 0
	else
		return 1
	end
end
