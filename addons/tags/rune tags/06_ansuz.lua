SMODS.Tag {
    key = "ansuz_tag",
    loc_txt = {
        label = "Ansuz Tag",
        name = "Ansuz Tag",
        text = {
            "Applies the {C:attention}Ansuz{} effect",
            "during the next {C:attention}shop{}"
        }
    },
    no_collection = true,
    yes_pool_flag = 'rune_effects',
    atlas = "BoingularTags",
    pos = {x = 0, y = 1},
    config = {
        type = ""
    },
    apply = function (self, tag, context)
    end
}