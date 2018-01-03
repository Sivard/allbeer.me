defmodule Allbeerme.Beer do
  use Allbeerme.Web, :model

  # @derive {Phoenix.Param, key: :slug}

  schema "beers" do
    # Relations
    belongs_to :user, Allbeerme.User , foreign_key: :author_id
    belongs_to :image, Allbeerme.Image , foreign_key: :image_id

    field :name, :string
    field :body, :string
    field :title, :string
    field :keywords, :string
    field :description, :string
    field :slug, :string

    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    params = Map.merge(params, slug_map(params))

    struct
    |> cast(params, [:name, :body, :title, :keywords, :description, :slug])
    |> validate_required([:name, :body, :title, :keywords, :description])
  end

  defp slug_map(%{"name" => name}) do
    slug = String.downcase(name) |> Slug.slugify() |> String.replace(" ", "-")
    %{"slug" => slug}
  end

  defp slug_map(_params) do
    %{}
  end
end

defimpl Phoenix.Param, for: Allbeerme.Post do
  def to_param(%{slug: slug}) do
    "#{slug}"
  end
end