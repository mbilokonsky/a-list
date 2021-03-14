defmodule AlistWeb.CMS.ListView do
  use AlistWeb, :view

  alias Alist.CMS

  def author_name(%CMS.List{author: author}) do
    author.user.name
  end
end
