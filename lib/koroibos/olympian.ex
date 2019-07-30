defmodule Koroibos.Olympian do
  use Ecto.Schema
  import Ecto.Changeset
  alias Koroibos.{ Repo, Olympian }

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
    |> cast(attrs, [:name, :sex, :age, :height, :weight])
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
end
