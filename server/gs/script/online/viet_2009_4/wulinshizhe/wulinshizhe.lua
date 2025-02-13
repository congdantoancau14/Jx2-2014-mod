--=============================================
--create by baiyun 2009.4.15
--describe:越南版4月活动 剑侠情缘web,武林使者NPC
--=============================================

Include("\\script\\lib\\globalfunctions.lua");

--任务变量
WL_TASK_GET_ITEM_DATE = 2146;					--获得连心丹的日期
WL_TASK_ALREADY_GET_EXP = 2147;				--使用连心丹已经获得的经验数
JXWEB_EXT = 1;

WL_ROLE_LEVEL_LIMIT = 50;							--活动等级限制
WL_GET_MAX_EXP = 60000000;						--使用连心丹最多获得60000000经验
WL_GET_EACH_EXP = 3000000;						--使用连心丹每次获得的经验

JXWEB_EXPIRED_DATE = 49052924	

--------------------------------------
--main()
--主函数
--------------------------------------
function main()
	Say(
			"в ch祇 m鮪g s� ki謓 <color=gold>Open Beta game V� L﹎ Web<color>, trong kho秐g th阨 gian t�  <color=gold>ng祔 01-05-2009 n 24 gi� ng祔 23-05-2009<color>, t蕋 c� v� l﹎ nh﹏ s� khi tham gia game V� L﹎ Web v� t 頲 c竎 th祅h t輈h trong game, khi  c� th� n g苝 ta  nh薾 ph莕 thng, th玭g tin chi ti誸 t筰 trang ch� game V� L﹎ Web.",
			2,
			"T筰 h� n nh薾 ph莕 thng H� Tr� T﹏ Th�!/WLGetReward",
			"T筰 h� ch� gh� ngang!/WLDoNothing"
		)
end

--------------------------------------
--WLGetReward()
--领取奖励
--------------------------------------
function WLGetReward()
	--判断活动日期
	if tonumber(date("%Y%m%d%H")) <= 2009043024 or tonumber(date("%Y%m%d%H")) > 2049052324 then
		Talk(1, "", "Ho箃 ng n祔 v蒼 ch璦 m�.");
		return 0;
	end
	
	local nExtVal = GetExtPoint(JXWEB_EXT)	
	--判断扩展点，判断玩家是否有资格领取
	if nExtVal ~= 1 then
		Say("C竎 h� v蒼 ch璦  甶襲 ki謓 l躰h thng", 1, "Th藅 ng筰 qu�! T筰 h� s� quay l筰 sau./WLDoNothing");
		return 0;
	end

	
	--判断今天是否已经获得连心丹
	if GetTask(WL_TASK_GET_ITEM_DATE) >= tonumber(date("%y%m%d")) then 
		Talk(1, "", "H玬 nay ngi  nh薾 Li猲 T﹎ n r錳.");
		return 0;
	end
	
	-----判断背包和负重------------------------
	if gf_Judge_Room_Weight(1, 1, "Xin l鏸, ") == 0 then
		return 0
	end
	
	--给奖励物品
	PayExtPoint(JXWEB_EXT,1)
	SetTask(WL_TASK_GET_ITEM_DATE, tonumber(date("%y%m%d")));
	
end

function WLDoNothing()
end