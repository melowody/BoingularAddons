SMODS.Seal {
    key = "yellow_seal",
    loc_txt = {
        name = "Yellow Seal",
        label = "Yellow Seal",
        text = {
            "Create a random Spectral card",
            "if played in the last hand of a round",
            "{C:inactive}Must have room"
        }
    },
    atlas = "BoingularSeals",
    pos = {
        x = 3,
        y = 0
    },
    badge_colour = HEX("D6D710"),
    calculate = function (self, card, context)
        if context.modify_scoring_hand and context.other_card.seal == "boingular_yellow_seal" then
            return {
                add_to_hand = true
            }
        end
    end
}