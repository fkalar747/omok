
getmetatable("").__call = function(s,i,j)
	
	if not j then 
		j = i
	end

	return s:sub(i,j)
end


--^ forin .
--> require("{{ erb -xf -rei |global.+\.lua| -sep |.| }}") 
require("global_debug")
require("globals")
--$


local module_rbp_s = {		
	--^ forin .
	--> "{{ erb -xf -rei |.+\.lua| -sep |.| }}"  {{ nl |,| }}
	"d__actions.modals._post"  ,
	"d__actions.modals._pre"  ,
	"global_debug"  ,
	"b__views.buttons._init"  ,
	"b__views.bars.common"  ,
	"b__views.bars.t2"  ,
	"b__views.bars.t3"  ,
	"b__views.bars._init"  ,
	"b__views.modals._pre"  ,
	"b__views.modals.record"  ,
	"b__views.modals.store"  ,
	"b__views.modals.account"  ,
	"b__views.multitouch_plane.planes"  ,
	"b__views.pan._pre"  ,
	"b__views.pan.t3.woodenBoard"  ,
	"b__views.pan.t2.colorSquares"  ,
	"b__views.pan.t2.steelFrameBoard"  ,
	"a__dimensions._pre"  ,
	"globals"  ,
	"f__inputs.modals._pre"  ,
	"main"  
	--$
}


local root_namenode = {_={},__child_s={}}

local function treeify_namenodes()
	local rbp_s = module_rbp_s

	for i,rbp in ipairs(rbp_s) do 

		local namenode = root_namenode

		for name in rbp:gmatch("[^.]+") do
			
			local place = nil

			if name(1) == "_" then
				-- meta module
				name = name(2,#name)
				place = namenode._
			else
				place = namenode.__child_s
			end
			
			if not place[name] then 
				place[name] = {_={},__child_s={}}
			end

			namenode = place[name]
		end

		namenode.__isleaf = true
	end
end

treeify_namenodes()

--dump_table(root_namenode,-10)



local function merge_lists(...)
	local res_list = {}

	for i,v in ipairs(arg) do
		for i1,v1 in ipairs(v) do
			table.insert(res_list,v1)
		end
	end

	return res_list
end


local function join_dsp(a,b)
	if #a > 0 and #b > 0 then 
		return a.."."..b
	else 
		return a..b
	end
end

local function keys_list(tab)
	local res_list = {}
	for k,v in pairs(tab) do 
		table.insert(res_list,k)
	end
	return res_list
end


local function sorted_keys_list(tab)
	local list = keys_list(tab)
	table.sort(list)
	return list
end


local virtual_pre_funcs = {}

local empty_pre_func = function() end
for i,v in ipairs{"common_pre","main","globals"} do 
	virtual_pre_funcs[v] = empty_pre_func
end

module_rbp_s = merge_lists(module_rbp_s,keys_list(virtual_pre_funcs))

local function require_v(rbdsp,call_stack)
	-- body
	print("gwaewg")
end

local function ex_ordinal_name(name)
	if name:match(".__.+") then
		return name(4,#name)
	else 
		return name
	end
end

print_in = print

local function require_r(parent,namenode,rbdsp,name,call_stack)
	-- body

	local pre = {}
	local rbdsp_pre = nil

	print_in(call_stack,"Entered req_r : " .. rbdsp)


	local pre_func = require_v(rbdsp_pre,call_stack+1)
	print("abc")

	print(dtag['pre_returning_non_func'])

	if dtag['pre_returning_non_func'] and type(pre_func) ~= 'function' then 
		print("bygaewe")
		pre_func = empty_pre_func
	end

	print("bye")
	print("bygaewe")
end

require_r({__child_s={}},root_namenode,"","root",1)