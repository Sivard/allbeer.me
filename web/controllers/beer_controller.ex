defmodule Allbeerme.BeerController do
  use Allbeerme.Web, :controller

  alias Allbeerme.Beer

  def index(conn, _params) do
    beers = Repo.all(Beer)
    render(conn, "index.html", beers: beers)
  end

  def show(conn, %{"id" => id}) do
    beer = Repo.get_by!(Beer, slug: id)
    render(conn, "show.html", beer: beer)
  end
end
