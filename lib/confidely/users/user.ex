defmodule Confidely.Users.User do
  @moduledoc """
  The schema for users table, it represents both patients and therapists trhough the roles.
  """

  use Ecto.Schema
  use Pow.Ecto.Schema

  schema "users" do
    pow_user_fields()

    timestamps()
  end
end
