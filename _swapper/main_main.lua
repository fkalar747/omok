require("globals")




local module_rbp_s = {		
	--^ forin .
	--> "{{ eri+2 -rei |.*/_init\.lua| -xf -sep |.| }}"  {{ nl |,| }}
	"debug._init"  ,
	"views._init"  ,
	"dimensions._init"  
	--$
}


local bag = {}
safe_load_rbp_s(module_rbp_s,bag,bag,0)