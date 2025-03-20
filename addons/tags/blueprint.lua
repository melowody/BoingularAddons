SMODS.Tag {
    key = "blueprint_tag",
    loc_txt = {
        label = "Blueprint Tag",
        name = "Blueprint Tag",
        text = {
            "Shop has a {C:green}#1# in 2{} chance",
            "to spawn a {C:spectral}Blueprint Joker{}"
        }
    },
    loc_vars = function (self, info_queue, tag)
        return {
            vars = {
                G.GAME.probabilities.normal
            }
        }
    end,
    atlas = "BoingularTags",
    pos = {
        x = 0,
        y = 0
    },
    config = {
        type = "store_joker_create"
    },
    apply = function (self, tag, context)

        if not (context and context.type == "store_joker_create") then
            return nil
        end

        if pseudorandom("blueprint_tag") > (G.GAME.probabilities.normal / 2) then

            tag:yep("Nope!", G.C.RED, function ()
                return true
            end)
            tag.triggered = true

            return nil
        end

        local key = (pseudorandom("blueprint_tag") < (G.GAME.probabilities.normal / 15)) and "j_boingular_mcjoker" or "j_blueprint"

        local card = SMODS.create_card({
            key = key,
            area = G.shop_jokers
        })
        create_shop_card_ui(card, 'Joker', G.shop_jokers)
        card.states.visible = false

        tag:yep("+", G.C.BLUE, function()
            card:start_materialize()
            return true 
        end)

        tag.triggered = true
        return card

    end
}