defmodule Confidely.Therapists do
  @moduledoc """
  The Therapists context.
  """

  import Ecto.Query, warn: false
  alias Confidely.Repo

  alias Confidely.Therapists.Therapist

  @doc """
  Returns the list of therapists.

  ## Examples

      iex> list_therapists()
      [%Therapist{}, ...]

  """
  def list_therapists do
    Repo.all(Therapist)
  end

  @doc """
  Gets a single therapist.

  Raises `Ecto.NoResultsError` if the Therapist does not exist.

  ## Examples

      iex> get_therapist!(123)
      %Therapist{}

      iex> get_therapist!(456)
      ** (Ecto.NoResultsError)

  """
  def get_therapist!(id), do: Repo.get!(Therapist, id)

  @doc """
  Creates a therapist.

  ## Examples

      iex> create_therapist(%{field: value})
      {:ok, %Therapist{}}

      iex> create_therapist(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_therapist(attrs \\ %{}) do
    %Therapist{}
    |> Therapist.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a therapist.

  ## Examples

      iex> update_therapist(therapist, %{field: new_value})
      {:ok, %Therapist{}}

      iex> update_therapist(therapist, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_therapist(%Therapist{} = therapist, attrs) do
    therapist
    |> Therapist.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a therapist.

  ## Examples

      iex> delete_therapist(therapist)
      {:ok, %Therapist{}}

      iex> delete_therapist(therapist)
      {:error, %Ecto.Changeset{}}

  """
  def delete_therapist(%Therapist{} = therapist) do
    Repo.delete(therapist)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking therapist changes.

  ## Examples

      iex> change_therapist(therapist)
      %Ecto.Changeset{data: %Therapist{}}

  """
  def change_therapist(%Therapist{} = therapist, attrs \\ %{}) do
    Therapist.changeset(therapist, attrs)
  end
end
