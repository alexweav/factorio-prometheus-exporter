prometheus = require("lib.prometheus.prometheus")

nth_tick = 5 * 60

script.on_init(function()
    script.on_nth_tick(nth_tick, scrape_metrics)
end)

script.on_load(function()
    script.on_nth_tick(nth_tick, scrape_metrics)
end)

script.on_nth_tick(nth_tick, scrape_metrics)

gauge_exporter_count = prometheus.gauge("factorio_prometheus_exporter_count", "exporter count")

function scrape_metrics(event)
    local player = game.get_player(1)
    count = player.surface.count_entities_filtered{name="prometheus-exporter"}
    gauge_exporter_count:set(count)

    game.write_file("factorio-prometheus-exporter/test.txt", tostring(count), false)
    game.write_file("factorio-prometheus-exporter/game.prom", prometheus.collect(), false)
end
