SMODS.Joker{
    key = "hornet",
    loc_txt = {
        name = "Hornet",
        text = {
                "Adds X Chips the more you win",
                "Lowers X Chips the more you lose",
                "Currently X"..tostring(ratio).." Chips"
              }
    },
    rarity = 3,
    atlas = "BoingularJokers",
    pos = {
        x = 0,
        y = 1
    },
    config = {
        extra = {
            --wins = G.career_stats.c_wins,
            --losses = G.career_stats.c_losses,
        },
    },
    loc_vars = function(self, info_queue, card)
        return {
                vars = {
                    --ratio = (2*card.ability.extra.wins)/card.ability.extra.losses
                }
        }
    end,
    cost = 8,
    eternal_compat = true,
    perishable_compat = false,
    blueprint_compat = true,
    calculate = function (self, card, context)
        if context.cardarea == G.jokers and context.joker_main then
                return {
                    --xchips = ratio
                }
         end
    end
}
