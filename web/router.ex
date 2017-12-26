defmodule Allbeerme.Router do
  use Allbeerme.Web, :router

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

  scope "/", Allbeerme do
    pipe_through :browser # Use the default browser stack

    get "/", PageController, :index
    resources "/beers", BeerController, only: [:index, :show]
  end

  scope "/admin", Allbeerme, as: :admin do
    pipe_through :browser

    resources "/beers", Admin.BeerController
    resources "/images", Admin.ImageController
    resources "/users", Admin.UserController
    resources "/sessions", Admin.SessionController, only: [:new, :create, :delete]
  end

  # Other scopes may use custom stacks.
  # scope "/api", Allbeerme do
  #   pipe_through :api
  # end
end
