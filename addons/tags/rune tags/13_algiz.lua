SMODS.Tag {
    key = "algiz_tag",
    loc_txt = {
        label = "Algiz Tag",
        name = "Algiz Tag",
        text = {
            "Applies the {C:attention}Algiz{} effect",
            "during the next {C:attention}blind{}"
        }
    },
    no_collection = true,
    yes_pool_flag = 'rune_effects',
    atlas = "BoingularTags",
    pos = {x = 2, y = 0},
    config = {
        type = ""
    },
    apply = function (self, tag, context)
    end
}