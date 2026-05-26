include "autorun/client/Director.lua"

Director_Music( "MUS_NuclearMissionJam_Intro", "Music/NuclearMissionJam/Intro.wav" )

// This is not a looper. Loopers are when you have to modify a track
// a lot to make it loop, part of it being in the intro. This one is
// not a looper because the part of the end in the beginning is so
// well hidden that the brain does not notice it, and as such the
// intro is an intro, not a part of the song.
Director_Music( "MUS_NuclearMissionJam", "Music/NuclearMissionJam/Track.wav" )

DIRECTOR_ALLOCATE_COMBAT_THEME( "DIRECTOR_TRACK_NuclearMissionJam", {
	CheckIntro = function( self ) return true end,
	Intro = function( self )
		WarmUpSoundGenerous "MUS_NuclearMissionJam"
		if !self.tHandles.Main then
			if self.bPartStarted then
				self.bPartStarted = nil
				Director_Music_Stop( self.m_pSource, "Main" )
				return true, 0, 1
			else
				Director_Music_Play( self, "Main", "MUS_NuclearMissionJam_Intro" )
				self.bPartStarted = true
			end
		end
		return nil, 0, 0
	end,
	Execute = function( self )
		if self.m_flVolume <= 0 then Director_Music_Stop( self, "Main" ) return end
		if !self.tHandles.Main then Director_Music_Play( self, "Main", "MUS_NuclearMissionJam" ) end
	end
} )
