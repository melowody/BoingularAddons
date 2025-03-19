SMODS.Seal {
    key = "seal1",
    loc_txt = {
        name = "Seal Seal",
        label = "Seal",
        text = {
            "Eats any {C:inactive}Stone Cards{} this",
            "card is played with, and gives",
            "{C:mult}+#1#^(Stone Cards Eaten){} Mult",
            "{C:inactive}(Currently {C:mult}+#2#{C:inactive} Mult)"
        }
    },
    config = {
        base = 2
    },
    loc_vars = function (self, info_queue, card)
        if card.ability["boingular_seal_current"] == nil then
            card.ability["boingular_seal_current"] = 0
        end
        return { vars = { self.config.base, self.config.base ^ card.ability["boingular_seal_current"] } }
    end,
    atlas = "BoingularSeals",
    pos = {
        x = 0,
        y = 0
    },
    badge_colour = HEX("AAAAAA"),
    calculate = function (self, card, context)
        
    end
}