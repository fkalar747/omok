return function (p,o,c )
	
	local dimensions = modular_ros("dimensions")

	o.colrowToXYInT2 = function(colrow)
		-- body
		local col,row = colrow:match("(%d+)_(%d+)")

		local x = dimensions.panPlaceSize*(col-6)
		local y = dimensions.panPlaceSize*(row-6)

		return x,y
	end



end