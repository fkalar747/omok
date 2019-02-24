return function (p,o,c)
	-- body

	local dimensions = modular_ros("dimensions")

	o.new = function(stoneInfo)
	
		local stone = display.newGroup()

		local circ = display.newCircle(0,0,dimensions.stoneSize)
		circ:setFillColor(u.randoms(3))
		circ:setStrokeColor(0,0,0)
		circ.strokeWidth = 2
		stone:insert(circ)

		local letter = display.newText(char, 0, 0, native.systemFontBold, 20)
		letter.xScale = 0.5
		letter.yScale = 0.5
		letter:setFillColor(u.randoms(3))
		stone:insert(letter)

		return stone 
	
	end


end