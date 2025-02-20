SMODS.Joker {
    key = "roulette",
    loc_txt = {
        name = "Russian Roulette",
        text = {
            "{C:green}#2# in #1#{} chance",
            "to win {C:money}$#3#{}",
            "{C:green}1 in #1#{} chance",
            "to {C:red}set cash to $0{}",
            "and delete itself",
            "{C:inactive}Added by Muzza"
        }
    },
    rarity = 2,
    atlas = "BoingularJokers",
    pos = {x = 2, y = 0},
    cost = 6,
    eternal_compat = true,
    perishable_compat = true,
    blueprint_compat = true,
    config = {
        extra = {
            reward = 20,
            odds = 6
        }
    },
    loc_vars = function(self, info_queue, card)
        return { vars = { G.GAME.probabilities.normal * card.ability.extra.odds, (G.GAME.probabilities.normal * card.ability.extra.odds) - 1, card.ability.extra.reward }}
    end,
    calculate = function(self, card, context)
        if not context.game_over and context.end_of_round and context.main_eval then
            local rand = pseudorandom("boingular_roulette")
            if rand < 1 / (G.GAME.probabilities.normal * card.ability.extra.odds) then
                ease_dollars(-G.GAME.dollars, true)
                extinct(card, "Blam!", nil)
            else
                return {
                    dollars = card.ability.extra.reward,
                    colour = G.C.MONEY
                }
            end
        end
    end
}