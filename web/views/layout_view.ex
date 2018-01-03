defmodule Allbeerme.LayoutView do
  use Allbeerme.Web, :view

  def current_user(conn) do
    Plug.Conn.get_session(conn, :current_user)
  end

  def current_link(conn, title, path) do
    active = conn.request_path == path
    class = if active, do: "active", else: nil
    current = if active, do: content_tag(:span, "(current)", class: "sr-only"), else: nil

    ~E"""
      <li class="nav-item <%= class %>">
        <%= link to:  path, class: "nav-link" do %>
          <%= title %> <%= current %>
        <% end %>
      </li>
    """
  end

  defp render_flash(type, message) do
    ~E"""
    <div class="alert alert-<%= type %>" role="alert">
      <%= message %>
      <button type="button" class="close" data-dismiss="alert" aria-label="Close">
        <span aria-hidden="true">&times;</span>
      </button>
    </div>
    """
  end

  def show_flash(conn) do
    case get_flash(conn) do
      %{"info" => msg} ->
        render_flash("info", msg)
      %{"error" => msg} ->
        render_flash("danger", msg)
      _ ->
        ""
    end
  end
end
