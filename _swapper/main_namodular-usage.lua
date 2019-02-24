
require("globals")

local module_rbp_by_name = namemap_rbp_s{		
	--^ forin .
	--> "{{ erb -sep |.| -xf }}{{ eib -rei %([^/]+/_init\.lua)|([^_/][^/]*\.lua)% -iv }}" {{ nl |,| }}
	"globals" ,
	"debug._init" ,
	"views._init" ,
	"main" ,
	"dimensions._init" 
	--$
}


dump_table(module_rbp_by_name)

for i,name in ipairs{"dimensions",views} do
	require(module_rbp_by_name[name])(name)
end
