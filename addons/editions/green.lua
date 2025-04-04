SMODS.Sound {
    key = "snd_green",
    path = "green.ogg"
}

SMODS.Shader {
    key = "green",
    path = "green.fs"
}

SMODS.Edition {
    key = "green",
    shader = "green",
    loc_txt = {
        name = "Green",
        label = "Green",
        text = {
            "Card is tinted {C:green}Green"
        }
    },
    in_shop = true,
    weight = 15,
    extra_cost = 0,
    apply_to_float = true,
    badge_colour = HEX("00FF00"),
    sound = {
        sound = "boingular_snd_green",
        per = 1,
        vol = 0.4
    }
}