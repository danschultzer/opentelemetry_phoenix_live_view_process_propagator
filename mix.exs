defmodule OpentelemetryPhoenixLiveViewProcessPropagator.MixProject do
  use Mix.Project

  @source_url "https://github.com/open-telemetrex/opentelemetry_credo_checks"
  @version "0.1.0"

  def project do
    [
      app: :opentelemetry_phoenix_live_view_process_propagator,
      version: @version,
      elixir: "~> 1.18",
      start_permanent: Mix.env() == :prod,
      deps: deps(),

      # Hex
      description: "Opentelemetry Phoenix LiveView process propagator",
      package: package(),

      # Docs
      name: "OpentelemetryPhoenixLiveViewProcessPropagator",
      docs: docs(),

      # Dialyzer
      dialyzer: [
        plt_add_apps: [:mix]
      ]
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger]
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:opentelemetry_api, "~> 1.4"},
      {:phoenix_live_view, "~> 1.0"},
      {:opentelemetry, "~> 1.5", only: [:test], runtime: false},
      {:opentelemetry_exporter, "~> 1.8", only: [:test], runtime: false},
      {:credo, "~> 1.7", only: [:dev, :test]},
      {:dialyxir, "~> 1.1", only: [:dev, :test], runtime: false},
      {:floki, ">= 0.30.0", only: :test},
      {:ex_doc, ">= 0.0.0", only: :dev, runtime: false}
    ]
  end

  defp package do
    [
      maintainers: ["Dan Schultzer"],
      licenses: ["MIT"],
      links: %{
        "GitHub" => @source_url,
        "Sponsor" => "https://github.com/sponsors/danschultzer"
      },
      files: ~w(lib LICENSE mix.exs README.md)
    ]
  end

  defp docs do
    [
      source_ref: "v#{@version}",
      main: "README",
      canonical: "http://hexdocs.pm/opentelemetry_phoenix_live_view_process_propagator",
      source_url: @source_url,
      extras: [
        "README.md": [filename: "README"],
        "CHANGELOG.md": [filename: "CHANGELOG"]
      ],
      skip_undefined_reference_warnings_on: [
        "CHANGELOG.md"
      ]
    ]
  end
end
