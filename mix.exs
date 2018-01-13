defmodule Allbeerme.Mixfile do
  use Mix.Project

  def project do
    [app: :allbeerme,
     version: "0.0.27",
     elixir: "~> 1.2",
     elixirc_paths: elixirc_paths(Mix.env),
     compilers: [:phoenix, :gettext] ++ Mix.compilers,
     build_embedded: Mix.env == :prod,
     start_permanent: Mix.env == :prod,
     deps: deps()]
  end

  # Configuration for the OTP application.
  #
  # Type `mix help compile.app` for more information.
  def application do
    [mod: {Allbeerme, []},
     applications: [:phoenix, :phoenix_pubsub, :phoenix_html, :cowboy, :logger, :gettext,
                    :distillery, :edeliver, :postgrex, :phoenix_ecto,
                    :ex_aws, :hackney, :poison, :arc_ecto, :comeonin, :timex]]
  end

  # Specifies which paths to compile per environment.
  defp elixirc_paths(:test), do: ["lib", "web", "test/support"]
  defp elixirc_paths(_),     do: ["lib", "web"]

  # Specifies your project dependencies.
  #
  # Type `mix help deps` for examples and options.
  defp deps do
    [
      {:arc, "~> 0.8.0"},
      {:arc_ecto, "~> 0.7.0"},
      {:comeonin, "~> 2.3"},
      {:cowboy, "~> 1.0"},
      {:distillery, "~> 1.4"},
      {:edeliver, "~> 1.4.3"},
      {:ex_aws, "~> 1.1"},
      {:gettext, "~> 0.11"},
      {:hackney, "~> 1.6"},
      {:rummage_phoenix, "~> 1.2.0"},
      {:phoenix, "~> 1.3.0", override: true},
      {:phoenix_ecto, "~> 3.0"},
      {:phoenix_html, "~> 2.0"},
      {:phoenix_live_reload, "~> 1.0", only: :dev},
      {:phoenix_pubsub, "~> 1.0"},
      {:poison, "~> 3.1"},
      {:postgrex, "~> 0.13.0"},
      {:slugify, "~> 1.1"},
      {:sweet_xml, "~> 0.6"},
      {:timex, "~> 3.1"},
    ]
  end
end
