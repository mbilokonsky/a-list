defmodule Alist.Lists.List do
  use Ecto.Schema
  import Ecto.Changeset
  alias Alist.Lists.{ListTemplate,ListItem}

  schema "lists" do
    belongs_to :list_template, ListTemplate
    has_one :item1, ListItem
    has_one :item2, ListItem
    has_one :item3, ListItem
    has_one :item4, ListItem
    has_one :item5, ListItem

    timestamps()
  end

  @doc false
  def changeset(list, attrs) do
    list
    |> cast(attrs, [])
    |> validate_required([])
  end
end
