return function (parent,o)
	-- body

	local dimensions = modular_ros("dimensions")

	local group = display.newGroup()
	o.dobj = group

	local defaultColor = {0.3,0.3,0.5}

	for i = 1,11 do
		for j = 1,11 do
			local colrow = i.."_"..j
			local x,y = parent.colrowToXYInT2(colrow)
			local panColorSquare = display.newRect(x,y,dimensions.panPlaceSize,dimensions.panPlaceSize)
			panColorSquare:setFillColor(u.randoms(3))
			group:insert(panColorSquare)
			group[colrow] = panColorSquare	
		end
	end



	local coefs = {	
		{0.9,0.1,0.1},
		{0.1,0.9,0.2},
		{0.1,0.1,0.9},
		{0.9,0.7,0.2}
	}

	return group

end