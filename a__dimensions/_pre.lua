return function(parent,o)
	
	-- setfenv(1,namepacked("a"))
	-- g_namepacks[name] = getfenv(1)

	local dimensions = o

	dimensions.W = display.safeActualContentWidth
	dimensions.H = display.safeActualContentHeight
	dimensions.CX = display.contentCenterX
	dimensions.CY = display.contentCenterY
	dimensions.L = display.safeScreenOriginX
	dimensions.T = display.safeScreenOriginY
	dimensions.R = display.safeScreenOriginX+display.safeActualContentWidth
	dimensions.B = display.safeScreenOriginY+display.safeActualContentHeight
	dimensions.Mult = dimensions.W/320

	dimensions.iconSize = math.floor(dimensions.W/5*0.5)
	dimensions.iconPlaceSize = math.floor(dimensions.W/5)

	dimensions.kanSize =dimensions.Mult*20
	dimensions.numKan = 11  
	dimensions.panSize = dimensions.numKan*dimensions.kanSize
	dimensions.numPan = 11
	dimensions.numT3 = 11
	dimensions.numT4 = 11
	dimensions.panStrokeWidth = dimensions.Mult*12
	dimensions.stoneSize = dimensions.kanSize * 0.35
	dimensions.kanPlaceSize = dimensions.kanSize
	dimensions.panPlaceSize = dimensions.panSize+dimensions.panStrokeWidth	
	dimensions.globalSize = (dimensions.panPlaceSize)*dimensions.numPan
	dimensions.kanStart = -dimensions.panSize/2
	dimensions.panStart = -dimensions.globalSize/2

	dump_table(-3,dimensions)

	return o
end