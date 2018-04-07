modifier_rambo_explode = class({})

--------------------------------------------------------------------------------

function modifier_rambo_explode:IsDebuff()
	return true
end

--------------------------------------------------------------------------------

function modifier_rambo_explode:OnCreated( kv )
	self.slow = self:GetAbility():GetSpecialValueFor("movement_slow")
end

function modifier_rambo_explode:OnRefresh( kv )
	self.slow = self:GetAbility():GetSpecialValueFor("movement_slow")
end
--------------------------------------------------------------------------------

function modifier_rambo_explode:DeclareFunctions()
	local funcs = {
		MODIFIER_PROPERTY_MOVESPEED_BONUS_PERCENTAGE,
	}

	return funcs
end

--------------------------------------------------------------------------------

function modifier_rambo_explode:GetModifierMoveSpeedBonus_Percentage()
	return self.slow
end

--------------------------------------------------------------------------------
-- Graphics & Animations
function modifier_rambo_explode:GetEffectName()
	return "particles/units/heroes/hero_ursa/ursa_earthshock_modifier.vpcf"
end

function modifier_rambo_explode:GetEffectAttachType()
	return PATTACH_ABSORIGIN_FOLLOW
end