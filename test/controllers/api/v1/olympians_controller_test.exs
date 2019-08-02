defmodule Koroibos.OlympiansControllerTest do
  use KoroibosWeb.ConnCase
  # use Koroibos.DataCase
  alias Koroibos.{Team, Olympian, Sport, Event, Result}

  test "#index renders a list of todos" do
    conn = build_conn()
    {:ok, %Team{} = team} = Team.create(%{name: "Team Name"})

    {:ok, %Olympian{} = olympian_1} = Olympian.create(
      %{team_id: team.id, name: "Olympian Name 1", sex: "M", age: 1, height: 100, weight: 200}
    )
    {:ok, %Olympian{} = olympian_2} = Olympian.create(
      %{team_id: team.id, name: "Olympian Name 2", sex: "M", age: 1, height: 100, weight: 200}
    )

    {:ok, %Sport{} = sport} = Sport.create(%{description: "Basketball"})

    {:ok, %Event{} = event} = Event.create(%{sport_id: sport.id, name: "Basketball - Mens 5x5"})

    Result.create(%{olympian_id: olympian_1.id,
                    event_id: event.id,
                    event_year: "2016 Summer",
                    medal: "Gold"})
    Result.create(%{olympian_id: olympian_2.id,
                    event_id: event.id,
                    event_year: "2016 Summer",
                    medal: "NA"})

    conn = get conn, "/api/v1/olympians"

    expected = %{
        "olympians" => [
          %{ "name" => olympian_1.name,
             "team" => team.name,
             "age" => olympian_1.age,
             "sport" => sport.description,
             "total_medals_won" => 1,
           },
           %{ "name" => olympian_2.name,
              "team" => team.name,
              "age" => olympian_2.age,
              "sport" => sport.description,
              "total_medals_won" => 0,
            }
        ]
      }

    assert json_response(conn, 200) == expected
  end

  test "GET api/v1/olympians?age=" do
    conn = build_conn()
    {:ok, %Team{} = team} = Team.create(%{name: "Team Name"})

    {:ok, %Olympian{} = olympian_1} = Olympian.create(
      %{team_id: team.id, name: "Olympian Name 1", sex: "M", age: 1, height: 100, weight: 200}
    )
    {:ok, %Olympian{} = olympian_2} = Olympian.create(
      %{team_id: team.id, name: "Olympian Name 2", sex: "M", age: 2, height: 100, weight: 200}
    )

    {:ok, %Sport{} = sport} = Sport.create(%{description: "Basketball"})

    {:ok, %Event{} = event} = Event.create(%{sport_id: sport.id, name: "Basketball - Mens 5x5"})

    Result.create(%{olympian_id: olympian_1.id,
                    event_id: event.id,
                    event_year: "2016 Summer",
                    medal: "Gold"})
    Result.create(%{olympian_id: olympian_2.id,
                    event_id: event.id,
                    event_year: "2016 Summer",
                    medal: "NA"})

    conn = get conn, "/api/v1/olympians?age=youngest"

    expected = %{
        "olympians" => [
          %{ "name" => olympian_1.name,
             "team" => team.name,
             "age" => olympian_1.age,
             "sport" => sport.description,
             "total_medals_won" => 1,
           }
        ]
      }

    assert json_response(conn, 200) == expected
  end
end
