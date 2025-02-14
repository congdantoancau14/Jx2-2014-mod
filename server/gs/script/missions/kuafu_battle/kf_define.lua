Include("\\script\\ks2vng\\missions\\mission_award_add_rate_cfg.lua")
--配置跨服和源服这里需要修改-----------------
--KF_NPC_POS = {6028, 1620, 3145} --跨服报名人坐标（跨服）
--KF_NPC_POS_SRC = {300, 1855, 3556}  --跨服战场领奖人坐标(源服)
KF_MAP_TASK_TEMP_ID = 8899 --凝月宫地图记录场次信息
--退出战场的点
KF_OUT_POS = {
	{8899, 1310, 2693},
	{8899, 1405, 2800},
	{8899, 1490, 2743},
	{8899, 1366, 2608},
}
---------------------------------------------
KF_CURR_OPEN_COUNT = 1; --SetMapTaskTemp(KF_MAP_TASK_TEMP_ID, KF_CURR_OPEN_COUNT, x)
KF_LAST_OPEN_MAPID = 2; --SetMapTaskTemp(KF_MAP_TASK_TEMP_ID, KF_LAST_OPEN_MAPID, x)

KF_EXP_EXT_RATE = min(VNG_CFG_KFB_EXP_EXT_ADD_RATE or 0, 2)--经验奖励加成系数
KF_JUNGONG_EXT_RATE = min(VNG_CFG_KFB_JUNGONG_EXT_ADD_RATE or 0, 2) --军功加成系数

KF_ENTRY_FEE = 1;  --报名费

KF_JOIN_TIMES_MAX = 2; --一天最多参加的次数

KF_TEAM_SIZE_MAX = 3; --队伍最大人数限制

KF_REVIVE_BUFF_TIME = 15; --s

KF_LOGTITEL = "Ph莕 thng chi課 trng li猲 u";

---跨服战场使用的任务变量--------------------------------
---需传回源服务器的任务变量------------------------------
KF_BATTLE_TASK = 3132; --第1至5位表示扣金的单位数量，第6,16记录活跃度，第3字节记录参加的次数,25,26表示阵营,27死亡回血标记，28是否是当天第一次领奖,第29-31位记录战场的胜负（1未开启，2胜利，3失败，4平局）

KF_TMULTIPLE = {
		[1] = {1, 1, {0, 0}, "Nh薾 thng tr鵦 ti誴"},
		[2] = {1.5, 2, {1, 1}, "Qu﹏ c玭g chng nh薾 thng"},
		[3] = {2, 5, {2, 1}, "Qu﹏ c玭g i nh薾 thng"},
		[4] = {2.5, 10, {3, 1}, "Qu﹏ c玭g huy ho祅g nh薾 thng"},
		[5] = {3, 14, {3, 2}, "Vinh D� Qu﹏ C玭g Chng nh薾 thng"},
}

---MISSION----------------------------
KF_MAP_ID = 6027;
KF_MISSION_ID = 62;
KF_TIMER_ID = 92;

KF_CampOne_Name = "Qu﹏ T鑞g";
KF_CampTwo_Name = "Qu﹏ Li猽";

KF_ALL_ID = 0;
KF_CampOne_ID = 1;	--武林联盟在mission中阵营
KF_CampTwo_ID = 2;	--武林叛徒在mission中阵营

KF_tCampName = {"Qu﹏ T鑞g","Qu﹏ Li猽"};

KF_CampOne_Type = "camp_player"; --武林联盟阵营类型，包括npc
KF_CampTwo_Type = "camp_enemy";  --武林叛徒阵营类型，包括npc
KF_Neutral_Type = "camp_evil";		--中立npc阵营类型

KF_tCampType = {
	[KF_ALL_ID] = "camp_evil",
	[KF_CampOne_ID] = "camp_player",
	[KF_CampTwo_ID] = "camp_enemy",
};

--频道
KF_BATTLE_CHANNEL = {
	[KF_ALL_ID] = {"K猲h chi課 trng", 39},
	[KF_CampOne_ID] = {"K猲h T鑞g", 40},
	[KF_CampTwo_ID] = {"K猲h Li猽", 41},
}

KF_PLAYER_MAX_NUM = 120; --一方最大人数限制
KF_PLAYER_ALLOW_NUM = 10; --开启至少需要多少人

KF_MISSION_COUTN_MAX = 1; --一个时间最多开启的场次

KF_MISSION_OPEN_FAIL_FLAG = 1234; --战场未开启标志

KF_JOIN_MISSION_POS = {
	[KF_CampOne_ID] = {1582, 3792},
	[KF_CampTwo_ID] = {1905, 3288},
}

KF_ITEM_LINGPAI = {
	[KF_CampOne_ID] = {2, 1, 30478, "T鑞g Qu﹏ Truy襫 L謓h K�"},
	[KF_CampTwo_ID] = {2, 1, 30479, "Li猽 Qu﹏ Truy襫 L謓h K�"},	
}

KF_PLAYER_DEATH_SCRIPT = "\\script\\missions\\kuafu_battle\\kf_player_death.lua";

KF_ZHENQI_INC = 10; --积分每15秒

--==============常量：战场的状态===================
KF_MS_STATE_PEACE = 0;				--等待人数阶段
KF_MS_STATE_READY = 1;				--准备状态，人数齐等待开战阶段
KF_MS_STATE_FIGHT = 2;				--开战状态
KF_MS_STATE_COMPLETE = 3;		--战争结束状态

--==============公用missionV变量===================
KF_MV_BATTLE_LOAD = 1;   --是否已经加载开启
KF_MV_BATTLE_STATE = 2;  --记录战场的状态
KF_MV_BATTLE_MAP_ID = 3;        --本场战场的MAPID
KF_MV_BATTLE_MAP_INDEX = 4;    --本场战场的MAP索引
KF_MV_BATTLE_TIMER_LOOP = 5;		--计数timer次数
KF_MV_BATTLE_GAME_FRAMETIME = 6; --当前游戏帧数
KF_MV_BATTLE_SONG_SCORE = 7; --宋军积分数
KF_MV_BATTLE_LIAO_SCORE = 8; --辽军积分数
KF_MV_BATTLE_WINNER = 9; --获胜者(0,1,2)
KF_MV_BATTLE_FLAG_JM = 10; --阵旗0中立，1宋，2辽
KF_MV_BATTLE_FLAG_MM = 11; --阵旗0中立，1宋，2辽
KF_MV_BATTLE_FLAG_SM = 12;	--阵旗0中立，1宋，2辽
KF_MV_BATTLE_FLAG_SI = 13;	--阵旗0中立，1宋，2辽
KF_MV_BATTLE_FLAG_DA = 14;	--阵旗0中立，1宋，2辽
KF_MV_BATTLE_SONG_ACTIVITY = 15; --宋累计活跃度
KF_MV_BATTLE_LIAO_ACTIVITY = 16; --辽累计活跃度
KF_MV_BATTLE_DUWEI_TAG_SONG = 17; --0为未派遣，1已派遣，2已死亡
KF_MV_BATTLE_DUWEI_DEATHTIME_SONG = 18; --都尉死亡时间
KF_MV_BATTLE_XIANFENG_TAG_SONG = 19; --0为未派遣，1已派遣，2已死亡
KF_MV_BATTLE_XIANFENG_DEATHTIME_SONG = 20; --先锋死亡时间
KF_MV_BATTLE_DUWEI_TAG_LIAO = 21; --0为未派遣，1已派遣，2已死亡
KF_MV_BATTLE_DUWEI_DEATHTIME_LIAO = 22; --都尉死亡时间
KF_MV_BATTLE_XIANFENG_TAG_LIAO = 23; --0为未派遣，1已派遣，2已死亡
KF_MV_BATTLE_XIANFENG_DEATHTIME_LIAO = 24; --先锋死亡时间
KF_MV_BATTLE_JIANGJUN_TAG = 25; --是否刷过将军了
KF_MV_BATTLE_IS_OPEN_SUCC = 26; --是否开启成功标志
KF_MV_BATTLE_TEMP_SAFE_POS_INDEX_SONG = 27; --宋临时庇护点
KF_MV_BATTLE_TEMP_SAFE_POS_INDEX_LIAO = 28; --辽临时庇护点

KF_SCORE_MAX = 30; --积分上限值
KF_JIANGJUN_SCORE = 31; --什么时候将军出现
KF_SCORE_JIANGJUN = 32; --将军积分值
--===============mission时间控制===================
KF_FRAME_PER_SECOND = 18;
KF_FRAME_PER_MIN = 60*KF_FRAME_PER_SECOND;

KF_PEACE_TIME = 5*KF_FRAME_PER_SECOND;--等待玩家人数开启计时器的报时间隔，5秒
KF_PEACE_TIMER_LOOP = (5*KF_FRAME_PER_MIN/KF_PEACE_TIME)-1;--等待玩家人数开启计时器报时次数（5分钟）
KF_READY_TIME = 5*KF_FRAME_PER_SECOND;--开战准备时间计时器的报时间隔，5秒
KF_READY_TIMER_LOOP = (1*KF_FRAME_PER_MIN/(6*KF_READY_TIME))-1;--开战准备时间计时器报时次数（10s）
KF_FIGHT_TIME = 3*KF_FRAME_PER_SECOND;			--打仗时间计时器的报时间隔，3秒
KF_FIGHT_TIMER_LOOP = (90*KF_FRAME_PER_MIN/KF_FIGHT_TIME)-1;	--打仗时间计时器的报时次数（90分钟）
KF_WAITOUT_TIME = 15*KF_FRAME_PER_SECOND;		--等待结束时间计时器的报时间隔
KF_WAITOUT_TIMER_LOOP = (0.5*KF_FRAME_PER_MIN/KF_WAITOUT_TIME)-1; --等待结束时间计时器的报时次数（半分钟）


--==============Npc表===================
KF_TALK_NPC = {
	{"KFZC_songqianxian", "Ti襫 tuy課 qu﹏ T鑞g", 1623, 3734, "\\script\\missions\\kuafu_battle\\npc\\ms_song_qxsb.lua"},
	{"KFZC_songqianxian", "Ti襫 tuy課 qu﹏ T鑞g", 1630, 3813, "\\script\\missions\\kuafu_battle\\npc\\ms_song_qxsb.lua"},
	{"KFZC_liaoqianxian", "Ti襫 tuy課 qu﹏ Li猽", 1864, 3331, "\\script\\missions\\kuafu_battle\\npc\\ms_liao_qxsb.lua"},
	{"KFZC_liaoqianxian", "Ti襫 tuy課 qu﹏ Li猽", 1853, 3261, "\\script\\missions\\kuafu_battle\\npc\\ms_liao_qxsb.lua"},
	{"KFZC_songyuansuan", "T鑞g Nguy猲 So竔", 1572, 3800, "\\script\\missions\\kuafu_battle\\npc\\ms_song_ys.lua"},
	{"KFZC_shenyou", "Th莕 Du Ch﹏ Nh﹏", 1540, 3772, "\\script\\missions\\kuafu_battle\\npc\\ms_song_syzr.lua"},
	{"KFZC_songjunxu", "T鑞g Qu﹏ Nhu Quan", 1592, 3827, "\\script\\missions\\kuafu_battle\\npc\\ms_song_jxg.lua"},
	{"KFZC_songshangren", "T鑞g Thng Nh﹏", 1532, 3756, "\\script\\missions\\kuafu_battle\\npc\\ms_song_sr.lua"},
	{"KFZC_songshangbing", "T鑞g Thng Binh", 1644, 3765, "\\script\\missions\\kuafu_battle\\npc\\ms_song_sb.lua"},
	{"KFZC_liaoyuansuan", "Li猽 Nguy猲 So竔", 1912, 3282, "\\script\\missions\\kuafu_battle\\npc\\ms_liao_ys.lua"},
	{"KFZC_jinglun", "Kim Lu﹏ Ph竝 Vng", 1885, 3250, "\\script\\missions\\kuafu_battle\\npc\\ms_liao_jlfw.lua"},
	{"KFZC_liaojunxu", "Li猽 Qu﹏ Nhu Quan", 1961, 3314, "\\script\\missions\\kuafu_battle\\npc\\ms_liao_jxg.lua"},
	{"KFZC_liaoshangren", "Li猽 Thng Nh﹏", 1953, 3306, "\\script\\missions\\kuafu_battle\\npc\\ms_liao_sr.lua"},
	{"KFZC_liaoshangbing", "Li猽 Thng Binh", 1837, 3295, "\\script\\missions\\kuafu_battle\\npc\\ms_liao_sb.lua"},
	
	
}

--八个佛的位置
KF_tPositionFo = {
	{"Nga Mi ti觰 s� t� 1", "Nga Mi ti觰 s� t� ", 1582, 3711, KF_CampOne_Type},
	{"Nga Mi ti觰 s� t� 2", "Nga Mi ti觰 s� t� ", 1592, 3711, KF_CampOne_Type},
	{"Nga Mi ti觰 s� t� 3", "Nga Mi ti觰 s� t� ", 1588, 3725, KF_CampOne_Type},
	{"Nga Mi ti觰 s� t� 4", "Nga Mi ti觰 s� t� ", 1573, 3718, KF_CampOne_Type},
	
	{"Nga Mi ti觰 s� t� 1", "Nga Mi ti觰 s� t� ", 1901, 3356, KF_CampTwo_Type},
	{"Nga Mi ti觰 s� t� 2", "Nga Mi ti觰 s� t� ", 1910, 3350, KF_CampTwo_Type},
	{"Nga Mi ti觰 s� t� 3", "Nga Mi ti觰 s� t� ", 1919, 3360, KF_CampTwo_Type},
	{"Nga Mi ti觰 s� t� 4", "Nga Mi ti觰 s� t� ", 1907, 3371, KF_CampTwo_Type},
}

KF_MONSTER_NPC = {
	{"KFZC_yeguai1", "Th� Qu竔", 1682, 3316},
	{"KFZC_yeguai2", "Th筩h Nh﹏", 1733, 3215},
	{"KFZC_yeguai3", "Tr飊g Qu竔", 1890, 3446},
	{"KFZC_yeguai4", "Thng tng", 1825, 3715},
	{"KFZC_yeguai5", "Ki誱 tng", 1760, 3731},
	{"KFZC_yeguai6", " H錸", 1553, 3606},
	{"KFZC_yeguai7", "Cung tng", 1663, 3543},
	{"KFZC_yeguai8", "O竛 Qu�", 1810, 3555},
	{"KFZC_boss1", "C� Dng Th�", 1525, 3482},
	{"KFZC_boss2", "Tr蕁 M� Th�", 1902, 3547},
}

KF_FLAG_NPC = {
	{"KFZC_jingmen", "C秐h M玭 Tr薾 K�", 1606, 3309, "\\script\\missions\\kuafu_battle\\npc\\zhenqi_jinmen.lua"},
	{"KFZC_miemen", "Di謙 M玭 Tr薾 K�", 1827, 3370, "\\script\\missions\\kuafu_battle\\npc\\zhenqi_miemen.lua"},
	{"KFZC_shengmen", "Sinh M玭 Tr薾 K�", 1888, 3754, "\\script\\missions\\kuafu_battle\\npc\\zhenqi_shengmen.lua"},
	{"KFZC_simen", "T� M玭 Tr薾 K�", 1656, 3676, "\\script\\missions\\kuafu_battle\\npc\\zhenqi_simen.lua"},
	{"KFZC_dazhenqi", "Чi Tr薾 K�", 1736, 3537, "\\script\\missions\\kuafu_battle\\npc\\zhenqi_da.lua"},
}

KF_FLAG_NPCLIST = {
		[1] = {
			[KF_ALL_ID] = {"KFZC_jingmen", "C秐h M玭 Tr薾 K�", "\\script\\missions\\kuafu_battle\\npc\\zhenqi_jinmen.lua", KF_MV_BATTLE_FLAG_JM},
			[KF_CampOne_ID] = {"KFZC_songjingmen", "T鑞g C秐h M玭 Tr薾 K�", "\\script\\missions\\kuafu_battle\\npc\\zhenqi_jinmen.lua", KF_MV_BATTLE_FLAG_JM},
			[KF_CampTwo_ID] = {"KFZC_liaojingmen", "Li猽 C秐h M玭 Tr薾 K�", "\\script\\missions\\kuafu_battle\\npc\\zhenqi_jinmen.lua", KF_MV_BATTLE_FLAG_JM},
		},
		[2] = {
			[KF_ALL_ID] = {"KFZC_miemen", "Di謙 M玭 Tr薾 K�", "\\script\\missions\\kuafu_battle\\npc\\zhenqi_miemen.lua", KF_MV_BATTLE_FLAG_MM},
			[KF_CampOne_ID] = {"KFZC_songmiemen", "T鑞g Di謙 M玭 Tr薾 K�", "\\script\\missions\\kuafu_battle\\npc\\zhenqi_miemen.lua", KF_MV_BATTLE_FLAG_MM},
			[KF_CampTwo_ID] = {"KFZC_liaomiemen", "Li猽 Di謙 M玭 Tr薾 K�", "\\script\\missions\\kuafu_battle\\npc\\zhenqi_miemen.lua", KF_MV_BATTLE_FLAG_MM},
		},
		[3] = {
			[KF_ALL_ID] = {"KFZC_shengmen", "Sinh M玭 Tr薾 K�", "\\script\\missions\\kuafu_battle\\npc\\zhenqi_shengmen.lua", KF_MV_BATTLE_FLAG_SM},
			[KF_CampOne_ID] = {"KFZC_songshengmen", "T鑞g Sinh M玭 Tr薾 K�", "\\script\\missions\\kuafu_battle\\npc\\zhenqi_shengmen.lua", KF_MV_BATTLE_FLAG_SM},
			[KF_CampTwo_ID] = {"KFZC_liaoshengmen", "Li猽 Sinh M玭 Tr薾 K�", "\\script\\missions\\kuafu_battle\\npc\\zhenqi_shengmen.lua", KF_MV_BATTLE_FLAG_SM},
		},
		[4] = {
			[KF_ALL_ID] = {"KFZC_simen", "T� M玭 Tr薾 K�", "\\script\\missions\\kuafu_battle\\npc\\zhenqi_simen.lua", KF_MV_BATTLE_FLAG_SI},
			[KF_CampOne_ID] = {"KFZC_songsimen", "T鑞g T� M玭 Tr薾 K�", "\\script\\missions\\kuafu_battle\\npc\\zhenqi_simen.lua", KF_MV_BATTLE_FLAG_SI},
			[KF_CampTwo_ID] = {"KFZC_liaosimen", "Li猽 T� M玭 Tr薾 K�", "\\script\\missions\\kuafu_battle\\npc\\zhenqi_simen.lua", KF_MV_BATTLE_FLAG_SI},
		},
		[5] = {
			[KF_ALL_ID] = {"KFZC_dazhenqi", "Чi Tr薾 K�", "\\script\\missions\\kuafu_battle\\npc\\zhenqi_da.lua", KF_MV_BATTLE_FLAG_DA},
			[KF_CampOne_ID] = {"KFZC_songdazhenqi", "T鑞g Чi Tr薾 K�", "\\script\\missions\\kuafu_battle\\npc\\zhenqi_da.lua", KF_MV_BATTLE_FLAG_DA},
			[KF_CampTwo_ID] = {"KFZC_liaodazhenqi", "Li猽 Чi Tr薾 K�", "\\script\\missions\\kuafu_battle\\npc\\zhenqi_da.lua", KF_MV_BATTLE_FLAG_DA},
		},
	}

KF_SHIBINF_NPC = {
	[1] = {
		[KF_CampOne_ID] = {
			{"KFZC_songshibing","T鑞g C秐h M玭 S� Binh",1602, 3313, "\\script\\missions\\kuafu_battle\\npc\\death_song_shibing.lua"},
			{"KFZC_songshibing","T鑞g C秐h M玭 S� Binh",1610, 3302, "\\script\\missions\\kuafu_battle\\npc\\death_song_shibing.lua"},
			{"KFZC_songshibing","T鑞g C秐h M玭 S� Binh",1601, 3305, "\\script\\missions\\kuafu_battle\\npc\\death_song_shibing.lua"},
			{"KFZC_songshibing","T鑞g C秐h M玭 S� Binh",1604, 3301, "\\script\\missions\\kuafu_battle\\npc\\death_song_shibing.lua"},
		},
		[KF_CampTwo_ID] = {
			{"KFZC_liaoshibing","Li猽 C秐h M玭 S� Binh",1602, 3313, "\\script\\missions\\kuafu_battle\\npc\\death_liao_shibing.lua"},
			{"KFZC_liaoshibing","Li猽 C秐h M玭 S� Binh",1610, 3302, "\\script\\missions\\kuafu_battle\\npc\\death_liao_shibing.lua"},
			{"KFZC_liaoshibing","Li猽 C秐h M玭 S� Binh",1601, 3305, "\\script\\missions\\kuafu_battle\\npc\\death_liao_shibing.lua"},
			{"KFZC_liaoshibing","Li猽 C秐h M玭 S� Binh",1604, 3301, "\\script\\missions\\kuafu_battle\\npc\\death_liao_shibing.lua"},
		},
	},
	[2] = {
		[KF_CampOne_ID] = {
			{"KFZC_songshibing","T鑞g Di謙 M玭 S� Binh",1823, 3364, "\\script\\missions\\kuafu_battle\\npc\\death_song_shibing.lua"},
			{"KFZC_songshibing","T鑞g Di謙 M玭 S� Binh",1828, 3362, "\\script\\missions\\kuafu_battle\\npc\\death_song_shibing.lua"},
			{"KFZC_songshibing","T鑞g Di謙 M玭 S� Binh",1831, 3368, "\\script\\missions\\kuafu_battle\\npc\\death_song_shibing.lua"},
			{"KFZC_songshibing","T鑞g Di謙 M玭 S� Binh",1830, 3375, "\\script\\missions\\kuafu_battle\\npc\\death_song_shibing.lua"},
		},
		[KF_CampTwo_ID] = {
			{"KFZC_liaoshibing","Li猽 Di謙 M玭 S� Binh",1823, 3364, "\\script\\missions\\kuafu_battle\\npc\\death_liao_shibing.lua"},
			{"KFZC_liaoshibing","Li猽 Di謙 M玭 S� Binh",1828, 3362, "\\script\\missions\\kuafu_battle\\npc\\death_liao_shibing.lua"},
			{"KFZC_liaoshibing","Li猽 Di謙 M玭 S� Binh",1831, 3368, "\\script\\missions\\kuafu_battle\\npc\\death_liao_shibing.lua"},
			{"KFZC_liaoshibing","Li猽 Di謙 M玭 S� Binh",1830, 3375, "\\script\\missions\\kuafu_battle\\npc\\death_liao_shibing.lua"},
		},
	},
	[3] = {
		[KF_CampOne_ID] = {
			{"KFZC_songshibing","T鑞g Sinh M玭 S� Binh",1883, 3757, "\\script\\missions\\kuafu_battle\\npc\\death_song_shibing.lua"},
			{"KFZC_songshibing","T鑞g Sinh M玭 S� Binh",1887, 3761, "\\script\\missions\\kuafu_battle\\npc\\death_song_shibing.lua"},
			{"KFZC_songshibing","T鑞g Sinh M玭 S� Binh",1892, 3754, "\\script\\missions\\kuafu_battle\\npc\\death_song_shibing.lua"},
			{"KFZC_songshibing","T鑞g Sinh M玭 S� Binh",1890, 3747, "\\script\\missions\\kuafu_battle\\npc\\death_song_shibing.lua"},
		},
		[KF_CampTwo_ID] = {
			{"KFZC_liaoshibing","Li猽 Sinh M玭 S� Binh",1883, 3757, "\\script\\missions\\kuafu_battle\\npc\\death_liao_shibing.lua"},
			{"KFZC_liaoshibing","Li猽 Sinh M玭 S� Binh",1887, 3761, "\\script\\missions\\kuafu_battle\\npc\\death_liao_shibing.lua"},
			{"KFZC_liaoshibing","Li猽 Sinh M玭 S� Binh",1892, 3754, "\\script\\missions\\kuafu_battle\\npc\\death_liao_shibing.lua"},
			{"KFZC_liaoshibing","Li猽 Sinh M玭 S� Binh",1890, 3747, "\\script\\missions\\kuafu_battle\\npc\\death_liao_shibing.lua"},
		},
	},
	[4] = {
		[KF_CampOne_ID] = {
			{"KFZC_songshibing","T鑞g T� M玭 S� Binh",1659, 3680, "\\script\\missions\\kuafu_battle\\npc\\death_song_shibing.lua"},
			{"KFZC_songshibing","T鑞g T� M玭 S� Binh",1654, 3682, "\\script\\missions\\kuafu_battle\\npc\\death_song_shibing.lua"},
			{"KFZC_songshibing","T鑞g T� M玭 S� Binh",1650, 3679, "\\script\\missions\\kuafu_battle\\npc\\death_song_shibing.lua"},
			{"KFZC_songshibing","T鑞g T� M玭 S� Binh",1650, 3670, "\\script\\missions\\kuafu_battle\\npc\\death_song_shibing.lua"},
		},
		[KF_CampTwo_ID] = {
			{"KFZC_liaoshibing","Li猽 T� M玭 S� Binh",1659, 3680, "\\script\\missions\\kuafu_battle\\npc\\death_liao_shibing.lua"},
			{"KFZC_liaoshibing","Li猽 T� M玭 S� Binh",1654, 3682, "\\script\\missions\\kuafu_battle\\npc\\death_liao_shibing.lua"},
			{"KFZC_liaoshibing","Li猽 T� M玭 S� Binh",1650, 3679, "\\script\\missions\\kuafu_battle\\npc\\death_liao_shibing.lua"},
			{"KFZC_liaoshibing","Li猽 T� M玭 S� Binh",1650, 3670, "\\script\\missions\\kuafu_battle\\npc\\death_liao_shibing.lua"},
		},
	},
	[5] = {
		[KF_CampOne_ID] = {
			{"KFZC_songshibing","T鑞g Чi Tr薾 K� S� Binh",1731, 3531, "\\script\\missions\\kuafu_battle\\npc\\death_song_shibing.lua"},
			{"KFZC_songshibing","T鑞g Чi Tr薾 K� S� Binh",1739, 3530, "\\script\\missions\\kuafu_battle\\npc\\death_song_shibing.lua"},
			{"KFZC_songshibing","T鑞g Чi Tr薾 K� S� Binh",1738, 3543, "\\script\\missions\\kuafu_battle\\npc\\death_song_shibing.lua"},
			{"KFZC_songshibing","T鑞g Чi Tr薾 K� S� Binh",1732, 3542, "\\script\\missions\\kuafu_battle\\npc\\death_song_shibing.lua"},
		},
		[KF_CampTwo_ID] = {
			{"KFZC_liaoshibing","Li猽 Чi Tr薾 K� S� Binh",1731, 3531, "\\script\\missions\\kuafu_battle\\npc\\death_liao_shibing.lua"},
			{"KFZC_liaoshibing","Li猽 Чi Tr薾 K� S� Binh",1739, 3530, "\\script\\missions\\kuafu_battle\\npc\\death_liao_shibing.lua"},
			{"KFZC_liaoshibing","Li猽 Чi Tr薾 K� S� Binh",1738, 3543, "\\script\\missions\\kuafu_battle\\npc\\death_liao_shibing.lua"},
			{"KFZC_liaoshibing","Li猽 Чi Tr薾 K� S� Binh",1732, 3542, "\\script\\missions\\kuafu_battle\\npc\\death_liao_shibing.lua"},
		},
	},
	[6] = {
		[KF_CampOne_ID] = {
			{"KFZC_songshibing","T鑞g Tng Qu﹏ V� Binh",1659, 3680, "\\script\\missions\\kuafu_battle\\npc\\death_song_shibing.lua"},
			{"KFZC_songshibing","T鑞g Tng Qu﹏ V� Binh",1654, 3682, "\\script\\missions\\kuafu_battle\\npc\\death_song_shibing.lua"},
			{"KFZC_songshibing","T鑞g Tng Qu﹏ V� Binh",1650, 3679, "\\script\\missions\\kuafu_battle\\npc\\death_song_shibing.lua"},
			{"KFZC_songshibing","T鑞g Tng Qu﹏ V� Binh",1650, 3670, "\\script\\missions\\kuafu_battle\\npc\\death_song_shibing.lua"},
		},
		[KF_CampTwo_ID] = {
			{"KFZC_liaoshibing","Li猽 Tng Qu﹏ V� Binh",1823, 3364, "\\script\\missions\\kuafu_battle\\npc\\death_liao_shibing.lua"},
			{"KFZC_liaoshibing","Li猽 Tng Qu﹏ V� Binh",1828, 3362, "\\script\\missions\\kuafu_battle\\npc\\death_liao_shibing.lua"},
			{"KFZC_liaoshibing","Li猽 Tng Qu﹏ V� Binh",1831, 3368, "\\script\\missions\\kuafu_battle\\npc\\death_liao_shibing.lua"},
			{"KFZC_liaoshibing","Li猽 Tng Qu﹏ V� Binh",1830, 3375, "\\script\\missions\\kuafu_battle\\npc\\death_liao_shibing.lua"},
		},
	},
}

--积分值
KF_SCORE_PLAYER = 1;
KF_SCORE_SHIBING = 1;
KF_SCORE_DUWEI = 20;
KF_SCORE_XIANFENG = 40;
KF_SCORE_ZHENQI = 10;
KF_SCORE_XIAOYG = 2;
KF_SCORE_DAYG = 4;

--活跃度
KF_ACTIVITY_PLAYER = 3;
KF_ACTIVITY_SHIBING = 2;
KF_ACTIVITY_DUWEI = 10;
KF_ACTIVITY_XIANFENG = 20;
KF_ACTIVITY_JIANGJUN = 40;
KF_ACTIVITY_XIAOYG = 2;
KF_ACTIVITY_DAYG = 6;
KF_ACTIVITY_ZHENQI = 10;
KF_ACTIVITY_PLAYERDEATH = 1;

--将军以上头衔
KF_TITIL_JIANGJUN = 5;

--派遣先锋的CD时间
KF_ORDER_XF_CD = 20 * 60; --10min
KF_ORDER_DW_CD = 10 * 60; --20min

KF_ORDER_POS = {
	[1] = {1609, 3312, "C秐h M玭 Tr薾 K�"},
	[2] = {1823, 3373, "Di謙 M玭 Tr薾 K�"},
	[3] = {1885, 3749, "Sinh M玭 Tr薾 K�"},
	[4] = {1660, 3671, "T� M玭 Tr薾 K�"},
	[5] = {1735, 3543, "Чi Tr薾 K�"},
}


--雪恨BUFF
KF_XUEHEN = {--差距数 攻击提高数值 生命上限提高数值 免疫负面次数
	{21,150,300,15,format("Tuy誸 h薾 c蕄 %d", 11),"C玭g k輈h t╪g %d%%, gi韎 h筺 sinh l鵦 t╪g %d%%, mi詎 d辌h tr筺g th竔 ph� %d l莕"},
	{19,150,300,14,format("Tuy誸 h薾 c蕄 %d", 10),"C玭g k輈h t╪g %d%%, gi韎 h筺 sinh l鵦 t╪g %d%%, mi詎 d辌h tr筺g th竔 ph� %d l莕"},
	{17,135,270,14,format("Tuy誸 h薾 c蕄 %d", 9),"C玭g k輈h t╪g %d%%, gi韎 h筺 sinh l鵦 t╪g %d%%, mi詎 d辌h tr筺g th竔 ph� %d l莕"},
	{15,120,240,13,format("Tuy誸 h薾 c蕄 %d", 8),"C玭g k輈h t╪g %d%%, gi韎 h筺 sinh l鵦 t╪g %d%%, mi詎 d辌h tr筺g th竔 ph� %d l莕"},
	{13,105,210,13,format("Tuy誸 h薾 c蕄 %d", 7),"C玭g k輈h t╪g %d%%, gi韎 h筺 sinh l鵦 t╪g %d%%, mi詎 d辌h tr筺g th竔 ph� %d l莕"},
	{11,90 ,180,12,format("Tuy誸 h薾 c蕄 %d", 6),"C玭g k輈h t╪g %d%%, gi韎 h筺 sinh l鵦 t╪g %d%%, mi詎 d辌h tr筺g th竔 ph� %d l莕"},
	{9 ,75 ,150,12,format("Tuy誸 h薾 c蕄 %d", 5),"C玭g k輈h t╪g %d%%, gi韎 h筺 sinh l鵦 t╪g %d%%, mi詎 d辌h tr筺g th竔 ph� %d l莕"},
	{7 ,60 ,120,10,format("Tuy誸 h薾 c蕄 %d", 4),"C玭g k輈h t╪g %d%%, gi韎 h筺 sinh l鵦 t╪g %d%%, mi詎 d辌h tr筺g th竔 ph� %d l莕"},
	{5 ,45 ,90 , 5,format("Tuy誸 h薾 c蕄 %d", 3),"C玭g k輈h t╪g %d%%, gi韎 h筺 sinh l鵦 t╪g %d%%, mi詎 d辌h tr筺g th竔 ph� %d l莕"},
	{3 ,30 ,60 , 3,format("Tuy誸 h薾 c蕄 %d", 2),"C玭g k輈h t╪g %d%%, gi韎 h筺 sinh l鵦 t╪g %d%%, mi詎 d辌h tr筺g th竔 ph� %d l莕"},
	{1 ,15 ,30 , 1,format("Tuy誸 h薾 c蕄 %d", 1),"C玭g k輈h t╪g %d%%, gi韎 h筺 sinh l鵦 t╪g %d%%, mi詎 d辌h tr筺g th竔 ph� %d l莕"},
};

KF_TSTATEMAGICATTR = {
		[1] = {
			{"state_p_attack_percent_add", 20, 5 * 60 * 18, 20101, 2, "Ngo筰 c玭g c玭g k輈h t╪g%d%%", "BUFF1"},
			{"state_m_attack_percent_add", 20, 5 * 60 * 18, 20102, 2, "N閕 c玭g c玭g k輈h t╪g%d%%", "BUFF1"},
		},
		[2] = {
			{"state_life_max_percent_add", 50, 5 * 60 * 18, 20103, 3, "Sinh l鵦 t╪g %d%%", "BUFF2"},
		},
		[3] = {
			{"state_physical_parmor_poi_add", 10, 5 * 60 * 18, 20104, 4, "Ngo筰 ph遪g t╪g %d%%", "BUFF3"},
			{"state_magic_parmor_poi_add", 10, 5 * 60 * 18, 20105, 4, "N閕  ph遪g t╪g %d%%", "BUFF3"},
		},
		[4] = {
			{"state_buff_resist", 5, 5 * 60 * 18, 20106, 5, "Mi詎 d辌h tr筺g th竔 ph� %d l莕", "BUFF4"},
		},
		[5] = {
			{"state_p_attack_percent_add", 40, 3 * 60 * 18, 20101, 6, "Ngo筰 c玭g c玭g k輈h t╪g%d%%", "BUFF5"},
			{"state_m_attack_percent_add", 40, 3 * 60 * 18, 20102, 6, "N閕 c玭g c玭g k輈h t╪g%d%%", "BUFF5"},
			{"state_life_max_percent_add", 100, 3 * 60 * 18, 20103, 6, "Sinh l鵦 t╪g %d%%", "BUFF5"},
			{"state_physical_parmor_poi_add", 20, 3 * 60 * 18, 20104, 6, "Ngo筰 ph遪g t╪g %d%%", "BUFF5"},
			{"state_magic_parmor_poi_add", 20, 3 * 60 * 18, 20105, 6, "N閕  ph遪g t╪g %d%%", "BUFF5"},
			{"state_buff_resist", 5, 3 * 60 * 18, 20106, 6, "Mi詎 d辌h tr筺g th竔 ph� %d l莕", "BUFF5"},
		},
}

---奖励-----------------------------------------
KF_ACTIVITY_LEVEL = {0, 1, 10, 40, 200};

KF_BATTLE_AWARD = {
		--未开启
		[1] = {
			[1] = {KF_ACTIVITY_LEVEL[1], {300000, 0}, 200, {1, 1}},
			[2] = {KF_ACTIVITY_LEVEL[2], {300000, 0}, 300, {1, 1}},
			[3] = {KF_ACTIVITY_LEVEL[3], {300000, 0}, 800, {1, 1}},
			[4] = {KF_ACTIVITY_LEVEL[4], {300000, 0}, 1200, {1, 1}},
			[5] = {KF_ACTIVITY_LEVEL[5], {300000, 0}, 1600, {1, 1}},
		},
		--胜利
		[2] = {
			[1] = {KF_ACTIVITY_LEVEL[1], {300000, 0}, 200, {1, 1}},
			[2] = {KF_ACTIVITY_LEVEL[2], {16000000, 10000}, 300, {2, 1}},
			[3] = {KF_ACTIVITY_LEVEL[3], {16000000, 10000}, 800, {2, 1}},
			[4] = {KF_ACTIVITY_LEVEL[4], {16000000, 10000}, 1200, {2, 1}},
			[5] = {KF_ACTIVITY_LEVEL[5], {36000000, 0}, 1600, {2, 1}},
		},
		--失败
		[3] = {
			[1] = {KF_ACTIVITY_LEVEL[1], {300000, 0}, 200, {1, 1}},
			[2] = {KF_ACTIVITY_LEVEL[2], {8000000, 10000}, 300, {1, 1}},
			[3] = {KF_ACTIVITY_LEVEL[3], {8000000, 10000}, 800, {1, 1}},
			[4] = {KF_ACTIVITY_LEVEL[4], {8000000, 10000}, 1200, {1, 1}},
			[5] = {KF_ACTIVITY_LEVEL[5], {20000000, 0}, 1600, {1, 1}},
		},
		--平局
		[4] = {
			[1] = {KF_ACTIVITY_LEVEL[1], {300000, 0}, 200, {1, 1}},
			[2] = {KF_ACTIVITY_LEVEL[2], {8000000, 10000}, 300, {1, 1}},
			[3] = {KF_ACTIVITY_LEVEL[3], {8000000, 10000}, 800, {1, 1}},
			[4] = {KF_ACTIVITY_LEVEL[4], {8000000, 10000}, 1200, {1, 1}},
			[5] = {KF_ACTIVITY_LEVEL[5], {20000000, 0}, 1600, {1, 1}},
		},
}

KF_PARK_AWARD_PT = {
	{3, 100, 30000, 1},
	{3, 40, 60000, 1},
	{3, 10, 100000, 1},
	{27, 150, 300, 1},
	{27, 100, 600, 1},
	{27, 100, 1000, 1},
	{34, 75, 60, 1},
	{35, 25, 60, 1},
	{1, 150, "V� Ti誹 Y уng", {2, 1, 30493, 1}, 0},
	{1, 100, "V� Ti誹 Y уng", {2, 1, 30493, 2}, 0},
	{1, 50, "V� Ti誹 Y уng", {2, 1, 30493, 4}, 0},
	{1, 100, "Thi誸 Tinh c蕄 1", {2, 1, 30533, 4}, 0},
}

KF_PARK_AWARD_PT_ADD = {
	{1, "Hu﹏ chng anh h飊g", {2, 1, 30499, 1}, 0},
	{28, 300, 1},--真气
}

KF_PARK_AWARD_GJ = {
	{3, 50, 100000, 1},
	{3, 20, 150000, 1},
	{3, 10, 300000, 1},	
	{27, 100, 600, 1},
	{27, 100, 1200, 1},
	{27, 100, 1500, 1},
	{34, 40, 60, 1},
	{35, 10, 60, 1},
	{1, 200, "V� Ti誹 Y уng", {2, 1, 30493, 2}, 0},
	{1, 100, "V� Ti誹 Y уng", {2, 1, 30493, 4}, 0},
	{1, 50, "V� Ti誹 Y B筩", {2, 1, 30492, 1}, 0},
	
	{1, 120, "Thi誸 Tinh c蕄 1", {2, 1, 30533, 4}, 0},
	{1, 100, "Thi誸 Tinh c蕄 2", {2, 1, 30534, 4}, 0},
}

KF_PARK_AWARD_GJ_ADD = {
	{1, "Hu﹏ chng anh h飊g", {2, 1, 30499, 2}, 0},
	{28, 400, 1},--真气
}

KF_PARK_AWARD_JY = {
	{3, 100, 150000, 1},
	{3, 100, 300000, 1},
	{3, 10, 600000, 1},	
	{27, 100, 1500, 1},
	{27, 100, 2000, 1},
	{27, 100, 2500, 1},
	{35, 75, 60, 1},
	{36, 25, 60, 1},
	{1, 100, "V� Ti誹 Y B筩", {2, 1, 30493, 1}, 0},
	{1, 100, "V� Ti誹 Y B筩", {2, 1, 30493, 2}, 0},
	{1, 50, "V� Ti誹 Y B筩", {2, 1, 30492, 4}, 0},
	
	{1, 50, "Thi誸 Tinh c蕄 1", {2, 1, 30533, 4}, 0},
	{1, 50, "Thi誸 Tinh c蕄 2", {2, 1, 30534, 4}, 0},
	{1, 40, "Thi誸 Tinh c蕄 3", {2, 1, 30535, 4}, 0},
}

KF_PARK_AWARD_JY_ADD = {
	{1, "Hu﹏ chng anh h飊g", {2, 1, 30499, 6}, 0},
	{28, 500, 1},--真气
}

KF_NB_WEAPON_TABLE = {
	--流派={武器}
	[2] = {0,	3,	30052, 1, 1, -1, -1, -1, -1, -1, -1, 0, 15, "Ch﹏ Ma o"},
	[4] = {0,	0,	30053, 1, 1, -1, -1, -1, -1, -1, -1, 0, 15, "Ch﹏ Ma Trng"},
	[3] = {0,	8,	30054, 1, 1, -1, -1, -1, -1, -1, -1, 0, 15, "Ch﹏ Ma Th�"},
	[6] = {0,	1,	30055, 1, 1, -1, -1, -1, -1, -1, -1, 0, 15, "Ch﹏ Ma Ch﹎"},
	[8] = {0,	2,	30056, 1, 1, -1, -1, -1, -1, -1, -1, 0, 15, "Ch﹏ Ma Ki誱"},
	[9] = {0,	10,	30057, 1, 1, -1, -1, -1, -1, -1, -1, 0, 15, "Ch﹏ Ma C莔"},
	[11] = {0,	0,	30058, 1, 1, -1, -1, -1, -1, -1, -1, 0, 15, "Ch﹏ Ma Th�"},
	[12] = {0,	5,	30059, 1, 1, -1, -1, -1, -1, -1, -1, 0, 15, "Ch﹏ Ma C玭"},
	[14] = {0,	2,	30060, 1, 1, -1, -1, -1, -1, -1, -1, 0, 15, "Ch﹏ Ma Ki誱"},
	[15] = {0,	9,	30061, 1, 1, -1, -1, -1, -1, -1, -1, 0, 15, "Ch﹏ Ma B髏"},
	[17] = {0,	6,	30062, 1, 1, -1, -1, -1, -1, -1, -1, 0, 15, "Ch﹏ Ma Thng"},
	[18] = {0,	4,	30063, 1, 1, -1, -1, -1, -1, -1, -1, 0, 15, "Ch﹏ Ma Cung"},
	[20] = {0,	7,	30064, 1, 1, -1, -1, -1, -1, -1, -1, 0, 15, "Ch﹏ Ma Nh蒼"},
	[21] = {0,	11,	30065, 1, 1, -1, -1, -1, -1, -1, -1, 0, 15, "Ch﹏ Ma Tr秓"},
	[23] = {0,	2,	30066, 1, 1, -1, -1, -1, -1, -1, -1, 0, 15, "Ch﹏ Ma Ki誱"},
	[25] = {0,	3,	30067, 1, 1, -1, -1, -1, -1, -1, -1, 0, 15, "Ch﹏ Ma o"},
	[26] = {0,	9,	30068, 1, 1, -1, -1, -1, -1, -1, -1, 0, 15, "Ch﹏ Ma B髏"},
	[27] = {0,	11,	30069, 1, 1, -1, -1, -1, -1, -1, -1, 0, 15, "Ch﹏ Ma Tr秓"},
	[29] = {0,	13,	30070, 1, 1, -1, -1, -1, -1, -1, -1, 0, 15, "Ch﹏ Ma Phi課"},
	[30] = {0,	12,	30071, 1, 1, -1, -1, -1, -1, -1, -1, 0, 15, "Ch﹏ Ma Ti猽"},
}

KF_WEAPON_EXIST_TIME = 10 * 60;

--临时传送点
KF_TEMP_SAFE_POS = {
	[KF_CampOne_ID] = {
		{1671, 3334},
		{1564, 3651},
		{1736, 3626},
	},
	[KF_CampTwo_ID] = {
		{1881, 3676},
		{1895, 3436},
		{1740, 3440},
	},	
}

--出现临时安全传送条件
KF_TEMP_SAFE_POS_CONDITION = 100;