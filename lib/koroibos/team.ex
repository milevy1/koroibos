defmodule Koroibos.Team do
  use Ecto.Schema
  import Ecto.Changeset
  alias Koroibos.{Repo, Team}

  schema "teams" do
    field :name, :string
    timestamps()

    has_many :olympians, Koroibos.Olympian
  end

  @doc false
  def changeset(%Team{} = team, attrs) do
    team
    |> cast(attrs, [:name])
    |> validate_required([:name])
  end

  @doc """
  Creates a Team.

  ## Examples

      iex> create(%{field: value})
      {:ok, %Team{}}

      iex> create(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create(attrs \\ %{}) do
    %Team{}
    |> Team.changeset(attrs)
    |> Repo.insert()
  end

  def find_or_create_by(team_name) do
    case Repo.get_by(Team, name: team_name) do
      nil -> Team.create(%{name: team_name})
      result -> {:ok, result}
    end
  end
end
