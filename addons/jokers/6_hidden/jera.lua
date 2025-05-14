SMODS.Joker{
    key = "jera_effect",
    loc_txt = {
        name = "Jera Effect",
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
    add_to_deck = function (self, card, from_debuff)
        G.GAME.round_resets.hands = G.GAME.round_resets.hands + 3
        G.GAME.round_resets.discards = G.GAME.round_resets.discards + 3
    end,
    remove_from_deck = function (self, card, from_debuff)
        G.GAME.round_resets.hands = G.GAME.round_resets.hands - 3
        G.GAME.round_resets.discards = G.GAME.round_resets.discards - 3
    end
}
