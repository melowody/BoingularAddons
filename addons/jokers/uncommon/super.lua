SMODS.Joker {
    key = "super_joker",
    loc_txt = {
        name = "Super Joker",
        text = {
            "Gains {C:red}+#1#{} Mult",
            "per {C:blue}Round{} played",
            "{C:inactive}(Currently {C:red}+#2#{C:inactive} Mult}"
        }
    },
    config = {
        extra = {
            increase = 4,
            current = 0
        }
    },
    loc_vars = function (self, info_queue, card)
        return {
            vars = {
                card.ability.extra.increase,
                card.ability.extra.current
            }
        }
    end,
    rarity = 2,
    atlas = "BoingularJokers",
    pos = {x = 8, y = 0},
    cost = 6,
    eternal_compat = true,
    perishable_compat = true,
    blueprint_compat = true,
    calculate = function (self, card, context)
        if context.joker_main and not context.repetition then
            return {
                mult = card.ability.extra.current
            }
        end

        if context.joker_main and context.blueprint then
            return {
                mult = card.ability.extra.current
            }
        end

        if context.end_of_round and not context.blueprint and not context.game_over and context.main_eval then
            card.ability.extra.current = card.ability.extra.current + card.ability.extra.increase
            return {
                message = "Upgraded!",
                colour = G.C.MULT,
                card = card
            }
        end
    end
}