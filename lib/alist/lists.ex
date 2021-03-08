defmodule Alist.Lists do
  @moduledoc """
  The Lists context.
  """

  import Ecto.Query, warn: false
  alias Alist.Repo

  alias Alist.Lists.ListTemplate

  @doc """
  Returns the list of list_templates.

  ## Examples

      iex> list_list_templates()
      [%ListTemplate{}, ...]

  """
  def list_list_templates do
    Repo.all(ListTemplate)
  end

  @doc """
  Gets a single list_template.

  Raises `Ecto.NoResultsError` if the List template does not exist.

  ## Examples

      iex> get_list_template!(123)
      %ListTemplate{}

      iex> get_list_template!(456)
      ** (Ecto.NoResultsError)

  """
  def get_list_template!(id), do: Repo.get!(ListTemplate, id)

  @doc """
  Creates a list_template.

  ## Examples

      iex> create_list_template(%{field: value})
      {:ok, %ListTemplate{}}

      iex> create_list_template(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_list_template(attrs \\ %{}) do
    %ListTemplate{}
    |> ListTemplate.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a list_template.

  ## Examples

      iex> update_list_template(list_template, %{field: new_value})
      {:ok, %ListTemplate{}}

      iex> update_list_template(list_template, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_list_template(%ListTemplate{} = list_template, attrs) do
    list_template
    |> ListTemplate.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a list_template.

  ## Examples

      iex> delete_list_template(list_template)
      {:ok, %ListTemplate{}}

      iex> delete_list_template(list_template)
      {:error, %Ecto.Changeset{}}

  """
  def delete_list_template(%ListTemplate{} = list_template) do
    Repo.delete(list_template)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking list_template changes.

  ## Examples

      iex> change_list_template(list_template)
      %Ecto.Changeset{data: %ListTemplate{}}

  """
  def change_list_template(%ListTemplate{} = list_template, attrs \\ %{}) do
    ListTemplate.changeset(list_template, attrs)
  end

  alias Alist.Lists.ListItem

  @doc """
  Returns the list of list_items.

  ## Examples

      iex> list_list_items()
      [%ListItem{}, ...]

  """
  def list_list_items do
    Repo.all(ListItem)
  end

  @doc """
  Gets a single list_item.

  Raises `Ecto.NoResultsError` if the List item does not exist.

  ## Examples

      iex> get_list_item!(123)
      %ListItem{}

      iex> get_list_item!(456)
      ** (Ecto.NoResultsError)

  """
  def get_list_item!(id), do: Repo.get!(ListItem, id)

  @doc """
  Creates a list_item.

  ## Examples

      iex> create_list_item(%{field: value})
      {:ok, %ListItem{}}

      iex> create_list_item(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_list_item(attrs \\ %{}) do
    %ListItem{}
    |> ListItem.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a list_item.

  ## Examples

      iex> update_list_item(list_item, %{field: new_value})
      {:ok, %ListItem{}}

      iex> update_list_item(list_item, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_list_item(%ListItem{} = list_item, attrs) do
    list_item
    |> ListItem.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a list_item.

  ## Examples

      iex> delete_list_item(list_item)
      {:ok, %ListItem{}}

      iex> delete_list_item(list_item)
      {:error, %Ecto.Changeset{}}

  """
  def delete_list_item(%ListItem{} = list_item) do
    Repo.delete(list_item)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking list_item changes.

  ## Examples

      iex> change_list_item(list_item)
      %Ecto.Changeset{data: %ListItem{}}

  """
  def change_list_item(%ListItem{} = list_item, attrs \\ %{}) do
    ListItem.changeset(list_item, attrs)
  end

  alias Alist.Lists.List

  @doc """
  Returns the list of lists.

  ## Examples

      iex> list_lists()
      [%List{}, ...]

  """
  def list_lists do
    Repo.all(List)
  end

  @doc """
  Gets a single list.

  Raises `Ecto.NoResultsError` if the List does not exist.

  ## Examples

      iex> get_list!(123)
      %List{}

      iex> get_list!(456)
      ** (Ecto.NoResultsError)

  """
  def get_list!(id), do: Repo.get!(List, id)

  @doc """
  Creates a list.

  ## Examples

      iex> create_list(%{field: value})
      {:ok, %List{}}

      iex> create_list(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_list(attrs \\ %{}) do
    %List{}
    |> List.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a list.

  ## Examples

      iex> update_list(list, %{field: new_value})
      {:ok, %List{}}

      iex> update_list(list, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_list(%List{} = list, attrs) do
    list
    |> List.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a list.

  ## Examples

      iex> delete_list(list)
      {:ok, %List{}}

      iex> delete_list(list)
      {:error, %Ecto.Changeset{}}

  """
  def delete_list(%List{} = list) do
    Repo.delete(list)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking list changes.

  ## Examples

      iex> change_list(list)
      %Ecto.Changeset{data: %List{}}

  """
  def change_list(%List{} = list, attrs \\ %{}) do
    List.changeset(list, attrs)
  end
end
