use Mix.Config

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :xy_inc, XyInc.Web.Endpoint,
  http: [port: 4001],
  server: false

# Print only warnings and errors during test
config :logger, level: :warn

# Configure your database
config :xy_inc, XyInc.Repo,
  adapter: Ecto.Adapters.Postgres,
  username: "postgres",
  password: "postgres",
  database: "xy_inc_test",
  hostname: "localhost",
  pool: Ecto.Adapters.SQL.Sandbox
