SMODS.Joker {
    key = "plj",
    loc_txt = {
        name = "Problematically Large Joker",
        text = {
            "This {C:attention}Joker{} gains",
            "{C:white,X:mult}+X0.15{} Mult when each",
            "played {C:attention}Ace{} is scored",
            "{C:inactive}(Currently {C:white,X:mult}X#1#{C:inactive} Mult)"
        }
    },
    rarity = 3,
    atlas = "BoingularJokers",
    pos = {x = 6, y = 1},
    cost = 11,
    config = {
        extra = {
            mult = 1
        }
    },
    loc_vars = function(self, info_queue, card)
        return {
                vars = {
                    card.ability.extra.mult
                }
        }
    end,
    eternal_compat = true,
    perishable_compat = true,
    blueprint_compat = true,
    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play then
            if context.other_card:get_id() == 14 then
                card.ability.extra.mult = card.ability.extra.mult + 0.15
                return {
                    message = "Upgrade!",
                    colour = G.C.ATTENTION,
                    card = card
                }
            end
        end
        if context.cardarea == G.jokers and context.joker_main then
            return {
                xmult = card.ability.extra.mult
            }
        end
    end
}