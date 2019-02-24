return function(parent,o)

	
	o.show = function(self)
		transition.moveTo( self, { x=g.CX, y=g.CY, time=1000, transition = easing.outCubic} )
	end

	o.hide = function(self)	
		transition.moveTo( self, { x=g.CX, y=hidePosY, time=1000, transition = easing.inCubic} )
	end

	o.exit = function (self)
		o.show(self)
	end

end