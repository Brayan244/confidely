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

  schema "users" do
    field :role, :string, default: @default_role

    pow_user_fields()
    timestamps()
  end

  def changeset(user, params \\ %{}) do
    user
    |> cast(params, [:email, :password, :password_confirmation, :role])
    |> validate_required([:role])
    |> validate_inclusion(:role, @roles)
    |> unique_constraint(:email)
  end
end
