defmodule Confidely.Repo.Migrations.AddTherapistDataToUser do
  use Ecto.Migration

  def change do
    alter table(:users) do
      add :first_name, :string
      add :last_name, :string
      add :phone_number, :string
      add :country_code, :string, default: "+52"
      add :bio, :string
    end
  end
end
