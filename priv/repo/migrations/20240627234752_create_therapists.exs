defmodule Confidely.Repo.Migrations.CreateTherapists do
  use Ecto.Migration

  def change do
    create table(:therapists) do
      add :bio, :string
      add :user_id, references(:users, on_delete: :delete_all), null: false

      timestamps()
    end
  end
end
