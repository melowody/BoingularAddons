SMODS.Tag {
    key = "perthro_tag",
    loc_txt = {
        label = "Perthro Tag",
        name = "Perthro Tag",
        text = {
            "Applies the {C:attention}Perthro{} effect",
            "during the next {C:attention}blind{}"
        }
    },
    no_collection = true,
    yes_pool_flag = 'rune_effects',
    atlas = "BoingularTags",
    pos = {x = 3, y = 0},
    config = {
        type = "round_start_bonus"
    },
    apply = function (self, tag, context)
        if context.type == 'round_start_bonus' then
        tag:yep("Eihwaz!", G.C.BOINGULAR_DEFENSE_RUNE, function()
        play_sound('timpani')
        local card = create_card('Joker', G.rune_area, nil, nil, nil, nil, 'j_triboulet', nil)
        card:add_to_deck()
        G.rune_area:emplace(card)
        tag.triggered = true
        return true
        end)
    end
end
}