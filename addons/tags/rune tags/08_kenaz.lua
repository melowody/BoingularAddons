SMODS.Tag {
    key = "kenaz_tag",
    loc_txt = {
        label = "Kenaz Tag",
        name = "Kenaz Tag",
        text = {
            "Applies the {C:attention}Kenaz{} effect",
            "during the next {C:attention}shop{}"
        }
    },
    no_collection = true,
    yes_pool_flag = 'rune_effects',
    atlas = "BoingularTags",
    pos = {x = 2, y = 1},
    config = {
        type = ""
    },
    apply = function (self, tag, context)
    end
}