SMODS.Blind {
    key = "rainbow_blind",
    loc_txt = {
        name="The Rainbow",
        text={
            "Must play hands",
            "with only 1 Rank",
        }
    },
    atlas = "BoingularBlinds",
    pos = { x = 0, y = 0 },
    mult = 2,
    boss = { min = 1, max = 10 },
    boss_colour = HEX("FF0000"),
    debuff_hand = function(self, cards, hand, handname, check)
        
	end,
}