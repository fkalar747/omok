return function(p)


	local scalePosSettable = modular_gos(p,"scalePosSettable")
	
	local alphaChanger = modular_gos(p,"alphaChanger")
	local updateFocus = modular_gos(p,"updateFocusedT3")

	scalePosSettable.t2.updateListener = function(iobj)
		
		alphaChanger.func(iobj)
		updateFocus.func(iobj)
	end

end