defmodule Koroibos.Sport do
  use Ecto.Schema

  schema "teams" do
    field :description, :string
    timestamps()

    belongs_to :event, Koroibos.Event
  end
end
