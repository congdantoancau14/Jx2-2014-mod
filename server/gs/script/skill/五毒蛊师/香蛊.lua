--技能: 香蛊

Include("\\script\\skill\\skillfunctions.lua")

SKILL = {
	--技能属性

	SKILL_LEVEL_BASE_ATTRIB	  =	--技能等级相关基本属性
	{
	{"skill_effect_persist_time",{{1,300},{5,300},{6,60},{17,60}}},
	{"skill_display_persist_time",{{1,0},{5,0},{6,0},{7,1},{17,1}}},
	{"skill_cast_interval",{{1,54},{5,54},{6,270},{7,54},{17,54}}},
	},

	SKILL_LEVEL_COST_ATTRIB	  =	--技能等级相关消耗属性
	{
	{"cost_mana_point",{{1,21},{5,25},{6,30},{17,30}}},
	{"cost_goods_id",{{1,1114120},{5,1114120},{6,1114121},{7,1114122},{17,1114122}}},
	{"cost_goods_num",{{1,1},{17,1}}},
	},

	SKILL_LEVEL_MISSLE_ATTRIB =	--技能等级相关子弹属性
	{
	},

	--魔法属性

	--属性值:	普通攻击力 * X + (1 + 技能等级 * Y) * (力量 * A + 根骨 * B + 身法 * C + 内功 * D + 洞察 * E)
	--			+ 武器外功攻击点 * F + Z
	--			(其中,A,B,C,D,E,F,X,Y,Z为伤害因素.除Z外,其余各伤害因素为百分比数.)

	--成功几率:	(属性值 * A + (自身等级 - 对方等级) * B + 技能等级 * C) * D + X
	--			(其中,A,B,C,D,X为几率因素.除X外,其余各几率因素为百分比数.)

	SKILL_MAGIC_DAMAGE_ATTRIB =	--技能等级相关伤害魔法属性
	{
	},

	SKILL_MAGIC_STATE_ATTRIB  =	--技能等级相关状态魔法属性
	{
	{magic="state_armor_add",
	damage_factor_e={{1,8},{5,12},{6,15},{7,12},{17,22}},
	damage_factor_z={{1,27},{5,35},{6,45},{7,40},{17,140}},
	},
	{magic="state_paralysis_when_lose_hp",
	damage_factor_z={{1,196628},{5,196648},{6,196658},{7,196653},{17,196653}},
	},
	{magic="state_magic_parmor_poi_add",
	damage_factor_z={{1,3},{5,3},{6,6},{7,4},{12,5},{17,6}},
	},
	{magic="state_physical_parmor_poi_add",
	damage_factor_z={{1,3},{5,3},{6,6},{7,4},{12,5},{17,6}},
	},
	},

	SKILL_MAGIC_IMME_ATTRIB   =	--技能等级相关立即魔法属性
	{
	},
}
