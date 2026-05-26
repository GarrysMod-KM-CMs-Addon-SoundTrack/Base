include "autorun/client/Director.lua"

Director_Music( "MUS_PrivateEstate", "Music/PrivateEstate.wav" )

DIRECTOR_ALLOCATE_ALERT_THEME( "DIRECTOR_TRACK_SEARCH_PrivateEstate", {
	Execute = function( self )
		if self.m_flVolume <= 0 then Director_Music_Stop( self, "Main" ) return end
		if !self.tHandles.Main then Director_Music_Play( self, "Main", "MUS_PrivateEstate" ) end
	end
} )
