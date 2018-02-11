# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :phoenix_bulma,
  ecto_repos: [PhoenixBulma.Repo]

# Configures the endpoint
config :phoenix_bulma, PhoenixBulmaWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "2pKm0zy+BZ4TJTF4VYt0qctM9N/Zv1dCCWuQeOornQcIkMxQe9Br/W2mhEVMvSZK",
  render_errors: [view: PhoenixBulmaWeb.ErrorView, accepts: ~w(html json)],
  pubsub: [name: PhoenixBulma.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
