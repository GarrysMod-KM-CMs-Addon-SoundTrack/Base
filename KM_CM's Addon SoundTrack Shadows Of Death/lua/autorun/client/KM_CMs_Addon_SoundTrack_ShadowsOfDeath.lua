include "autorun/client/Director.lua"

Director_Music( "MUS_ShadowsOfDeath_Intro", "Music/ShadowsOfDeath/Intro.wav" )
Director_Music( "MUS_ShadowsOfDeath_Looper", "Music/ShadowsOfDeath/Looper.wav" )

DIRECTOR_ALLOCATE_COMBAT_THEME( "DIRECTOR_TRACK_ShadowsOfDeath", {
	CheckIntro = function( self ) return true end,
	Intro = function( self )
		WarmUpSoundGenerous "MUS_ShadowsOfDeath_Looper"
		if !self.tHandles.Main then
			if self.bPartStarted then
				self.bPartStarted = nil
				Director_Music_Stop( self.m_pSource, "Main" )
				return true, 0, 1
			else
				Director_Music_Play( self, "Main", "MUS_ShadowsOfDeath_Intro" )
				self.bPartStarted = true
			end
		end
		return nil, 0, 0
	end,
	Execute = function( self )
		if self.m_flVolume <= 0 then Director_Music_Stop( self, "Main" ) return end
		if !self.tHandles.Main then Director_Music_Play( self, "Main", "MUS_ShadowsOfDeath_Looper" ) end
	end
} )
