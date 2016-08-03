# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     Demo.Repo.insert!(%Demo.SomeModel{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.

Demo.Repo.delete_all Demo.User

Demo.User.changeset(%Demo.User{}, %{
  name: "user1",
  email: "testuser@example.com",
  password: "secret",
  password_confirmation: "secret"})
|> Demo.Repo.insert!
