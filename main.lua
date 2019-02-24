
getmetatable("").__call = function(s,i,j)
	
	if not j then 
		j = i
	end

	return s:sub(i,j)
end


--^ forin .
--> require("{{ erb -xf -rei |global.+\.lua| -sep |.| }}") 
require("global.dprint")
require("global.dcode")
require("global.dtag")
require("globals")
--$


local module_rbp_s = {		
	--^ forin .
	--> "{{ erb -xf -rei |.+\.lua| -xrei &(main.+)|(config.+)|(global.+)& -sep |.| }}"  {{ nl |,| }}
	"b__views.d__buttons._init"  ,
	"b__views.a__pan._post"  ,
	"b__views.a__pan._pre"  ,
	"b__views.a__pan.t3.woodenBoard"  ,
	"b__views.a__pan.t3._post"  ,
	"b__views.a__pan.t3._pre"  ,
	"b__views.a__pan.t3.stoneGroups._post"  ,
	"b__views.a__pan.t3.stoneGroups.stones"  ,
	"b__views.a__pan.t3.stoneGroups._pre"  ,
	"b__views.a__pan.t2._post"  ,
	"b__views.a__pan.t2.colorSquares"  ,
	"b__views.a__pan.t2._pre"  ,
	"b__views.a__pan.t2.steelFrameBoard"  ,
	"b__views.c__bars.t3"  ,
	"b__views.c__bars._init"  ,
	"b__views.c__bars.common"  ,
	"b__views.c__bars.t2"  ,
	"b__views.e__modals.store"  ,
	"b__views.e__modals._pre"  ,
	"b__views.e__modals.record"  ,
	"b__views.e__modals.account"  ,
	"b__views.b__multitouchPlanes._pre"  ,
	"d__actions._post"  ,
	"d__actions.pan.t3.putStone"  ,
	"d__actions.pan.t2.setFocus"  ,
	"d__actions.alphaChanger"  ,
	"d__actions.modals._post"  ,
	"d__actions.modals._pre"  ,
	"d__actions.updateFocusedT3"  ,
	"d__actions.scalePosSettable"  ,
	"a__dimensions._pre"  ,
	"e__network.b__requester"  ,
	"e__network.a__receiver"  ,
	"f__inputs.multitouchPlanes.woodenBoard"  ,
	"f__inputs.multitouchPlanes._post"  ,
	"f__inputs.modals._pre"  ,
	"g__debug._post"  ,
	"g__debug.fakeTouch"  ,
	"g__debug._pre"  ,
	"ca__mvSyncers.stoneGroups"  ,
	"cb__models.stoneGroups._pre"  ,
	"cb__models.user._pre"  
	--$
}

local function a_in_b(a,b)
	-- body
	for k,v in pairs(b) do 
		if v == a then
			return true
		end
	end
	return false
end


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
for i,v in ipairs{"common_pre"} do 
	virtual_pre_funcs[v] = empty_pre_func
end

module_rbp_s = merge_lists(module_rbp_s,keys_list(virtual_pre_funcs))

local function require_v(rbdsp,call_stack)
	-- body
	if virtual_pre_funcs[rbdsp] then 
		print_in(call_stack,"requiring virtually")
		return virtual_pre_funcs[rbdsp]
	else
		print_in(call_stack,"requiring existing lua file")
		return require(rbdsp)
	end
end

local function ex_ordinal_name(name)
	local match = name:match("^(%l+__).+") 
	if match then
		return name(#match+1,#name)
	else 
		return name
	end
end


local function require_r(parent,namenode,rbdsp,name,call_stack)
	-- body

	local pre = {}
	local rbdsp_pre = nil

	print_in(call_stack,"Entered req_r : " .. rbdsp)

	if namenode._.pre then 
		rbdsp_pre = join_dsp(rbdsp,"_pre")
	elseif namenode.__isleaf then
		rbdsp_pre = rbdsp
	else
		rbdsp_pre = "common_pre"
	end 

	local pre_func = require_v(rbdsp_pre,call_stack+1)

	if dtag['pre_returning_non_func'] and type(pre_func) ~= 'function' then 
		pre_func = empty_pre_func
	end

	pre_func(parent,pre,call_stack+1)

	local name_p = ex_ordinal_name(name)
	
	pre.__parent = parent
	pre.__name = name_p
	parent.__child_s[name_p] = pre

	pre.__child_s = {}

	for i,name in ipairs(sorted_keys_list(namenode.__child_s)) do 
		require_r(
			pre,
			namenode.__child_s[name],
			join_dsp(rbdsp,name),
			name,
			call_stack+2
			) 
	end

	if namenode._.post then 
		require_v(join_dsp(rbdsp,"_post"))(pre)
	end
end

require_r(modular_root_holder,root_namenode,"","root",1)

