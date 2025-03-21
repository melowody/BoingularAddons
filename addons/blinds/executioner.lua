local old_end_round = end_round
function end_round()
    old_end_round()
end
SMODS.Blind {
    key = "executioner_blind",
    loc_txt = {
        name="The Executioner",
        text={
            "Playing a #1#",
            "sets chips to 0"
        }
    },
    loc_vars = function (self)
        return {
            vars = {
                (G.GAME and G.GAME.current_round and G.GAME.current_round.most_played_poker_hand) and localize(G.GAME.current_round.most_played_poker_hand, "poker_hands") or "[most played hand]"
            }
        }
    end,
    collection_loc_vars = function (self)
        return {
            vars = {
                "[most played hand]"
            }
        }
    end,
    atlas = "BoingularBlinds",
    pos = { x = 0, y = 2 },
    mult = 2,
    boss = { min = 1, max = 10 },
    boss_colour = HEX("FF7B00"),
    debuff_hand = function(self, cards, hand, handname, check)
        -- huhgushfuiodshnfjks
	end,
}