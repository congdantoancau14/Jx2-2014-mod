--技能: 霸王卸甲

Include("\\script\\skill\\skillfunctions.lua")

SKILL = {
	--技能属性

	SKILL_LEVEL_BASE_ATTRIB	  =	--技能等级相关基本属性
	{
	{"skill_sub_skill1_probability",{{1,0},{2,0},{3,8},{4,9},{5,10},{6,12},{7,15},{17,15}}},
	{"skill_sub_skill1_factor",{{1,0},{2,0},{3,10},{4,12},{5,15},{6,17},{7,20},{17,20}}},
	{"skill_sub_skill2_probability",{{1,0},{5,0},{6,3},{7,5},{17,5}}},
	{"skill_sub_skill2_factor",{{1,0},{5,0},{6,9},{7,12},{17,12}}},
	{"skill_effect_persist_time",{{1,45},{17,45}}},
	{"skill_display_persist_time",{{1,45},{17,45}}},
	},

	SKILL_LEVEL_COST_ATTRIB	  =	--技能等级相关消耗属性
	{
	{"cost_mana_point",{{1,15},{7,21},{17,30}}}
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
	{magic="common_probability",
	probability_factor_b={{1,15},{17,15}},
	probability_factor_x={{1,100},{17,100}},
	},
	{magic="state_magic_parmor_per_dec_no_ignore",
	damage_factor_e={{1,2},{7,3},{17,3}},
	damage_factor_z={{1,6},{7,26},{17,46}},
	damage_factor_m={{1,50},{7,50},{17,60}},
	},
	{magic="state_physical_parmor_per_dec_no_ignore",
	damage_factor_e={{1,2},{7,3},{17,3}},
	damage_factor_z={{1,6},{7,26},{17,46}},
	damage_factor_m={{1,50},{7,50},{17,60}},
	},
	{magic="state_p_attack_percent_dec",
	damage_factor_z={{1,0},{17,0}},
	},
	{magic="state_m_attack_percent_dec",
	damage_factor_z={{1,0},{17,0}},
	},
	},

	SKILL_MAGIC_IMME_ATTRIB   =	--技能等级相关立即魔法属性
	{
	},
}
