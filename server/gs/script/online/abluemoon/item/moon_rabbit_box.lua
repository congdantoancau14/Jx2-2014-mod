--脚本名称：“月亮兔铁宝箱”使用脚本
--脚本功能：使用“月亮兔铁宝箱”的奖励增加
--代码编写人：村长
--代码编写时间：2007-01-28
--修改记录：小蓝打补丁
Include("\\script\\online\\zgc_public_fun.lua")		--村长的公共函数
--============================公共变量定义区============================
	moon_rabbit_box_prize_list = {
	--奖励概率--奖励类型--奖励函数
	{353,2,"jue_bag_add()"},						--诀要包
	{250,2,"shimen_book()"},					--师门秘籍
	{100,1,"Ng� H祅h M藅 T辌h",0,107,155},				--五行秘籍
	{60,2,"labor_head_add()"},					--五一头
	{60,2,"labor_trouers_add()"},				--五一裤子
	{60,2,"labor_weapon_add()"},					--五一武器
	{40,1,"Tng qu﹏ gi韎 ch�",0,102,21},					--将军戒
	{20,1,"Ng鵤 60%",0,105,12},					--忽雷驳
	{20,1,"Ng鋍 Th� Dc Bao",0,102,41},				--月亮兔药包				
	{15,1,"Khu蕋 nguy謙 b閕",0,102,27},				--屈原玉佩
	{5,1,"B� C秐h",0,105,13},					--布景
	{5,1,"Чi l鵦 th莕 h筺g li猲",0,102,28},				--大力神
	{4,1,"H籲g Nga Nguy謙 V� i",0,102,42},				--嫦娥舞带
	{4,1,"Йng Phng Long Ch﹗",0,102,24},				--东方龙珠
	{4,1,"H藆 ngh� l筩 nh藅 ho祅",0,102,43}				--后羿落日环
	}
--=============================脚本主逻辑区=============================


function OnUse(goods_index)
	Say("Rng ch鴄 ng nhi襲 b秓 v藅 th蕋 truy襫 ch鑞 v� l﹎",
	2,
	"M� rng/moon_rabbit_box_use",
	--"我想看看每种宝物的出现概率/show_all",
	"K誸 th骳/end_dialog")
end


--****************************箱子确认使用函数**************************
function moon_rabbit_box_use()
	if Zgc_pub_goods_add_chk(1,300) ~= 1 then		--空间/负重判断
		Talk(1,"","Ch骳 m鮪g b筺")
		return
	end
	if GetItemCount(2,0,606) == 0 then					--物品判断
		Talk(1,"","Xui qu� nh薾 l筰 th玦")
		return
	end
	if DelItem(2,0,606,1) ~= 1 then					--删除物品判断
		Talk(1,"","Ch竛 qu�")
		return
	end
	local num_count = 0
	for i = 1,getn(moon_rabbit_box_prize_list) do
		num_count = num_count + moon_rabbit_box_prize_list[i][1]
	end
	local ran_num = random(1,num_count)
	for i = 1 ,getn(moon_rabbit_box_prize_list) do
		if ran_num <= moon_rabbit_box_prize_list[i][1] then
			if getn(moon_rabbit_box_prize_list[i]) > 3 then
				local add_flag = AddItem(moon_rabbit_box_prize_list[i][4],moon_rabbit_box_prize_list[i][5],moon_rabbit_box_prize_list[i][6],moon_rabbit_box_prize_list[i][2],1,-1,-1,-1,-1,-1,-1)
				--if add_flag == 1 then
					--Msg2Player("B筺 nh薾 頲"..moon_rabbit_box_prize_list[i][3].. "nh�")
					--Msg2SubWorld(GetName().."B筺 nh薾 頲"..moon_rabbit_box_prize_list[i][3].. "nh�")
					--WriteLog("[abluemoon]"..GetName().."B筺 nh薾 頲"..moon_rabbit_box_prize_list[i][3].."nh�")
				--else
					--WriteLog("[abluemoon]B筺 nh薾 頲["..GetName().."]May m緉 nh薾 頲"..moon_rabbit_box_prize_list[i][3].. "nh�"..add_flag)
				--end	
				break
			else
				dostring(moon_rabbit_box_prize_list[i][3])
				break
			end
		else
			ran_num = ran_num - moon_rabbit_box_prize_list[i][1]
		end
	end
end
--*******************************诀要包增加********************************
function jue_bag_add()
	local jue_id = {{607,"T骾 b� k輕 thi誹 l﹎"},
					{608,"T骾 b� k輕 Л阯g m玭"},
					{609,"T骾 b� k輕 Nga My"},
					{610,"T骾 b� k輕 C竔 Bang"},
					{611,"T骾 b� k輕 V� ng"},
					{612,"T骾 b� k輕 Dng M玭"},
					{613,"T骾 b� k輕 Ng� чc"}}
	local bag_diff = random(1,getn(jue_id))
	local add_flag = AddItem(2,0,jue_id[bag_diff][1],1)
	--if add_flag == 1 then
		--Msg2Player("B筺 nh薾 頲"..jue_id[bag_diff][2].. "nh�")
		--Msg2SubWorld(GetName().."B筺 nh薾 頲"..jue_id[bag_diff][2].. "nh�")
		--WriteLog("[abluemoon]"..GetName().."B筺 nh薾 頲"..jue_id[bag_diff][2].. "nh�")		
	--else
		--WriteLog("[abluemoon]B筺 nh薾 頲["..GetName().."]May m緉 nh薾 頲"..jue_id[bag_diff][2].. "nh�"..add_flag)
	--end	

end
--*****************************五一头增加*********************************
function labor_head_add()
	local HatTab = {
		{0,103,17},	
		{0,103,18},
		{0,103,35},
		{0,103,36},
		{0,103,53},
		{0,103,54},
		{0,103,71},
		{0,103,72}
		}
	local nRandomNum = random(1,getn(HatTab))
	local add_flag = AddItem(HatTab[nRandomNum][1],HatTab[nRandomNum][2],HatTab[nRandomNum][3],1,1,2,random(131,132),2,102,-1,-1)
	--if add_flag  == 1 then
		--Msg2Player("B筺 nh薾 頲")
		--Msg2SubWorld(GetName().."B筺 nh薾 頲")
		--WriteLog("[abluemoon]"..GetName().."B筺 nh薾 頲 0,103,"..HatTab[nRandomNum][3].."nh�")
	--else
		--WriteLog("[abluemoon]B筺 nh薾 頲["..GetName().."]may m緉 nh薾 頲"..add_flag)
	--end
end
--****************************五一裤子增加*******************************
function labor_trouers_add()
	local TrousersTab = {
		{0,101,17},
		{0,101,18},
		{0,101,35},
		{0,101,36},
		{0,101,53},
		{0,101,54},
		{0,101,71},
		{0,101,72},
		}
	local nRandomNum = random(1,getn(TrousersTab))
	local add_flag = AddItem(TrousersTab[nRandomNum][1],TrousersTab[nRandomNum][2],TrousersTab[nRandomNum][3],1,1,3,random(131,132),2,102,-1,-1)
	--if add_flag  == 1 then
		--Msg2Player("恭喜你获得了一件五一裤！")
		--Msg2SubWorld(GetName().."使用月亮兔铁宝箱获得了一条五一裤！")	
		--WriteLog("[abluemoon]"..GetName().."使用月亮兔铁宝箱获得了一件编号0,101,"..TrousersTab[nRandomNum][3].."五一裤！")
	--else
		--WriteLog("[abluemoon]月亮兔铁宝箱使用：玩家["..GetName().."]使用月亮兔铁宝箱获得五一裤失败！失败标志："..add_flag)
	--end
end
--****************************五一武器增加*******************************
function labor_weapon_add()
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
		}
	local nRandomNum = random(1,getn(WeaponTab))
	
	if nRandomNum == 3 or nRandomNum == 4 or nRandomNum == 5 or nRandomNum == 7 or nRandomNum == 9 or nRandomNum == 10 or nRandomNum == 12 then
		nAttribute = 131	--棍,暗器,单刀,笔,枪,弓,双刀
	elseif nRandomNum == 2 or nRandomNum == 6 or nRandomNum == 8 or nRandomNum == 11 then
		nAttribute = 132	--剑,琴,杖,爪
	else	--手
		nAttribute = random(131,132)
	end

	local add_flag = AddItem(WeaponTab[nRandomNum][1],WeaponTab[nRandomNum][2],WeaponTab[nRandomNum][3],1,1,3,nAttribute,3,102,2,251)

	--if add_flag  == 1 then
		--Msg2Player("恭喜你获得了一件武器！")
		--Msg2SubWorld(GetName().."使用月亮兔铁宝箱获得了一把五一武器！")	
		--WriteLog("[abluemoon]"..GetName().."使用月亮兔铁宝箱获得了一件编号"..WeaponTab[nRandomNum][1]..","..WeaponTab[nRandomNum][2]..","..WeaponTab[nRandomNum][3].."五一武器！")
	--else
		--WriteLog("[abluemoon]月亮兔铁宝箱使用：玩家["..GetName().."]使用月亮兔铁宝箱获得五一武器失败！失败标志："..add_flag)
	--end
end
--***************************师门秘籍增加*********************************
function shimen_book()
	local book_name = {"金刚伏魔经","潜龙秘籍","无尘秘籍","天罗秘籍","如意秘籍","碧海谱","混沌秘籍",
					"揆天秘籍","幻影秘籍","君子秘籍","镇军秘籍","穿云秘籍","幽冥鬼录","灵蛊秘籍"}
	local book_seq = random(1,getn(book_name))
	local book_id = ((book_seq - 1) * 2) + 1
	local add_flag = AddItem(0,107,book_id,1)
	--if add_flag == 1 then
		--Msg2Player("恭喜您获得“"..book_name[book_seq].."”！")
		--Msg2SubWorld(GetName().."使用月亮兔铁宝箱获得了一本“"..book_name[book_seq].."”！")	
		--WriteLog("[abluemoon]".."使用月亮兔铁宝箱获得了一本“"..book_name[book_seq].."”！")
	--else		--test
		--WriteLog("[abluemoon]月亮兔铁宝箱使用：玩家："..GetName().."增加"..book_name[book_seq].."失败，失败标志："..add_flag)
	--end
end


