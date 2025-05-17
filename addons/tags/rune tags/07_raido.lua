SMODS.Tag {
    key = "raido_tag",
    loc_txt = {
        label = "Raido Tag",
        name = "Raido Tag",
        text = {
            "Applies the {C:attention}Raido{} effect",
            "during the next {C:attention}shop{}"
        }
    },
    no_collection = true,
    yes_pool_flag = 'rune_effects',
    atlas = "BoingularTags",
    pos = {x = 1, y = 1},
    config = {
        type = ""
    },
    apply = function (self, tag, context)
    end
}