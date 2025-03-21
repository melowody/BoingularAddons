SMODS.Blind {
    key = "gavel_boss_blind",
    loc_txt = {
        name="Jade Gavel",
        text={
            "You must play [RANDOM HAND]",
            " at least once, or score is",
            "set to 0 at end of Blind"
        }
    },
    atlas = "BoingularBlinds",
    pos = { x = 0, y = 1 },
    mult = 2,
    boss = { min = 1, max = 10 },
    boss_colour = HEX("00FF33"),
    debuff_hand = function(self, cards, hand, handname, check)
        -- huhgushfuiodshnfjks
	end,
}