SMODS.current_mod.optional_features = function()
    return { retrigger_joker = true }
end

-----------------------
---    FUNCTIONS    ---
-----------------------

function Card:extinct(quote, sound)
    G.E_MANAGER:add_event(Event({
        func = function()
            if sound then
                play_sound(sound)
            end
            self.T.r = -0.2
            self:juice_up(0.3, .4)
            self.states.drag.is = true
            self.children.center.pinch.x = true
            G.E_MANAGER:add_event(Event({
                trigger = 'after',
                delay = 0.3,
                blockable = false,
                func = function()
                    G.jokers:remove_card(self)
                    self:remove()
                    self = nil
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

function PRINT_TABLE( t )
 
    local printTable_cache = {}
 
    local function sub_printTable( t, indent )
 
        if ( printTable_cache[tostring(t)] ) then
            print( indent .. "*" .. tostring(t) )
        else
            printTable_cache[tostring(t)] = true
            if ( type( t ) == "table" ) then
                for pos,val in pairs( t ) do
                    if ( type(val) == "table" ) then
                        print( indent .. "[" .. pos .. "] => " .. tostring( t ).. " {" )
                        sub_printTable( val, indent .. string.rep( " ", string.len(pos)+8 ) )
                        print( indent .. string.rep( " ", string.len(pos)+6 ) .. "}" )
                    elseif ( type(val) == "string" ) then
                        print( indent .. "[" .. pos .. '] => "' .. val .. '"' )
                    else
                        print( indent .. "[" .. pos .. "] => " .. tostring(val) )
                    end
                end
            else
                print( indent..tostring(t) )
            end
        end
    end
 
    if ( type(t) == "table" ) then
        print( tostring(t) .. " {" )
        sub_printTable( t, "  " )
        print( "}" )
    else
        sub_printTable( t, "  " )
    end
end

function Card:destroy(color, sound)
    G.GAME.joker_buffer = G.GAME.joker_buffer - 1
    G.E_MANAGER:add_event(Event({func = function()
        G.GAME.joker_buffer = 0
        self:start_dissolve({HEX(color)}, nil, 1.6)
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

SMODS.Atlas {
    key = "BoingularSeals",
    path = "Seals.png",
    px = 71,
    py = 95
}

SMODS.Atlas {
    key = "BoingularTags",
    path = "Tags.png",
    px = 34,
    py = 34
}

load_files_in_dir("addons/hands")

load_files_in_dir("addons/achievements")

load_files_in_dir("addons/blinds")

-- Load the Jokers
load_files_in_dir("addons/jokers")

-- Load the Spectral Cards
load_files_in_dir("addons/spectrals")

load_files_in_dir("addons/editions")

load_files_in_dir("addons/seals")

load_files_in_dir("addons/tags")