SMODS.Tag {
    key = "inguz_tag",
    loc_txt = {
        label = "Inguz Tag",
        name = "Inguz Tag",
        text = {
            "Applies the {C:attention}Inguz{} effect",
            "during the next {C:attention}blind{}"
        }
    },
    no_collection = true,
    yes_pool_flag = 'rune_effects',
    atlas = "BoingularTags",
    pos = {x = 3, y = 2},
    config = {
        type = ""
    },
    apply = function (self, tag, context)
    end
}