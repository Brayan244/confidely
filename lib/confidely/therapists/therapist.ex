defmodule Confidely.Therapists.Therapist do
  @moduledoc """
  Represents the schema for the therapists table. It is a child of the users table.
  """
  use Ecto.Schema
  import Ecto.Changeset

  alias Confidely.Users.User

  schema "therapists" do
    field :bio, :string
    belongs_to :user, User

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(therapist, attrs) do
    therapist
    |> cast(attrs, [:bio, :user_id])
    |> validate_required([:bio, :user_id])
    |> assoc_constraint(:user)
  end
end
