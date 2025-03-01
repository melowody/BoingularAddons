local old_evalcard = eval_card

function eval_card(card, context)
    local old, post = old_evalcard(card, context)
   if context.cardarea == G.play and card == context.scoring_hand[#context.scoring_hand] and next(SMODS.find_card("j_boingular_deboning_knife")) and context.main_scoring then
    old.playing_card.mult = (old.playing_card.mult or 0) + (old.playing_card.chips or 0)
    old.playing_card.chips = 0
    end
    return old, post
  end

SMODS.Joker {
    key = "deboning_knife",
    rarity = 2,
    loc_txt = {
        name = "Deboning Knife",
        text = {
            "{C:chips}Chips{} value of last",
            "card used in scoring",
            "is added to {C:mult}mult{} instead"
              }
    },
    atlas = "BoingularJokers",
    pos = {
        x = 6,
        y = 0
    },
    config = {
        extra = {
        },
    },
    cost = 7,
    eternal_compat = true,
    perishable_compat = true,
    blueprint_compat = true,
    calculate = function (self, card, context)
    if context.cardarea == G.play and (context.other_card == context.scoring_hand[#context.scoring_hand]) then
        return {
            message = "Trimmed",
            colour = G.C.mult,
            card = card
        }
    end
end
}