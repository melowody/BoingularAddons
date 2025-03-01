SMODS.Joker{
    key = "prophet",
    loc_txt = {
        name = "Prophet",
        text = {
            "This Joker gains",
            "0.5x Mult every time",
            "a Spectral card is used",
            "{C:inactive}(Currently X Mult){}"
              }
    },
    rarity = 2,
    atlas = "BoingularJokers",
    pos = {
        x = 4,
        y = 0
    },
    config = {
        extra = {
        },
    },
    cost = 5,
    eternal_compat = true,
    perishable_compat = true,
    blueprint_compat = true,
    calculate = function (self, card, context)
        if context.cardarea == G.play and context.individual then

        end
    end 
}
