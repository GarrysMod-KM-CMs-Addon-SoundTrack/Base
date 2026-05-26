include "autorun/client/Director.lua"

Director_Music( "MUS_EstateRedOut", "Music/EstateRedOut.wav" )

local t = {
	Execute = function( self )
		if self.m_flVolume <= 0 then Director_Music_Stop( self, "Main" ) return end
		if !self.tHandles.Main then Director_Music_Play( self, "Main", "MUS_EstateRedOut" ) end
	end
}
DIRECTOR_ALLOCATE_AGGRESSIVE_SEARCH_THEME( "DIRECTOR_TRACK_SEARCH_EstateRedOut", t )
DIRECTOR_ALLOCATE_ALERT_THEME( "DIRECTOR_TRACK_SEARCH_EstateRedOut", t )
