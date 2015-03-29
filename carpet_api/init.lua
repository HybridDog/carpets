minetest.on_place = minetest.on_place or function(name, func)
	local previous_on_place = minetest.registered_nodes[name].on_place
	minetest.override_item(name, {
		on_place = function(itemstack, placer, pointed_thing)
			if func(itemstack, placer, pointed_thing) then
				return previous_on_place(itemstack, placer, pointed_thing)
			end
		end
	})
end

local carpet_def = {
	paramtype = "light",
	drawtype = "nodebox",
	node_box = {
		type = "fixed",
		fixed = {-0.5, -0.5, -0.5, 0.5, -0.5+0.0625, 0.5}
	},
}
function register_carpet(name, recipe, desc, texture, group)
	local data
	if desc then
		-- support the previous carpet registration function
		data = {
			recipe = recipe,
			description = desc,
			texture = texture,
			groups = group,
			drop = "disable",
		}
	else
		data = recipe
	end

	-- fix for automatically made names
	if not data then
		data = name
		name = nil
	end

	recipe = data.recipe
	data.recipe = nil
	local recipedata = table.copy(minetest.registered_nodes[recipe])

	-- fill specific carped def
	for n,i in pairs(data) do
		-- allows disabling drop, on_punch, ect.
		if i == "disable" then
			recipedata[n] = nil
		else
			recipedata[n] = i
		end
	end

	-- fill fixed carped def
	for n,i in pairs(carpet_def) do
		recipedata[n] = i
	end

	local desc = recipedata.description
	if not string.find(string.lower(desc), "carpet") then
		recipedata.description = recipedata.description.." Carpet"
	end

	recipedata.tiles = recipedata.texture and {recipedata.texture} or recipedata.tiles or recipedata.tile_images
	recipedata.texture = nil
	recipedata.tile_images = nil

	recipedata.groups = recipedata.groups or {oddly_breakable_by_hand=3}
	recipedata.groups.falling_node = 1

	if not name then
		name = string.split(recipe, ":")
		name = name[1].."_"..name[2]
	end
	name = "carpet:"..name

	minetest.register_node(":"..name, recipedata)

	-- disallow carpets to be placed onto other ones
	minetest.on_place(name, function(_, _, pointed_thing)
		if not pointed_thing then
			return
		end
		local pos = pointed_thing.under
		local above = pointed_thing.above
		if above.y == pos.y+1
		and minetest.get_node(pos).name == name then
			return
		end
		return true
	end)
	
	minetest.register_craft({
		output = name.." 32",
		recipe = {
			{recipe, recipe},
		}
	})
end

register_carpet("wool_black", "wool:black", "Black Carpet", "wool_black.png", {snappy=2,choppy=2,oddly_breakable_by_hand=3,flammable=3,wool=1})
register_carpet("wool_blue", "wool:blue", "Blue Carpet", "wool_blue.png", {snappy=2,choppy=2,oddly_breakable_by_hand=3,flammable=3,wool=1})
register_carpet("wool_brown", "wool:brown", "Brown Carpet", "wool_brown.png", {snappy=2,choppy=2,oddly_breakable_by_hand=3,flammable=3,wool=1})
register_carpet("wool_cyan", "wool:cyan", "Cyan Carpet", "wool_cyan.png", {snappy=2,choppy=2,oddly_breakable_by_hand=3,flammable=3,wool=1})
register_carpet("wool_dark_green", "wool:dark_green", "Dark Green Carpet", "wool_dark_green.png", {snappy=2,choppy=2,oddly_breakable_by_hand=3,flammable=3,wool=1})
register_carpet("wool_dark_grey", "wool:dark_grey", "Dark Grey Carpet", "wool_dark_grey.png", {snappy=2,choppy=2,oddly_breakable_by_hand=3,flammable=3,wool=1})
register_carpet("wool_green", "wool:green", "Green Carpet", "wool_green.png", {snappy=2,choppy=2,oddly_breakable_by_hand=3,flammable=3,wool=1})
register_carpet("wool_grey", "wool:grey", "Grey Carpet", "wool_grey.png", {snappy=2,choppy=2,oddly_breakable_by_hand=3,flammable=3,wool=1})
register_carpet("wool_magenta", "wool:magenta", "Magenta Carpet", "wool_magenta.png", {snappy=2,choppy=2,oddly_breakable_by_hand=3,flammable=3,wool=1})
register_carpet("wool_orange", "wool:orange", "Orange Carpet", "wool_orange.png", {snappy=2,choppy=2,oddly_breakable_by_hand=3,flammable=3,wool=1})
register_carpet("wool_pink", "wool:pink", "Pink Carpet", "wool_pink.png", {snappy=2,choppy=2,oddly_breakable_by_hand=3,flammable=3,wool=1})
register_carpet("wool_red", "wool:red", "Red Carpet", "wool_red.png", {snappy=2,choppy=2,oddly_breakable_by_hand=3,flammable=3,wool=1})
register_carpet("wool_violet", "wool:violet", "Violet Carpet", "wool_violet.png", {snappy=2,choppy=2,oddly_breakable_by_hand=3,flammable=3,wool=1})
register_carpet("wool_white", "wool:white", "White Carpet", "wool_white.png", {snappy=2,choppy=2,oddly_breakable_by_hand=3,flammable=3,wool=1})
register_carpet("wool_yellow", "wool:yellow", "Yellow Carpet", "wool_yellow.png", {snappy=2,choppy=2,oddly_breakable_by_hand=3,flammable=3,wool=1})
