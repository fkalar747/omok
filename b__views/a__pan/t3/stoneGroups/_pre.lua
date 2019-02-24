return function(parent,o,callstack)
	-- body
	print_in(callstack," iam - k3g02g23")

	local dimensions = modular_ros("dimensions")
	local colrowToXYInT2 = modular_ros("views.pan.t2").colrowToXYInT2

	local lib = {}
	o.lib = lib 


	modular_ros("views.pan").forColUbRow(function(colubrow)
		-- body
		local stoneGroup = display.newGroup()
		stoneGroup.x,stoneGroup.y = colrowToXYInT2(colubrow)
		lib[colubrow] = stoneGroup	
	end)




	o.get = function(colubrow)
		-- body
		print(" dcode - g023ngf02 " .. colubrow)

		assert(lib[colubrow])

		return lib[colubrow]
	end


end