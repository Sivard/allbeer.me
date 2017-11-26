defmodule Allbeerme.Repo.Migrations.CreateBeer do
  use Ecto.Migration

  def change do
    create table(:beers) do
      add :name, :string
      add :body, :text
      add :title, :string
      add :keywords, :string
      add :description, :string

      timestamps()
    end

  end
end
