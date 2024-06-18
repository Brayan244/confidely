defmodule Confidely.Users.User do
  @moduledoc """
  The schema for users table, it represents both patients and therapists trhough the roles.
  """

  use Ecto.Schema
  use Pow.Ecto.Schema
  import Ecto.Changeset

  # Import the Pow schema fields for extendings
  use Pow.Extension.Ecto.Schema,
    extensions: [PowResetPassword, PowEmailConfirmation, PowInvitation]

  @roles ["therapist", "patient"]
  @default_role "therapist"
  @fields [
    :first_name,
    :last_name,
    :phone_number,
    :country_code,
    :bio,
    :role,
    :email,
    :password,
    :password_confirmation
  ]

  schema "users" do
    field :first_name, :string
    field :last_name, :string
    field :phone_number, :string
    field :country_code, :string, default: "+52"
    field :bio, :string
    field :role, :string, default: @default_role

    pow_user_fields()
    timestamps()
  end

  def changeset(user, params \\ %{}) do
    user
    |> cast(params, @fields)
    |> validate_required([:role])
    |> validate_inclusion(:role, @roles)
    |> unique_constraint(:email)
  end
end
