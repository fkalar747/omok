return function(pre,calldepth)
	-- body
	local dimensions = modular_get(pre,"dimensions")

	local disobj = display.newGroup()
	pre.disobj = disobj

	for k,v in pairs(pre.__child_s) do 

		disobj:insert(v.disobj)

	end

	disobj.x = dimensions.CX
	disobj.y = dimensions.CY
	disobj.__dcode = "gydn323nso"



	local panPlaceSize = dimensions.panPlaceSize
	pre.globalXYToColUbRowInT2 = function(x,y)
		-- body
		
		x,y = disobj:contentToLocal(x,y)
		local col = math.floor((x+panPlaceSize/2)/panPlaceSize) + 6
		local row = math.floor((y+panPlaceSize/2)/panPlaceSize) + 6

		return col.."_"..row
	end


end