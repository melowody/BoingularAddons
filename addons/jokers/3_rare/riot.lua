SMODS.Joker {
    key = "riot",
    loc_txt = {
        name = "Riot Joker",
        text = {
            "{C:mult}Destroys{} all {C:eternal}eternal{C:attention} Jokers{}",
            "then itself when {C:blue}round{} ends",
            "{C:inactive}Added by Marisa"
        }
    },
    rarity = 3,
    atlas = "BoingularJokers",
    pos = {x = 1, y = 0},
    cost = 10,
    eternal_compat = true,
    perishable_compat = false,
    blueprint_compat = false,
    calculate = function(self, card, context)
        if not context.game_over and not context.blueprint and not context.repetition and context.end_of_round then
            card:destroy("82FF92", nil)
            for i = 1, #G.jokers.cards do
                local curr_card = G.jokers.cards[i]
                if curr_card.ability.eternal then
                    curr_card:destroy("82FF92", nil)
                end
            end
        end
    end
}