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
    no_collection = true,
    yes_pool_flag = 'rune_effects',
    atlas = "BoingularTags",
    pos = {x = 0, y = 0},
    config = {
        type = "round_start_bonus"
    },
    apply = function (self, tag, context)
        if context.type == 'round_start_bonus' then
        tag:yep("Jera!", G.C.BOINGULAR_OFFENSE_RUNE, function()
        play_sound('timpani')
        ease_hands_played(3)
        ease_discard(3)
        tag.triggered = true
        return true
        end)
    end
end
}