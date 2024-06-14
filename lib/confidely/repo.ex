defmodule Confidely.Repo do
  use Ecto.Repo,
    otp_app: :confidely,
    adapter: Ecto.Adapters.Postgres
end
