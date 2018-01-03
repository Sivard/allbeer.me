defmodule Allbeerme.Image do
  use Allbeerme.Web, :model
  use Arc.Ecto.Schema

  schema "images" do
    # Relations
    has_many :beers, Allbeerme.Beer, foreign_key: :image_id

    field :image, Allbeerme.ImageUploader.Type

    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:image])
    |> cast_attachments(params, [:image])
  end
end
