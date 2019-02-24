return function(p,o,c)
	-- body

	local view_t2 = modular_ros("views.pan.t2")	



	local function make_interfaceObj(disobj)
		
		local pivotScale = nil
		local pivotX = nil
		local pivotY = nil

		local function pivot(iobj,x,y)
			pivotScale = disobj.xScale
			pivotX,pivotY = disobj:contentToLocal(x,y) 
		end

		local function update(iobj,avgX,avgY,multiplier)
				
			disobj.x =  avgX - pivotX*disobj.xScale 
			disobj.y =  avgY - pivotY*disobj.yScale 
			disobj.xScale = pivotScale * multiplier
			disobj.yScale = pivotScale * multiplier

			if iobj.updateListener then 
				--print(" dcode - 9g39ofg : multiplier " .. multiplier )
				iobj:updateListener()
			end
		end

		local interfaceObj = {}
		interfaceObj.disobj = disobj
		interfaceObj.pivot =  pivot
		interfaceObj.update =  update

		return interfaceObj
	end

	o.t2 = make_interfaceObj(view_t2.disobj)

end