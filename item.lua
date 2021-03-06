require("combinator-pictures")

local entity_prototype = generate_prometheus_exporter
{
    type = "constant-combinator",
    name = "prometheus-exporter",
    icon = "__factorio-prometheus-exporter__/graphics/icons/prometheus-smol.png",
    icon_size = 64,
    icon_mipmaps = 1,
    flags = { "placeable-neutral", "player-creation" },
    minable =
    {
        mining_time = 0.1,
        result = "prometheus-exporter"
    },
    max_health = 150,
    corpse = "constant-combinator-remnants",
    dying_explosion = "constant-combinator-explosion",
    collision_box = {{-0.35, -0.65}, {0.35, 0.65}},
    selection_box = {{-0.5, -1}, {0.5, 1}},
    -- damaged_trigger_effect = hit_effects.entity(),

    item_slot_count = 20,

    energy_source =
    {
        type = "electric",
        usage_priority = "secondary-input"
    },
    active_energy_usage = "1KW",

    working_sound =
    {
        sound =
        {
            filename = "__base__/sound/combinator.ogg",
            volume = 0.45
        },
        fade_in_ticks = 4,
        fade_out_ticks = 20,
        audible_distance_modifier = 0.2,
        match_speed_to_activity = true
    },
    -- vehicle_impact_sound = sounds.generic_impact,
    -- open_sound = sounds.machine_open,
    -- close_sound = sounds.machine_close,

    activity_led_light =
    {
        intensity = 0,
        size = 1,
        color = {r = 1.0, g = 1.0, b = 1.0}
    },

    activity_led_light_offsets =
    {
        {0.265625, -0.53125},
        {0.515625, -0.078125},
        {-0.25, 0.03125},
        {-0.46875, -0.5}
    },

    screen_light =
    {
        intensity = 0,
        size = 0.6,
        color = {r = 1.0, g = 1.0, b = 1.0}
    },

    screen_light_offsets =
    {
        {0.015625, -0.265625},
        {0.015625, -0.359375},
        {0.015625, -0.265625},
        {0.015625, -0.359375}
    },

    input_connection_bounding_box = {{-0.5, 0}, {0.5, 1}},
    output_connection_bounding_box = {{-0.5, -1}, {0.5, 0}},

    circuit_wire_max_distance = 9
}

local item_prototype =
{
    type = "item",
    name = "prometheus-exporter",
    icon = "__factorio-prometheus-exporter__/graphics/icons/prometheus-smol.png",
    icon_size = 64,
    icon_mipmaps = 1,
    subgroup = "circuit-network",
    place_result="prometheus-exporter",
    order = "c[combinators]-b[prometheus-exporter]",
    stack_size= 50
}

local recipe =
{
    type = "recipe",
    name = "prometheus-exporter",
    enabled = true,
    ingredients =
    {
        { "copper-cable", 5 },
        { "electronic-circuit", 5 }
    },
    result = "prometheus-exporter"
}

data:extend{entity_prototype, item_prototype, recipe}
