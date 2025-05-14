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
        play_sound('timpani')
        local card = create_card('Joker', G.rune_area, nil, nil, nil, nil, 'j_matador', 'jud')
        card:add_to_deck()
        G.rune_area:emplace(card)
    end
}