SMODS.Consumable {
    key = "reverse_justice",
    loc_txt = {
        name = "Justice?",
        text = {
            "Creates {C:attention}1 {C:offense}offense {C:rune}rune",
            "{C:inactive}(Must have room)"
        }
    },
    set = "BoingularAnacra",
    atlas = "BoingularAnacra",
    pos = {x = 0, y = 1},
    config = {
        extra = {
            rune = 1
        }
    },

    can_use = function (self, card)
        if #G.consumeables.cards <= G.consumeables.config.card_limit or self.area == G.consumeables then
        return true
        end
    end,

    use = function (self, card, area, copier)
        for i = 1, math.min(card.ability.extra.rune, G.consumeables.config.card_limit - #G.consumeables.cards) do
            G.E_MANAGER:add_event(Event({trigger = 'after', delay = 0.4, func = function()
                if G.consumeables.config.card_limit >= #G.consumeables.cards then
                    play_sound('timpani')
                    local ran_card = math.floor(math.random(1,5))
                    local choice
                    if ran_card == 1 then
                        choice = 'c_boingular_jera'
                    elseif ran_card == 2 then
                        choice = 'c_boingular_hagalaz'
                    elseif ran_card == 3 then
                        choice = 'c_boingular_algiz'
                    elseif ran_card == 4 then
                        choice = 'c_boingular_perthro'
                    elseif ran_card == 5 then
                        choice = 'c_boingular_eihwaz'
                    end
                    local card = create_card('BoingularRunes', G.consumeables, nil, nil, nil, nil, choice, 'boingular_off_rune')
                    card:add_to_deck()
                    G.consumeables:emplace(card)
                    card:juice_up(0.3, 0.5)
                end
                return true end }))
        end
        delay(0.6)
    end
}