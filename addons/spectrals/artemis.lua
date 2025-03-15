SMODS.Consumable {
    set = "Spectral",
    key = "artemis",
    config = {
        destroy_count = 3
    },
    loc_txt = {
        name = "Artemis",
        text = {
            "Destroys {C:attention}#1#{} lowest ranking",
            "cards in hand, then converts",
            "remaining cards to a {E:1,C:attention}Royal",
            "{E:1,C:attention}Flush{} of a random suit",
            "{C:inactive}Added by Ivey"
        }
    },
    loc_vars = function(self, info_queue, card)
        return {vars = {(card.ability or self.config).destroy_count}}
    end,
    cost = 5,
    atlas = "BoingularSpectrals",
    pos = {x=0, y=0},
    soul_pos = {x=0, y=1},
    can_use = function(self, card)
        return G.hand and #G.hand.cards >= 5 + self.config.destroy_count
    end,
    use = function(self, card, area, _)

        -- Initialize variables
        local lowest_cards = {}
        local highest_cards = {}
        local total_destroy = self.config.destroy_count
        local suit_prefix = pseudorandom_element({'H', 'C', 'S', 'D'}, pseudoseed("boingular_sleuth"))
        local rank_prefixes = {'A', 'K', 'Q', 'J', 'T', '9', '8', '7', '6', '5', '4', '3', '2'}
        local total = #G.hand.cards

        -- Fill the table
        for i, v in ipairs(G.hand.cards) do
            lowest_cards[i] = v
        end

        -- Sort from smallest to biggest
        table.sort(lowest_cards, function (a, b)
            return a:get_id() < b:get_id()
        end)

        -- Remove items outside range
        while #lowest_cards > total_destroy do
            table.insert(highest_cards, #highest_cards+1, table.remove(lowest_cards, #lowest_cards))
        end

        -- DESTROY THEM ALL!!!!
        for _, v in ipairs(lowest_cards) do
            v:destroy("82FF92", nil)
        end

        -- Flip remaining cards around
        for i, v in ipairs(highest_cards) do
            if i > #rank_prefixes then
                break
            end

            local percent = 1.15 - (i-0.999)/(total-0.998)*0.3
            G.E_MANAGER:add_event(Event({
                trigger = 'after',
                delay = 0.15,
                func = function()
                    v:flip()
                    play_sound('card1', percent)
                    v:juice_up(0.3, 0.3)
                    return true
                end
            }))
        end

        delay(0.2)

        -- Update the remaining cards to the correct rank
        for i, v in ipairs(highest_cards) do
            print(v:get_id().." -> "..suit_prefix.."_"..rank_prefixes[i])
            G.E_MANAGER:add_event(Event({
                func = function()
                    v:set_base(G.P_CARDS[suit_prefix.."_"..rank_prefixes[i]])
                    return true
                end
            }))
        end

        -- Flip the remaining cards back around
        for i, v in ipairs(highest_cards) do
            G.E_MANAGER:add_event(Event({
                trigger = 'after',
                delay = 0.15,
                func = function()
                    v:flip()
                    play_sound('tarot2', percent, 0.6)
                    v:juice_up(0.3, 0.3)
                    return true
                end
            }))
        end

        delay(0.5)

    end
}