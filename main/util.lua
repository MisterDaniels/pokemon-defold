-- Put functions in this file to use them in several other scripts.
-- To get access to the functions, you need to put:
-- require "my_directory.my_file"
-- in any script using the functions.
local main_module = require 'main/main'

local Util = {}

function Util.convert_hash_to_string(hash)
	return string.sub(tostring(hash), 8, #tostring(hash)-1)
end

function Util.change_animation_by_direction(sprite, direction, name)
	if direction == hash('up') then
		msg.post(sprite, 'play_animation', { id = hash(name .. '_walk_up') })
	elseif direction == hash('down') then
		msg.post(sprite, 'play_animation', { id = hash(name .. '_walk_down') })
	elseif direction == hash('left') then
		msg.post(sprite, 'play_animation', { id = hash(name .. '_walk_left') })
	elseif direction == hash('right') then
		msg.post(sprite, 'play_animation', { id = hash(name .. '_walk_right') })
	end
end

function Util.get_random_number_between(begin, finish)
	reset_random_seed()
	return math.random(begin, finish)
end

function Util.convert_to_tile_size(tiles_count)
	return tiles_count * main_module.tile_size
end

function reset_random_seed()
	math.randomseed(os.time())
	math.random();
	math.random()
end

return Util