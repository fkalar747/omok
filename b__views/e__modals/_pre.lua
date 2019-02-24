return function(parent,o)

	local dimensions = modular_get(parent,"dimensions")

	local function elms_to_specs(elms)
		local res_list = {}

		for i,elm in ipairs(elms) do 

			local info = {}

			for word in elm:gmatch("[%w_%.-]+") do 
				if not info.name then 
					info.name = word 
				elseif not info.dm or #info.dm < 4 then 
					info.dm = info.dm or {}
					table.insert(info.dm,tonumber(word))
				else
					info.elms = info.elms or {}

					if not info.elms[1] or info.elms[#info.elms].done then 
						local typ = word:match("-(.+)")
						print("<"..word..">")
						print("<"..typ..">")
						assert(typ)
						local elm = {typ=typ}
						table.insert(info.elms,elm)
					else
						local elm = info.elms[#info.elms]
						local typ = elm.typ

						if typ == "c" then 

							if not elm.s then
								elm.s = word
							else
								elm.dm = elm.dm or {}

								table.insert(elm.dm,tonumber(word))
								if #elm.dm == 4 then 
									elm.done = true
								end
							end 

						elseif typ == "r" then
							elm.dm = elm.dm or {}

							table.insert(elm.dm,tonumber(word))
							if #elm.dm == 4 then 
								elm.done = true
							end
						end 
					end
				end

			end
			table.insert(res_list,info)
		end
		return res_list
	end





	function o.inflate(elm_list)
		-- body

		local height = 650
		local width = 500
		local hidePosY = dimensions.B * 1.5


		local group = display.newGroup()
		group.y = hidePosY
		group.x = dimensions.CX

		

		local rect = display.newRoundedRect( group, 0, 0, width, height, 20)
		rect:setFillColor(unpack(u.hexColor("d8d2e1")))

		local specs = elms_to_specs(elm_list)

		for i,spec in ipairs(specs) do 

			local group1 = display.newGroup()

			for i1,elm_spec in ipairs(spec.elms) do 
				local elm = nil
				if elm_spec.typ == "c" then 
					elm = display.newText(elm_spec.s, 0, 0 , native.systemFontBold, spec.dm[4])
				elseif elm_spec.typ == "r" then
					elm = display.newRect(0, 0 , elm_spec.dm[3], elm_spec.dm[4])
				end
				group1:insert(elm)
			end

			group1.x = spec.dm[1]
			group1.y = spec.dm[2]
		
			group:insert(group1)			
		end

	end

	
	
	return o
end