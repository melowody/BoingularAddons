SMODS.Joker {
    key = "ecological",
    loc_txt = {
        name = "Ecological Joker",
        text = {
            "This Joker gains {C:chips}+#1#{} Chips",
            "per {C:attention}consecutive{} hand",
            "played with a",
            "scoring {C:green}Green Card{}",
            "{C:inactive}(Currently {C:chips}+#2#{C:inactive} Chips)"
        }
    },
    config = {
        extra = {
            current = 0,
            add = 25
        }
    },
    loc_vars = function (self, info_queue, card)
        info_queue[#info_queue + 1] = G.P_CENTERS.e_boingular_green
        return { vars = { card.ability.extra.add, card.ability.extra.current } }
    end,
    rarity = 1,
    atlas = "BoingularJokers",
    pos = {x = 3, y = 1},
    cost = 5,
    eternal_compat = true,
    perishable_compat = true,
    blueprint_compat = true,
    calculate = function(self, card, context)
        if context.before and context.cardarea == G.jokers and not context.blueprint then
            local green = false
            for i = 1, #context.scoring_hand do
                local card = context.scoring_hand[i]
                if card.edition and card.edition.key == "e_boingular_green" then
                    green = true
                end
            end
            if green then
                card.ability.extra.current = card.ability.extra.current + card.ability.extra.add
            else
                local curr = card.ability.extra.current
                card.ability.extra.current = 0
                if curr > 0 then 
                    return {
                        card = card,
                        message = localize('k_reset')
                    }
                end
            end
        elseif context.joker_main then
            return {
                chips = card.ability.extra.current,
                colour = G.C.CHIPS
            }
        end
    end
}