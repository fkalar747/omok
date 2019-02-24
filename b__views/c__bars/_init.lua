return function ( main_bag,parent_bag,call_stack )
	-- body	

		local rbp_s = modular_namemap{		
	--^ forin .
	--> "{{ erb -sep |.| -xf }}{{ eib -rei %([^/]+/_init\.lua)|([^_/][^/]*\.lua)% -iv }}" {{ nl |,| }}
	"b__views.c__bars.t2" ,
	"b__views.c__bars.common" ,
	"b__views.c__bars.t3" 
	--$
	}


	modular_require_s(rbp_s)

end  