SMODS.Consumable {
    key = "laguz",
    loc_txt = {
        name = "Laguz",
        text = {
            "Grants the {C:attention}Matador{} effect",
            "for the current blind"
        }
    },
    cost = 4,
    set = "BoingularRunes",
    atlas = "BoingularRunes",
    pos = {x = 2, y = 2},
    pools = {
        ["boingular_def_rune"] = true
        },

    can_use = function (self, card)
        return true
    end,

    use = function (self, card, area, copier)
       G.E_MANAGER:add_event(Event({
            func = (function()
                add_tag(Tag('tag_boingular_laguz_tag'))
                play_sound('generic1', 0.9 + math.random()*0.1, 0.8)
                play_sound('holo1', 1.2 + math.random()*0.1, 0.4)
                    return true
                end)
            }))
    end
}