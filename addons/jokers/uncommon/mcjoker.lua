SMODS.Joker{
    key = "mcjoker",
    loc_txt = {
        name = "McJoker",
        text = {
            "Earn {C:money}$#1#{} at the end",
            "of every {C:attention}Boss Blind{}",
            "{C:blue}#2#{} Hand"
              }
    },
    rarity = 2,
    atlas = "BoingularJokers",
    pos = {x = 5, y = 0},
    config = {
        extra = {
            check = 20,
            less_hands = -1
        },
    },
    loc_vars = function(self, info_queue, card)
        return {
                vars = {
                    card.ability.extra.check,
                    card.ability.extra.less_hands
                }
        }
    end,
    cost = 5,
    eternal_compat = true,
    perishable_compat = true,
    blueprint_compat = false,
    add_to_deck = function (self, card, from_debuff)
		G.GAME.round_resets.hands = G.GAME.round_resets.hands + card.ability.extra.less_hands
    end,
    remove_from_deck = function (self, card, from_debuff)
		G.GAME.round_resets.hands = G.GAME.round_resets.hands - card.ability.extra.less_hands
    end,
    calc_dollar_bonus = function (self, card)
        if G.GAME.blind.boss == true then
            return
                card.ability.extra.check
         end
    end 
}