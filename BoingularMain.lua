SMODS.current_mod.optional_features = function()
    return { retrigger_joker = true }
end

SMODS.ConsumableType {
    key = "BoingularAnacra",
    primary_colour = HEX("FFFFFF"),
    secondary_colour = HEX("618B31"),
    loc_txt = {
        name = "Anacra",
        collection = "Anacra Cards",
        undiscovered = {
            name = "ah shit",
            text = {
                "ah shit"
            }
        }
    }
}

------------------------------
---       FILE FUNCS       ---
------------------------------

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

load_file("BoingularFuncs.lua")

-- Load the Atlases
load_file("addons/atlas.lua")

-- Load the Custom Hands
load_files_in_dir("addons/hands")

-- Load the Achievements
load_files_in_dir("addons/achievements")

-- Load the Reverse Arcana
load_files_in_dir("addons/anacra")

-- Load the Blinds
load_files_in_dir("addons/blinds")

-- Load the Decks
load_files_in_dir("addons/decks")

-- Load the Jokers
load_files_in_dir("addons/jokers")

-- Load the Spectral Cards
load_files_in_dir("addons/spectrals")

-- Load the Editions
load_files_in_dir("addons/editions")

-- Load the Enhancements
load_files_in_dir("addons/enhancements")

-- Load the Ranks
load_files_in_dir("addons/ranks")

-- Load the Seals
load_files_in_dir("addons/seals")

-- Load the Suits
load_files_in_dir("addons/suits")

-- Load the Tags
load_files_in_dir("addons/tags")