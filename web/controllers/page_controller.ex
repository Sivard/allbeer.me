defmodule Allbeerme.PageController do
  use Allbeerme.Web, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end

  def not_found(conn, _params) do
    render conn, "not_found.html"
  end
end
