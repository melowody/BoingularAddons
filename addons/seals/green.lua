SMODS.Seal {
    key = "green_seal",
    loc_txt = {
        name = "Green Seal",
        label = "Green Seal",
        text = {
            "Always counts this",
            "card in scoring"
        }
    },
    atlas = "BoingularSeals",
    pos = {
        x = 1,
        y = 0
    },
    badge_colour = HEX("38D41A"),
    calculate = function (self, card, context)
        if context.modify_scoring_hand and context.other_card.seal == "boingular_green_seal" then
            return {
                add_to_hand = true
            }
        end
    end
}