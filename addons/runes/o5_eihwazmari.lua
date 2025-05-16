SMODS.Consumable {
    key = "eihwaz",
    loc_txt = {
        name = "Eihwaz",
        text = {
            "Gain {C:white,X:mult}X10{} Mult",
            "for the current blind"
        }
    },
    cost = 4,
    set = "BoingularRunes",
    atlas = "BoingularRunes",
    pos = {x = 4, y = 0},
    pools = {
        ["boingular_off_rune"] = true
        },

    can_use = function (self, card)
        return true
    end,

    use = function (self, card, area, copier)
       G.E_MANAGER:add_event(Event({
            func = (function()
                add_tag(Tag('tag_boingular_eihwaz_tag'))
                play_sound('generic1', 0.9 + math.random()*0.1, 0.8)
                play_sound('holo1', 1.2 + math.random()*0.1, 0.4)
                    return true
                end)
            }))
        play_sound('timpani')
        local card = create_card('Joker', G.rune_area, nil, nil, nil, nil, 'j_boingular_eihwaz_effect', nil)
        card:add_to_deck()
        G.rune_area:emplace(card)
    end
}