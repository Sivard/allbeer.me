defmodule Allbeerme.Image do
  use Allbeerme.Web, :model
  use Arc.Ecto.Schema

  schema "images" do
    # Relations
    has_one :beer, Allbeerme.Beer, foreign_key: :logo_id

    field :image, Allbeerme.ImageUploader.Type
    field :name, :string

    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ :invalid) do
    struct
    |> cast(params, [:name])
    |> validate_required([:name])
  end

  def logo_changeset(struct, params \\ :invalid) do
    struct
    |> cast_attachments(params, [:image])
  end
end
