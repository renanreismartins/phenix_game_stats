use Mix.Config

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :derivco, DerivcoWeb.Endpoint,
  http: [port: 4002],
  server: false,
  dataset: "data_test.csv"

# Print only warnings and errors during test
config :logger, level: :warn
