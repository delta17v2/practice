armaman_minus_bat = class({})
LinkLuaModifier( "modifier_armaman_minus_bat", "custom_abilities/rambo/armaman_minus_bat/modifier_armaman_minus_bat", LUA_MODIFIER_MOTION_NONE )

--------------------------------------------------------------------------------
-- Passive Modifier
function armaman_minus_bat:GetIntrinsicModifierName()
	return "modifier_armaman_minus_bat"
end