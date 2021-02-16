defmodule AlistWeb.PageController do
  use AlistWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
