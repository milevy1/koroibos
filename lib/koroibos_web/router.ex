defmodule KoroibosWeb.Router do
  use KoroibosWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/api/v1", KoroibosWeb do
    pipe_through :api

    get "/olympians", OlympianController, :index
  end
end
