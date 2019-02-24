

local rect1 = display.newRect(100,100,100,100)
rect1:setFillColor(1,0,0)

function rect1:touch(event)
	print(" rect1 got : "..event.phase)
end

rect1:addEventListener("touch")