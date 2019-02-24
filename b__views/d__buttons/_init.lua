return function ( main, parent_bag )
	-- body	


	local ButtonInfos = {}

	local dimensions = g_namepacks.dimensions

	ButtonInfos.history = function()
		require("modals.history"):show()
	end

	ButtonInfos.target = function()
		globalView:focusPan()
	end
	ButtonInfos.map = function()
		globalView:focusMap()
	end


	ButtonInfos.store = function()
		require("modals.store"):show()	
	end

	ButtonInfos.account = function()
		require("modals.account"):show()	
	end

	local count = 0


	dimensions.iconSize = math.floor(dimensions.W/5*0.5)
	dimensions.iconPlaceSize = math.floor(dimensions.W/5)


	local btns = {}


	local count = 0
	for k,v in pairs(ButtonInfos) do
		count = count+1

		local btn = display.newGroup()
		local icon = display.newImageRect("res/main_icons/"..k..".png",dimensions.iconSize,dimensions.iconSize)
		btn:insert(icon)
	 	
	 	table.insert(btns,btn)

		-- btn[1].idleColor = {0,0.1,0.2}
		-- btn[1].pressedColor = {0,0.4,0.4}
		-- btn[1]:setFillColor(unpack(btn[1].idleColor))

		btn.x = dimensions.L + dimensions.iconPlaceSize*(count-0.5)
		btn.y = dimensions.B - dimensions.iconPlaceSize*0.5
		
		btn.touch = function(self,event)
			if event.phase == "began" then
				display.getCurrentStage():setFocus(self)
				for i = 1,self.numChildren do
					self[i]:setFillColor(1,0,0)
				end
			elseif event.phase == "ended" or event.phase == "cancelled" then
				display.getCurrentStage():setFocus(nil)
				for i = 1,self.numChildren do
					self[i]:setFillColor(1,1,1)
				end
				v()
			end
			return true
		end
		
		btn:addEventListener("touch")
	end

	return btns



end  