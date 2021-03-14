defmodule Alist.CMS.List do
  use Ecto.Schema
  import Ecto.Changeset
  alias Alist.CMS.Author

  schema "lists" do
    field :body, :string
    field :title, :string
    field :views, :integer
    belongs_to :author, Author

    timestamps()
  end

  @doc false
  def changeset(list, attrs) do
    list
    |> cast(attrs, [:title, :body])
    |> validate_required([:title, :body])
  end
end
