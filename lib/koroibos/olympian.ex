defmodule Koroibos.Olympian do
  use Ecto.Schema
  import Ecto.Changeset
  alias Koroibos.{Repo, Olympian}

  schema "olympians" do
    field :name, :string
    field :sex, :string
    field :age, :integer
    field :height, :integer
    field :weight, :integer
    timestamps()

    belongs_to :team, Koroibos.Team
  end

  @doc false
  def changeset(%Olympian{} = olympian, attrs) do
    olympian
    |> cast(attrs, [:team_id, :name, :sex, :age, :height, :weight])
    |> validate_required([:name])
  end

  @doc """
  Creates a team.

  ## Examples

      iex> create(%{field: value})
      {:ok, %User{}}

      iex> create(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create(attrs \\ %{}) do
    %Olympian{}
    |> Olympian.changeset(attrs)
    |> Repo.insert()
  end

  def find_or_create_by(row, team_id) do
    case Repo.get_by(Olympian, name: row.name, age: row.age) do
      nil ->
        Olympian.create(%{
          team_id: team_id,
          name: row.name,
          sex: row.sex,
          age: String.to_integer(row.age),
          height:
            if row.height == "NA" do
              nil
            else
              String.to_integer(row.height)
            end,
          weight:
            if row.weight == "NA" do
              nil
            else
              String.to_integer(row.weight)
            end
        })

      result ->
        {:ok, result}
    end
  end
end
