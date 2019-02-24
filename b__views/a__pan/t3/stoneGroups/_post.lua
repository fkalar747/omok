return function (p,c)

	
	local stones = modular_gos(p,"stones")

	local function put(self,record)
		local stone = stones.new(record)  
		self:insert(stone)
		stone.x,stone.y = colubrowToXYInT3(record.colubrow)
		return stone
	end

	for k,stoneGroup in pairs(p.lib) do 
		stoneGroup.put = put
	end


end