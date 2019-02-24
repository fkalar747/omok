return function (p,c)

	
	local stones = modular_gos(p,"stones")

	local function put(self,record)
		local stone = stones.new(record)  
		self:insert(stone)
		stone.x,stone.y = colubrowToXYInT3(record.colubrow)
		return stone
	end

	local kanPlaceSize = modular_ros("dimensions").kanPlaceSize

	local function globalXYtoColubrow(self,x,y)
		local x_l,y_l = self:contentToLocal(x,y)
		
		local col = math.floor((x+kanPlaceSize/2)/kanPlaceSize) + 6
		local row = math.floor((y+kanPlaceSize/2)/kanPlaceSize) + 6

		return col.."_"..row

	end

	for k,stoneGroup in pairs(p.lib) do 
		stoneGroup.put = put
	end


end