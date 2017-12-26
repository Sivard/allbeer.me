defmodule Allbeerme.Admin.ImageController do
  use Allbeerme.Web, :controller

  alias Allbeerme.Image
  alias Allbeerme.Repo

  plug :put_layout, "admin.html"

  def index(conn, _) do
    images = Repo.all(Image)
    render(conn, "index.html", images: images)
  end

  def new(conn, _) do
    changeset = Image.changeset(%Image{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"image" => image_params}) do
    IO.inspect image_params
    changeset = Image.changeset(%Image{}, image_params)
    case Repo.insert(changeset) do
      {:ok, image} ->
        conn
        |> put_flash(:info, "Image was added")
        |> redirect(to: admin_image_path(conn, :index))
      {:error, changeset} ->
        conn
        |> put_flash(:error, "Something went wrong")
        |> render("new.html", changeset: changeset)
    end
  end
end
