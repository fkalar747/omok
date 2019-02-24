return function (p,o,c)
	-- body


	local dimensions = modular_ros("dimensions")
	local view_stoneGroups = modular_ros("views.pan.t3.stoneGroups")

	local woodenBoard = modular_ros("views.pan.t3.woodenBoard").dobj
	local t2 = modular_ros("views.pan.t2")
	
	o.showingStoneGroup = display.newGroup()
	o.showingStoneGroupColUbRow = nil


	o.func = function(iobj)
		
		-- body

		local curFocusColUbRow = t2.globalXYToColUbRowInT2(dimensions.CX,dimensions.CY) 


		if o.showingStoneGroupColUbRow ~= curFocusColUbRow then 

			o.showingStoneGroup.isVisible = false

			o.showingStoneGroup = view_stoneGroups.get(curFocusColUbRow)

			o.showingStoneGroup.isVisible = true
			o.showingStoneGroupColUbRow = curFocusColUbRow

			woodenBoard.x, woodenBoard.y = t2.colrowToXYInT2(o.showingStoneGroupColUbRow)

		end




	end


end