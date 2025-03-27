SMODS.Achievement {
    key = "thorough_planning",
    loc_txt = {
        name = "Thorough Planning",
        description = {
            "Get a Shop full of Blueprints"
        },
        unlock = {
            "Get a Shop full of Blueprints"
        }
    },
    atlas = "BoingularMisc",
    pos = {x = 0, y = 0},
    bypass_all_unlocked = true,
    hidden_text = false,
    unlock_condition = function(self, args)
        if args.type ~= "shop_joker" or not args.area then return false end

        for _, card in ipairs(args.area.cards) do
            if card.ability.name ~= "Blueprint" then return false end
        end

        return true
    end
}