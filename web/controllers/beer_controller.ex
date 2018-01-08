defmodule Allbeerme.BeerController do
  use Allbeerme.Web, :controller
  use Rummage.Phoenix.Controller

  alias Allbeerme.Beer

  def index(conn, params) do
    {query, rummage} = Beer
      |> Beer.rummage(params["rummage"])

    beers = query
      |> Repo.all
      |> Repo.preload(:logo)

# localhost:400/products?rummage[sort][field]=name.asc&rummage[paginate][page]=2&rummage[paginate][per_page]=2

    render(conn, "index.html", beers: beers, rummage: rummage)
  end

  def show(conn, %{"id" => id}) do
    beer = Repo.get_by!(Beer, slug: id)
    beer = Repo.preload(beer, :logo)
    render(conn, "show.html", beer: beer)
  end
end
