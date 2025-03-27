SMODS.Joker{
    key = "prophet",
    loc_txt = {
        name = "Prophet",
        text = {
            "This {C:attention}Joker{} gains",
            "{C:white,X:mult}X0.5{} Mult every time",
            "a {C:spectral}Spectral{} card is used",
            "{C:inactive}(Currently {C:white,X:mult}X#1#{C:inactive} Mult){}"
              }
    },
    rarity = 2,
    atlas = "BoingularJokers",
    pos = {x = 4, y = 0},
    config = {
        extra = {
            multNum = 1
        },
    },
    loc_vars = function(self, info_queue, card)
        return {
                vars = {
                    card.ability.extra.multNum
                }
        }
    end,
    cost = 5,
    eternal_compat = true,
    perishable_compat = true,
    blueprint_compat = true,
    calculate = function (self, card, context)
        local total_spectrals = G.GAME.consumeable_usage_total and G.GAME.consumeable_usage_total.spectral or 0
        if context.using_consumeable and context.consumeable.ability.set == "Spectral" and not context.blueprint then
            card.ability.extra.multNum = 1 + (total_spectrals * 0.5)
            return {
                message = "X" .. tostring(card.ability.extra.multNum),
                colour = G.C.MULT
            }
        end
        if context.cardarea == G.jokers and context.joker_main then
            return{
                xmult = card.ability.extra.multNum
            }
        end
    end
}
