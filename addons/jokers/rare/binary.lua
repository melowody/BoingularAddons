SMODS.Joker{
    key = "binary",
    loc_txt = {
        name = "Binary Joker",
        text = {
            "This {C:attention}Joker{} alternates",
            "{C:white,X:mult}X#2#{} {C:mult}Mult{} and {C:white,X:chips}X#1#{} {C:chips}Chips{}",
            "on every hand played"
              }
    },
    rarity = 3,
    atlas = "BoingularJokers",
    pos = {x = 9, y = 0},
    config = {
        extra = {
            chips = 4,
            mult = 2,
            decide = 0
        },
    },
    loc_vars = function(self, info_queue, card)
        return {
                vars = {
                    card.ability.extra.chips,
                    card.ability.extra.mult
                }
        }
    end,
    cost = 8,
    eternal_compat = true,
    perishable_compat = true,
    blueprint_compat = true,
    calculate = function (self, card, context)
        if context.before and not context.blueprint then
            card.ability.extra.decide = card.ability.extra.decide + 1
        end
         if context.cardarea == G.jokers and context.joker_main then
          if card.ability.extra.decide % 2 == 0 then return {
                colour = G.C.MULT,
                xmult = card.ability.extra.mult
            } elseif card.ability.extra.decide % 2 == 1 then return {
                colour = G.C.CHIPS,
                xchips = card.ability.extra.chips
            }
            end
         end
    end
}
