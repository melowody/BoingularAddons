SMODS.Consumable {
    key = "jera",
    loc_txt = {
        name = "Jera",
        text = {
            "Gain {C:chips}+3{} Hands and",
            "{C:mult}+3{} Discards for the blind"
        }
    },
    cost = 4,
    set = "BoingularRunes",
    atlas = "BoingularRunes",
    pos = {x = 0, y = 0},
    pools = {
        ["boingular_off_rune"] = true
        },

    can_use = function (self, card)
        return true
    end,

    use = function (self, card, area, copier)
        play_sound('timpani')
        local card = create_card('Joker', G.rune_area, nil, nil, nil, nil, 'j_boingular_jera_effect', nil)
        card:add_to_deck()
        G.rune_area:emplace(card)
    end
}