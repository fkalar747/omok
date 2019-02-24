return function(p,o,c)
	-- body

	local view_t2 = modular_ros("views.pan.t2")	



	local function make_interfaceObj(dobj)
		
		local pivotScale = nil
		local pivotX = nil
		local pivotY = nil

		local function pivot(iobj,x,y)
			pivotScale = dobj.xScale
			pivotX,pivotY = dobj:contentToLocal(x,y) 
		end

		local function update(iobj,avgX,avgY,multiplier)
				
			dobj.x =  avgX - pivotX*dobj.xScale 
			dobj.y =  avgY - pivotY*dobj.yScale 
			dobj.xScale = pivotScale * multiplier
			dobj.yScale = pivotScale * multiplier

			if iobj.updateListener then 
				--print(" dcode - 9g39ofg : multiplier " .. multiplier )
				iobj:updateListener()
			end
		end

		local interfaceObj = {}
		interfaceObj.dobj = dobj
		interfaceObj.pivot =  pivot
		interfaceObj.update =  update

		return interfaceObj
	end

	o.t2 = make_interfaceObj(view_t2.dobj)

end