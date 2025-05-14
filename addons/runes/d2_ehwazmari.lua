SMODS.Consumable {
    key = "ehwaz",
    loc_txt = {
        name = "Ehwaz",
        text = {
            "Grants the {C:attention}Midas Mask{} effect",
            "for the current blind"
        }
    },
    cost = 4,
    set = "BoingularRunes",
    atlas = "BoingularRunes",
    pos = {x = 1, y = 2},
    pools = {
        ["boingular_def_rune"] = true
        },

    can_use = function (self, card)
        return true
    end,

    use = function (self, card, area, copier)
        play_sound('timpani')
        local card = create_card('Joker', G.rune_area, nil, nil, nil, nil, 'j_midas_mask', 'jud')
        card:add_to_deck()
        G.rune_area:emplace(card)
    end
}