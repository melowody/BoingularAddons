SMODS.Joker{
    key = "eihwaz_effect",
    loc_txt = {
        name = "Eihwaz Effect",
        text = {
              }
    },
    no_collection = true,
    yes_pool_flag = 'rune_effects',
    rarity = 1,
    atlas = "BoingularJokers",
    pos = {x = 3, y = 1},
    config = {
        extra = {
        },
    },
    cost = 0,
    eternal_compat = false,
    perishable_compat = true,
    blueprint_compat = false,
    calculate = function (self, card, context)
        if context.joker_main then
            return {xmult = 10}
        end
    end
}
