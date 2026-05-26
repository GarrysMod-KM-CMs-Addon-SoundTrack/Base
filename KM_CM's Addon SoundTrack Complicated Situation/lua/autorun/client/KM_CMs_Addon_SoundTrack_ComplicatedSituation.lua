include "autorun/client/Director.lua"

Director_Music( "MUS_ComplicatedSituation", "Music/ComplicatedSituation.wav" )

DIRECTOR_ALLOCATE_HOLD_FIRE_THEME( "DIRECTOR_TRACK_ComplicatedSituation", {
	Execute = function( self )
		if self.m_flVolume <= 0 then Director_Music_Stop( self, "Main" ) return end
		if !self.tHandles.Main then Director_Music_Play( self, "Main", "MUS_ComplicatedSituation" ) end
	end
} )
