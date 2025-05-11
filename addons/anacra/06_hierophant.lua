SMODS.Consumable {
    key = "reverse_hierophant",
    loc_txt = {
        name = "The Hierophant?",
        text = {
            "Add a {C:yellow}Yellow Seal{}",
            "to {C:attention}1{} selected",
            "card in your hand"
        }
    },
    set = "BoingularAnacra",
    atlas = "BoingularAnacra",
    pos = {x = 5, y = 0},

    can_use = function(self, card)
    if G.hand and (#G.hand.highlighted == 1) then
        return true
        end
    end,

    use = function(self, card)
        G.E_MANAGER:add_event(Event({func = function()
            play_sound('tarot1')
            card:juice_up(0.3, 0.5)
            return true end }))
        
        G.E_MANAGER:add_event(Event({trigger = 'after',delay = 0.1,func = function()
            G.hand.highlighted[1]:set_seal("boingular_yellow_seal", nil, true)
            return true end }))
        
        delay(0.5)
        G.E_MANAGER:add_event(Event({trigger = 'after', delay = 0.2,func = function() G.hand:unhighlight_all(); return true end }))
    end
}