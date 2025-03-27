SMODS.Joker {
    key = "six_fingers",
    loc_txt = {
        name = "Six Fingers",
        text = {
            "Allows you to select",
            "{C:attention}six cards{} for your hand",
            "{C:inactive}Added by Mari"
        }
    },
    rarity = 3,
    atlas = "BoingularJokers",
    pos = {x = 3, y = 0},
    cost = 10,
    eternal_compat = true,
    perishable_compat = true,
    blueprint_compat = false,
    add_to_deck = function(self, card, from_debuff)
        G.E_MANAGER:add_event(Event({
            func = function()
                G.hand.config.highlighted_limit = G.hand.config.highlighted_limit + 1
                return true
            end
        }))
    end,
    remove_from_deck = function (self, card, from_debuff)
        G.E_MANAGER:add_event(Event({
            func = function()
                G.hand.config.highlighted_limit = G.hand.config.highlighted_limit - 1
                return true
            end
        }))
    end
}