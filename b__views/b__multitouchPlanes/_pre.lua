return function (parent_module,o,calldepth)
	-- body
	local dimensions = modular_get(parent_module,"dimensions")

	local backPlanes = display.newGroup()
	backPlanes:insert(display.newRect(dimensions.CX,dimensions.CY,dimensions.W+40,dimensions.H+40))
	backPlanes:insert(display.newRect(dimensions.CX,dimensions.CY,dimensions.W+40,dimensions.H+40))

	for i=1,backPlanes.numChildren do 
		backPlanes[i].isVisible = false
	end

	o.group = backPlanes
end
