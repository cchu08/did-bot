defmodule DidBot.MixProject do
  use Mix.Project

  def project do
    [
      app: :did_bot,
      version: "0.1.0",
      elixir: "~> 1.9",
      start_permanent: Mix.env() == :prod,
      deps: deps()
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger, :slack, :con_cache, :quantum],
      mod: {DidBot.Application, []}
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:slack, "~> 0.19.0"},
      {:con_cache, "~> 0.14.0"},
      {:quantum, "~> 2.3.4"}
    ]
  end
end
