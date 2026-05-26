include "autorun/client/Director.lua"

Director_Music( "MUS_NowOrNever_Intro", "Music/NowOrNever/Intro.wav" )
Director_Music( "MUS_NowOrNever", "Music/NowOrNever/Track.wav" )

DIRECTOR_ALLOCATE_COMBAT_THEME( "DIRECTOR_TRACK_NowOrNever", {
	CheckIntro = function( self ) return true end,
	Intro = function( self )
		WarmUpSoundGenerous "MUS_NowOrNever"
		if !self.tHandles.Main then
			if self.bPartStarted then
				self.bPartStarted = nil
				Director_Music_Stop( self.m_pSource, "Main" )
				return true, 0, 1
			else
				Director_Music_Play( self, "Main", "MUS_NowOrNever_Intro" )
				self.bPartStarted = true
			end
		end
		return nil, 0, 0
	end,
	Execute = function( self )
		if self.m_flVolume <= 0 then Director_Music_Stop( self, "Main" ) return end
		if !self.tHandles.Main then Director_Music_Play( self, "Main", "MUS_NowOrNever" ) end
	end
} )
