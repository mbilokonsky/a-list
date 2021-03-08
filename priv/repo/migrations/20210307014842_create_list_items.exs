defmodule Alist.Repo.Migrations.CreateListItems do
  use Ecto.Migration

  def change do
    create table(:list_items) do
      add :short_label, :string
      add :label, :string
      add :link, :string
      add :thumbnail_url, :string

      timestamps()
    end

  end
end
