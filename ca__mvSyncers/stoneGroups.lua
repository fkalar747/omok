return function(p,o,c)
	-- body



	local function copy(a)
		-- body
		local o = {}
		for k,v in pairs(a) do 
			o[k] = v
		end
		return o
	end

	local function a_in_b (a,b)
		-- body
		for k,v in pairs(b) do 
			if a[v] ~= b[v] then
				return false
			end
		end

		return true
	end

	o.lib = {}

	for k,stoneGroup in pairs(modular_ros("views.pan.t3.stoneGroups").lib) do 

		local iobj = {}
		o.lib[k] = iobj

		iobj.dobj = stoneGroup
		iobj.model = nil

		iobj.unconfirmedStart = 1 
		iobj.RN = -1


		function iobj:sync()
			-- body
			local model = self.model

			if self.RN ~= model.RN then 
				self.unconfirmedStart = 1
			end

			for i = self.unconfirmedStart,#model.records do 


				if self.records[i] and not a_in_b(model.records[i],self.records[i]) then
					self.records[i].dobj:removeSelf()
				end

				self.records[i] = copy(model.records[i])
				self.records[i].dobj = self.dobj:put(self.records[i])

			end

			for i = #model.records+1,#self.records do
				self.records[i].dobj:removeSelf()
			end

			self.RN = model.RN 
			self.unconfirmedStart = model.unconfirmedStart

		end

		function iobj:setModel(model)
			self.model = model
		end

	end


	
end