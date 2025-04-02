SMODS.Joker {
    key = "plj",
    loc_txt = {
        name = "Problematically Large Joker",
        text = {
            "This Joker gains",
            "{C:white,X:mult}+X0.15{} Mult when each",
            "played Ace is scored",
            "{C:inactive}(Currently {C:white,X:mult}X0.15{C:inactive} Mult)"
        }
    },
    rarity = 3,
    atlas = "BoingularJokers",
    pos = {x = 5, y = 1},
    cost = 11,
    config = {
        display_size = { w = 142, h = 190 },
        pixel_size = { w = 71, h = 95 }
    },
    loc_vars = function(self, info_queue, card)
        return {
                vars = {

                }
        }
    end,
    eternal_compat = true,
    perishable_compat = true,
    blueprint_compat = true,
    calculate = function(self, card, context)
        if context.joker_main and context.cardarea == G.jokers then
            return {
                chips = 25
            }
        end
    end
}