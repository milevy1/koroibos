defmodule Koroibos.Olympian do
  use Ecto.Schema

  schema "teams" do
    field :name, :string
    timestamps()

    belongs_to :team, Koroibos.Team
  end
end
