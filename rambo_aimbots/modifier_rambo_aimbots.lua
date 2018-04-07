modifier_rambo_aimbots = class({})

--------------------------------------------------------------------------------
-- Classifications
function modifier_rambo_aimbots:IsHidden()
	return true
end

--------------------------------------------------------------------------------
-- Initializations
function modifier_rambo_aimbots:OnCreated()
	self.attack_speed = self:GetAbility():GetSpecialValueFor("atk_spd_bns")
	self.damage = self:GetAbility():GetSpecialValueFor("damage")
	self.chance = self:GetAbility():GetSpecialValueFor("chance")
end

function modifier_rambo_aimbots:OnRefresh()
	self.attack_speed = self:GetAbility():GetSpecialValueFor("atk_spd_bns")
	self.damage = self:GetAbility():GetSpecialValueFor("damage")
	self.chance = self:GetAbility():GetSpecialValueFor("chance")
end

---------------------------------------------------------------------------------

function modifier_rambo_aimbots:DeclareFunctions()
	local funcs = {
		MODIFIER_PROPERTY_ATTACKSPEED_BONUS_CONSTANT,
		MODIFIER_PROPERTY_PROCATTACK_BONUS_DAMAGE_PURE
	}

	return funcs
end

function modifier_rambo_aimbots:GetModifierProcAttack_BonusDamage_Pure( params )
	if IsServer() then
		-- fail if target is invalid
		if params.target:IsBuilding() or params.target:IsOther() then
			return 0
		end

		-- fail if status is invalid
		if self:GetParent():PassivesDisabled() then
			return 0
		end

		local x = math.random()
		
		if x < self.chance / 100 then
			return self.damage
		end
	end
end 

function modifier_rambo_aimbots:GetModifierAttackSpeedBonus_Constant( params )
	if not self:GetParent():PassivesDisabled() then
		return self.attack_speed
	end
end

--------------------------------------------------------------------------------
-- Helper
--function modifier_rambo_aimbots:RollChance( chance )
--	local rand = math.random()
--	if rand<chance/100 then
--		return true
--	end
--	return false
--end