SMODS.Joker {
    key = "glonk",
    loc_txt = {
        name = "Glonk",
        text = {
            "Does absolutely nothing and dies",
            "{C:inactive}Added by zetex"
        }
    },
    rarity = "boingular_evil",
    atlas = "BoingularJokers",
    pos = {x = 0, y = 0},
    cost = 0,
    eternal_compat = true,
    perishable_compat = false,
    blueprint_compat = false,
    calculate = function(self, card, context)
        if not context.game_over and not context.blueprint and not context.repetition and (context.end_of_round or context.ending_shop) and context.cardarea == G.jokers then
            return card:extinct("Died", "tarot1")
        end
    end
}