defmodule CrudUsers.AccountsTest do
  use CrudUsers.DataCase

  alias CrudUsers.Accounts

  describe "users" do
    alias CrudUsers.Accounts.Users

    import CrudUsers.AccountsFixtures

    @invalid_attrs %{desciption: nil, email: nil, name: nil}

    test "list_users/0 returns all users" do
      users = users_fixture()
      assert Accounts.list_users() == [users]
    end

    test "get_users!/1 returns the users with given id" do
      users = users_fixture()
      assert Accounts.get_users!(users.id) == users
    end

    test "create_users/1 with valid data creates a users" do
      valid_attrs = %{desciption: "some desciption", email: "some email", name: "some name"}

      assert {:ok, %Users{} = users} = Accounts.create_users(valid_attrs)
      assert users.desciption == "some desciption"
      assert users.email == "some email"
      assert users.name == "some name"
    end

    test "create_users/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Accounts.create_users(@invalid_attrs)
    end

    test "update_users/2 with valid data updates the users" do
      users = users_fixture()

      update_attrs = %{
        desciption: "some updated desciption",
        email: "some updated email",
        name: "some updated name"
      }

      assert {:ok, %Users{} = users} = Accounts.update_users(users, update_attrs)
      assert users.desciption == "some updated desciption"
      assert users.email == "some updated email"
      assert users.name == "some updated name"
    end

    test "update_users/2 with invalid data returns error changeset" do
      users = users_fixture()
      assert {:error, %Ecto.Changeset{}} = Accounts.update_users(users, @invalid_attrs)
      assert users == Accounts.get_users!(users.id)
    end

    test "delete_users/1 deletes the users" do
      users = users_fixture()
      assert {:ok, %Users{}} = Accounts.delete_users(users)
      assert_raise Ecto.NoResultsError, fn -> Accounts.get_users!(users.id) end
    end

    test "change_users/1 returns a users changeset" do
      users = users_fixture()
      assert %Ecto.Changeset{} = Accounts.change_users(users)
    end
  end
end
