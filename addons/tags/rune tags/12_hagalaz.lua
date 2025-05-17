SMODS.Tag {
    key = "hagalaz_tag",
    loc_txt = {
        label = "Hagalaz Tag",
        name = "Hagalaz Tag",
        text = {
            "Applies the {C:attention}Hagalaz{} effect",
            "during the next {C:attention}blind{}"
        }
    },
    no_collection = true,
    yes_pool_flag = 'rune_effects',
    atlas = "BoingularTags",
    pos = {x = 1, y = 0},
    config = {
        type = ""
    },
    apply = function (self, tag, context)
    end
}