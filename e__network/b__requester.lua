return function (p,o,c)
	-- body


	local json = require("json")

	local receiver = modular_ros("network.receiver") 
	local receiver_func = receiver.func 

	local userInfo = modular_ros("models.user")
	local view_t3 = modular_ros("views.pan.t3")

	local packets = {}

	local function processStaticPackets()

		if userInfo.loggedIn then



		end

		-- if view_t3.isT2Visible() then 


		-- end


	end

	function o.request(packet)
		
	end





	local function check_and_pass(event)
		-- body
		if ( event.isError ) then 
			printANZ( "Network error: ", event.response ) 
		else
	        local response = json.decode(event.response)
			
			if response then
				--l0gUpdateGameColRow(response);
				--l0gUpdateGamePoints(response);        	
	        	receiver_func(response)
			else
				printANZ ("error : response not json parsable")
			end

	    end
	end



	local params = {headers = {["Content-Type"] = "application/json"}}

	local function request()
		-- body
		
		processStaticPackets()


		--print(params.body)
		network.request( "https://omok-fkalar.c9users.io/","POST", check_and_pass , params)
		
		packets = {}
	end





	timer.performWithDelay(500,request,0)


end



