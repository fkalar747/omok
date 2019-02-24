



io.write("abc")
io.write("abc")
io.write("abc")
io.write("abc")
io.write("abc \n")

local count = 0
timer.performWithDelay(1000,function( ... )
	-- body
	count = count + 1
	io.write("\r c : ".. count)


	if count > 10 then 
		io.write('\n')
	end

end,0)