defmodule Allbeerme.BeerView do
  use Allbeerme.Web, :view

  def card_link(logo) do
    ~E"""
      <img class="card-img-top" src="<%= image_link(logo) %>" alt="<%= logo.name %>">
    """
  end

  def image_link(logo) do
    Allbeerme.ImageUploader.url({logo.image, logo}, :thumb)
  end
end
