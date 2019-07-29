defmodule Koroibos.Repo.Migrations.CreateSports do
  use Ecto.Migration

  def change do
    create table(:sports) do
      add :description, :string

      timestamps()
    end
  end
end
