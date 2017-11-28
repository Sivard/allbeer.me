defmodule Allbeerme.UserTest do
  # use Allbeerme.ModelCase
  use ExUnit.Case

  alias Allbeerme.User

  @valid_attrs %{email: "[email protected]", password: "test1234", password_confirmation: "test1234", username: "testuser"}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = User.changeset(%User{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = User.changeset(%User{}, @invalid_attrs)
    refute changeset.valid?
  end
end
