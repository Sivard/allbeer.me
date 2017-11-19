defmodule Allbeerme.PageController do
  use Allbeerme.Web, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end
