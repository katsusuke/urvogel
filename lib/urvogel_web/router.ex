defmodule UrvogelWeb.Router do
  use UrvogelWeb, :router

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

  scope "/", UrvogelWeb do	
    pipe_through :browser # Use the default browser stack

    get "/", PageController, :index
    resources "/instances", InstanceController
    scope "/admin" do
      resources "/users", UserController
    end
  end
  


  # Other scopes may use custom stacks.
  # scope "/api", UrvogelWeb do
  #   pipe_through :api
  # end
end
