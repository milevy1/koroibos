defmodule Koroibos.Sport do
  use Ecto.Schema
  import Ecto.Changeset
  alias Koroibos.{Repo, Sport}

  schema "sports" do
    field :description, :string
    timestamps()

    has_many :events, Koroibos.Event
  end

  @doc false
  def changeset(%Sport{} = team, attrs) do
    team
    |> cast(attrs, [:description])
    |> validate_required([:description])
  end

  @doc """
  Creates a Sport.

  ## Examples

      iex> create(%{field: value})
      {:ok, %Sport{}}

      iex> create(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create(attrs \\ %{}) do
    %Sport{}
    |> Sport.changeset(attrs)
    |> Repo.insert()
  end

  def find_or_create_by(description) do
    case Repo.get_by(Sport, description: description) do
      nil -> Sport.create(%{description: description})
      result -> {:ok, result}
    end
  end
end
