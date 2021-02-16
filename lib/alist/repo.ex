defmodule Alist.Repo do
  use Ecto.Repo,
    otp_app: :alist,
    adapter: Ecto.Adapters.Postgres
end
