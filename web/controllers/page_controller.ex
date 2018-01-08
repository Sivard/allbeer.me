defmodule Allbeerme.PageController do
  use Allbeerme.Web, :controller

  alias Allbeerme.Beer

  def index(conn, _params) do
    beers = Repo.all(
      from beer in Beer,
      order_by: [desc: beer.inserted_at],
      limit: 3)
      |> Repo.preload(:logo)
    render(conn, "index.html", beers: beers)
  end

  def not_found(conn, _params) do
    render conn, "not_found.html"
  end
end
