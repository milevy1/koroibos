defmodule KoroibosWeb.OlympianController do
  use KoroibosWeb, :controller
  alias Koroibos.Olympian

  def index(conn, %{"age" => age}) do
    render(conn, "index.json", olympians: Olympian.filter_by_age(age))
  end

  def index(conn, _params) do
    render(conn, "index.json", olympians: Olympian.index)
  end
end
