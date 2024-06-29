defmodule ConfidelyWeb.SessionController do
  use ConfidelyWeb, :controller

  def new(conn, _params) do
    render_new_session(conn)
  end

  def create(conn, %{"user" => user_params}) do
    case Pow.Plug.authenticate_user(conn, user_params) do
      {:ok, conn} ->
        conn
        |> put_flash(:info, "You are now signed in.")
        |> redirect(to: Routes.page_path(conn, :home))

      {:error, conn} ->
        conn
        |> put_flash(:error, "Invalid email or password.")
        |> render_new_session()
    end
  end

  def delete(conn, _params) do
    conn = Pow.Plug.delete(conn)

    redirect(conn, to: Routes.page_path(conn, :home))
  end

  defp render_new_session(conn) do
    changeset = Pow.Plug.change_user(conn)
    action = Routes.session_path(conn, :create)

    render(conn, "new.html", changeset: changeset, action: action)
  end
end
