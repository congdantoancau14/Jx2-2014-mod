
-- Creator : lizhi
-- 攻城战报名	2007-3-29 10:43

Include("\\script\\missions\\bw\\siege\\siege_arena_head.lua")
Include("\\script\\missions\\bw\\siege\\mission_room.lua")

-- 为了测试方便，改为NPC形式启动和关闭
function main()
	if PlayerIndex > 0 then
		if GetMissionV(2) > 0 then
			Say("сng", 2, "сng/close_mission", "Qua 阯g/no_say")
		else
			Say("B総 u", 2, "B総 u/start_mission", "Qua 阯g/no_say")
		end
	elseif tonumber(date("%w")) == 5 then
		start_mission()
	end
end

function no_say()
end

function close_mission()
	KMissionRecordRoom:CloseMe(CITY_SIGNUP_MAP_ID)
end

function start_mission()
	-- 在成都服务器开始擂台
	if SubWorldID2Idx(CITY_SIGNUP_MAP_ID) == -1 then
		return
	end
	-- 检查时间,获得当前开启的擂台
	local nHour = tonumber(date("%H"))
	if CHEAT_MODE == 1 then
		nHour = 19;
	end
	local nCityID = tHourCity[nHour]
	if nCityID == nil then
		LOG_SIEGE(LOG_SIEGE_ERROR, "Th阨 gian m� kh玭g ph� h頿")
		return
	end
	
--取得本次攻城战类型的方法--------------------------------------------------------------
	get_gongcheng_type();
	local nType = GetGlbValue(CITY_GLB_VALUE_TYPE);
	print("siege\\siege_arena_mission_start >> start_mission >> nType: "..nType);
	if nType == 2 then
		AddGlobalNews("B総 u b竜 danh tranh 畂箃"..tFightCityName[nCityID].."Lo筰 h譶h c玭g th祅h chi課 l�: "..tSignMethod[nType])		
		return 0;
	end
--如果是竞投挑战令方法，则不开启攻城战擂台
-------------------------------------------------------------------------------------------------------
	
	-- 检查擂台地图
	local tArenaID = tArenaMapID[nCityID]
	if tArenaID == nil then
		LOG_SIEGE(LOG_SIEGE_ERROR, "Khu v鵦 b� tr� kh玭g ph� h頿")
		return
	end

	for index, value in tArenaID do
		if SubWorldID2Idx(value) == -1 then
			LOG_SIEGE(LOG_SIEGE_ERROR, "Kh玭g t譵 th蕐 khu v鵦 m鬰 ti猽")
			return
		end
	end
	
	-- 生成房间OK, 开始报名
	KMissionRecordRoom:Open(CITY_SIGNUP_MAP_ID, RECORD_MISSION_ID, nCityID)	
	AddGlobalNews("B総 u b竜 danh tranh 畂箃"..tFightCityName[nCityID].." L玦 i C玭g th祅h chi課, h穣 nhanh ch鉵g n ch� Th祅h Й Ch� L玦 i b竜 danh.")
end

function get_gongcheng_type()
	ApplyRelayShareData("gongchengtype",0,0,"\\script\\missions\\bw\\siege\\siege_arena_mission_start.lua","get_type");
end

function get_type(szKey, nKey1, nKey2, nCount)
	local nType = 0;
	if nCount == 0 then
		nType = 1;
	else
		nType = GetRelayShareDataByKey(szKey, nKey1, nKey2, "type");
		DelRelayShareDataCopy(szKey,nKey1,nKey2);
	end
	SetGlbValue(CITY_GLB_VALUE_TYPE, nType);
end