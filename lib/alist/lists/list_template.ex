defmodule Alist.Lists.ListTemplate do
  use Ecto.Schema
  import Ecto.Changeset
  alias Alist.Lists.List
 
  schema "list_templates" do
    field :title, :string
    field :body, :string
    field :prompt1, :string, default: "1"
    field :prompt2, :string, default: "2"
    field :prompt3, :string, default: "3"
    field :prompt4, :string, default: "4"
    field :prompt5, :string, default: "5"
    has_many :lists, List

    timestamps()
  end

  @doc false
  def changeset(list_template, attrs) do
    list_template
    |> cast(attrs, [:title, :body, :prompt1, :prompt2, :prompt3, :prompt4, :prompt5])
    |> validate_required([:title, :body, :prompt1, :prompt2, :prompt3, :prompt4, :prompt5])
  end
end
