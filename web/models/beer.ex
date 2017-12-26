defmodule Allbeerme.Beer do
  use Allbeerme.Web, :model

  schema "beers" do
    # Relations
    belongs_to :user, Allbeerme.User , foreign_key: :author_id

    field :name, :string
    field :body, :string
    field :title, :string
    field :keywords, :string
    field :description, :string

    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:name, :body, :title, :keywords, :description])
    |> validate_required([:name, :body, :title, :keywords, :description])
  end
end
