# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :demo,
  ecto_repos: [Demo.Repo]

# Configures the endpoint
config :demo, Demo.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "LuKLajUMvS5+96GBKboWx6TaYBNeMdJVNsRgQk1af3bgnEbMaqnQ3YSOK0nhRar7",
  render_errors: [view: Demo.ErrorView, accepts: ~w(html json)],
  pubsub: [name: Demo.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"

# %% Coherence Configuration %%   Don't remove this line
config :coherence,
  user_schema: Demo.User,
  repo: Demo.Repo,
  module: Demo,
  logged_out_url: "/",
  email_from: {"Phoenix Demo", "testemail@example.com"},
  opts: [:confirmable, :rememberable, :registerable, :invitable,
  :authenticatable, :recoverable, :lockable, :trackable, :unlockable_with_token]

config :ex_admin,
  repo: Demo.Repo,
  module: Demo,
  modules: [
    Demo.ExAdmin.Dashboard,
    Demo.ExAdmin.User,
  ]

config :coherence, Demo.Coherence.Mailer,
  adapter: Swoosh.Adapters.Sendgrid,
  api_key: "your api key here"
# %% End Coherence Configuration %%

config :xain, :after_callback, {Phoenix.HTML, :raw}

