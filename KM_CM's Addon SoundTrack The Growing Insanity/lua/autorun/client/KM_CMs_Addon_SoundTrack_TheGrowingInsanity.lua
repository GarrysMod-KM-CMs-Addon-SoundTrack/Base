include "autorun/client/Director.lua"

Director_Music( "MUS_TheGrowingInsanity", "Music/TheGrowingInsanity.wav" )

DIRECTOR_ALLOCATE_COMBAT_THEME( "DIRECTOR_TRACK_TheGrowingInsanity", {
	CheckIntro = function( self ) return true end,
	Intro = function( self ) Director_Music_Stop( self, "Main" ) return true end,
	Execute = function( self )
		if self.m_flVolume <= 0 then Director_Music_Stop( self, "Main" ) return end
		if !self.tHandles.Main then Director_Music_Play( self, "Main", "MUS_TheGrowingInsanity" ) end
	end
} )
