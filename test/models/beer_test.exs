defmodule Allbeerme.BeerTest do
  use Allbeerme.ModelCase

  alias Allbeerme.Beer

  @valid_attrs %{body: "some content", description: "some content", keywords: "some content", name: "some content", title: "some content"}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = Beer.changeset(%Beer{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = Beer.changeset(%Beer{}, @invalid_attrs)
    refute changeset.valid?
  end
end
