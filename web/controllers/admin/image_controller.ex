defmodule Allbeerme.Admin.ImageController do
  use Allbeerme.Web, :controller

  alias Allbeerme.Image
  alias Allbeerme.Repo

  plug :authorize_user

  def index(conn, _) do
    images = Image
      |> Repo.all
      |> Repo.preload(:beer)

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
        Image.logo_changeset(image, image_params) |> Repo.update
        conn
        |> put_flash(:info, "Image was added")
        |> redirect(to: admin_image_path(conn, :index))
      {:error, changeset} ->
        conn
        |> put_flash(:error, "Something went wrong")
        |> render("new.html", changeset: changeset)
    end
  end

  def edit(conn, %{"id" => id}) do
    image = Repo.get!(Image, id)
    changeset = Image.changeset(image)
    render(conn, "edit.html", image: image, changeset: changeset)
  end

  def update(conn, %{"id" => id, "image" => image_params}) do
    image = Repo.get!(Image, id)
    changeset = Image.changeset(image, image_params)

    if changeset.valid? do
      Image.logo_changeset(changeset, image_params) |> Repo.update

      conn
      |> put_flash(:info, "Image updated successfully.")
      |> redirect(to: admin_image_path(conn, :index))
    else
      render(conn, "edit.html", image: image, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    image = Repo.get!(Image, id)

    # Here we use delete! (with a bang) because we expect
    # it to always work (and if it does not, it will raise).
    Repo.delete!(image)

    conn
    |> put_flash(:info, "Image deleted successfully.")
    |> redirect(to: admin_image_path(conn, :index))
  end

  defp authorize_user(conn, _opts) do
    if get_session(conn, :current_user) do
      conn
    else
      conn
      |> put_flash(:error, "Страница не найдена!")
      |> redirect(to: page_path(conn, :not_found))
      |> halt()
    end
  end
end
