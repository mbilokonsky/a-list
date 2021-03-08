defmodule Alist.Lists.ListItem do
  use Ecto.Schema
  import Ecto.Changeset
  alias Alist.Lists.List

  schema "list_items" do
    field :label, :string
    field :link, :string
    field :short_label, :string
    field :thumbnail_url, :string
    belongs_to :list, List

    timestamps()
  end

  @doc false
  def changeset(list_item, attrs) do
    list_item
    |> cast(attrs, [:short_label, :label, :link, :thumbnail_url])
    |> validate_required([:short_label, :label, :link, :thumbnail_url])
  end
end
