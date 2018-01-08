defmodule Allbeerme.Beer do
  use Allbeerme.Web, :model
  use Rummage.Ecto

  # @derive {Phoenix.Param, key: :slug}

  schema "beers" do
    # Relations
    belongs_to :user, Allbeerme.User , foreign_key: :author_id
    belongs_to :logo, Allbeerme.Image , foreign_key: :logo_id

    field :name, :string
    field :body, :string
    field :title, :string
    field :keywords, :string
    field :description, :string
    field :slug, :string

    timestamps()
  end

  @optional_fields ~w(name body title keywords description slug logo_id)a
  @required_fields ~w(name body title keywords description logo_id)a

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    params = Map.merge(params, slug_map(params))

    struct
    |> cast(params, @optional_fields)
    |> validate_required(@required_fields)
  end

  defp slug_map(%{"name" => name}) do
    slug = Slug.slugify(name)
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