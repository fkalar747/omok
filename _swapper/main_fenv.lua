

require("globals")


--dump_table("getfenv():",2,a)



function f2( ... )
	-- body
	--dump_table("getfenv2():",getfenv(1))


	function f2b( ... )
		-- body
		dump_table("getfenv f2b :",getfenv(1),-1)
	end

	return f2b

end

function f1( ... )
	-- body
	t = {}
	setmetatable(t,{__index = {f2=f2,getfenv=getfenv,dump_table=dump_table}})
	setfenv(1,t)

	dump_table("getfenv 1:",getfenv(1),-1)

	local  function fb( ... )

		b=3 

		c=4

		local b = 34

		dump_table("getfenv b():",getfenv(1),-1)
	end



	s = f2(1,2,3,4,5)
	s()


	return fb
end

a= f1("abaer",42322)

a()
