SMODS.Consumable {
    key = "ansuz",
    loc_txt = {
        name = "Ansuz",
        text = {
            "Makes every item in",
            "the current shop {C:attention}free"
        }
    },
    cost = 4,
    set = "BoingularRunes",
    atlas = "BoingularRunes",
    pos = {x = 0, y = 1},
    pools = {
        ["boingular_life_rune"] = true
        },

    can_use = function (self, card)
        return true
    end,

    use = function (self, card, area, copier)
       G.E_MANAGER:add_event(Event({
            func = (function()
                add_tag(Tag('tag_boingular_ansuz_tag'))
                play_sound('generic1', 0.9 + math.random()*0.1, 0.8)
                play_sound('holo1', 1.2 + math.random()*0.1, 0.4)
                    return true
                end)
            }))
    end
}