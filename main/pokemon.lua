-- Put functions in this file to use them in several other scripts.
-- To get access to the functions, you need to put:
-- require "my_directory.my_file"
-- in any script using the functions.

local Pokemon = {}

local data

function Pokemon.get_pokemon(id)
	local pokemon_json_file = sys.load_resource('/main/data/pokemon.json')
	data = json.decode(pokemon_json_file)

	if id == nil then
		id = 1
	end

	return data.pokemon[id]
end

return Pokemon