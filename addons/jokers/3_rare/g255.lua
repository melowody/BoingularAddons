SMODS.Joker {
    key = "g255",
    loc_txt = {
        name = "G255",
        text = {
            "Retriggers all {C:green}Green Cards{}",
            "in play, Jokers or Playing Cards"
        }
    },
    loc_vars = function(self, info_queue, card)
        info_queue[#info_queue + 1] = G.P_CENTERS.e_boingular_green
    end,
    rarity = 3,
    atlas = "BoingularJokers",
    pos = {x = 3, y = 1},
    cost = 10,
    eternal_compat = true,
    perishable_compat = true,
    blueprint_compat = true,
    calculate = function(self, card, context)
        if ((context.repetition and context.cardarea == G.play) or (context.retrigger_joker_check and not context.retrigger_joker)) and (context.other_card.edition and context.other_card.edition.key == "e_boingular_green") then
            return {
                message = localize('k_again_ex'),
                repetitions = 1,
                card = context.other_card
            }
        end
    end
}