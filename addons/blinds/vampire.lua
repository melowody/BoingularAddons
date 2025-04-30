SMODS.Blind {
    key = "vampire_blind",
    loc_txt = {
        name="The Vampire",
        text={
            "Enhanced Cards are debuffed"
        }
    },
    loc_vars = function (self)
        return {
            vars = {
            }
        }
    end,
    vars = {
    },
    atlas = "BoingularBlinds",
    pos = { x = 0, y = 2 },
    mult = 2,
    boss = { min = 1, max = 10 },
    boss_colour = HEX("FF7B00"),
    debuff_hand = function(self, cards, hand, handname, check)
        
	end,
}