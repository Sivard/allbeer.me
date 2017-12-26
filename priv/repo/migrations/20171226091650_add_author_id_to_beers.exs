defmodule Allbeerme.Repo.Migrations.AddAuthorIdToBeers do
  use Ecto.Migration

  def change do
    alter table(:beers) do
      add :author_id, references(:users)
    end
    create index(:beers, [:author_id])
  end
end
