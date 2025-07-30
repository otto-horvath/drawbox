defmodule DrawboxWeb.Router do
  alias DrawboxLive
  use DrawboxWeb, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_live_flash
    plug :put_root_layout, html: {DrawboxWeb.Layouts, :root}
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", DrawboxWeb do
    pipe_through :browser

    live "/", DrawboxLive
  end
end
