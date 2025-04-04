SMODS.Joker {
    key = "whole_lotta",
    loc_txt = {
        name = "Whole Lotta Mult",
        text = {
            "{C:green}#1# in 6{} chance to add",
            "{C:red}Red Seal{} or {C:mult}Mult Enhancement{}",
            "to scored {C:hearts}Heart{} cards"
        }
    },
    rarity = 2,
    atlas = "BoingularJokers",
    pos = {x = 4, y = 1},
    cost = 6,
    loc_vars = function (self, info_queue, card)
    info_queue[#info_queue + 1] = {key = 'red_seal', set = 'Other'}
    info_queue[#info_queue + 1] = G.P_CENTERS.m_mult
       return {
        vars = {
            G.GAME.probabilities.normal
        }
       }
    end,
    eternal_compat = true,
    perishable_compat = true,
    blueprint_compat = true,
    calculate = function(self, card, context)
            if context.individual and context.cardarea == G.play then
                local upgraded = false
                local other = context.other_card
                local colour = G.C["SO_"..(G.SETTINGS.colourblind_option and 2 or 1)].Hearts
                if context.other_card:is_suit('Hearts') then
                    local rand1 = pseudorandom("boingular_mult")
                    local rand2 = pseudorandom("boingular_red")
                    if rand1 < G.GAME.probabilities.normal/6 then
                        upgraded = true
                        other:set_ability(G.P_CENTERS.m_mult, nil, true)
                    end
                    if rand2 < G.GAME.probabilities.normal/6 then
                        upgraded = true
                        G.E_MANAGER:add_event(Event({
                            func = function()
                                other:set_seal("Red")
                                other:juice_up()
                                return true
                            end
                        }))
                    end
                end
                if upgraded == true then
                    return {
                        message = "Slatt!",
                        colour = colour,
                        card = card
                    }
                end
            end
    end
}