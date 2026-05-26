include "autorun/client/Director.lua"

Director_Music( "MUS_SuddenDistress", "Music/SuddenDistress.wav" )

DIRECTOR_ALLOCATE_HOLD_FIRE_THEME( "DIRECTOR_TRACK_SuddenDistress", {
	Execute = function( self )
		if self.m_flVolume <= 0 then Director_Music_Stop( self, "Main" ) return end
		if !self.tHandles.Main then Director_Music_Play( self, "Main", "MUS_SuddenDistress" ) end
	end
} )
