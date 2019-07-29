defmodule Koroibos.Result do
  use Ecto.Schema

  schema "results" do
    field :description, :string
    timestamps()

    belongs_to :olympian, Koroibos.Olympian
    belongs_to :event, Koroibos.Event
  end
end
