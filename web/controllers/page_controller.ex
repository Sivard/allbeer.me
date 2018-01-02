defmodule Allbeerme.PageController do
  use Allbeerme.Web, :controller

  alias Allbeerme.Beer

  def index(conn, _params) do
    beers = Repo.all(Beer)
    render(conn, "index.html", beers: beers)
  end

  def not_found(conn, _params) do
    render conn, "not_found.html"
  end
end
