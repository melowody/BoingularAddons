SMODS.Joker{
    key = "hornet",
    loc_txt = {
        name = "Hornet",
        text = {
                "Adds {C:white,X:chips}X Chips{} the more you {C:green}win{}",
                "Lowers {C:white,X:chips}X Chips{} the more you {C:mult}lose{}",
                "{C:inactive}(Currently {C:white,X:chips}X#1#{C:inactive} Chips)"
              }
    },
    rarity = 3,
    atlas = "BoingularJokers",
    pos = {x = 0, y = 1},
    config = {
        extra = {
            wins = G.PROFILES[G.SETTINGS.profile].career_stats.c_wins,
            losses = G.PROFILES[G.SETTINGS.profile].career_stats.c_losses,
        },
    },
    loc_vars = function(self, info_queue, card)
        return {
                vars = {
                    1.0 + ((2.0*card.ability.extra.wins)/card.ability.extra.losses)
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
                    xchips = 1.0 + ((2.0*card.ability.extra.wins)/card.ability.extra.losses)
                }
         end
    end
}
