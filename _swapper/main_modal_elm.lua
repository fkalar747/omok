


require("globals")



local elm_list = {
	"xbtn 1 2 3 4 -c age 2.5 3.5 4.5 5.5",
	"xbtn 1 3 3 3 -r 2.5 3.5 4.5 5.5 -c gwae 5 6 7 8"

}



for i,elm in ipairs(elm_list) do 

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
end