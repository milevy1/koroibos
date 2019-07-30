defmodule KoroibosWeb.OlympianController do
  use KoroibosWeb, :controller

  def index(conn, _params) do
    render(conn, "index.json")
  end
end
