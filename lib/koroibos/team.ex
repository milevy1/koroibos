defmodule Koroibos.Team do
  use Ecto.Schema

  schema "teams" do
    field :name, :string
    timestamps()

    has_many :olympians, Koroibos.Olympian
  end
end
