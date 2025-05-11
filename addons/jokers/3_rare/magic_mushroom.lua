SMODS.Joker {
    key = "magic_mushroom",
    loc_txt = {
        name = "Magic Mushroom",
        text = {
            "{C:red}A{C:attention}l{C:green}l {C:blue}s{C:spectral}t{C:legendary}a{C:red}t{C:attention}s {C:green}u{C:blue}p{C:spectral}!",
            "{s:0.7}(+1 hand/discard, +1 hand size)",
            "{s:0.7}(+1 Joker slot, +1 Consumeable slot)"
        }
    },
    rarity = 3,
    atlas = "BoingularJokers",
    pos = {x = 3, y = 1},
    cost = 4,
    eternal_compat = true,
    perishable_compat = true,
    blueprint_compat = false,
    add_to_deck = function(self, card, from_debuff)
        G.consumeables.config.card_limit = 25
    end
}