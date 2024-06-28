defmodule ConfidelyWeb.RegistrationController do
  use ConfidelyWeb, :controller

  alias Confidely.Repo
  alias Confidely.Users.User
  alias Confidely.Therapists.Therapist

  def new(conn, _params) do
    changeset = Pow.Plug.change_user(conn)

    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"user" => user_params}) do
    conn |> Pow.Plug.create_user(user_params) |> handle_create_response()
  end

  defp handle_create_response({:ok, conn, %User{id: user_id}}) do
    therapist = Therapist.changeset(%Therapist{}, %{"user_id" => user_id})

    Repo.insert!(therapist)

    conn
    |> put_flash(:info, "You have signed up successfully.")
    |> redirect(to: Routes.page_path(conn, :home))
  end

  defp handle_create_response({:error, conn, %Ecto.Changeset{} = changeset}) do
    conn
    |> put_flash(:error, "There was an error with your submission.")
    |> render("new.html", changeset: changeset)
  end
end
