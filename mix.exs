defmodule Issues.Mixfile do
  use Mix.Project

  def project do
    [app: :issues,
     escript: escript_config,
     version: "0.1.0",
     name: "Issues",
     source_url: "https://github.com/jimbeaudoin/elixir-github-issues-fetcher",
     elixir: "~> 1.3",
     build_embedded: Mix.env == :prod,
     start_permanent: Mix.env == :prod,
     test_coverage: [tool: ExCoveralls],
     preferred_cli_env: [
      "coveralls": :test,
      "coveralls.details": :test,
      "coveralls.post": :test,
      "coveralls.html": :test
     ],
     deps: deps()]
  end

  # Configuration for the OTP application
  #
  # Type "mix help compile.app" for more information
  def application do
    [applications: [:logger, :httpoison]]
  end

  # Dependencies can be Hex packages:
  #
  #   {:mydep, "~> 0.3.0"}
  #
  # Or git/path repositories:
  #
  #   {:mydep, git: "https://github.com/elixir-lang/mydep.git", tag: "0.1.0"}
  #
  # Type "mix help deps" for more examples and options
  defp deps do
    [
      {:httpoison, "~> 0.9"},
      {:poison,    "~> 2.2"},
      {:ex_doc,    "~> 0.12"},
      {:earmark,   "~> 1.0", override: true},
      {:excoveralls, "~> 0.5", only: :test}
    ]
  end

  defp escript_config do
    [main_module: Issues.CLI]
  end
end
