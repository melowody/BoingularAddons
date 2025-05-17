SMODS.Tag {
    key = "gebo_tag",
    loc_txt = {
        label = "Gebo Tag",
        name = "Gebo Tag",
        text = {
            "Applies the {C:attention}Gebo{} effect",
            "during the next {C:attention}shop{}"
        }
    },
    no_collection = true,
    yes_pool_flag = 'rune_effects',
    atlas = "BoingularTags",
    pos = {x = 3, y = 1},
    config = {
        type = ""
    },
    apply = function (self, tag, context)
    end
}