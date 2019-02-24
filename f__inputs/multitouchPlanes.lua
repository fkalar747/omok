return function(parent,o,calldepth)
	
	o.d_holder = {squares = {}}

	local action_scalePosSettable = modular_ros("actions.scalePosSettable")
	local scalePosSettable = action_scalePosSettable.t2



	local view_multitouchPlanes = modular_get(parent,"views.multitouchPlanes")
	
	local planes = view_multitouchPlanes.group


	local numTouches = 0
	local hasHit2 = false

	local initAvgX,initAvgY = nil 
	local initDistance = nil
	local initXpos = nil 
	local initYpos = nil
	local initScale = nil  


	local function calcAvg()
		local xsum = planes[1].lastTouchEvent.x + planes[2].lastTouchEvent.x
		local ysum = planes[1].lastTouchEvent.y + planes[2].lastTouchEvent.y
		return xsum/2,ysum/2
	end

	local function calcDist()
		local xdif = planes[1].lastTouchEvent.x - planes[2].lastTouchEvent.x
		local ydif = planes[1].lastTouchEvent.y - planes[2].lastTouchEvent.y
		return math.sqrt(xdif*xdif + ydif*ydif)	
	end

	local function singleEnded()
		print(" d-jaig8340 singleEnded ")
	end

	local backPlaneTouchListener = function(self,event)
		if event.phase == "began" then 
			self.lastTouchEvent = event

			numTouches = numTouches + 1
			if not event.isFake then display.getCurrentStage():setFocus( event.target, event.id ) end
	 	
	 		if self.planeID == 1 then 
	 			planes[2].isHitTestable = true
	 		end

	 		if numTouches == 2 then 
	 			hasHit2 = true
	 			initAvgX,initAvgY = calcAvg()
	 			initDistance = calcDist()
	 			scalePosSettable:pivot(initAvgX,initAvgY)
	 		end

		
		elseif self.lastTouchEvent and event.id == self.lastTouchEvent.id then 
			self.lastTouchEvent = event

			if event.phase == "moved" then
				if numTouches == 2 then 		
					local avgX,avgY = calcAvg()
					local distance = calcDist()
					-- print(" ax : "..avgX)
					-- print(" ay : "..avgY)
					scalePosSettable:update(avgX, avgY, distance/initDistance)
				end
			else
				numTouches = numTouches - 1

				if numTouches == 0 then
					planes[2].isHitTestable = false
				end

				if not event.isFake then display.getCurrentStage():setFocus( event.target, nil ) end
		
				if not hasHit2 then 
					singleEnded(event)
				end

				if numTouches == 0 then 
					hasHit2 = false 
				end 

				
			end
		
		end
		
		if o.d_holder.draw_squares and event.id == get_by_keypath(self,"lastTouchEvent.id") then
			
			-- print(" dcode - a93hn1f98 " .. tostring(event.id))
			-- print(" dcode - a93hn1f981 " .. tostring(self.lastTouchEvent.id))
			-- print(" dcode - a93hn1f9811 " .. tostring(get_by_keypath(self,"lastTouchEvent.id")))

			if (event.phase == "moved" or event.phase == "began") then 

				local lastTouchEvent = self.lastTouchEvent

				o.d_holder.squares[self.planeID] = o.d_holder.squares[self.planeID] or display.newRect(lastTouchEvent.x,lastTouchEvent.y,30,30)
				o.d_holder.squares[self.planeID].x,o.d_holder.squares[self.planeID].y = event.x,event.y
			
			else
				o.d_holder.squares[self.planeID]:removeSelf()
				o.d_holder.squares[self.planeID] = nil
			end 
		end

		return true
	end


	for i=1,planes.numChildren do 
		planes[i].planeID = i
		planes[i].touch = backPlaneTouchListener
		planes[i].isVisible = false
		planes[i]:addEventListener("touch")
	end
	planes[1].isHitTestable = true

end