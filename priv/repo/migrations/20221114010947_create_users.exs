defmodule CrudUsers.Repo.Migrations.CreateUsers do
  use Ecto.Migration

  def change do
    create table(:users) do
      add :name, :string
      add :email, :string
      add :desciption, :text

      timestamps()
    end
  end
end
