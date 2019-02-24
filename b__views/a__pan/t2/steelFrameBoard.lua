return function (parent,o)
	-- body

	
	local dimensions = modular_get(parent_module,"dimensions")

	local panBoardPlane = display.newGroup()
	o.dobj = panBoardPlane

	for i0 = 1,2 do
		local gapX = (i0%2)*dimensions.panPlaceSize
		local gapY = ((i0+1)%2)*dimensions.panPlaceSize

		local lenX = gapY*(dimensions.numPan)
		local lenY = gapX*(dimensions.numPan)
		for i = 1, (dimensions.numPan-1) do
			local startX = dimensions.panStart+gapX*i
			local startY = dimensions.panStart+gapY*i

			local line = display.newLine(startX,startY,startX+lenX,startY+lenY)
			line:setStrokeColor(unpack(u.hexColor("0x454644")))
			line.strokeWidth = dimensions.panStrokeWidth
			panBoardPlane:insert(line)	
		end
	end

	return panBoardPlane
end
