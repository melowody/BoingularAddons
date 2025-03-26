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
    pos = {x = 7, y = 0},
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
            local faces = {}
            for k, v in ipairs(context.scoring_hand) do
                if v:is_face() then 
                    faces[#faces+1] = v
                    v:set_ability(G.P_CENTERS.m_stone, nil, true)
                    G.E_MANAGER:add_event(Event({
                        func = function()
                            v:juice_up()
                            return true
                        end
                    })) 
                end
            end
        end
    end 
}
