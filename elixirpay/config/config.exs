# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :elixirpay,
  ecto_repos: [Elixirpay.Repo]

# Configures the endpoint
config :elixirpay, ElixirpayWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "bcFan9C3CNDge2v9xIPdskxYpc0XhzwU3g62IDNTxoiYetwYxFkey7qhD5DaP9sV",
  render_errors: [view: ElixirpayWeb.ErrorView, accepts: ~w(json), layout: false],
  pubsub_server: Elixirpay.PubSub,
  live_view: [signing_salt: "Mn7RRIwO"]

config :elixirpay, Elixirpay.Repo,
  migration_primary_key: [type: :binary_id],
  migration_foreign_key: [type: :binary_id]

config :elixirpay, :basic_auth,
  username: "oink", # if we were in production this data shouldn't be here
  password: "mcPork" # if we were in production this data shouldn't be here

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
