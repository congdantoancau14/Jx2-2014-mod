--File name:head_qingming.lua
--Describe:清明节活动脚本头文件
--Create Date:2008-3-18
--Author:ChenMoxian

--全局常量
FALSE = 0;	--相信定义这样的常量会使代码容易理解一点吧
TRUE = 1;
QINGMING_SWITCH = TRUE;	--活动开关。０为关，１为开
--=========以下设置可以让收费免费区用同一个脚本，只要更改开关就可以了========
IS_SHOUFEI = FALSE;--true收费区false免费区
--===========================================================================
--全局变量
--成都300汴京200泉州100地图id
--任务变量号
--TSK_QINGMING_2008_ISINITED			= 1851 --记录去年任务变量是否已经全部初始化，是新拿的
--TSK_QINGMING_2008_BAI_TOTAL			= 1851--记录玩家累计叩头多少天
--TSK_QINGMING_2008_BAI_LASTTIME	= 1852--记录玩家上次叩头的日期
--TSK_QINGMING_2008_ITEMISUSED		= 1853--记录祭拜品当日是否用过
--TSK_QINGMING_2008_PROBABILITY		= 1854--记录祭拜品使用后提高的概率

EnterPointTab = {	--记录三个地图的进入坐标。这些坐标策划都还没定,抄去年的
			[1] = {820,1636,3181},	--泉州
			[2] = {819,1636,3181},	--汴京
			[3] = {818,1636,3181},	--成都
			};
LeavePointTab = {	--记录从陵墓出来时的坐标。这些坐标策划都还没定,抄去年的
			[1] = {100,1453,2812},	--泉州　黄侠冢
			[2] = {200,1170,2834},	--汴京　韩侠冢
			[3] = {300,1640,3531},	--成都　轩辕侠冢
			};

--判断节日是否开放
function is_qingming_opened()	
	local nDate = tonumber(date("%Y%m%d"));
	if nDate < 20080403 then
		return -1;--如果还未到时间
	elseif nDate > 20480412 then
		return 0;--已过期
	elseif QINGMING_SWITCH == TRUE then
		return 1;--在开放时间且开关为真
	else
		return 2;--开关关闭
	end;
end;

--得到玩家的性别字符串。从\script\task\world\task_head.lua里面copy过来的。
--Copyright◎2005peres
function get_player_sex()	
	local mySex -- 用以显示人物性别的字符
	if (GetSex() == 1) then
		mySex = "Thi誹 hi謕";
	elseif (GetSex() == 2) then
		mySex = "C� nng";
	end;
	return mySex;
end;

function nothing()--空函数,结束对话
	
end;

function get_type()--返回侠冢类型1黄侠2韩侠3轩辕侠
	local nLocalMapID = 0;
	local nLocalPosX = 0;
	local nLocalPosY = 0;
	local nType = 0;

	nLocalMapID,nLocalPosX,nLocalPosY = GetWorldPos();
	--根据玩家所在地图id来判断与玩家对话的是哪个侠冢的引路人
	if nLocalMapID == EnterPointTab[1][1] or nLocalMapID == LeavePointTab[1][1] then
		nType = 1;
	elseif nLocalMapID == EnterPointTab[2][1] or nLocalMapID == LeavePointTab[2][1] then
		nType = 2;
	elseif nLocalMapID == EnterPointTab[3][1] or nLocalMapID == LeavePointTab[3][1] then
		nType = 3;
	else
		WriteLog("Thanh Minh 2008: B秐  ngi ch琲 s� t筰 v� b秐  ngi d蒼 阯g kh玭g ph� h頿.");
		return FALSE;--出错
	end;
	
	return nType;
end;
function get_transport_name()--返回侠冢引路人名字
	local nLocalMapID = 0;
	local nLocalPosX = 0;
	local nLocalPosY = 0;
	local szTransportName ="";

	nLocalMapID,nLocalPosX,nLocalPosY = GetWorldPos();
	--根据玩家所在地图id来判断与玩家对话的是哪个侠冢的引路人
	if nLocalMapID == EnterPointTab[1][1] or nLocalMapID == LeavePointTab[1][1] then
		szTransportName = "Ho祅g i hi謕 (d蒼 阯g)";
	elseif nLocalMapID == EnterPointTab[2][1] or nLocalMapID == LeavePointTab[2][1] then
		szTransportName = "H祅 i hi謕 (d蒼 阯g)";
	elseif nLocalMapID == EnterPointTab[3][1] or nLocalMapID == LeavePointTab[3][1] then
		szTransportName = "Hi猲 Vi猲 i hi謕 (d蒼 阯g)";
	else
		WriteLog("Thanh Minh 2008: B秐  ngi ch琲 s� t筰 v� b秐  ngi d蒼 阯g kh玭g ph� h頿.");
		return FALSE;--出错
	end;
	
	return szTransportName;
end;

function get_tomb_name()--返回侠冢名称
	local nLocalMapID = 0;
	local nLocalPosX = 0;
	local nLocalPosY = 0;

	local szTombName = "";

	nLocalMapID,nLocalPosX,nLocalPosY = GetWorldPos();
	--根据玩家所在地图id来判断与玩家对话的是哪个侠冢的引路人
	if nLocalMapID == EnterPointTab[1][1] or nLocalMapID == LeavePointTab[1][1] then
		szTombName = "Ho祅g i hi謕";
	elseif nLocalMapID == EnterPointTab[2][1] or nLocalMapID == LeavePointTab[2][1] then
		szTombName = "H祅 i hi謕";
	elseif nLocalMapID == EnterPointTab[3][1] or nLocalMapID == LeavePointTab[3][1] then
		szTombName = "Hi猲 Vi猲 i hi謕";
	else
		WriteLog("Thanh Minh 2008: B秐  ngi ch琲 s� t筰 v� b秐  ngi d蒼 阯g kh玭g ph� h頿.");
		return FALSE;--出错
	end;
	
	return szTombName;
end;