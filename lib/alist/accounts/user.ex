defmodule Alist.Accounts.User do
  use Ecto.Schema
  import Ecto.Changeset

  schema "users" do
    field :email, :string
    field :name, :string
    field :twitter_account_id, :string
    field :username, :string

    timestamps()
  end

  @doc false
  def changeset(user, attrs) do
    user
    |> cast(attrs, [:name, :username, :email, :twitter_account_id])
    |> validate_required([:name, :username, :email, :twitter_account_id])
    |> unique_constraint(:username)
    |> unique_constraint(:email)
    |> unique_constraint(:twitter_account_id)
  end
end
