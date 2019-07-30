defmodule KoroibosWeb.OlympianView do
  use KoroibosWeb, :view
  alias KoroibosWeb.OlympianView

  def render("index.json", %{olympians: olympians}) do
    %{olympians: render_many(olympians, OlympianView, "olympian.json")}
  end

  def render("olympian.json", %{olympian: olympian}) do
    %{name: olympian.name, team: olympian.team, age: olympian.age}
  end
end
