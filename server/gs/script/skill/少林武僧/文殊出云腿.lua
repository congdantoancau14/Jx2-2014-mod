--技能: 文殊出云腿

Include("\\script\\skill\\skillfunctions.lua")

SKILL = {
	--技能属性

	SKILL_LEVEL_BASE_ATTRIB	  =	--技能等级相关基本属性
	{
	{"skill_burst_time",{{1,8},{3,8},{4,12},{6,12},{7,22},{19,22}}},
	{"skill_effect_persist_time",{{1,2},{19,2}}},
	{"skill_nextskill_wait_time",{{1,6},{3,6},{4,11},{6,11},{7,16},{19,16}}},
	},

	SKILL_LEVEL_COST_ATTRIB	  =	--技能等级相关消耗属性
	{
	},

	SKILL_LEVEL_MISSLE_ATTRIB =	--技能等级相关子弹属性
	{
	{"skill_missle_num",{{1,2},{4,3},{7,4},{19,4}}},
	},

	--魔法属性

	--属性值:	普通攻击力 * X + (1 + 技能等级 * Y) * (力量 * A + 根骨 * B + 身法 * C + 内功 * D + 洞察 * E)
	--			+ 武器外功攻击点 * F + Z
	--			(其中,A,B,C,D,E,F,X,Y,Z为伤害因素.除Z外,其余各伤害因素为百分比数.)

	--成功几率:	(属性值 * A + (自身等级 - 对方等级) * B + 技能等级 * C) * D + X
	--			(其中,A,B,C,D,X为几率因素.除X外,其余各几率因素为百分比数.)

	SKILL_MAGIC_DAMAGE_ATTRIB =	--技能等级相关伤害魔法属性
	{
	{magic="damage_life",
	damage_factor_x={{1,70},{9,110},{19,132}},
	probability_factor_b={{1,20},{19,20}},
	probability_factor_x={{1,100},{19,100}},
	}
	},

	SKILL_MAGIC_STATE_ATTRIB  =	--技能等级相关状态魔法属性
	{
	{magic="state_fetter",
	damage_factor_z={{1,1},{19,1}},
	probability_factor_x={{1,20},{19,20}},
	}
	},

	SKILL_MAGIC_IMME_ATTRIB   =	--技能等级相关立即魔法属性
	{
	},
}
