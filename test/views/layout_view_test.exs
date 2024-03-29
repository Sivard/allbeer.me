defmodule Allbeerme.LayoutViewTest do
  use Allbeerme.ConnCase, async: true

  alias Allbeerme.LayoutView
  alias Allbeerme.User

  setup do
    User.changeset(%User{}, %{username: "test", password: "test", password_confirmation: "test", email: "[email protected]"})
    |> Repo.insert
    {:ok, conn: build_conn()}
  end

  test "current user returns the user in the session", %{conn: conn} do
    conn = post conn, session_path(conn, :create), user: %{username: "test", password: "test"}
    assert LayoutView.current_user(conn)
  end

  test "current user returns nothing if there is no user in the session", %{conn: conn} do
    user = Repo.get_by(User, %{username: "test"})
    conn = delete conn, session_path(conn, :delete, user)
    refute LayoutView.current_user(conn)
  end
end
