SMODS.Joker {
    key = "verdant",
    loc_txt = {
        name = "Verdant Joker",
        text = {
            "All played cards become",
            "{C:green}Green Cards{} when scored"
        }
    },
    loc_vars = function (self, info_queue, card)
        info_queue[#info_queue + 1] = G.P_CENTERS.e_boingular_green
    end,
    rarity = 2,
    atlas = "BoingularJokers",
    pos = {x = 3, y = 1},
    cost = 5,
    eternal_compat = true,
    perishable_compat = true,
    blueprint_compat = false,
    calculate = function(self, card, context)
        if context.before and context.cardarea == G.jokers then
            for _, v in ipairs(context.scoring_hand) do
                G.E_MANAGER:add_event(Event({
                    func = function()
                        v:set_edition("e_boingular_green", nil, true)
                        v:juice_up()
                        return true
                    end
                })) 
            end
        end
    end
}