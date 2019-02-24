return function (p,o,c)

	
	local alphaChangers = {
		{
			target = modular_ros("views.pan.t2.steelFrameBoard").dobj,
			range = {
				thresh1=0.2,
				thresh2=1.2,
				pos = false
			}
		},{
			target = modular_ros("views.pan.t2.colorSquares").dobj,
			range = {
				thresh1=0.2,
				thresh2=1.5,
				pos = false
			}
		},{
			target = modular_ros("views.pan.t3.woodenBoard").dobj,
			range = {
				thresh1=0.7,
				thresh2=1,
				pos = true
			}
		}
		-- ,{
		-- 	target = currentPanViewMock,
		-- 	range = {
		-- 		thresh1=0.7,
		-- 		thresh2=1,
		-- 		pos = true
		-- 	}
		-- },{
		-- 	target = panBar,
		-- 	range = {
		-- 		thresh1=0.2,
		-- 		thresh2=0.8,
		-- 		pos = true
		-- 	}
		-- },{
		-- 	target = globalBar,
		-- 	range = {
		-- 		thresh1=0.2,
		-- 		thresh2=0.8,
		-- 		pos = false
		-- 	}
		-- }
	}

	local function manageAlpha(iobj)
		local scale = iobj.dobj.xScale

		--print(" dcode - g902hn0gf : scale " .. scale)

		for k,v in ipairs(alphaChangers) do
			local target = v.target
			
			if type(target) == "function" then
				target = target()
			end

			local range = v.range 
			local at = 2 

			if scale<range.thresh1 then 
				at = 1
			elseif scale>range.thresh2 then 
				at = 3
			end

			
			if at == 1 then 
				if range.pos then 
					target.isVisible = false 
				else
					target.isVisible = true
					target.alpha = 1
				end		
			elseif at == 2 then 
				target.isVisible = true 
				local dif = (scale - range.thresh1)/(range.thresh2-range.thresh1)
			 	if range.pos then 
			 		target.alpha = dif 
			 	else
			 		target.alpha = 1-dif
			 	end 			 	
			elseif at == 3 then 
				if range.pos then 
					target.isVisible = true 
					target.alpha = 1
				else
					target.isVisible = false
				end
			end 
		end 
	end


	o.func = manageAlpha


end