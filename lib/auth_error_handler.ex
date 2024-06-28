defmodule ConfidelyWeb.AuthErrorHandler do
  @moduledoc """
  This module is used to handle authentication errors.
  """
  use ConfidelyWeb, :controller
  alias Plug.Conn

  @spec call(Conn.t(), atom) :: Conn.t()
  def call(conn, :not_authenticated) do
    conn
    |> put_flash(:error, "You must be logged in to access this page.")
    |> redirect(to: Routes.signup_path(conn, :new))
  end

  @spec call(Conn.t(), atom) :: Conn.t()
  def call(conn, :already_authenticated) do
    conn
    |> put_flash(:info, "You are already logged in.")
    |> redirect(to: Routes.page_path(conn, :home))
  end
end
