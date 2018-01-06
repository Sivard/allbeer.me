# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     Allbeerme.Repo.insert!(%SomeModel{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.

alias Allbeerme.Repo
alias Allbeerme.User
# alias Allbeerme.Message
# import Ecto.Changeset

user = User.changeset(%User{}, %{
  username: "Admin",
  email: "admin@allbeer.me",
  password: "123456",
  password_confirmation: "123456"
})
Repo.insert!(user)

# Repo.insert!(change(%Document{}, %{
#   title: "Phoenix",
#   body: """
#   Phoenix is a framework for building HTML5 apps, API backends and distributed systems. Written in Elixir, you get beautiful syntax, productive tooling and a fast runtime.
#   """,
#   messages: [%Message{body: "<3 <3 phoenix"}]
# }))