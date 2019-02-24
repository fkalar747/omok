return function (p,o,c)
	-- body

	local dimensions = modular_ros("dimensions")

	local kanPlaceSize = dimensions.kanPlaceSize
	o.colubrowToXYInT3 = function(colubrow)
		-- body
		local col,row = colubrow:match("(%d+)_(%d+)")

		local x = dimensions.kanPlaceSize*(col-6)
		local y = dimensions.kanPlaceSize*(row-6)

		return x,y
	end




end