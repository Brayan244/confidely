defmodule Confidely.Repo.Migrations.CreateUsers do
  use Ecto.Migration

  def change do
    create table(:users) do
      add :first_name, :string, null: false
      add :last_name, :string, null: false
      add :email, :string, null: false
      add :phone_number, :string
      add :country_code, :string
      add :password_hash, :string

      timestamps()
    end

    create unique_index(:users, [:email])
  end
end
