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

	for k,stoneGroupMVSyncer in pairs(modular_ros("mvSyncers.stoneGroups").lib) do 

		local model = {}
		o.lib[k] = model

		model.syncer = stoneGroupMVSyncer
		stoneGroupMVSyncer.model = model

		model.unconfirmedStart = 1 
		model.RN = -1


		function model:recieve(packet)
			-- body

			if self.RN ~= packet.RN then 
				self.unconfirmedStart = 1
			end

			for i = self.unconfirmedStart,#packet.records do 


				if self.records[i] and not a_in_b(packet.records[i],self.records[i]) then
					self.records[i].dobj:removeSelf()
				end

				self.records[i] = packet.records[i]
				self.records[i].dobj = self.dobj:put(self.records[i])

			end

			for i = #packet.records+1,#self.records do
				self.records[i].dobj:removeSelf()
			end

			self.RN = packet.RN 
			self.unconfirmedStart = #packet.records

			self.stoneGroupMVSyncer:sync()
		end
	end


	
end