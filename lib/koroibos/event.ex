defmodule Koroibos.Event do
  use Ecto.Schema
  import Ecto.Changeset
  alias Koroibos.{Repo, Event}

  schema "events" do
    field :name, :string
    timestamps()

    belongs_to :sport, Koroibos.Sport
  end

  @doc false
  def changeset(%Event{} = team, attrs) do
    team
    |> cast(attrs, [:sport_id, :name])
    |> validate_required([:name])
  end

  @doc """
  Creates a Event.

  ## Examples

      iex> create(%{field: value})
      {:ok, %Event{}}

      iex> create(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create(attrs \\ %{}) do
    %Event{}
    |> Event.changeset(attrs)
    |> Repo.insert()
  end

  def find_or_create_by(name, sport_id) do
    case Repo.get_by(Event, name: name) do
      nil -> Event.create(%{sport_id: sport_id, name: name})
      result -> {:ok, result}
    end
  end
end
