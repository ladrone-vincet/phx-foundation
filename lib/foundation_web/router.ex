defmodule FoundationWeb.Router do
  use FoundationWeb, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
    plug FoundationWeb.Plugs.SetUser
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  pipeline :auth do
    plug FoundationWeb.Plugs.RequireAuth
  end

  scope "/auth", FoundationWeb do
    pipe_through :browser

    get "/signout", AuthController, :delete
    get "/:provider", AuthController, :request
    get "/:provider/callback", AuthController, :new
  end

  scope "/", FoundationWeb do
    pipe_through [:browser, :auth]

    resources "/videos", VideoController, only: [:new, :create]
  end

  scope "/", FoundationWeb do
    pipe_through :browser # Use the default browser stack

    resources "/videos", VideoController, only: [:index, :show, :delete]
    get "/", PageController, :index
  end

  # Other scopes may use custom stacks.
  # scope "/api", FoundationWeb do
  #   pipe_through :api
  # end
end
