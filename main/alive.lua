-- Put functions in this file to use them in several other scripts.
-- To get access to the functions, you need to put:
-- require "my_directory.my_file"
-- in any script using the functions.
local Alive = {}

function Alive.deal_damage(life, damage)
	local life_post_damage = life - damage

	if life_post_damage < 0 then
		life_post_damage = 0
	end
	
	return life_post_damage
end

return Alive