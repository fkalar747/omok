return function(p,o,c)
	-- body



	local view_mtplane = modular_ros("views.multitouchPlanes")
	local input_mtplane = modular_ros("inputs.multitouchPlanes")
	local dimensions = modular_ros("dimensions")

	local obj = view_mtplane.group[1]
	local d_holder = input_mtplane.d_holder

	d_holder.draw_squares = true

	local t_event = {
		phase = "ended",
		id = "9r2b90fvg0",
		x = dimensions.CX,
		y = dimensions.CY,
		isFake = true
	}





	p.call_when_key_down_s['t'] = function(event)
		if t_event.phase == "ended" then
			t_event.phase = "began"
		else
			t_event.phase = "ended"
		end

		obj:touch(t_event)
	end




	local arrow_vec_map = {
		left = {x = -1,y = 0},
		right = {x = 1,y = 0},
		up = {x = 0,y = -1},
		down = {x = 0,y = 1}
	}

	local function arrow_func(event)
		if t_event.phase ~= "ended" then

			t_event.phase = "moved"
			t_event.x = t_event.x + arrow_vec_map[event.keyName].x
			t_event.y = t_event.y + arrow_vec_map[event.keyName].y

			obj:touch(t_event)
		end
	end

	for i,v in ipairs{"down","left","up","right"} do 
		p.call_every_frame_when_key_down_s[v] = arrow_func
	end



	o.func = function( ... )

	end

end