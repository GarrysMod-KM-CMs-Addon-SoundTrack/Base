include "autorun/client/Director.lua"

Director_Music( "MUS_MassiveAction4", "Music/MassiveAction4.wav" )

DIRECTOR_ALLOCATE_COMBAT_THEME( "DIRECTOR_TRACK_MassiveAction4", {
	Execute = function( self )
		if self.m_flVolume <= 0 then Director_Music_Stop( self, "Main" ) return end
		if !self.tHandles.Main then Director_Music_Play( self, "Main", "MUS_MassiveAction4" ) end
	end
} )
