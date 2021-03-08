defmodule Alist.Repo.Migrations.CreateListTemplates do
  use Ecto.Migration

  def change do
    create table(:list_templates) do
      add :title, :string
      add :body, :text
      add :prompt1, :string
      add :prompt2, :string
      add :prompt3, :string
      add :prompt4, :string
      add :prompt5, :string

      timestamps()
    end

  end
end
