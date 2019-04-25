-----------------------------------------------------------------------------------------
--
-- Created By:Wajd Mariam
-- Created by:April
-----------------------------------------------------------------------------------------

local ball1 = display.newImageRect ("assets/sprites/SoccerBall.png" , 150, 150)
ball1.x = display.contentCenterX
ball1.y = display.contentCenterY
ball1.id = "Soccer Ball"

local function ball1Touch( event )
	if ( event.phase == "began" ) then

        print( "Touch event began on: " .. event.target.id )


         ball1.y = ball1.y - 50

    end

  

    return true

end



ball1:addEventListener( "touch", ball1Touch )


--Comprehensive Touch Event

local ball2 = display.newImageRect ("assets/sprites/VolleyBall.png" , 150, 150)
ball2.x = display.contentCenterX
ball2.y = 400
ball2.id = "Volley Ball"

function ball2touch( event )
 local self = event.target
    if ( event.phase == "began" ) then

        print( "Touch event began on: " .. self.id )

 

        -- Set touch focus

        display.getCurrentStage():setFocus( self )

        self.isFocus = true

        

        self.markX = self.x

    	self.markY = self.y

     

    elseif ( self.isFocus ) then

        if ( event.phase == "moved" ) then

            print( "Moved phase of touch event detected." )

 			

 			self.x = event.x - event.xStart + self.markX

      		self.y = event.y - event.yStart + self.markY

        elseif ( event.phase == "ended" or event.phase == "cancelled" ) then

 

            -- Reset touch focus

            display.getCurrentStage():setFocus( nil )

            self.isFocus = nil

            print( "Touch event ended on: " .. self.id )

        end

    end



    return true

end



ball2:addEventListener( "touch", ball2touch )
