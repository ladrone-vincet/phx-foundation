# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :foundation,
  ecto_repos: [Foundation.Repo]

# Configures the endpoint
config :foundation, FoundationWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "c9RU2qUljNuVRMWT8EH5QnaMwC7RXaFhW0T4VixGC2ucSaNIDrFcLgSVmcrcKdNf",
  render_errors: [view: FoundationWeb.ErrorView, accepts: ~w(html json)],
  pubsub: [name: Foundation.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:user_id]

# Configure Google OAuth2
config :ueberauth, Ueberauth,
  providers: [
    google: {Ueberauth.Strategy.Google, [default_scope: "emails profile plus.me"]}
  ]

config :ueberauth, Ueberauth.Strategy.Google.OAuth,
  client_id: System.get_env("GOOGLE_CLIENT_ID"),
  client_secret: System.get_env("GOOGLE_CLIENT_SECRET")

config :rummage_ecto, Rummage.Ecto,
  default_repo: Foundation.Repo,
  default_per_page: 5

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
