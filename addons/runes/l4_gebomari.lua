SMODS.Consumable {
    key = "gebo",
    loc_txt = {
        name = "Gebo",
        text = {
            "Adds one {C:attention}Mega Spectral Pack{}",
            "to the current shop"
        }
    },
    cost = 4,
    set = "BoingularRunes",
    atlas = "BoingularRunes",
    pos = {x = 3, y = 1},
    pools = {
        ["boingular_life_rune"] = true
        },

    can_use = function (self, card)
        return true
    end,

    use = function (self, card, area, copier)
       G.E_MANAGER:add_event(Event({
            func = (function()
                add_tag(Tag('tag_boingular_gebo_tag'))
                play_sound('generic1', 0.9 + math.random()*0.1, 0.8)
                play_sound('holo1', 1.2 + math.random()*0.1, 0.4)
                    return true
                end)
            }))
    end
}