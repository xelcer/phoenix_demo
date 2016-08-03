defmodule Demo.Router do
  use Demo.Web, :router
  use Coherence.Router
  use ExAdmin.Router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
    plug Coherence.Authentication.Session, login: true
  end

  pipeline :public do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
    plug Coherence.Authentication.Session
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  # Add this block
  scope "/" do
    pipe_through :public
    coherence_routes :public
  end

  # Add this block
  scope "/" do
    pipe_through :browser
    coherence_routes :private
  end

  scope "/", Demo do
    pipe_through :public
    get "/", PageController, :index
  end

  scope "/", Demo do
    pipe_through :browser
    # Add your protected routes here
  end

  scope "/admin", ExAdmin do
    pipe_through :browser
    admin_routes
  end

end
