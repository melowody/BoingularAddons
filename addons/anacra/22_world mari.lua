SMODS.Consumable {
    key = "reverse_world",
    loc_txt = {
        name = "The World?",
        text = {
            "Enhances {C:attention}1{} selected",
            "card into a",
            "{C:attention}Flipped Card"
        }
    },
    set = "BoingularAnacra",
    atlas = "BoingularAnacra",
    pos = {x = 5, y = 2},

    can_use = function (self, card)
        if #G.consumeables.cards <= G.consumeables.config.card_limit or self.area == G.consumeables then
        return true
        end
    end,

    use = function (self, card, area, copier)
        for i = 1, math.min(1, G.consumeables.config.card_limit - #G.consumeables.cards) do
            G.E_MANAGER:add_event(Event({trigger = 'after', delay = 0.4, func = function()
                if G.consumeables.config.card_limit >= #G.consumeables.cards then
                    play_sound('timpani')
                    local card2 = create_card('Joker', G.rune_area, nil, nil, nil, nil, 'j_ring_master', 'jud')
                    local card = create_card('Joker', G.consumeables, nil, nil, nil, nil, 'j_wrathful_joker', 'jud')
                    card:add_to_deck()
                    G.rune_area:emplace(card2)
                    G.consumeables:emplace(card)
                    card:juice_up(0.3, 0.5)
                end
                return true end }))
        end
        delay(0.6)
    end
}
