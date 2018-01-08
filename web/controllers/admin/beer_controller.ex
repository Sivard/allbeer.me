defmodule Allbeerme.Admin.BeerController do
  use Allbeerme.Web, :controller

  alias Allbeerme.Beer
  alias Allbeerme.Image

  plug :authorize_user

  def index(conn, _params) do
    beers = Beer
      |> Repo.all
      |> Repo.preload(:logo)

    render(conn, "index.html", beers: beers)
  end

  def new(conn, _params) do
    changeset = Beer.changeset(%Beer{})
    logos = Repo.all(Image)
    render(conn, "new.html", changeset: changeset, logos: logos)
  end

  def create(conn, %{"beer" => beer_params}) do
    changeset = Beer.changeset(%Beer{}, beer_params)
    logos = Repo.all(Image)

    case Repo.insert(changeset) do
      {:ok, _beer} ->
        conn
        |> put_flash(:info, "Beer created successfully.")
        |> redirect(to: admin_beer_path(conn, :index))
      {:error, changeset} ->
        render(conn, "new.html", changeset: changeset, logos: logos)
    end
  end

  def show(conn, %{"id" => id}) do
    beer = Repo.get!(Beer, id)
    render(conn, "show.html", beer: beer)
  end

  def edit(conn, %{"id" => id}) do
    beer = Repo.get!(Beer, id)
    logos = Repo.all(Image)
    changeset = Beer.changeset(beer)
    render(conn, "edit.html", beer: beer, changeset: changeset, logos: logos)
  end

  def update(conn, %{"id" => id, "beer" => beer_params}) do
    beer = Repo.get!(Beer, id)
    changeset = Beer.changeset(beer, beer_params)
    logos = Repo.all(Image)

    case Repo.update(changeset) do
      {:ok, beer} ->
        conn
        |> put_flash(:info, "Beer updated successfully.")
        |> redirect(to: admin_beer_path(conn, :edit, beer))
      {:error, changeset} ->
        render(conn, "edit.html", beer: beer, changeset: changeset, logos: logos)
    end
  end

  def delete(conn, %{"id" => id}) do
    beer = Repo.get!(Beer, id)

    # Here we use delete! (with a bang) because we expect
    # it to always work (and if it does not, it will raise).
    Repo.delete!(beer)

    conn
    |> put_flash(:info, "Beer deleted successfully.")
    |> redirect(to: admin_beer_path(conn, :index))
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
