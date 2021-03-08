defmodule Alist.Repo.Migrations.CreateLists do
  use Ecto.Migration

  def change do
    create table(:lists) do
      add :template, references(:list_templates, on_delete: :nothing)
      add :item1, references(:list_items, on_delete: :nothing)
      add :item2, references(:list_items, on_delete: :nothing)
      add :item3, references(:list_items, on_delete: :nothing)
      add :item4, references(:list_items, on_delete: :nothing)
      add :item5, references(:list_items, on_delete: :nothing)

      timestamps()
    end

    create index(:lists, [:template])
    create index(:lists, [:item1])
    create index(:lists, [:item2])
    create index(:lists, [:item3])
    create index(:lists, [:item4])
    create index(:lists, [:item5])
  end
end
