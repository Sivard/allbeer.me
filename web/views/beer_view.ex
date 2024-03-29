defmodule Allbeerme.BeerView do
  use Allbeerme.Web, :view
  use Rummage.Phoenix.View
  use Timex

  def card_link(logo, thumb \\ :thumb, class \\ "card-img-top") do
    ~E"""
      <img class="<%= class %>" src="<%= image_link(logo, thumb) %>" alt="<%= logo.name %>">
    """
  end

  def preview(text) do
    text |> Floki.find("p.preview") |> Floki.raw_html
  end

  def image_link(logo, thumb) do
    Allbeerme.ImageUploader.url({logo.image, logo}, thumb)
  end

  def time_ago(time) do
    Timex.from_now(time, "ru")
  end
end
