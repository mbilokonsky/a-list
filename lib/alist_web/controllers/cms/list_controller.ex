defmodule AlistWeb.CMS.ListController do
  use AlistWeb, :controller

  alias Alist.CMS
  alias Alist.CMS.List

  plug :require_existing_author
  plug :authorize_list when action in [:edit, :update, :delete]

  def index(conn, _params) do
    lists = CMS.list_lists()
    render(conn, "index.html", lists: lists)
  end

  def new(conn, _params) do
    changeset = CMS.change_list(%List{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"list" => list_params}) do
    case CMS.create_list(conn.assigns.current_author, list_params) do
      {:ok, list} ->
        conn
        |> put_flash(:info, "List created successfully.")
        |> redirect(to: Routes.cms_list_path(conn, :show, list))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    list = id
    |> CMS.get_list!()
    |> CMS.increment_list_views()

    render(conn, "show.html", list: list)
  end

  def edit(conn, _) do
    changeset = CMS.change_list(conn.assigns.list)
    render(conn, "edit.html", changeset: changeset)
  end

  def update(conn, %{"list" => list_params}) do
    case CMS.update_list(conn.assigns.list, list_params) do
      {:ok, list} ->
        conn
        |> put_flash(:info, "List updated successfully.")
        |> redirect(to: Routes.cms_list_path(conn, :show, list))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html", changeset: changeset)
    end
  end

  def delete(conn, _) do
    {:ok, _list} = CMS.delete_list(conn.assigns.list)

    conn
    |> put_flash(:info, "List deleted successfully.")
    |> redirect(to: Routes.cms_list_path(conn, :index))
  end

  defp require_existing_author(conn, _) do
    author = CMS.ensure_author_exists(conn.assigns.current_user)
    assign(conn, :current_author, author)
  end

  defp authorize_list(conn, _) do
    list = CMS.get_list!(conn.params["id"])

    if conn.assigns.current_author.id == list.author_id do
      assign(conn, :list, list)
    else
      conn
      |> put_flash(:error, "You can't modify that list")
      |> redirect(to: Routes.cms_list_path(conn, :index))
      |> halt()
    end
  end
end
