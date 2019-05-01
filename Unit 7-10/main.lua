-----------------------------------------------------------------------------------------
--
-- Created by: Matsuru Hoshi
-- Created on: Apr 30, 2019
--
-- This file plays with animation
-----------------------------------------------------------------------------------------

local sheetOptionsIdle =
{
    width = 232,
    height = 439,
    numFrames = 12
}
local sheetIdleNinja = graphics.newImageSheet( "assets/NinjaIdle.png", sheetOptionsIdle )

local sheetOptionsWalk =
{
    width = 363,
    height = 458,
    numFrames = 10
}
local sheetWalkingNinja = graphics.newImageSheet( "assets/NinjaRunning.png", sheetOptionsWalk )

local sheetOptionsAttack =
{
    width = 536,
    height = 495,
    numFrames = 12
}
local sheetAttackingNinja = graphics.newImageSheet( "assets/NinjaAttack.png", sheetOptionsAttack )

-- sequences table
local sequence_data = {
    -- consecutive frames sequence
    {
        name = "idle",
        start = 1,
        count = 10,
        time = 800,
        loopCount = 0,
        sheet = sheetIdleNinja
    },
    {
        name = "walk",
        start = 1,
        count = 10,
        time = 800,
        loopCount = 0,
        sheet = sheetWalkingNinja
    }
}

local sequenceData = {
	{	
    	name = "attack",
        start = 1,
        count = 10,
        time = 800,
        loopCount = 0,
        sheet = sheetAttackingNinja
	}
}

local AttackNinja = display.newSprite( sheetAttackingNinja, sequenceData )
AttackNinja.x = 160
AttackNinja.y = 100
AttackNinja.xScale = 300/536
AttackNinja.yScale = 277/495

AttackNinja:play()

local ninja = display.newSprite( sheetIdleNinja, sequence_data )
ninja.x = display.contentWidth / 2
ninja.y = 300
ninja.xScale = 58/363
ninja.yScale = 77/458

ninja:play()

-- After a short time, swap the sequence to 'seq2' which uses the second image sheet
local function swapSheet()
    ninja:setSequence( "walk" )
    ninja:play()
    print("walk")
end

timer.performWithDelay( 2000, swapSheet )


