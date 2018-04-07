modifier_armaman_minus_bat = class({})

--------------------------------------------------------------------------------
-- Classifications
function modifier_armaman_minus_bat:IsHidden()
	return true
end

function modifier_armaman_minus_bat:OnCreated()
	self.bonus = self:GetAbility():GetSpecialValueFor("bat_reduction")
end

function modifier_armaman_minus_bat:OnRefresh()
	self.bonus = self:GetAbility():GetSpecialValueFor("bat_reduction")
end

---------------------------------------------------------------------------------

function modifier_armaman_minus_bat:DeclareFunctions()
	local funcs = {
		MODIFIER_PROPERTY_BASE_ATTACK_TIME_CONSTANT
	}

	return funcs
end

function modifier_armaman_minus_bat:GetModifierBaseAttackTimeConstant( params )
	if not self:GetParent():PassivesDisabled() then
		return self.bonus
	end
end