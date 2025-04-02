SMODS.Joker {
    key = "whole_lotta",
    loc_txt = {
        name = "Whole Lotta Mult",
        text = {
            "yad"
        }
    },
    rarity = 1,
    atlas = "BoingularJokers",
    pos = {x = 4, y = 1},
    cost = 6,
    loc_vars = function (self, info_queue, card)
        
    end,
    eternal_compat = true,
    perishable_compat = true,
    blueprint_compat = true,
    calculate = function(self, card, context)
            if context.individual and context.joker_main then
                
            end
    end
}