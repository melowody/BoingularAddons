SMODS.current_mod.optional_features = function()
    return { retrigger_joker = true }
end

local old_Game_start_run = Game.start_run
function Game:start_run(args)
        self.rune_area = CardArea(
            0, 0,
            2.3*G.CARD_W,
            0.95*G.CARD_H,
            {card_limit = 10, type = 'joker', highlight_limit = 1}
        )
        local old = old_Game_start_run(self, args)
        return old
end

local old_find_joker = find_joker
function find_joker(name, non_debuff)
    local jokers = old_find_joker(name, non_debuff)
    if not G.rune_area then return jokers end
  for k, v in pairs(G.rune_area.cards) do
    if v and type(v) == 'table' and v.ability.name == name and (non_debuff or not v.debuff) then
      table.insert(jokers, v)
    end
  end
  return jokers
end

SMODS.ConsumableType {
    key = "BoingularAnacra",
    primary_colour = HEX("FFFFFF"),
    secondary_colour = HEX("618B31"),
    collection_rows = { 5, 6 },
    loc_txt = {
        name = "Anacra",
        collection = "Anacra Cards",
        undiscovered = {
            name = "Not Discovered",
            text = {
                "Purchase or use",
                "this card in an",
                "unseeded run to",
                "learn what it does"
            }
        }
    }
}

SMODS.ConsumableType {
    key = "BoingularRunes",
    primary_colour = HEX("FFFFFF"),
    secondary_colour = HEX("8A54FF"),
    collection_rows = { 5, 5, 5 },
    loc_txt = {
        name = "Rune",
        collection = "Rune Cards",
        undiscovered = {
            name = "Not Discovered",
            text = {
                "Purchase or use",
                "this card in an",
                "unseeded run to",
                "learn what it does"
            }
        }
    }
}

SMODS.UndiscoveredSprite {
    key = "BoingularRunes",
    atlas = "BoingularRunes",
    pos = {x = 0, y = 3}
}

SMODS.UndiscoveredSprite {
    key = "BoingularAnacra",
    atlas = "BoingularAnacra",
    pos = {x = 6, y = 2}
}

SMODS.ObjectType {
    key = "boingular_off_rune"
}

SMODS.ObjectType {
    key = "boingular_life_rune"
}

SMODS.ObjectType {
    key = "boingular_def_rune"
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

SMODS.Rarity {
    key = "evil",
    loc_txt = {
        name = "Evil"
    },
    pools = {
        ["Glonk"] = {rate = 1}
    },
    badge_colour = HEX("2F0000"),
    default_weight = 0.5
}

--Load the Funcs :D
load_file("BoingularFuncs.lua")

-- Load the Atlases
load_file("addons/atlas.lua")

-- Load the Boosters
load_files_in_dir("addons/boosters")

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

-- Load the Runes
load_files_in_dir("addons/runes")

-- Load the Seals
load_files_in_dir("addons/seals")

-- Load the Suits
load_files_in_dir("addons/suits")

-- Load the Tags
load_files_in_dir("addons/tags")