modifier_rambo_nanobotics = class({})

--------------------------------------------------------------------------------
-- Classifications

function modifier_rambo_nanobotics:IsDebuff()
	return false
end

function modifier_rambo_nanobotics:IsPurgable()
	return true
end

--------------------------------------------------------------------------------
--
function modifier_rambo_nanobotics:OnCreated()
	self.health_regen = self:GetAbility():GetSpecialValueFor("health_regen")
	self.move_speed = self:GetAbility():GetSpecialValueFor("move_speed")
end

function modifier_rambo_nanobotics:OnRefresh()
	self.health_regen = self:GetAbility():GetSpecialValueFor("health_regen")
	self.move_speed = self:GetAbility():GetSpecialValueFor("move_speed")
end

--------------------------------------------------------------------------------
function modifier_rambo_nanobotics:DeclareFunctions()
	local funcs = {
		MODIFIER_PROPERTY_HEALTH_REGEN_CONSTANT,
		MODIFIER_PROPERTY_MOVESPEED_BONUS_PERCENTAGE
	}

	return funcs
end

function modifier_rambo_nanobotics:GetModifierConstantHealthRegen()
	return self.health_regen
end

function modifier_rambo_nanobotics:GetModifierMoveSpeedBonus_Percentage()
	return self.move_speed
end 

--------------------------------------------------------------------------------
-- Graphics & Animations
function modifier_rambo_nanobotics:GetEffectName()
	return "particles/units/heroes/hero_legion_commander/legion_commander_press_the_attack_buff.vpcf"
end

function modifier_rambo_nanobotics:GetEffectAttachType()
	return PATTACH_ABSORIGIN_FOLLOW
end