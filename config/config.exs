# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :urvogel,
  ecto_repos: [Urvogel.Repo]

# Configures the endpoint
config :urvogel, UrvogelWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "Y82MIDoEIlnyQlfDlb5Hqv25ovImF+qlBnjjjzI6K0m81nHEWRhJ/vddz1qwSfRF",
  render_errors: [view: UrvogelWeb.ErrorView, accepts: ~w(html json)],
  pubsub: [name: Urvogel.PubSub,
           adapter: Phoenix.PubSub.PG2],
  live_reload: [
    patterns: [
      ~r{priv/static/.*(js|css|png|jpeg|jpg|gif|svg)$},
      ~r{priv/gettext/.*(po)$},
      ~r{web/views/.*(ex)$},
      ~r{web/templates/.*(eex|slim|slime)$} # here
    ]
  ]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:user_id]

config :phoenix, :template_engines,
  slim: PhoenixSlime.Engine,
  slime: PhoenixSlime.Engine

config :phoenix_slime, :use_slim_extension, true

config :oauth2,
  serializers: %{
    "application/vnd.api+json" => Poison,
    "application/xml" => MyApp.XmlParser,
  }

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
