-- Put functions in this file to use them in several other scripts.
-- To get access to the functions, you need to put:
-- require "my_directory.my_file"
-- in any script using the functions.

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

return Util