defmodule PhtDynamo.Mixfile do
  use Mix.Project

  def project do
    [ app: :pht_dynamo,
      version: "0.0.1",
      build_per_environment: true,
      dynamos: [PhtDynamo.Dynamo],
      compilers: [:elixir, :dynamo, :app],
      deps: deps ]
  end

  # Configuration for the OTP application
  def application do
    [ applications: [:cowboy, :dynamo],
      mod: { PhtDynamo, [] } ]
  end

  defp deps do
    [ { :cowboy, github: "extend/cowboy" },
      { :dynamo, "~> 0.1.0-dev", github: "elixir-lang/dynamo" } ]
  end
end
