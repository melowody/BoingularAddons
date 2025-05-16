SMODS.Tag {
    key = "jera_tag",
    loc_txt = {
        label = "Jera Tag",
        name = "Jera Tag",
        text = {
            "Applies the {C:attention}Jera{} effect",
            "during the next {C:attention}blind{}"
        }
    },
    atlas = "BoingularTags",
    pos = {x = 0, y = 0},
    config = {
        type = ""
    },
    apply = function (self, tag, context)
        tag.triggered = true
        play_sound('timpani')
        local card = create_card('Joker', G.rune_area, nil, nil, nil, nil, 'j_boingular_jera_effect', nil)
        card:add_to_deck()
        G.rune_area:emplace(card)
    end
}