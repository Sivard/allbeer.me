defmodule Allbeerme.Repo.Migrations.CreateImage do
  use Ecto.Migration

  def change do
    create table(:images) do
      add :image, :string
      add :name, :string
      add :beer_id, references(:beers, on_delete: :delete_all)

      timestamps()
    end

    create index(:images, [:beer_id])
  end
end
