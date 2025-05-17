SMODS.Tag {
    key = "berkana_tag",
    loc_txt = {
        label = "Berkana Tag",
        name = "Berkana Tag",
        text = {
            "Applies the {C:attention}Berkana{} effect",
            "during the next {C:attention}blind{}"
        }
    },
    no_collection = true,
    yes_pool_flag = 'rune_effects',
    atlas = "BoingularTags",
    pos = {x = 0, y = 2},
    config = {
        type = ""
    },
    apply = function (self, tag, context)
    end
}