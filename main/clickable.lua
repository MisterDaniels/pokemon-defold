-- Put functions in this file to use them in several other scripts.
-- To get access to the functions, you need to put:
-- require "my_directory.my_file"
-- in any script using the functions.
local Clickable = {}

local sprites = {}

local function key_from_url(url)
	return tostring(url.socket) .. hash_to_hex(url.path) .. hash_to_hex(url.fragment)
end

function Clickable.add(sprite_url, sprite_offset, on_input_callback)
	assert(sprite_url)
	assert(on_input_callback)

	sprite_offset = sprite_offset or vmath.vector3()
	sprite_url = type(sprite_url) == 'string' and msg.url(sprite_url) or sprite_url
	sprites[key_from_url(sprite_url)] = {
		sprite_url = sprite_url,
		go_url = msg.url(sprite_url.socket, sprite_url.path, nil),
		offset = sprite_offset,
		callback = on_input_callback
	}
end

function Clickable.remove(sprite_url)
	assert(sprite_url)
	sprite_url = type(sprite_url) == 'string' and msg.url(sprite_url) or sprite_url
	sprites[key_from_url(sprite_url)] = nil
end

function Clickable.on_input(action_id, action)
	for _,sprite_data in pairs(sprites) do
		local go_scale = go.get_scale_vector(sprite_data.go_url)
		local sprite_scale = go.get(sprite_data.sprite_url, property)
		local pos = go.get_position(sprite_data.go_url)

		return sprite_data.callback(sprite_data.go_url, action_id, action)
	end
end

return Clickable