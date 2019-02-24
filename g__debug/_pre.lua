return function( p , o , c )
	-- body

	local dimensions = modular_ros("dimensions")


	local funcs ={
		function(a,b,c)
			-- body
			print("hello dcode - watg32at")
		end,
		function(a,b,c)
			print("hello dcode - wa122at")
			-- body
		end,
		function(a,b,c)
			print("hello dcode - watg211t")
			-- body
		end
	}

	local numInRow = 7

	local gap = dimensions.W/numInRow
	local btnSize = gap*0.7
	local start = gap/2

	local touch = function(self,event)
		if event.phase == "ended" or event.phase == "cancelled" then 
			self.func()
		end
	end

	for i,f in ipairs(funcs) do 

		local rect = display.newRect(0,0,btnSize,btnSize)
		rect:setFillColor(0,0.3,0.2)
		rect.x = dimensions.L - start + (i%7)*gap
		rect.y = dimensions.T + start + math.floor(i/7)

		print("d-gwh0194081 creating a debug btn at "..rect.x .. " / " .. rect.y)

		rect.touch = touch
		rect.func = f

		rect:addEventListener("touch")
	end


	o.call_when_key_down_s = {}
	o.call_every_frame_when_key_down_s = {}


end