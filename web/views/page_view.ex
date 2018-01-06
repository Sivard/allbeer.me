defmodule Allbeerme.PageView do
  use Allbeerme.Web, :view
  use Timex

  def card_link(logo) do
    ~E"""
      <img class="card-img-top" src="<%= image_link(logo) %>" alt="<%= logo.name %>">
    """
  end

  def image_link(logo) do
    Allbeerme.ImageUploader.url({logo.image, logo}, :thumb)
  end

  def time_ago(time) do
    Timex.from_now(time, "ru")
  end
end
