defmodule Koroibos.Sport do
  use Ecto.Schema

  schema "sports" do
    field :description, :string
    timestamps()

    has_many :events, Koroibos.Event
  end
end
