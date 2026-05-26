include "autorun/client/Director.lua"

Director_Music( "MUS_DrumRush", "Music/DrumRush.wav" )

DIRECTOR_ALLOCATE_COMBAT_THEME( "DIRECTOR_TRACK_DrumRush", {
	CheckIntro = function( self ) return true end,
	Intro = function( self ) return true end,
	Execute = function( self )
		if self.m_flVolume <= 0 then Director_Music_Stop( self, "Main" ) return end
		if !self.tHandles.Main then Director_Music_Play( self, "Main", "MUS_DrumRush" ) end
	end
} )
