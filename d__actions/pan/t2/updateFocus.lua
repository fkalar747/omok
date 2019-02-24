return function (p,o,c)
	-- body


	local dimensions = modular_ros("dimensions")
	local view_stoneGroups = modular_ros("views.pan.t3.stoneGroups")

	local woodenBoard = modular_ros("views.pan.t3.woodenBoard").disobj
	local t2 = modular_ros("views.pan.t2")
	
	local showingStoneGroup = display.newGroup()
	local showingStoneGroupColUbRow = nil


	o.func = function(iobj)
		
		-- body

		local curFocusColUbRow = t2.globalXYToColUbRowInT2(dimensions.CX,dimensions.CY) 


		if showingStoneGroupColUbRow ~= curFocusColUbRow then 

			showingStoneGroup.isVisible = false

			showingStoneGroup = view_stoneGroups.get(curFocusColUbRow)

			showingStoneGroup.isVisible = true
			showingStoneGroupColUbRow = curFocusColUbRow

			woodenBoard.x, woodenBoard.y = t2.colrowToXYInT2(showingStoneGroupColUbRow)

		end




	end


end