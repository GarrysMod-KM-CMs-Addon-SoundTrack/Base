include "autorun/client/Director.lua"

Director_Music( "MUS_MassiveAction1", "Music/MassiveAction1.wav" )

DIRECTOR_ALLOCATE_COMBAT_THEME( "DIRECTOR_TRACK_MassiveAction1", {
	CheckIntro = function( self ) return true end,
	Intro = function( self ) return true end,
	Execute = function( self )
		if self.m_flVolume <= 0 then Director_Music_Stop( self, "Main" ) return end
		if !self.tHandles.Main then Director_Music_Play( self, "Main", "MUS_MassiveAction1" ) end
	end
} )
