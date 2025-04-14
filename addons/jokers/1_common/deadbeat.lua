SMODS.Joker {
    key = "deadbeat",
    loc_txt = {
        name = "Deadbeat",
        text = {
            "Gains 1/2 the {C:chips}Chips{} of",
            "every scored {C:hearts}Heart{} card",
            "{C:inactive}(Currently {C:chips}+#1#{C:inactive} Chips)"
        }
    },
    rarity = 1,
    atlas = "BoingularJokers",
    pos = {x = 5, y = 1},
    cost = 3,
    eternal_compat = true,
    perishable_compat = false,
    blueprint_compat = true,
    config = {
        extra = {
            milk = 0,
            chips = 0
        }
    },
    loc_vars = function (self, info_queue, card)
        return {
            vars = {
                card.ability.extra.chips,
                card.ability.extra.milk
            }
        }
    end,
    calculate = function(self, card, context)
        if not context.game_over and not context.blueprint and not context.repetition and context.end_of_round and context.cardarea == G.jokers then
            card.ability.extra.milk = card.ability.extra.milk + 1
            if card.ability.extra.milk == 9 then
                ease_dollars(-20, true)
                return card:extinct("Divorced!", "tarot1")
            end
        end
        if context.individual and context.cardarea == G.play and not context.blueprint then
            if context.other_card:is_suit('Hearts') then
                if context.other_card:is_face(true) then
                    card.ability.extra.chips = card.ability.extra.chips + 5
                elseif context.other_card:get_id() == 14 then
                    card.ability.extra.chips = card.ability.extra.chips + 5.5
                else
                    card.ability.extra.chips = card.ability.extra.chips + (context.other_card:get_id()/2.0)
                end
                end
            end
        if context.cardarea == G.jokers and context.joker_main then
            return {
                chips = card.ability.extra.chips
                }
            end
         end
}