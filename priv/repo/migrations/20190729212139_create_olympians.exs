defmodule Koroibos.Repo.Migrations.CreateOlympians do
  use Ecto.Migration

  def change do
    create table(:olympians) do
      add :team_id, references(:teams)
      add :name, :string
      add :sex, :string
      add :age, :integer
      add :height, :integer
      add :weight, :integer

      timestamps()
    end
  end
end
