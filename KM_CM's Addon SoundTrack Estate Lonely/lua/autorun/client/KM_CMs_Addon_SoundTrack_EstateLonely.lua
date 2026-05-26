include "autorun/client/Director.lua"

Director_Music( "MUS_EstateLonely", "Music/EstateLonely.wav" )

DIRECTOR_ALLOCATE_HEAT_THEME( "DIRECTOR_TRACK_HEAT_EstateLonely", {
	Execute = function( self )
		if self.m_flVolume <= 0 then Director_Music_Stop( self, "Main" ) return end
		if !self.tHandles.Main then Director_Music_Play( self, "Main", "MUS_EstateLonely" ) end
	end
} )
