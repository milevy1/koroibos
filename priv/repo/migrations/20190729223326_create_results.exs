defmodule Koroibos.Repo.Migrations.CreateResults do
  use Ecto.Migration

  def change do
    create table(:results) do
      add :olympian_id, references(:olympians)
      add :event_id, references(:events)
      add :event_year, :string
      add :medal, :string

      timestamps()
    end
  end
end
