SMODS.Blind {
    key = "gavel_boss_blind",
    loc_txt = {
        name="Jade Gavel",
        text={
            "You must play #1#",
            "at least once, or score is",
            "set to 0 at end of Blind"
        }
    },
    config = {
        extra = {
            hand = "Pair",
            winning = false
        }
    },
    loc_vars = function (self)
        return { vars = { self.config.extra.hand } }
    end,
    set_blind = function (self)
        local keys = {}
        for k, v in pairs(G.GAME.hands) do
            if v.played > 0 then
                keys[#keys+1] = k
            end
        end
        self.config.extra.hand = pseudorandom_element(keys, pseudoseed("boingular_gavel"))
    end,
    disable = function (self)
        self.config.extra.winning = true
    end,
    atlas = "BoingularBlinds",
    pos = { x = 0, y = 1 },
    mult = 2,
    boss = { min = 1, max = 10 },
    boss_colour = HEX("00FF33")
}