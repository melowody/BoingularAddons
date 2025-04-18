SMODS.Suit {
    key = 'Stars',
    card_key = 'STARS',
    hidden = true,
    loc_txt = {
        singular = "Star",
        plural = "Stars"
    },
    pos = {x = 0, y = 0},
    ui_pos = {x = 0, y = 0},
    lc_atlas = 'BoingularStarSuit',
    hc_atlas = 'BoingularStarSuit',
    lc_ui_atlas = 'BoingularUI',
    hc_ui_atlas = 'BoingularUI',
    lc_colour = HEX('A242F6'),
    hc_colour = HEX('A242F6'),

    in_pool = function(self, args)
        if args and args.initial_deck then
            return false
        end
    end
}