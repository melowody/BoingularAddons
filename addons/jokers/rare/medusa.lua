SMODS.Joker{
    key = "medusa",
    loc_txt = {
        name = "Medusa",
        text = {
            "Scored {C:attention}face{} cards are",
            "turned into {C:attention}Stone Cards{}"
              }
    },
    rarity = 3,
    atlas = "BoingularJokers",
    pos = {
        x = 7,
        y = 0
    },
    config = {
        extra = {
        },
    },
    cost = 8,
    eternal_compat = true,
    perishable_compat = true,
    blueprint_compat = false,
    calculate = function (self, card, context)
        if context.cardarea == G.play and context.individual then

        end
    end 
}
