SMODS.Joker {
    key = "boombox",
    loc_txt = {
        name = "Boombox",
        text = {
            "Gains {C:mult}+Mult{} the louder",
            "the {C:attention}game volume{} is",
            "{C:inactive}(Currently {C:mult}+#1#{C:inactive} Mult)"
        }
    },
    rarity = 1,
    atlas = "BoingularJokers",
    pos = {x = 3, y = 1},
    cost = 4,
    eternal_compat = true,
    perishable_compat = true,
    blueprint_compat = true,
    config = {
        extra = {
            mult = (G.SETTINGS.SOUND.volume + G.SETTINGS.SOUND.music_volume + G.SETTINGS.SOUND.game_sounds_volume)/12
        }
    },
    loc_vars = function (self, info_queue, card)
                card.ability.extra.mult = (G.SETTINGS.SOUND.volume + G.SETTINGS.SOUND.game_sounds_volume + G.SETTINGS.SOUND.music_volume) / 12
                return { vars = { card.ability.extra.mult }}
    end,
    calculate = function(self, card, context)
        if context.cardarea == G.jokers and context.joker_main then
            return {
            mult = card.ability.extra.mult
            }
        end
    end
}