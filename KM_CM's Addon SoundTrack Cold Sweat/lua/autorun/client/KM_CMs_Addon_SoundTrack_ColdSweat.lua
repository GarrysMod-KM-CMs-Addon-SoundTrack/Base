include "autorun/client/Director.lua"

Director_Music( "MUS_ColdSweat", "Music/ColdSweat.wav" )

DIRECTOR_ALLOCATE_HEAT_THEME( "DIRECTOR_TRACK_HEAT_ColdSweat", {
	Execute = function( self )
		if self.m_flVolume <= 0 then Director_Music_Stop( self, "Main" ) return end
		if !self.tHandles.Main then Director_Music_Play( self, "Main", "MUS_ColdSweat" ) end
	end
} )
