defmodule Allbeerme.Repo.Migrations.CreateBeer do
  use Ecto.Migration

  def change do
    create table(:beers) do
      add :name, :string
      add :body, :text
      add :title, :string
      add :keywords, :string
      add :description, :string
      add :slug, :string
      add :author_id, references(:users)
      add :logo_id, references(:images)

      timestamps()
    end

    create index(:beers, [:author_id])
    create index(:beers, [:slug], unique: true)
  end
end
