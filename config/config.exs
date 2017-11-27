# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

config :allbeerme, ecto_repos: [Allbeerme.Repo]

config :allbeerme, Allbeerme.Repo,
  adapter: Ecto.Adapters.Postgres,
  database: "allbeerme_repo",
  username: "andrew",
  password: "1",
  hostname: "localhost"


# Configures the endpoint
config :allbeerme, Allbeerme.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "3M72vWqYTPd3kzwouILyATbXRt+YjCTsiCjbDeY42OeEjQ+X0okbedO5LKEmhmO/",
  render_errors: [view: Allbeerme.ErrorView, accepts: ~w(html json)],
  pubsub: [name: Allbeerme.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"

# config :arc,
#   storage: Arc.Storage.S3, # or Arc.Storage.Local
#   bucket: {:system, "AWS_S3_BUCKET"} # if using Amazon S3

config :arc,
 bucket: "allfoodinfo",
 virtual_host: true

config :ex_aws,
 access_key_id: "AKIAJ7EQCDIKNPQENDJQ",
 secret_access_key: "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",
 region: "eu-central-1",
 host: "s3.eu-central-1.amazonaws.com",
 s3: [
 scheme: "https://",
 host: "s3.eu-central-1.amazonaws.com",
 region: "eu-central-1"
 ]