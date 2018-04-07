rambo_aimbots = class({})
LinkLuaModifier( "modifier_rambo_aimbots", "custom_abilities/rambo/rambo_aimbots/modifier_rambo_aimbots", LUA_MODIFIER_MOTION_NONE )

-- Passive Modifier
function rambo_aimbots:GetIntrinsicModifierName()
	return "modifier_rambo_aimbots"
end