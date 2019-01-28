defmodule DerivcoWeb.Router do
  use DerivcoWeb, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", DerivcoWeb do
    pipe_through :browser

    get "/seasons", PageController, :index
    get "/seasons/:season", PageController, :getSeason
  end

  # Other scopes may use custom stacks.
  # scope "/api", DerivcoWeb do
  #   pipe_through :api
  # end
end
