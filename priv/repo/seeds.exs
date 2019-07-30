# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     Koroibos.Repo.insert!(%Koroibos.SomeSchema{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.

alias Koroibos.{Team, Olympian, Sport, Event, Result}

defmodule Koroibos.Seeds do
  def store_it(row) do
    {:ok, row_data} = row

    # IO.inspect(row_data.age) == age column from csv

    # 1. Find_or_Create_By Team.country
    {:ok, %Team{} = team} = Team.find_or_create_by(row_data.team)

    # 2. Find_or_Create_By Olympian{name and age}
    {:ok, %Olympian{} = olympian} = Olympian.find_or_create_by(row_data, team.id)

    # 3. Find_or_Create_By Sport(description)
    {:ok, %Sport{} = sport} = Sport.find_or_create_by(row_data.sport)

    # 4. Find_or_Create_By Event(name)
    {:ok, %Event{} = event} = Event.find_or_create_by(row_data.event, sport.id)

    # 5. CREATE result
    result_attrs = %{
      olympian_id: olympian.id,
      event_id: event.id,
      event_year: row_data.games,
      medal: row_data.medal
    }
    # {:ok, %Result{} = result} =
    Result.create(result_attrs)
  end
end

# Iterate over each row of csv
File.stream!(Path.expand("olympic_data_2016.csv"))
|> Stream.drop(1)
|> CSV.decode(
  headers: [:name, :sex, :age, :height, :weight, :team, :games, :sport, :event, :medal]
)
|> Enum.each(&Koroibos.Seeds.store_it/1)
