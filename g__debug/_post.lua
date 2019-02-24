return function (pre)
	
	local pressed = {}

		
	Runtime:addEventListener("key",function(event)

			if event.phase == "down" then

				pressed[event.keyName] = true

				print(" pressed " .. event.keyName .. " is true")

				if pre.call_when_key_down_s[event.keyName] then 
					pre.call_when_key_down_s[event.keyName](event)
				end
		
			elseif event.phase == "up" then
		
				pressed[event.keyName] = false
		
			end		  

			return true
		end)

	Runtime:addEventListener("enterFrame",function(event)

			for k,v in pairs(pre.call_every_frame_when_key_down_s) do 

				if pressed[k] then
					v({keyName = k})
				end

			end

			return true
		end)




end