defmodule Koroibos.Result do
  use Ecto.Schema
  import Ecto.Changeset
  alias Koroibos.{ Repo, Result }

  schema "results" do
    field :event_year, :string
    field :medal, :string
    timestamps()

    belongs_to :olympian, Koroibos.Olympian
    belongs_to :event, Koroibos.Event
  end

  @doc false
  def changeset(%Result{} = team, attrs) do
    team
    |> cast(attrs, [:event_year])
    |> validate_required([:event_year])
  end

  @doc """
  Creates a result.

  ## Examples

      iex> create(%{field: value})
      {:ok, %Result{}}

      iex> create(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create(attrs \\ %{}) do
    %Result{}
    |> Result.changeset(attrs)
    |> Repo.insert()
  end
end
