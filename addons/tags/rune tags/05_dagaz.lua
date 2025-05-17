SMODS.Tag {
    key = "dagaz_tag",
    loc_txt = {
        label = "Dagaz Tag",
        name = "Dagaz Tag",
        text = {
            "Applies the {C:attention}Dagaz{} effect",
            "during the next {C:attention}blind{}"
        }
    },
    no_collection = true,
    yes_pool_flag = 'rune_effects',
    atlas = "BoingularTags",
    pos = {x = 4, y = 2},
    config = {
        type = ""
    },
    apply = function (self, tag, context)
    end
}