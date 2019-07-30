defmodule Koroibos.SchemaTest do
  use Koroibos.DataCase
  alias Koroibos.{ Team, Olympian, Result, Event, Sport }

  describe "teams" do
    @valid_attrs %{name: "Team Name"}
    @invalid_attrs %{name: nil}

    test "Team.create/1 with valid data creates a team" do
      assert {:ok, %Team{} = team} = Team.create(@valid_attrs)
      assert team.name == "Team Name"
    end

    test "Team.create/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Team.create(@invalid_attrs)
    end
  end

  describe "olympians" do
    @valid_attrs %{ name:   "Olympian Name",
                    sex:    "M",
                    age:    1,
                    height: 100,
                    weight: 200
                  }
    @invalid_attrs %{name: nil}

    test "Olympian.create/1 with valid data creates a team" do
      assert {:ok, %Olympian{} = team} = Olympian.create(@valid_attrs)
      assert team.name == "Olympian Name"
    end

    test "Olympian.create/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Olympian.create(@invalid_attrs)
    end
  end

  describe "results" do
    @valid_attrs %{ event_year: "2016 Summer" }
    @invalid_attrs %{ event_year: nil }

    test "Result.create/1 with valid data creates a team" do
      assert {:ok, %Result{} = result} = Result.create(@valid_attrs)
      assert result.event_year == "2016 Summer"
    end

    test "Result.create/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Result.create(@invalid_attrs)
    end
  end

  describe "events" do
    @valid_attrs %{ name: "Weightlifting Women's Super-Heavyweight" }
    @invalid_attrs %{ name: nil }

    test "Event.create/1 with valid data creates a team" do
      assert {:ok, %Event{} = result} = Event.create(@valid_attrs)
      assert result.name == "Weightlifting Women's Super-Heavyweight"
    end

    test "Event.create/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Event.create(@invalid_attrs)
    end
  end
end
