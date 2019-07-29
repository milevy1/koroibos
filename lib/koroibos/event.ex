defmodule Koroibos.Event do
  use Ecto.Schema

  schema "events" do
    field :name, :string
    timestamps()

    belongs_to :sport, Koroibos.Sport
  end
end
