defmodule CrudUsers.Accounts.Users do
  use Ecto.Schema
  import Ecto.Changeset

  schema "users" do
    field :desciption, :string
    field :email, :string
    field :name, :string

    timestamps()
  end

  @doc false
  def changeset(users, attrs) do
    users
    |> cast(attrs, [:name, :email, :desciption])
    |> validate_required([:name, :email, :desciption])
  end
end
