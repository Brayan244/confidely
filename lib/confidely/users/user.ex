defmodule Confidely.Users.User do
  @moduledoc """
  Represents the base schema for the users table, it works as baseline of therapist and patient schemas.
  """

  use Ecto.Schema
  use Pow.Ecto.Schema
  import Ecto.Changeset

  schema "users" do
    field :first_name, :string
    field :last_name, :string
    field :email, :string
    field :phone_number, :string
    field :country_code, :string
    pow_user_fields()

    timestamps()
  end

  def changeset(user, attrs) do
    user
    |> cast(attrs, [:first_name, :last_name, :email, :phone_number, :country_code])
    |> validate_required([:first_name, :last_name, :email])
    |> unique_constraint(:email)
    |> pow_changeset(attrs)
  end
end
