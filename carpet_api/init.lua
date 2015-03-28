function register_carpet(name, recipe, desc, texture, group)
	minetest.register_node(":carpet:"..name, {
		description = desc,
		tiles = {texture},
		paramtype = "light",
		drawtype = "nodebox",
		groups = group,
		node_box = {
			type = "fixed",
			fixed = {-0.5, -0.5, -0.5, 0.5, -0.5+0.0625, 0.5}
		},
	})
	
	minetest.register_craft({
		output = 'carpet:'..name..' 32',
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
