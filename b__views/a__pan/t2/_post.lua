return function(pre,calldepth)
	-- body
	local dimensions = modular_get(pre,"dimensions")

	local dobj = display.newGroup()
	pre.dobj = dobj

	for k,v in pairs(pre.__child_s) do 

		dobj:insert(v.dobj)

	end

	dobj.x = dimensions.CX
	dobj.y = dimensions.CY
	dobj.__dcode = "gydn323nso"



	local panPlaceSize = dimensions.panPlaceSize
	pre.globalXYToColUbRowInT2 = function(x,y)
		-- body
		
		x,y = dobj:contentToLocal(x,y)
		local col = math.floor((x+panPlaceSize/2)/panPlaceSize) + 6
		local row = math.floor((y+panPlaceSize/2)/panPlaceSize) + 6

		return col.."_"..row
	end


end