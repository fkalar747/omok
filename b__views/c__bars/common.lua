return function( connections )



	local o = {}

	local RGBY = {
		{1,0.1,0.2},
		{0.1,1,0.3},
		{0.4,0.4,1},
		{1,0.7,0.2}
	}

	function o.new()
		local bar = display.newGroup()
		bar.expanded = false

		local placeWidth = math.floor(g.W/4)
		bar.placeWidth = placeWidth



		local textSize = 40
		local bg = display.newRect(0,0,g.W+20,g.H)
		bg.anchorY = 1
		bg.y = textSize
		bg:setFillColor(0.1,0.1,0.1)
		bg.alpha = 0.6
		bar:insert(bg)
		bar.bg = bg
		bg.bar = bar

		bar.texts0 = {}

		bar.touch = barTouch
		bar:addEventListener("touch")

		for i = 1, 4 do 
			local text = display.newText("--", placeWidth*(i-2.5) ,0, native.systemFontBold, textSize)
			text:setFillColor(unpack(RGBY[i]))
			bar.texts0[i] = text
			bar:insert(text)
		end

		bar.yHidePos = g.T - textSize*1.5
		bar.yShowPos = textSize*2.5

		bar.x = g.CX
		return bar
	end

	return o 


end