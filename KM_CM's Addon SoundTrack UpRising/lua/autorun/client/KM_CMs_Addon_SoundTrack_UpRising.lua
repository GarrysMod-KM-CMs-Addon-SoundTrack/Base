include "autorun/client/Director.lua"

Director_Music( "MUS_UpRising_Intro", "Music/UpRising/Intro.wav" )
Director_Music( "MUS_UpRising", "Music/UpRising/Track.wav" )

DIRECTOR_ALLOCATE_COMBAT_THEME( "DIRECTOR_TRACK_UpRising", {
	CheckIntro = function( self ) return true end,
	Intro = function( self, flInterval, flVolumeA, flVolumeB, bCorrect )
		if !bCorrect then
			if flVolumeA > 0 then
				flVolumeA = flVolumeA < .1 && math.Approach( flVolumeA, 0, flInterval ) || Lerp( .1 * flInterval, flVolumeA, 0 )
				return false, flVolumeB, flVolumeA
			end
			if self.m_ELayerFrom == DIRECTOR_THREAT_NULL then return true end
			if flVolumeB >= 1 then return true end
			flVolumeB = flVolumeB > .9 && math.Approach( flVolumeB, 1, flInterval ) || Lerp( .1 * flInterval, flVolumeB, 1 )
			return false, 0, flVolumeB
		end
		WarmUpSoundGenerous "MUS_UpRising"
		if !self.tHandles.Main then
			if self.bPartStarted then
				self.bPartStarted = nil
				Director_Music_Stop( self.m_pSource, "Main" )
				return true, 0, 1
			else
				Director_Music_Play( self, "Main", "MUS_UpRising_Intro" )
				self.bPartStarted = true
			end
		end
		return nil, 0, 0
	end,
	Execute = function( self )
		if self.m_flVolume <= 0 then Director_Music_Stop( self, "Main" ) return end
		if !self.tHandles.Main then Director_Music_Play( self, "Main", "MUS_UpRising" ) end
	end
} )
