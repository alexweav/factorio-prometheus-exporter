# Factorio Prometheus Exporter
A Factorio mod for exporting circuit network data to Prometheus.

This mod is meant to provide an alternative to the common practice of using the in-game circuit system to build "circuit dashboards" out of lights and combinators. The mod can access the same data, but is intended to leverage Grafana to provide a much richer dashboard experience.

## Usage

Copy the contents of this repository to the `Factorio/mods` directory.

The Factorio directory can be found at the following location:
- Linux: `~/.factorio`
- Windows: `%APPDATA%/Factorio/saves`
- Mac: `~/Library/Application Support/factorio/saves`

Once this mod reaches a state of stability, it'll be hosted on the Factorio mod server and this step will be removed.

In order to avoid affecting the stability of the game when running large factories, this mod only produces output as a file on the local machine. It is up to the user to configure Prometheus to scrape this data, or otherwise use a tool like `node-exporter`.

### Local Grafana

TODO: Provide configuration/docker compose for this use case.

### Grafana Cloud Integration

Rather than hosting Grafana/Prometheus yourself, we've provided a setup for easily connecting the mod to a Grafana Cloud hosted instance.

If you have a hosted Grafana/Prometheus stack,
1. Rename `agent.sample.yml` to `agent.yml`.
2. Add your hosted insance's username/API key/Prometheus remote write URL to the file.
3. Run `docker compose up`.

This will launch a `node-exporter` instance that scrapes metrics from your current game, plus a [Grafana Agent](https://grafana.com/docs/grafana-cloud/agent/) instance that will forward the metrics to the hosted instance automatically.

## Is this a replacement for Graftorio/Graftorio2?

No! Graftorio is designed to export game-wide metrics to prometheus, where this mod is intended to export data which is in the user's circuit network. The circuit network gives this mod a unique degree of flexibility, but we avoid game-wide metrics. For the best Factorio monitoring experience, try using Graftorio and this mod simultaneously!
