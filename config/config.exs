# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :koroibos,
  ecto_repos: [Koroibos.Repo]

# Configures the endpoint
config :koroibos, KoroibosWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "qhEVgLeacsfus99u4q94kuJYpv5iit4paG0y/cuw8tBFGRwfY5vUuC5LzgGeT60Q",
  render_errors: [view: KoroibosWeb.ErrorView, accepts: ~w(json)],
  pubsub: [name: Koroibos.PubSub, adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
