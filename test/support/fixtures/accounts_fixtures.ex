defmodule CrudUsers.AccountsFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `CrudUsers.Accounts` context.
  """

  @doc """
  Generate a users.
  """
  def users_fixture(attrs \\ %{}) do
    {:ok, users} =
      attrs
      |> Enum.into(%{
        desciption: "some desciption",
        email: "some email",
        name: "some name"
      })
      |> CrudUsers.Accounts.create_users()

    users
  end
end
