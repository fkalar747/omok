

local original_print = print
local ANZ_last = ""
local ANZ_count = 0
function printANZ(s)
	if s ~= ANZ_last then
		if ANZ_count > 0 then 
			original_print(ANZ_last .. " x"..ANZ_count)
		end

		ANZ_last = s
		ANZ_count = 0
		
		original_print(s)
	else
		ANZ_count = ANZ_count + 1
	end
end
