defmodule Confidely.Users.User do
  @moduledoc """
  The schema for users table, it represents both patients and therapists trhough the roles.
  """

  use Ecto.Schema
  use Pow.Ecto.Schema

  # Import the Pow schema fields for extendings
  use Pow.Extension.Ecto.Schema,
    extensions: [PowResetPassword, PowEmailConfirmation, PowInvitation]

  schema "users" do
    pow_user_fields()

    timestamps()
  end
end
