defmodule Drawbox.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      DrawboxWeb.Telemetry,
      {DNSCluster, query: Application.get_env(:drawbox, :dns_cluster_query) || :ignore},
      {Phoenix.PubSub, name: Drawbox.PubSub},
      # Start a worker by calling: Drawbox.Worker.start_link(arg)
      # {Drawbox.Worker, arg},
      # Start to serve requests, typically the last entry
      DrawboxWeb.Endpoint
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: Drawbox.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    DrawboxWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
