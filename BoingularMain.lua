-----------------------
---    FUNCTIONS    ---
-----------------------

function extinct(card, quote, sound)
    G.E_MANAGER:add_event(Event({
        func = function()
            if sound then
                play_sound(sound)
            end
            card.T.r = -0.2
            card:juice_up(0.3, .4)
            card.states.drag.is = true
            card.children.center.pinch.x = true
            G.E_MANAGER:add_event(Event({
                trigger = 'after',
                delay = 0.3,
                blockable = false,
                func = function()
                    G.jokers:remove_card(card)
                    card:remove()
                    card = nil
                    return true;
                end
            }))
            return true
        end
    }))
    if quote then
        return {
            message = quote
        } 
    end
end

-- Taken from https://stackoverflow.com/a/42062321
function print_table(node)
    local cache, stack, output = {},{},{}
    local depth = 1
    local output_str = "{\n"

    while true do
        local size = 0
        for k,v in pairs(node) do
            size = size + 1
        end

        local cur_index = 1
        for k,v in pairs(node) do
            if (cache[node] == nil) or (cur_index >= cache[node]) then

                if (string.find(output_str,"}",output_str:len())) then
                    output_str = output_str .. ",\n"
                elseif not (string.find(output_str,"\n",output_str:len())) then
                    output_str = output_str .. "\n"
                end

                -- This is necessary for working with HUGE tables otherwise we run out of memory using concat on huge strings
                table.insert(output,output_str)
                output_str = ""

                local key
                if (type(k) == "number" or type(k) == "boolean") then
                    key = "["..tostring(k).."]"
                else
                    key = "['"..tostring(k).."']"
                end

                if (type(v) == "number" or type(v) == "boolean") then
                    output_str = output_str .. string.rep('\t',depth) .. key .. " = "..tostring(v)
                elseif (type(v) == "table") then
                    output_str = output_str .. string.rep('\t',depth) .. key .. " = {\n"
                    table.insert(stack,node)
                    table.insert(stack,v)
                    cache[node] = cur_index+1
                    break
                else
                    output_str = output_str .. string.rep('\t',depth) .. key .. " = '"..tostring(v).."'"
                end

                if (cur_index == size) then
                    output_str = output_str .. "\n" .. string.rep('\t',depth-1) .. "}"
                else
                    output_str = output_str .. ","
                end
            else
                -- close the table
                if (cur_index == size) then
                    output_str = output_str .. "\n" .. string.rep('\t',depth-1) .. "}"
                end
            end

            cur_index = cur_index + 1
        end

        if (size == 0) then
            output_str = output_str .. "\n" .. string.rep('\t',depth-1) .. "}"
        end

        if (#stack > 0) then
            node = stack[#stack]
            stack[#stack] = nil
            depth = cache[node] == nil and depth + 1 or depth - 1
        else
            break
        end
    end

    -- This is necessary for working with HUGE tables otherwise we run out of memory using concat on huge strings
    table.insert(output,output_str)
    output_str = table.concat(output)

    print(output_str)
end

function destroy(card, color, sound)
    G.GAME.joker_buffer = G.GAME.joker_buffer - 1
    G.E_MANAGER:add_event(Event({func = function()
        G.GAME.joker_buffer = 0
        card:start_dissolve({HEX(color)}, nil, 1.6)
        if sound then
            play_sound(sound, 0.96+math.random()*0.08)
        end
    return true end }))
end

--------------------------------------------------------------------------------------
---                                      MAIN                                      ---
--------------------------------------------------------------------------------------

-- Include the filesystem library provided by SMODS
local nativefs = require("nativefs")

--- Recreation of python's "endswith" function
--- Taken from: https://stackoverflow.com/a/72921992
--- 
--- @param suffix string Checks if the string ends with the given suffix
--- 
--- @return boolean Result True if it does, false if it doesn't
function string:endswith(suffix)
    return self:sub(-#suffix) == suffix
end

--- Loads a lua file
--- 
--- @param relative_path string The relative path of the file from the mod folder
function load_file(relative_path)
    print("Loading File: "..relative_path)
    assert(SMODS.load_file(relative_path))()
end

--- Recursively loads and runs the files in a given directory
--- Good for splitting jokers/cards/etc. into separate files for easier management
--- Written by: Melody (https://meluhdy.dev)
--- 
--- @param relative_path string The relative path of the directory from the mod folder
function load_files_in_dir(relative_path)
    local absolute_path = SMODS.current_mod.path..relative_path
    local files = nativefs.getDirectoryItemsInfo(absolute_path)
    for i = 1, #files do
        local file = files[i]
        local file_info = nativefs.getInfo(absolute_path.."/"..file.name)
        if file_info.type == "directory" then
            load_files_in_dir(relative_path.."/"..file.name)
        elseif file.name:endswith(".lua") then
            load_file(relative_path.."/"..file.name)
        end
    end
end

------------------
---    INIT    ---
------------------

SMODS.Atlas {
    key = "BoingularJokers",
    path = "Jokers.png",
    px = 71,
    py = 95
}

SMODS.Atlas {
    key = "BoingularSpectrals",
    path = "Spectrals.png",
    px = 71,
    py = 95
}

SMODS.Atlas {
    key = "BoingularMisc",
    path = "Misc.png",
    px = 66,
    py = 66
}

SMODS.Atlas {
    key = "BoingularBlinds",
    path = "Blinds.png",
    px = 34,
    py = 34,
    atlas_table = "ANIMATION_ATLAS",
	frames = 21,
}

load_files_in_dir("addons/achievements")

load_files_in_dir("addons/blinds")

-- Load the Jokers
load_files_in_dir("addons/jokers")

-- Load the Spectral Cards
load_files_in_dir("addons/spectrals")