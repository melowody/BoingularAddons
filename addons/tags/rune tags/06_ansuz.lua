SMODS.Tag {
    key = "ansuz_tag",
    loc_txt = {
        label = "Ansuz Tag",
        name = "Ansuz Tag",
        text = {
            "Applies the {C:attention}Ansuz{} effect",
            "during the next {C:attention}shop{}"
        }
    },
    no_collection = true,
    yes_pool_flag = 'rune_effects',
    atlas = "BoingularTags",
    pos = {x = 0, y = 1},
    apply = function (self, tag, context)
        print(context.type)
        if context.type == 'shop_final_pass' or (context.type == 'boingular_update_shop' and not not G.shop_jokers and not not G.shop_booster and G.STATE_COMPLETE) then
                if G.shop and not G.shop_free then
                    G.STATE_COMPLETE = false
                    G.GAME.shop_free = true
                    tag:yep('Ansuz!', G.C.BOINGULAR_LIFE_RUNE ,function()
                        if G.shop_jokers and G.shop_booster then
                            for k, v in pairs(G.shop_jokers.cards) do
                                v.ability.couponed = true
                                v:set_cost()
                            end
                            for k, v in pairs(G.shop_booster.cards) do
                                v.ability.couponed = true
                                v:set_cost()
                            end
                        end
                        return true
                    end)
                end
                tag.triggered = true
                return true
            end
            end
}