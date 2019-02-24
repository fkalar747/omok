return function (parent,o,call_stack)
	
	print_in(call_stack," dcode - gia029g")
	
	local dimensions = modular_get(parent,"dimensions")

	local board = display.newGroup()
	o.dobj = board


	local interval = dimensions.kanSize
	local numSquare = dimensions.numKan
	local numlines = dimensions.numKan-1
	local size = dimensions.panSize
	local start = -size/2


	local backBoard = display.newRect(0,0,size,size) 
	backBoard:setFillColor(unpack(u.hexColor("0xd7af70")))
	board.backBoard = backBoard
	board:insert(backBoard)

	for i0 = 1,2 do
		local gapX = (i0%2)*interval
		local gapY = ((i0+1)%2)*interval

		local lenX = gapY*(numSquare)
		local lenY = gapX*(numSquare)
		for i = 1, 10 do
			local startX = start+gapX*i
			local startY = start+gapY*i

			local line = display.newLine(startX,startY,startX+lenX,startY+lenY)
			line:setStrokeColor(unpack(u.hexColor("0x252624")))
			line.strokeWidth = 3
			board:insert(line)	
		end
	end
	
end