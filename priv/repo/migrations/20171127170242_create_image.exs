defmodule Allbeerme.Repo.Migrations.CreateImage do
  use Ecto.Migration

  def change do
    create table(:images) do
      add :image, :string
      add :name, :string

      timestamps()
    end
  end
end
