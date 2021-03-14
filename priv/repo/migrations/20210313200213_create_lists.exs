defmodule Alist.Repo.Migrations.CreateLists do
  use Ecto.Migration

  def change do
    create table(:lists) do
      add :title, :string
      add :body, :text
      add :views, :integer, default: 0

      timestamps()
    end

  end
end
