--此乃互动动作绑定之脚本。
--入口函数是main，输入参数１为互动动作的索引，参数２为互动动作是否成功
Include("\\script\\online\\afterworldcup06\\hand_in_hand_head.lua");
Include("\\script\\online\\zgc_public_fun.lua")					--村长的公共函数
Include("\\script\\task\\marriage\\map_att_head.lua")					--结婚二期头文件
Include("\\script\\结婚\\marriage_head.lua");
Include("\\script\\master_prentice\\some_op.lua")
Include("\\script\\online\\3festival\\3festival_head.lua")
Include("\\script\\online\\newyear08\\newyear08_head.lua") --07圣诞拜师活动
Include("\\script\\lib\\lingshi_head.lua"); --灵石头文件
Include("\\script\\online\\spring2014\\sp_head.lua")

INTERACTIVE_SHARE_RIDE = 0		-- 双人共骑
INTERACTIVE_SHARE_HAND = 1		-- 双人携手
INTERACTIVE_SHARE_BACK = 2		-- GG背MM
INTERACTIVE_SHARE_CHEST = 3		-- GG抱MM
INTERACTIVE_KISS = 4			-- 亲吻
INTERACTIVE_COMFORT = 5			-- 安慰
INTERACTIVE_KOTOW = 6			-- 拜
INTERACTIVE_HELP = 7			-- 帮忙
INTERACTIVE_SORROW = 8			-- 悲伤
INTERACTIVE_READY_GO = 9		-- 出发
INTERACTIVE_ACT_UP = 10			-- 调皮
INTERACTIVE_CRAZY = 11			-- 发狂
INTERACTIVE_KNEE_DOWN = 12		-- 跪下
INTERACTIVE_SHY = 13			-- 害羞
INTERACTIVE_BOW	= 14			-- 鞠躬
INTERACTIVE_CLAPS = 15			-- 拍手
INTERACTIVE_MARRIAGE = 16		-- 求婚
INTERACTIVE_ANGRY = 17			-- 生气
INTERACTIVE_VICTORY = 18		-- 胜利
INTERACTIVE_COOL = 19			-- 耍酷
INTERACTIVE_LAY_DOWN = 20		-- 躺下
INTERACTIVE_DEFY = 21			-- 挑衅
INTERACTIVE_PUZZLED = 22		-- 疑惑
INTERACTIVE_FAINT = 23			-- 晕倒
INTERACTIVE_BYEBYE = 24 		-- 招手
INTERACTIVE_CONFIDENCE = 25		-- 自信
INTERACTIVE_GENTLE = 26			-- 作揖
INTERACTIVE_SIT = 27			-- 坐下

--2007年春节活动TaskID记录
TaskID_spring2007_kotow_seq = 986
TaskID_spring2007_HASH_1st = 987
TaskID_spring2007_HASH_2nd = 988
TaskID_spring2007_HASH_3rd = 989
--2007清明节活动TaskID记录
tomb_sweep_2007_date_seq = 852
tomb_sweep_2007_times_count = 853
tomb_sweep_2007_goods_use_diff = 854
--2008清明节
tomb_sweep_2008_date_seq = 1858
tomb_sweep_2008_times_count = 1851
tomb_sweep_2008_goods_use_diff = 1859

tomb_sweep_2007_start_goodsID = 675
--结婚二期相关任务ID
	task_map_id_TaskID = 1217
	task_att_seq_TaskID = 1218
	Tb_frag = {}
	Tb_frag[568] = "Gi竝 M閏 dng"
	Tb_frag[569] = "蕋 M閏 ﹎"
	Tb_frag[570] = "B輓h h醓 dng"
	Tb_frag[571] = "nh H醓 ﹎"
	--结婚二期怪物属性
	Monster_attr = {}
	Monster_attr[13]={2750,19}
	Monster_attr[14]={3850,23}
	Monster_attr[15]={4950,28}
	Monster_attr[16]={6050,34}
	Monster_attr[17]={7150,41}
	Monster_attr[18]={8250,48}
	Monster_attr[19]={9350,54}
	Monster_attr[20]={10450,58}
	Monster_attr[21]={11550,61}
	Monster_attr[22]={12650,65}
	Monster_attr[23]={13750,67}
	Monster_attr[24]={14850,71}
	Monster_attr[25]={15950,73}
	Monster_attr[26]={17050,76}
	Monster_attr[27]={18150,79}
	Monster_attr[28]={19250,83}
	Monster_attr[29]={21550,85}
	Monster_attr[30]={23050,98}
	Monster_attr[31]={24550,106}
	Monster_attr[32]={26050,112}
	Monster_attr[33]={27550,114}
	Monster_attr[34]={29050,118}
	Monster_attr[35]={30550,123}
	Monster_attr[36]={32050,127}
	Monster_attr[37]={33550,133}
	Monster_attr[38]={35050,140}
	Monster_attr[39]={36550,148}
	Monster_attr[40]={38050,155}
	Monster_attr[41]={40000,167}
	Monster_attr[42]={41950,175}
	Monster_attr[43]={43900,181}
	Monster_attr[44]={45850,187}
	Monster_attr[45]={47800,192}
	Monster_attr[46]={49750,200}
	Monster_attr[47]={51700,205}
	Monster_attr[48]={53650,213}
	Monster_attr[49]={55600,230}
	Monster_attr[50]={58400,245}
	Monster_attr[51]={61200,248}
	Monster_attr[52]={64000,260}
	Monster_attr[53]={66800,266}
	Monster_attr[54]={69600,272}
	Monster_attr[55]={72400,280}
	Monster_attr[56]={75200,288}
	Monster_attr[57]={78000,296}
	Monster_attr[58]={80800,304}
	Monster_attr[59]={83600,312}
	Monster_attr[60]={86400,320}
	Monster_attr[61]={89400,331}
	Monster_attr[62]={92400,339}
	Monster_attr[63]={95400,350}
	Monster_attr[64]={98400,359}
	Monster_attr[65]={101400,362}
	Monster_attr[66]={104400,379}
	Monster_attr[67]={107400,383}
	Monster_attr[68]={110400,391}
	Monster_attr[69]={113400,404}
	Monster_attr[70]={117750,412}
	Monster_attr[71]={117750,426}
	Monster_attr[72]={117750,449}
	Monster_attr[73]={117750,467}
	Monster_attr[74]={117750,492}
	Monster_attr[75]={117750,511}
	Monster_attr[76]={117750,526}
	Monster_attr[77]={117750,541}
	Monster_attr[78]={117750,557}
	Monster_attr[79]={117750,573}
	Monster_attr[80]={117750,588}
	Monster_attr[81]={117750,604}
	Monster_attr[82]={117750,619}
	Monster_attr[83]={117750,641}
	Monster_attr[84]={117750,656}
	Monster_attr[85]={117750,672}
	Monster_attr[86]={117750,687}
	Monster_attr[87]={117750,703}
	Monster_attr[88]={117750,724}
	Monster_attr[89]={117750,740}
	Monster_attr[90]={117750,755}
	Monster_attr[91]={117750,777}
	Monster_attr[92]={117750,792}
	Monster_attr[93]={117750,819}
	Monster_attr[94]={117750,824}
	Monster_attr[95]={117750,828}
	Monster_attr[96]={117750,832}
	Monster_attr[97]={117750,836}
	Monster_attr[98]={117750,840}
	Monster_attr[99]={117750,845}
	Tb_ma_monster = {
		{2,"Di猽 L藀 Th祅h","Gia 甶nh c馻 Tr莕 c玭g t�"},
		{4,"Di猽 L藀 Th祅h","Gia 甶nh c馻 Tr莕 c玭g t�"},
		{5,"A Vi",	"Чo t芻 h竜 s綾 Tr莕 c玭g t�"},	
	}
function main(nInteractiveIndex, bSuccess)
	--结婚二期相关：任何相关动作
	if bSuccess ~= 0 then
		ON_All()
	end
	if (nInteractiveIndex == INTERACTIVE_KOTOW) and (bSuccess ~= 0) then	--拜动作
		ON_KOTOW()
	end
	if (nInteractiveIndex == INTERACTIVE_GENTLE) and (bSuccess ~= 0) then	--拜动作
		ON_GENTLE()
	end
	if (nInteractiveIndex == INTERACTIVE_SHARE_HAND) and (bSuccess ~= 0) then
		ON_SHARE_RIDE_HAND()
	end
	if bSuccess ~= 0 then --跟随有礼
		gen_sui_you_li(nInteractiveIndex);
	end
	if bSuccess ~= 0 and nInteractiveIndex == INTERACTIVE_GENTLE then
		sp_InteractiveToNpc();
	end
end
--==================================所有动作=============================
function ON_All()
        local szMateName = GetMateName();
	--判断是否结婚
	if szMateName == nil or szMateName == "" then
		return
	end
        local nPlayerIndexSave = PlayerIndex;--保存原PlayerIndex
        local nMateIndex = 0;                --配偶索引
        local nTeamSize = GetTeamSize();
        for i = 1 , nTeamSize do
	    PlayerIndex = GetTeamMember(i)
	    if szMateName == GetName() then
	        nMateIndex = PlayerIndex;
		PlayerIndex = nPlayerIndexSave;
		break
	    end
        end
        if nMateIndex == 0 then
            Talk(1, "", "<color=green>Ch� �<color>: Xin x竎 nh薾 b筺 v� � trung nh﹏  t� i!");
            return
        end
	--检测是否接任务
	local map_id_save = GetTask(task_map_id_TaskID)
	local att_seq = GetTask(task_att_seq_TaskID)
	if map_id_save == 0 or map_id_save == nil then
		return
	end
	if att_seq == 0 or att_seq == nil then
		return
	end
	--检测当前地图是否为任务地图
	local map_ID,att_X,att_Y = GetWorldPos()
	if map_ID ~= map_id_save then
		return
	end
	--空间和负重判断
	if Zgc_pub_goods_add_chk(1,1) ~= 1 then
		return
	end
	--地图相同的时候
	local frag_ID = {0,568,569,570,571,583,592}
	if Tb_task_reel_att[map_id_save][att_seq][1] == nil or Tb_task_reel_att[map_id_save][att_seq][2] == nil then
		return
	end
	if Tb_task_reel_att[map_id_save][att_seq][1] == floor(att_X/8) and Tb_task_reel_att[map_id_save][att_seq][2] == floor(att_Y/16) then
		local moster_frag_ran = random(1,10)
		if moster_frag_ran == 9 then		--刷怪
			--随机怪物等级
			local monster_level = random(1,5)
			for i = 1 ,getn(Tb_ma_monster) do
				if monster_level <= Tb_ma_monster[i][1] then
					monster_level = i
					break
				end
			end
			--创建怪物
			local Player_level = GetLevel()
				--判断改等级的怪物是否存在
			if Monster_attr[Player_level] == nil then
				return
			end
				--开始创建
			local monster_index = CreateNpc(Tb_ma_monster[monster_level][2],Tb_ma_monster[monster_level][3],GetWorldPos())
				--判断怪物索引是否正常
			if monster_index == 0 or monster_index == nil then
				return
			end
				--设置怪物属性和死亡脚本路径
				SetNpcScript(monster_index,"\\script\\task\\marriage\\ma_monster_death.lua")
				SetUnitCurStates(monster_index,0,Player_level)
				SetUnitCurStates(monster_index,1,Monster_attr[Player_level][1])
				SetTask(map_id_save,0)
				SetTask(task_att_seq_TaskID,0)		
                                SetTask(2286, monster_index);--记录一下创建出来的NPC索引
                                PlayerIndex = nMateIndex;
                                SetTask(2286, monster_index);--记录一下创建出来的NPC索引
                                PlayerIndex = nPlayerIndexSave;
                else		--直接给碎片

			local ran_num = random(1,100)
			for i = 2, getn(Tb_task_reel_att[map_ID].map_att) do
				if ran_num <= Tb_task_reel_att[map_ID].map_att[i] then
					if AddItem(2,1,frag_ID[i],1) == 1 then
						Talk(1,"","<color=green>Ch� d蒼<color>: Ch骳 m鮪g b筺 nh薾 頲 1 <color=yellow>"..Tb_frag[frag_ID[i]].."<color>, nh蕄 chu閠 ph秈  s� d鬾g v藅 ph萴!")
						SetTask(map_id_save,0)
						SetTask(task_att_seq_TaskID,0)
						break
					end
				end
			end
		end
	else
		Talk(1,"","B筺 kh玭g n 頲 a 甶觤 ch� nh v� kh玭g c� v藅 ph萴 c莕 thi誸")
		return
	end
end
--====================================拜=================================
function ON_KOTOW()
	if master_prentice() == 1 then			-- 如果师徒有响应，先干完师徒的事情再说
		return
	end
	kotow_tomb_sweep_2008()					--2007清明节
	marriage_check_kotow()				--结婚
	newyear08_bai()               --2007圣诞活动
end
--*******************************2007年清明节****************************
function kotow_tomb_sweep_2007()
	local Plyaer_level = GetLevel()
	if Plyaer_level < 11 then								--等级判断
		return
	end
	if tomb_sweep_2007_date_chk() ~= 1 then				--在活动期间有效
		return
	end
	local map_ID,att_X,att_Y = GetWorldPos()
	if map_ID < 818 or map_ID > 820 then				--在拜祭地图有效
		return
	end
	if att_X < 1660 then								--坐标限制
		Talk(1,""," c髇g t� i hi謕, ti誴 t鬰 n鱝 xem sao!")
		return
	end
	local last_kotow_seq = GetTask(tomb_sweep_2007_date_seq)		--获得最近的拜祭日期
	if last_kotow_seq >= zgc_pub_day_turn(1) then
		Talk(1,"","L莕 u c髇g t� l� th祅h t﹎ nh蕋.")
		return
	end
	--可以进行拜祭
	local prize_diff = GetTask(tomb_sweep_2007_goods_use_diff)
	local exp_times = 1
	local Player_level = GetLevel()
	local exp_num = floor(Player_level * Player_level * Player_level *Player_level / 50)
	if prize_diff == 0 or prize_diff == nil then
		prize_diff = 0
	end
			--增加任务卷轴
	if Plyaer_level < 40 then
		Say("Ngi mu鑞 nh薾 lo筰 nhi謒 v� n祇: Кn gi秐, h琲 kh�?",
		3,
		"Кn gi秐/#task_teel_add(2)",
		"Kh�/#task_teel_add(5)",
		"Sao c騨g 頲/#task_teel_add(9)"
		)
	elseif Plyaer_level >= 40 and Plyaer_level <= 60 then
		Say("Ngi mu鑞 nh薾 lo筰 nhi謒 v� n祇: Кn gi秐, h琲 kh�?",
		2,
		"Кn gi秐/#task_teel_add(5)",
		"Sao c騨g 頲/#task_teel_add(9)"
		)
	else
		task_teel_add(9)
	end
	if random(1,100) <= (10 + prize_diff) then						--奖励B
		exp_times = 10
	end
	local kotow_times_save = GetTask(tomb_sweep_2007_times_count)
	if kotow_times_save == 7 then				--奖励D
		exp_times = exp_times + 15
		--ModifyReputation(100,0)
	end
	--增加经验
	exp_num = exp_num * exp_times
	ModifyExp(exp_num)
	if exp_times == 1 then
		Msg2Player("Nh薾 頲 kh輈h l� c馻 i hi謕 ta c秏 th蕐 v� c玭g ti課 b� vt b薱, kinh nghi謒 giang h�  t╪g "..exp_num.." 甶觤!")
	else
		Msg2Player("M閠 c琻 gi� l筺h th鎖 qua, b筺 c秏 th蕐 g﹏ c鑤 to祅 th﹏ r蕋 d� ch辵, kinh nghi謒 giang h�  t╪g l猲"..exp_num.." 甶觤!")
	end
	--奖励给于结束后的处理
	if kotow_times_save == nil or kotow_times_save == 0 then
		SetTask(tomb_sweep_2007_times_count,1)
	else
		SetTask(tomb_sweep_2007_times_count,(kotow_times_save + 1))
	end
	SetTask(tomb_sweep_2007_date_seq,zgc_pub_day_turn(1))
	--祭品一次有效
	SetTask(tomb_sweep_2007_goods_use_diff,0)
end
--*******************************2008清明节******************************
function kotow_tomb_sweep_2008()
	local Player_level = GetLevel()
	--等级和负重检测
	if Player_level < 11 then								--等级判断
		return
	elseif Player_level ~= 99 then
		if Zgc_pub_goods_add_chk(1,50) ~= 1 then
			return
		end
	else
		if Zgc_pub_goods_add_chk(3,50) ~= 1 then
			return
		end
	end
	if is_qingming_opened() ~= 1 then				--在活动期间有效
		return
	end
	local map_ID,att_X,att_Y = GetWorldPos()
	if map_ID < 818 or map_ID > 820 then				--在拜祭地图有效
		return
	end
	if att_X < 1660 then								--坐标限制
		Talk(1,""," c髇g t� i hi謕, ti誴 t鬰 n鱝 xem sao!")
		return
	end
	local last_kotow_seq = GetTask(tomb_sweep_2008_date_seq)		--获得最近的拜祭日期
	if last_kotow_seq >= zgc_pub_day_turn(1) then
		Talk(1,"","L莕 u c髇g t� l� th祅h t﹎ nh蕋.")
		return
	end
	--可以进行拜祭
	local prize_diff = GetTask(tomb_sweep_2008_goods_use_diff)
	local exp_times = 1
	local exp_num = floor(1500000*(Player_level * Player_level  / (80*80)))--免费区
	--Msg2Player("获取玩家等级:"..Player_level)
	if prize_diff == 0 or prize_diff == nil then
		prize_diff = 0
	end

	if GetLevel() ~= 99 then
		--收费区为健康经验转经验200w*等级衰减,免费区为经验150w*等级衰减
	  --99级为天时注解2本，1-7级灵石*1放入聚灵鼎
		if random(1,100) <= (10 + prize_diff) then						--奖励B
			exp_times = 10
		end
		local kotow_times_save = GetTask(tomb_sweep_2008_times_count)
		if kotow_times_save == 7 then				--奖励D
			exp_times = 10 --不会在领取奖励D的时候领取奖励A，所以倍数不累加
			Msg2Player("B筺  b竔 t� li猲 t鬰 8 ng祔 n猲 nh薾 頲 nhi襲 甶觤 kinh nghi謒 h琻.")
			--ModifyReputation(100,0)--增加声望
		end
		--增加经验
		--免费区增加经验
		exp_num = exp_num * exp_times
		
		ModifyExp(exp_num)
		
		if exp_times == 1 then
			Msg2Player("Nh薾 頲 kh輈h l� c馻 i hi謕 ta c秏 th蕐 v� c玭g ti課 b� vt b薱, kinh nghi謒 giang h�  t╪g "..exp_num.." 甶觤!")
		else
			Msg2Player("M閠 c琻 gi� l筺h th鎖 qua, b筺 c秏 th蕐 g﹏ c鑤 to祅 th﹏ r蕋 d� ch辵, kinh nghi謒 giang h�  t╪g l猲"..exp_num.." 甶觤!")
		end
	else--玩家段位99
		local n99times = 1 --99级玩家奖励倍数
		if random(1,100) <= (10 + prize_diff) then						--奖励B
			n99times = 10
		end
		local kotow_times_save = GetTask(tomb_sweep_2008_times_count)
		if kotow_times_save == 7 then				--奖励D
			n99times = 10 --不会在领取奖励D的时候领取奖励A，所以倍数不累加
			Msg2Player("B筺  b竔 t� li猲 t鬰 8 ng祔 n猲 nh薾 頲 nhi襲 ph莕 thng h琻.")
			--ModifyReputation(100,0)--增加声望
		end
		local nTemp = 1
		for nTemp = 1,n99times,1 do
			if Zgc_pub_goods_add_chk(2,2) == 1 then
				AddItem(2,1,3210,2)--获得天时注解2本
			else
				Msg2Player("S鴆 l鵦 c馻 b筺 kh玭g , ph莕 thng b竔 t� l莕 n祔 b� h駓, h穣 d鋘 d裵 h祅h trang r錳 quay l筰 b竔 t�!")
				return
			end --if zgc_pub_gooods_add_chk
			--======获得随机1-7灵石1颗,获得7级灵石的几率调整到1/20
			local lvLingShi = 1
			local nRander = random(1,210)
			if nRander <= 120 then
				--1~4级灵石
				lvLingShi = random(1,4)
			elseif nRander <= 203 then
				--5~6级灵石
				lvLingShi = random(5,6)
			else
				lvLingShi = 7
			end
			SetTask(SYS_TSK_LINGSHI_ONE + lvLingShi - 1,GetTask(SYS_TSK_LINGSHI_ONE + lvLingShi - 1)+1)
			Msg2Player("B筺 nh薾 頲 "..lvLingShi.."(c蕄) Linh Th筩h!")
		end--for
		nTemp = n99times*2
		Msg2Player("B筺 nh薾 頲 Thi猲 Th阨 Ch� Gi秈 "..nTemp.." quy觧!")
	end--if_lv_99
	--增加任务卷轴
	if Player_level < 80 then
		Say("Ngi mu鑞 nh薾 lo筰 nhi謒 v� n祇: Кn gi秐, h琲 kh�?",
		3,
		"Кn gi秐/#task_teel_add(random(1,3))",
		"Kh�/#task_teel_add(random(1,6))",
		"Sao c騨g 頲/#task_teel_add(random(1,10))"
		)
	elseif Player_level >= 80 and Player_level <= 90 then
		Say("Ngi mu鑞 nh薾 lo筰 nhi謒 v� n祇: Кn gi秐, h琲 kh�?",
		2,
		"Кn gi秐/#task_teel_add(random(1,6))",
		"Sao c騨g 頲/#task_teel_add(random(1,10))"
		)
	else
		task_teel_add(random(1,10))
	end
	--奖励给于结束后的处理
	local kotow_times_save = GetTask(tomb_sweep_2008_times_count)
	if kotow_times_save == nil or kotow_times_save == 0 then
		SetTask(tomb_sweep_2008_times_count,1)
	else
		SetTask(tomb_sweep_2008_times_count,(kotow_times_save + 1))
	end
	SetTask(tomb_sweep_2008_date_seq,zgc_pub_day_turn(1))
	--祭品一次有效
	SetTask(tomb_sweep_2008_goods_use_diff,0)
end
--*******************************增加任务卷轴****************************
function task_teel_add(add_diff)
	--Msg2Player(add_diff);--调试用，已删！
	local add_flag = AddItem(2,0,add_diff+tomb_sweep_2007_start_goodsID-1,1)--2008Moxian修改,由调用者写随机数
	if add_flag == 1 then
		Msg2Player("Trong l骳 c髇g b竔 b筺 v� t譶h ph竧 hi謓 m閠 t� gi蕐!")
	end
	--祭品一次有效
	SetTask(tomb_sweep_2007_goods_use_diff,0)
	return
end
--===================================作揖================================
function ON_GENTLE()

end
function ON_SHARE_RIDE_HAND()	--牵手

end

function gen_sui_you_li(nInteractiveIndex)
	if Get_3festival_State() ~= 1 then
		return
	end
	local nMapId,nPlayerX,nPlayerY = GetWorldPos();
	local nNpcIdx = GetMapTaskTemp(nMapId,1);
	if GetNpcName(nNpcIdx) ~= tNewCehua[1][2] and GetNpcName(nNpcIdx) ~= tNewCehua[2][2] and GetNpcName(nNpcIdx) ~= tNewCehua[3][2] then
		return
	end
	if GetLevel() < 30 then
		Talk(1,"","Ъng c蕄 th蕄 qu�, ti誴 t鬰 phi猽 b箃 giang h� n c蕄 <color=yellow>30<color> h穣 n.");
		return
	end
	if Zgc_pub_goods_add_chk(1,1) ~= 1 then   --空间负重检测
		return
	end	
	local nNpcId,nNpcX,nNpcY = GetNpcWorldPos(nNpcIdx);
	local nDistance = floor(sqrt((nPlayerX-nNpcX)^2+(nPlayerY-nNpcY)^2));
	local nDate = tonumber(date("%Y%m%d"));
	if nDistance > 20 then
		Talk(1,"","Xa qu�, l筰 g莕 n鱝 甶");
	else
		local nActionIdx = GetMapTaskTemp(nMapId,2);
		if nActionIdx ~= nInteractiveIndex then
			Talk(1,"","чng t竎 hi謓 t筰 l� <color=yellow>"..tActionIndex[nActionIdx-4][1].."<color>, l祄 sai r錳.");
			return
		else
			if GetTask(TASK_GENSUI_DATE) ~= nDate then
				SetTask(TASK_GENSUI_TOTAL,0);
			end 
			if GetTask(TASK_GENSUI_TOTAL) == 10 then
				Talk(1,"","H玬 nay b筺 l穘h ph莕 thng nhi襲 r錳,  甶觤 cho b籲g h鱱 kh竎, ng祔 mai h穣 t韎");
				return
			else
				local nRand = random(1,10000);
				for i=2,getn(tGensuiAward) do
					if nRand <= tGensuiAward[i][6] then
						AddItem(tGensuiAward[i][2],tGensuiAward[i][3],tGensuiAward[i][4],tGensuiAward[i][5],1);
						Msg2Player("Ch骳 m鮪g b筺 nh薾 頲 "..tGensuiAward[i][1]..tGensuiAward[i][5].."c竔");
						break;
					end
				end
				local nExp = floor(GetLevel()^3/80^3*tGensuiAward[1][1]);
				ModifyExp(nExp);
				Msg2Player("Ch骳 m鮪g b筺 nh薾 頲 "..nExp.."Kinh nghi謒");
				SetTask(TASK_GENSUI_TOTAL,GetTask(TASK_GENSUI_TOTAL)+1);
				SetTask(TASK_GENSUI_DATE,nDate);
			end
		end
	end					
end

--=============================07圣诞拜师活动===========================
function newyear08_bai()
	if get_chrims_state() ~= 1 then
		return
	end
 	local nLv = GetLevel();
 	local nTeamNum = GetTeamSize();
 	local nDate = tonumber(date("%Y%m%d"));
 	local nMapId,nPosX,nPosY = GetWorldPos();
 	local nOldIdx = PlayerIndex;
 	if GetTask(TASK_BAI_DATE) >= nDate then
 		Talk(1,"","M鏸 ng祔 m閠 ngi ch� 頲 l穘h gi秈 thng 1 l莕.");
 		return
 	end
 	if nLv < 11 then --免费区无此限制
 		Talk(1,"","<color=green>Th玭g b竜: <color>: B筺 c遪 ph秈 phi猽 b箃 giang h� th猰 輙 l﹗ n鱝!");
 		return
 	end
 	if nTeamNum ~= 2 or nTeamNum == 0 then
		Talk(1,"","N╩ m韎 b竔 s� h鋍 v�. Ho箃 ng b竔 s� ph秈 c� 2 ngi t� i m韎 頲 l穘h thng.");
		return
	end
	if GetTeamMember(1) == PlayerIndex then
		PlayerIndex = GetTeamMember(2);
	elseif GetTeamMember(2) == PlayerIndex then 
		PlayerIndex = GetTeamMember(1);
	else
		WriteLog("Ho箃 ng b竔 s� Gi竛g Sinh 2007: link th祅h vi猲 i ng� c� l鏸.");
		return
	end
	local nMapId2,nPosX2,nPosY2 = GetWorldPos();
	local nLvTwo = GetLevel();
	local sName = GetName();
	if nMapId ~= nMapId2 or abs((nPosX-nPosX2)+(nPosY-nPosY2)) > 20 then --距离判断
		PlayerIndex = nOldIdx;
		Talk(1,"","N╩ m韎 b竔 s� h鋍 v�. Kho秐g c竎h h祄h l� xa qu�, l筰 g莕 l祄 l筰 甶");
		return
	end
	if nLv == 99 and nLvTwo == 99 then --99级玩家只能拜99级 给予经验
		PlayerIndex = nOldIdx;
		local nExp = floor(((nLv^4)/(80^4))*6000000);
		if nExp < 100000 then
			nExp = 100000;
		end
		if nExp > 8000000 then
			nExp = 8000000;
		end
		local nRandom = random(1,100);
		if nRandom <= 2 then    --2%概率翻倍
			nExp = 2*nExp;
		end
		SetTask(TASK_BAI_DATE,nDate);
		ModifyExp(nExp);
		Msg2Player("Sau khi b筺 h祅h l� v韎 "..sName.." xong, c飊g th莥 m o, l祄 t╪g th猰 kinh nghi謒 giang h�"..nExp.."甶觤.");
		if nRandom <= 2 then
			Msg2Global(GetName().."Th祅h t﹎ th祅h �"..sName.."th豱h gi竜 v� h鋍, v� c玭g ti課 b�, nh薾 頲 2 ph莕 thng, t 頲"..nExp.." 甶觤 kinh nghi謒 giang h�")	;
		end
		return 0;
	end			
	if nLv >= nLvTwo then --非99级入口
		PlayerIndex = nOldIdx;
		Talk(1,"","N╩ m韎 b竔 s� h鋍 v�. Ngi c蕄 th蕄 b竔 ngi c蕄 cao h琻 m韎 c� thng.");			
	else
		PlayerIndex = nOldIdx;
		local nExp = floor(((nLv^4)/(80^4))*6000000);
		if nExp < 100000 then
			nExp = 100000;
		end
		if nExp > 8000000 then
			nExp = 8000000;
		end
		local nRandom = random(1,100);
		if nRandom <= 2 then    --2%概率翻倍
			nExp = 2*nExp;
		end
		SetTask(TASK_BAI_DATE,nDate);
		ModifyExp(nExp);
		Msg2Player("Sau khi b筺 h祅h l� v韎 "..sName.." xong, c飊g th莥 m o, l祄 t╪g th猰 kinh nghi謒 giang h�"..nExp.."甶觤.");
		if nRandom <= 2 then
			Msg2Global(GetName().."Th祅h t﹎ th祅h �"..sName.."th豱h gi竜 v� h鋍, v� c玭g ti課 b�, nh薾 頲 2 ph莕 thng, t 頲"..nExp.." 甶觤 kinh nghi謒 giang h�")	;
		end
	end
	PlayerIndex = nOldIdx;
end

function is_qingming_opened()	
	local nDate = tonumber(date("%m%d"));
	if nDate < 0403 then
		return -1;--如果还未到时间
	elseif nDate > 0412 then
		return 0;--已过期
	else
		return 1;
	end;
end;
