defmodule Allbeerme.Image do
  use Allbeerme.Web, :model
  use Arc.Ecto.Schema

  schema "images" do
    # Relations
    belongs_to :beer, Allbeerme.Beer

    field :image, Allbeerme.ImageUploader.Type
    field :name, :string

    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:image, :name])
    |> cast_attachments(params, [:image])
    |> validate_required([:name])
  end
end
