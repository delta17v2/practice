rambo_nanobotics = class({})
LinkLuaModifier( "modifier_rambo_nanobotics", "custom_abilities/rambo/rambo_nanobotics/modifier_rambo_nanobotics", LUA_MODIFIER_MOTION_NONE )

--------------------------------------------------
--Active Modifier

function rambo_nanobotics:OnSpellStart()
	-- get references
	local bonus_duration = self:GetSpecialValueFor("duration")
	
	self:GetCaster():AddNewModifier(
		self:GetCaster(),
		self,
		"modifier_rambo_nanobotics",
		{ duration = bonus_duration }
	)
	
	-- play effects
	self:PlayEffects()
end

function rambo_nanobotics:PlayEffects()
	-- get resources
	local sound_cast = "Hero_Ursa.Enrage"

	-- play sound
	EmitSoundOn( sound_cast, self:GetCaster() )
end