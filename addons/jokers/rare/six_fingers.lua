local can_play_old = G.FUNCS.can_play

G.FUNCS.can_play = function(e)
    can_play_old(e)
    if #G.hand.highlighted <= 0 or G.GAME.blind.block_play then 
        e.config.colour = G.C.UI.BACKGROUND_INACTIVE
        e.config.button = nil
    else
        e.config.colour = G.C.BLUE
        e.config.button = 'play_cards_from_highlighted'
    end
end

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
    rarity = 1,
    atlas = "BoingularJokers",
    pos = {x = 3, y = 0},
    cost = 10,
    eternal_compat = true,
    perishable_compat = true,
    blueprint_compat = false,
    calculate = function(self, card, context)
        if context.setting_blind then
            G.E_MANAGER:add_event(Event({
                func = function()
                    G.hand.config.highlighted_limit = 6
                    return true
                end
            }))
        end
    end
}