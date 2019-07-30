defmodule Koroibos.SchemaTest do
  use Koroibos.DataCase
  alias Koroibos.Team

  describe "teams" do
    @valid_attrs %{name: "Team Name"}
    @invalid_attrs %{name: nil}

    test "create_team/1 with valid data creates a team" do
      assert {:ok, %Team{} = team} = Team.create(@valid_attrs)
      assert team.name == "Team Name"
    end

    test "create_user/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Team.create(@invalid_attrs)
      assert {:error, %Ecto.Changeset{}} = Team.create(%{name: 1})
    end
  end
end
