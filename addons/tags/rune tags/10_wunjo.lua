SMODS.Tag {
    key = "wunjo_tag",
    loc_txt = {
        label = "Wunjo Tag",
        name = "Wunjo Tag",
        text = {
            "Applies the {C:attention}Wunjo{} effect",
            "during the next {C:attention}shop{}"
        }
    },
    no_collection = true,
    yes_pool_flag = 'rune_effects',
    atlas = "BoingularTags",
    pos = {x = 4, y = 1},
    config = {
        type = ""
    },
    apply = function (self, tag, context)
    end
}