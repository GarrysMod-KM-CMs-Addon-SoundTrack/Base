include "autorun/client/Director.lua"

local WarmUpSoundGenerous = WarmUpSoundGenerous

Director_Music( "MUS_CityFight_0_1", "Music/CityFight/0/1.wav" )
Director_Music( "MUS_CityFight_0_2", "Music/CityFight/0/2.wav" )
Director_Music( "MUS_CityFight_0_3", "Music/CityFight/0/3.wav" )
Director_Music( "MUS_CityFight_0_4", "Music/CityFight/0/4.wav" )

local function WarmUp0()
	WarmUpSoundGenerous "MUS_CityFight_0_1"
	WarmUpSoundGenerous "MUS_CityFight_0_2"
	WarmUpSoundGenerous "MUS_CityFight_0_3"
	WarmUpSoundGenerous "MUS_CityFight_0_4"
end

Director_Music( "MUS_CityFight_1", "Music/CityFight/1.wav" )

Director_Music( "MUS_CityFight_2A", "Music/CityFight/2A.wav" )
Director_Music( "MUS_CityFight_2B", "Music/CityFight/2B.wav" )

local function WarmUp2()
	WarmUpSoundGenerous "MUS_CityFight_2A"
	WarmUpSoundGenerous "MUS_CityFight_2B"
end

Director_Music( "MUS_CityFight_3", "Music/CityFight/3.wav" )
Director_Music( "MUS_CityFight_4", "Music/CityFight/4.wav" )

Director_Music( "MUS_CityFight_5A", "Music/CityFight/5A.wav" )
Director_Music( "MUS_CityFight_5B", "Music/CityFight/5B.wav" )

local function WarmUp5()
	WarmUpSoundGenerous "MUS_CityFight_5A"
	WarmUpSoundGenerous "MUS_CityFight_5B"
end

Director_Music( "MUS_CityFight_6A", "Music/CityFight/6A.wav" )
Director_Music( "MUS_CityFight_6B", "Music/CityFight/6B.wav" )

local function WarmUp6()
	WarmUpSoundGenerous "MUS_CityFight_6A"
	WarmUpSoundGenerous "MUS_CityFight_6B"
end

Director_Music( "MUS_CityFight_7", "Music/CityFight/7.wav" )

Director_Music( "MUS_CityFight_8AA", "Music/CityFight/8AA.wav" )
Director_Music( "MUS_CityFight_8AB", "Music/CityFight/8AB.wav" )
Director_Music( "MUS_CityFight_8BA", "Music/CityFight/8BA.wav" )
Director_Music( "MUS_CityFight_8BB", "Music/CityFight/8BB.wav" )

local function WarmUp8()
	WarmUpSoundGenerous "MUS_CityFight_8AA"
	WarmUpSoundGenerous "MUS_CityFight_8AB"
	WarmUpSoundGenerous "MUS_CityFight_8BA"
	WarmUpSoundGenerous "MUS_CityFight_8BB"
end

Director_Music( "MUS_CityFight_9", "Music/CityFight/9.wav" )

Director_Music( "MUS_CityFight_10_1", "Music/CityFight/10/1.wav" )
Director_Music( "MUS_CityFight_10_2", "Music/CityFight/10/2.wav" )
Director_Music( "MUS_CityFight_10_3", "Music/CityFight/10/3.wav" )
Director_Music( "MUS_CityFight_10_4", "Music/CityFight/10/4.wav" )

local function WarmUp10()
	WarmUpSoundGenerous "MUS_CityFight_10_1"
	WarmUpSoundGenerous "MUS_CityFight_10_2"
	WarmUpSoundGenerous "MUS_CityFight_10_3"
	WarmUpSoundGenerous "MUS_CityFight_10_4"
end

local tostring = tostring
local math_random = math.random
local math_Rand = math.Rand
local math_Remap = math.Remap
local tIndex = {
	[ 0 ] = function( self )
		WarmUp0()
		WarmUpSoundGenerous "MUS_CityFight_1"
		if !self.tHandles.Main then
			if self.bPartStarted then
				self.bPartStarted = nil
				if math_Rand( 0, math.Remap( DIRECTOR_MUSIC_TENSION, 0, 1, 4, 1.5 ) ) <= 1 then
					self.iIndex = 1
					return
				end
			end
			Director_Music_Play( self, "Main", "MUS_CityFight_0_" .. tostring( math_random( 1, 4 ) ) )
			self.bPartStarted = true
		end
	end,
	[ 1 ] = function( self )
		WarmUp2()
		if !self.tHandles.Main then
			if self.bPartStarted then
				self.bPartStarted = nil
				if math_Rand( 0, math_Remap( DIRECTOR_MUSIC_TENSION, 0, 1, 2, 1.25 ) ) <= 1 then self.iIndex = 2 return end
			end
			Director_Music_Play( self, "Main", "MUS_CityFight_1" )
			self.bPartStarted = true
		end
	end,
	[ 2 ] = function( self )
		WarmUp2()
		WarmUpSoundGenerous "MUS_CityFight_3"
		if !self.tHandles.Main then
			if self.bPartStarted then
				self.bPartStarted = nil
				if math_Rand( 0, math_Remap( DIRECTOR_MUSIC_TENSION, 0, 1, 2, 1.25 ) ) <= 1 then self.iIndex = 3 return end
			end
			Director_Music_Play( self, "Main", "MUS_CityFight_2" .. ( math_random( 2 ) == 1 && "A" || "B" ) )
			self.bPartStarted = true
		end
	end,
	[ 3 ] = function( self )
		WarmUpSoundGenerous "MUS_CityFight_4"
		if !self.tHandles.Main then
			if self.bPartStarted then
				self.bPartStarted = nil
				if math_Rand( 0, math_Remap( DIRECTOR_MUSIC_TENSION, 0, 1, 2, 1.25 ) ) <= 1 then self.iIndex = 4 return end
			end
			Director_Music_Play( self, "Main", "MUS_CityFight_3" )
			self.bPartStarted = true
		end
	end,
	[ 4 ] = function( self )
		WarmUp5()
		if !self.tHandles.Main then
			if self.bPartStarted then
				self.bPartStarted = nil
				self.iIndex = 5
				return
			end
			Director_Music_Play( self, "Main", "MUS_CityFight_4" )
			self.bPartStarted = true
		end
	end,
	[ 5 ] = function( self )
		WarmUp5()
		WarmUp6()
		if !self.tHandles.Main then
			if self.bPartStarted then
				self.bPartStarted = nil
				if math_Rand( 0, math_Remap( DIRECTOR_MUSIC_TENSION, 0, 1, 2, 1.25 ) ) <= 1 then self.iIndex = 6 return end
			end
			Director_Music_Play( self, "Main", "MUS_CityFight_5" .. ( math_random( 2 ) == 1 && "A" || "B" ) )
			self.bPartStarted = true
		end
	end,
	[ 6 ] = function( self )
		WarmUp6()
		WarmUpSoundGenerous "MUS_CityFight_7"
		if !self.tHandles.Main then
			if self.bPartStarted then
				self.bPartStarted = nil
				if math_Rand( 0, math_Remap( DIRECTOR_MUSIC_TENSION, 0, 1, 2, 1.25 ) ) <= 1 then self.iIndex = 7 return end
			end
			Director_Music_Play( self, "Main", "MUS_CityFight_6" .. ( math_random( 2 ) == 1 && "A" || "B" ) )
			self.bPartStarted = true
		end
	end,
	[ 7 ] = function( self )
		WarmUp8()
		if !self.tHandles.Main then
			if self.bPartStarted then
				self.bPartStarted = nil
				self.iIndex = 8
				return
			end
			Director_Music_Play( self, "Main", "MUS_CityFight_7" )
			self.bPartStarted = true
		end
	end,
	[ 8 ] = function( self )
		WarmUp8()
		WarmUpSoundGenerous "MUS_CityFight_9"
		if !self.tHandles.Main then
			if self.bPartStarted then
				self.bPartStarted = nil
				if math_Rand( 0, math_Remap( DIRECTOR_MUSIC_TENSION, 0, 1, 8, 4 ) ) <= 1 then self.iIndex = 9 return end
			end
			Director_Music_Play( self, "Main", "MUS_CityFight_8" .. ( self.bB && "B" || "A" ) .. ( math_random( 2 ) == 1 && "A" || "B" ) )
			self.bB = !self.bB
			self.bPartStarted = true
		end
	end,
	[ 9 ] = function( self )
		WarmUp10()
		if !self.tHandles.Main then
			if self.bPartStarted then
				self.bPartStarted = nil
				self.iIndex = 10
				return
			end
			Director_Music_Play( self, "Main", "MUS_CityFight_9" )
			self.bPartStarted = true
		end
	end,
	[ 10 ] = function( self )
		WarmUp10()
		WarmUp0()
		if !self.tHandles.Main then
			if self.bPartStarted then
				self.bPartStarted = nil
				self.iIndex = 0
				return
			end
			Director_Music_Play( self, "Main", "MUS_CityFight_10_" .. tostring( math_random( 1, 4 ) ) )
			self.bPartStarted = true
		end
	end
}
DIRECTOR_ALLOCATE_COMBAT_THEME( "DIRECTOR_TRACK_CityFight", {
	CheckIntro = function( self ) return true end,
	Intro = function( self ) return true end,
	Execute = function( self ) ( tIndex[ self.iIndex ] || tIndex[ 0 ] )( self ) end
} )
