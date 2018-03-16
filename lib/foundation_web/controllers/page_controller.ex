defmodule FoundationWeb.PageController do
  use FoundationWeb, :controller

  def index(conn, _params) do
    conn
    # |> put_flash(:info, "This is flash alert test")
    |> render("index.html")
  end
end
