SMODS.Consumable {
    key = "perthro",
    loc_txt = {
        name = "Perthro",
        text = {
            "Grants the {C:attention}Triboulet{} effect",
            "for the current blind"
        }
    },
    cost = 4,
    set = "BoingularRunes",
    atlas = "BoingularRunes",
    pos = {x = 3, y = 0},
    pools = {
        ["boingular_off_rune"] = true
        },

    can_use = function (self, card)
        return true
    end,

    use = function (self, card, area, copier)
       G.E_MANAGER:add_event(Event({
            func = (function()
                add_tag(Tag('tag_boingular_perthro_tag'))
                play_sound('generic1', 0.9 + math.random()*0.1, 0.8)
                play_sound('holo1', 1.2 + math.random()*0.1, 0.4)
                    return true
                end)
            }))
    end
}