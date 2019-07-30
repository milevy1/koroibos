defmodule Koroibos.OlympiansControllerTest do
  use KoroibosWeb.ConnCase
  # use Koroibos.DataCase
  alias Koroibos.{Olympian, Team}

  test "#index renders a list of todos" do
    conn = build_conn()
    {:ok, %Team{} = team} = Team.create(%{name: "Team Name"})
    {:ok, %Olympian{} = olympian_1} = Olympian.create(
      %{team_id: team.id, name: "Olympian Name 1", sex: "M", age: 1, height: 100, weight: 200}
    )
    {:ok, %Olympian{} = olympian_2} = Olympian.create(
      %{team_id: team.id, name: "Olympian Name 2", sex: "M", age: 1, height: 100, weight: 200}
    )

    conn = get conn, "/api/v1/olympians"

    expected = %{
        "olympians" => [
          %{ "name" => olympian_1.name,
             "team" => olympian_1.team,
             "age" => olympian_1.age,
             "sport" => olympian_1.sport,
             "total_medals_won" => olympian_1.total_medals_won
           },
          %{ "name" => olympian_2.name,
             "team" => olympian_2.team,
             "age" => olympian_2.age,
             "sport" => olympian_2.sport,
             "total_medals_won" => olympian_2.total_medals_won
           }
        ]
      }

    assert json_response(conn, 200) == expected
  end
end
