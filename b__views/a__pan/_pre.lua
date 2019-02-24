return function(p,o,c)
	
	o.forColUbRow = function(func,num)
		-- body
		num = num or 11

		for i = 1,num do
			for j = 1,num do
				local colubrow = i.."_"..j
				
				func(colubrow)

			end
		end
		
	end


	return {}
end


 
