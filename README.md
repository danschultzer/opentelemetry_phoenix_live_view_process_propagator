# Opentelemetry Phoenix LiveView Process Propagator

[![Github CI](https://github.com/open-telemetrex/opentelemetry_phoenix_live_view_process_propagator/workflows/CI/badge.svg)](https://github.com/open-telemetrex/opentelemetry_phoenix_live_view_process_propagator/actions?query=workflow%3ACI)
[![hex.pm](https://img.shields.io/hexpm/v/opentelemetry_phoenix_live_view_process_propagator.svg)](https://hex.pm/packages/opentelemetry_phoenix_live_view_process_propagator)

<!-- MDOC !-->

Functions for cross-process opentelemetry context propagation in Phoenix LiveView.

## Installation

Add `opentelemetry_phoenix_live_view_process_propagator` to your list of dependencies in `mix.exs`:

```elixir
def deps do
  [
    {:opentelemetry_phoenix_live_view_process_propagator, "~> 0.1", only: [:dev, :test], runtime: false}
  ]
end
```

## Usage

Require `OpentelemetryPhoenixLiveViewProcessPropagator.LiveView` in your `live_view` and `live_component` macros:

```elixir
defmodule MyAppWeb do
  # ...
  def live_view do
    quote do
      use Phoenix.LiveView,
        layout: {MyAppWeb.Layouts, :app}

      require OpentelemetryPhoenixLiveViewProcessPropagator.LiveView

      unquote(html_helpers())
    end
  end

  def live_component do
    quote do
      use Phoenix.LiveComponent

      require OpentelemetryPhoenixLiveViewProcessPropagator.LiveView

      unquote(html_helpers())
    end
  end
end
```

Update the references to `assign_async` and `start_async` to use this module:application

```elixir
def mount(%{"slug" => slug}, _, socket) do
  {:ok,
  socket
  |> assign(:foo, "bar")
  |> OpentelemetryPhoenixLiveViewProcessPropagator.LiveView.assign_async(:org, fn -> {:ok, %{org: fetch_org!(slug)}} end)
  |> OpentelemetryPhoenixLiveViewProcessPropagator.LiveView.assign_async([:profile, :rank], fn -> {:ok, %{profile: ..., rank: ...}} end)}
end
```