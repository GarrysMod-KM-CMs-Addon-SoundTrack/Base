include "autorun/client/Director.lua"

Director_Music( "MUS_Arachnophobia_Intro", "Music/Arachnophobia/Intro.wav" )
Director_Music( "MUS_Arachnophobia_Generic", "Music/Arachnophobia/Generic.wav" )
Director_Music( "MUS_Arachnophobia_Special", "Music/Arachnophobia/Special.wav" )
// TODO: Make an outro when we have working outros
Director_Music( "MUS_Arachnophobia_Outro", "Music/Arachnophobia/Outro.wav" )

local tIndex = {
	[ 0 ] = function( self )
		WarmUpSoundGenerous "MUS_Arachnophobia_Special"
		if !self.tHandles.Main then
			if self.bPartStarted then
				self.bPartStarted = nil
				self.iIndex = 1
			else
				Director_Music_Play( self, "Main", "MUS_Arachnophobia_Generic" )
				self.bPartStarted = true
			end
		end
	end,
	[ 1 ] = function( self )
		if !self.tHandles.Main then
			if self.bPartStarted then
				self.bPartStarted = nil
				// I'm too bored to code a loop, so this'll do xD
				self.iIndex = 2
			else
				Director_Music_Play( self, "Main", "MUS_Arachnophobia_Special" )
				self.bPartStarted = true
			end
		end
	end,
	[ 2 ] = function( self )
		if !self.tHandles.Main then
			if self.bPartStarted then
				self.bPartStarted = nil
				self.iIndex = 0
			else
				Director_Music_Play( self, "Main", "MUS_Arachnophobia_Special" )
				self.bPartStarted = true
			end
		end
	end
}

DIRECTOR_ALLOCATE_COMBAT_THEME( "DIRECTOR_TRACK_Arachnophobia", {
	CheckIntro = function( self ) return true end,
	Intro = function( self )
		WarmUpSoundGenerous "MUS_Arachnophobia_Generic"
		WarmUpSoundGenerous "MUS_Arachnophobia_Outro"
		if !self.tHandles.Main then
			if self.bPartStarted then
				self.bPartStarted = nil
				local p = self.m_pSource
				p.bPartStarted = nil
				p.iIndex = 0
				Director_Music_Stop( p, "Main" )
				return true, 0, 1
			else
				Director_Music_Play( self, "Main", "MUS_Arachnophobia_Intro" )
				self.bPartStarted = true
			end
		end
		return nil, 0, 0
	end,
	Execute = function( self )
		if self.m_flVolume <= 0 then Director_Music_Stop( self, "Main" ) return end
		( tIndex[ self.iIndex ] || tIndex[ 0 ] )( self )
	end
} )
