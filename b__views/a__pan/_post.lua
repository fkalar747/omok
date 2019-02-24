return function(p)


	local t2 = modular_ros("views.pan.t2").disobj
	
	local woodenBoard = modular_ros("views.pan.t3.woodenBoard").disobj
	local stoneGroupLib = modular_ros("views.pan.t3.stoneGroups").lib

	t2:insert(woodenBoard)
	for k,v in pairs(stoneGroupLib) do 
		t2:insert(v)
	end

end