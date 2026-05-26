include "autorun/client/Director.lua"

Director_Music( "MUS_EstateCommandos", "Music/EstateCommandos.wav" )

local t = {
	Execute = function( self )
		if self.m_flVolume <= 0 then Director_Music_Stop( self, "Main" ) return end
		if !self.tHandles.Main then Director_Music_Play( self, "Main", "MUS_EstateCommandos" ) end
	end
}
DIRECTOR_ALLOCATE_AGGRESSIVE_SEARCH_THEME( "DIRECTOR_TRACK_SEARCH_EstateCommandos", t )
DIRECTOR_ALLOCATE_ALERT_THEME( "DIRECTOR_TRACK_SEARCH_EstateCommandos", t )
