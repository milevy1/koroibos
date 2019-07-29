defmodule Koroibos.Repo.Migrations.CreateEvents do
  use Ecto.Migration

  def change do
    create table(:events) do
      add :sport_id, references(:sports)
      add :name, :string

      timestamps()
    end
  end
end
