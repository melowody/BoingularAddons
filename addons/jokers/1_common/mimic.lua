SMODS.Joker {
    key = "mimic",
    loc_txt = {
        name = "Joker?",
        text = {
            "{C:chips}+25{} Chips",
        }
    },
    rarity = 1,
    atlas = "BoingularJokers",
    pos = {x = 0, y = 2},
    cost = 2,
    loc_vars = function(self, info_queue, card)
        return {
                vars = {

                }
        }
    end,
    eternal_compat = true,
    perishable_compat = false,
    blueprint_compat = false,
    calculate = function(self, card, context)
        if context.joker_main and context.cardarea == G.jokers then
            return {
                chips = 25
            }
        end
    end
}