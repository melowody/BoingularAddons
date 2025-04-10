SMODS.Blind {
    key = "sniper_blind",
    loc_txt = {
        name="The Sniper",
        text={
            "Played hands must contain",
            "a {C:important}#1#{}"
        }
    },
    loc_vars = function (self)
        return {
            vars = {
                localize()
            }
        }
    end,
    collection_loc_vars = function (self)
        return {
            vars = {
                
            }
        }
    end,
    atlas = "BoingularBlinds",
    pos = { x = 0, y = 0 },
    mult = 2,
    boss = { min = 1, max = 10 },
    boss_colour = HEX("FF0000"),
    debuff_hand = function(self, cards, hand, handname, check)
        if #get_X_same(#cards, cards) > 0 then
            return false
        end
        return true
	end,
}