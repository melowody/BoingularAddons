SMODS.Tag {
    key = "ehwaz_tag",
    loc_txt = {
        label = "Ehwaz Tag",
        name = "Ehwaz Tag",
        text = {
            "Applies the {C:attention}Ehwaz{} effect",
            "during the next {C:attention}blind{}"
        }
    },
    no_collection = true,
    yes_pool_flag = 'rune_effects',
    atlas = "BoingularTags",
    pos = {x = 1, y = 2},
    config = {
        type = "round_start_bonus"
    },
    apply = function (self, tag, context)
        if context.type == 'round_start_bonus' then
        tag:yep("Ehwaz!", G.C.BOINGULAR_DEFENSE_RUNE, function()
        play_sound('timpani')
        local card = create_card('Joker', G.rune_area, nil, nil, nil, nil, 'j_midas_mask', 'jud')
        card:add_to_deck()
        G.rune_area:emplace(card)
        tag.triggered = true
        return true
        end)
    end
end
}