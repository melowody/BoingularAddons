SMODS.Blind {
    key = "jury_blind",
    loc_txt = {
        name="The Jury",
        text={
            "All numbered cards",
            "are debuffed",
        }
    },
    atlas = "BoingularBlinds",
    pos = { x = 0, y = 3 },
    mult = 2,
    boss = { min = 1, max = 10 },
    boss_colour = HEX("003FFF"),
    recalc_debuff = function (self, card, from_blind)
        return not card:is_face(true) and card.area ~= G.jokers and card.area ~= G.consumeables
    end
}