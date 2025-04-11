SMODS.Seal {
    key = "orange_seal",
    loc_txt = {
        name = "Orange Seal",
        label = "Orange Seal",
        text = {
            "Plays the card to the",
            "right of this one instead"
        }
    },
    atlas = "BoingularSeals",
    pos = {
        x = 2,
        y = 0
    },
    badge_colour = HEX("E58711"),
    calculate = function (self, card, context)
        if context.modify_scoring_hand and context.other_card.seal == "boingular_orange_seal" then
            return {
                add_to_hand = true
            }
        end
    end
}