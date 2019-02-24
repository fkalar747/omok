return function (p,o,c)
	-- body

	local updateFocusedT3 = modular_ros("actions.updateFocusedT3")
	local stoneGroupModelLib = modular_ros("models.stoneGroups").lib


	local dobj_woodenBoard = modular_ros("views.pan.t3.woodenBoard").dobj
	dobj_woodenBoard.touch = function(self,event)
		-- body
		print(" dcode - 24fqeqfq")	
		
		if event.phase == "ended" then 

			local colubrow = updateFocusedT3.showingStoneGroup:globalXYtoColubrow(event.x,event.y)

			stoneGroupModelLib[colubrow]:put()		

			print("fqeqfq")	

		end
	end

	dobj_woodenBoard:addEventListener("touch")

end