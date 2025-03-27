SMODS.Achievement {
    key = "true_clown",
    loc_txt = {
        name = "A True Clown",
        description = {
            "Complete a Gold Stake run without using any Jokers"
        },
        unlock = {
            "Complete a Gold Stake run without using any Jokers"
        }
    },
    atlas = "BoingularMisc",
    pos = {x = 0, y = 0},
    bypass_all_unlocked = true,
    hidden_text = true,
    unlock_condition = function(self, args)
        return args.type == "win" and G.GAME.max_jokers == 0 and (args.stake or self.GAME.stake or 1) == 8
    end
}