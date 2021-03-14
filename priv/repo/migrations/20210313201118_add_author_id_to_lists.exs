defmodule Alist.Repo.Migrations.AddAuthorIdToLists do
  use Ecto.Migration

  def change do
    alter table(:lists) do
      add :author_id, references(:authors, on_delete: :delete_all),
                      null: false
    end

    create index(:lists, [:author_id])
  end
end
