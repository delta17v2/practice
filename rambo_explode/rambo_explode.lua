rambo_explode = class({})
LinkLuaModifier( "modifier_rambo_explode", "custom_abilities/rambo_explode/modifier_rambo_explode", LUA_MODIFIER_MOTION_NONE )

--------------------------------------------------------------------------------

function rambo_explode:OnSpellStart()
	-- get references
	local slow_radius = self:GetSpecialValueFor("shock_radius")
	local slow_duration = self:GetDuration()
	local ability_damage = self:GetAbilityDamage()
	local self_damage = self:GetSpecialValueFor("self_damage")
	
-- get list of affected enemies
	local enemies = FindUnitsInRadius(
		self:GetCaster():GetTeamNumber(),
		self:GetCaster():GetOrigin(),
		nil,
		slow_radius,
		DOTA_UNIT_TARGET_TEAM_ENEMY,
		DOTA_UNIT_TARGET_HERO + DOTA_UNIT_TARGET_BASIC,
		DOTA_UNIT_TARGET_FLAG_NONE,
		FIND_ANY_ORDER,
		false
	)

	-- Do for each affected enemies
	for _,enemy in pairs(enemies) do
		-- Apply damage
		local damage = {
			victim = enemy,
			attacker = self:GetCaster(),
			damage = ability_damage,
			damage_type = DAMAGE_TYPE_MAGICAL,
			ability = self
		}
		ApplyDamage( damage )

		-- Add slow modifier
		enemy:AddNewModifier(
			self:GetCaster(),
			self,
			"modifier_rambo_explode",
			{ duration = slow_duration }
		)
	end	
	
--00	local enemies = FindUnitsInRadius(		/ub case : the ( was one space away before

	--damages the caster
	local caster = {
		victim = self:GetCaster(),
		attacker = self:GetCaster(),
		damage = self_damage,
		damage_type = DAMAGE_TYPE_MAGICAL,
		ability = self
	}
	ApplyDamage( caster )
	
	-- Play effects
	self:PlayEffects()
end

function rambo_explode:PlayEffects()
	-- get resources
	local sound_cast = "Hero_Ursa.Earthshock"
	local particle_cast = "particles/units/heroes/hero_ursa/ursa_earthshock.vpcf"

	-- get data
	local slow_radius = self:GetSpecialValueFor("shock_radius")

	-- play particles
	local nFXIndex = ParticleManager:CreateParticle( particle_cast, PATTACH_WORLDORIGIN, nil )
	ParticleManager:SetParticleControl( nFXIndex, 0, self:GetCaster():GetOrigin() )
	ParticleManager:SetParticleControlForward( nFXIndex, 0, self:GetCaster():GetForwardVector() )
	ParticleManager:SetParticleControl( nFXIndex, 1, Vector(slow_radius/2, slow_radius/2, slow_radius/2) )
	ParticleManager:ReleaseParticleIndex( nFXIndex )

	-- play sounds
	EmitSoundOn( sound_cast, self:GetCaster() )
end