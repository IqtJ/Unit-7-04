
-----------------------------------------------------------------------------------------
--
-- main.lua
--
-----------------------------------------------------------------------------------------

---background
local background = display.newImageRect( "assets/bg.png", 570, 355 )
background.x = display.contentCenterX
background.y = display.contentCenterY
background.id = "background" 

-- Gravity

local physics = require( "physics" )

physics.start()
physics.setGravity( 0, 25 ) -- ( x, y )


---ground
local theGround = display.newImageRect( "assets/land.png", 600, 120 )
theGround.x = display.contentCenterX
theGround.y = display.contentHeight
theGround.id = "the ground"
physics.addBody( theGround, "static", { 
    friction = 0.5, 
    bounce = 0.3 
    } )

--character (ninja)
local theCharacter = display.newImageRect( "assets/ninja.png", 50, 50 )
theCharacter.x = display.contentCenterX
theCharacter.y = display.contentCenterY
theCharacter.id = "the character"
physics.addBody( theCharacter, "dynamic", { 
    density = 3.0, 
    friction = 0.5, 
    bounce = 0.3 
    } )

--d-pad
local dPad = display.newImageRect( "assets/d-pad.png", 75, 75 )
dPad.x = 50
dPad.y = display.contentHeight - 80
dPad.alpha = 0.50
dPad.id = "d-pad"

--to go up
local upArrow = display.newImageRect( "assets/upArrow.png", 19, 14 )
upArrow.x = 50
upArrow.y = display.contentCenterY + 53
upArrow.id = "up arrow"


--to go down
local downArrow = display.newImageRect( "assets/downArrow.png", 19, 14 )
downArrow.x = 50
downArrow.y = display.contentCenterY + 108
downArrow.id = "down arrow"

--to go left
local leftArrow = display.newImageRect( "assets/leftArrow.png", 14, 19 )
leftArrow.x = 22
leftArrow.y = display.contentCenterY + 80
leftArrow.id = "left arrow"

-- to go right
local rightArrow = display.newImageRect( "assets/rightArrow.png", 14, 19 )
rightArrow.x = 78
rightArrow.y = display.contentCenterY + 80
rightArrow.id = "right arrow"
 


 -----functions
function upArrow:touch( event )
    if ( event.phase == "ended" ) then
        -- move the character up
        transition.moveBy( theCharacter, { 
        	x = 0, -- move 0 in the x direction 
        	y = -50, -- move up 50 pixels
        	time = 100 -- move in a 1/10 of a second
        	} )
    end

    return true
end

function downArrow:touch( event )
    if ( event.phase == "ended" ) then
        -- move the character up
        transition.moveBy( theCharacter, { 
        	x = 0, -- move 0 in the x direction 
        	y = 50, -- move up 50 pixels
        	time = 100 -- move in a 1/10 of a second
        	} )
    end

    return true
end

function leftArrow:touch( event )
    if ( event.phase == "ended" ) then
        -- move the character up
        transition.moveBy( theCharacter, { 
        	x = -50, -- move 0 in the x direction 
        	y = 0, -- move up 50 pixels
        	time = 100 -- move in a 1/10 of a second
        	} )
    end

    return true
end

function rightArrow:touch( event )
    if ( event.phase == "ended" ) then
        -- move the character up
        transition.moveBy( theCharacter, { 
        	x = 50, -- move 0 in the x direction 
        	y = 0, -- move up 50 pixels
        	time = 100 -- move in a 1/10 of a second
        	} )
    end

    return true
end


---event listeners
upArrow:addEventListener( "touch", upArrow )
downArrow:addEventListener( "touch", downArrow )
leftArrow:addEventListener( "touch", leftArrow )
rightArrow:addEventListener( "touch", rightArrow )