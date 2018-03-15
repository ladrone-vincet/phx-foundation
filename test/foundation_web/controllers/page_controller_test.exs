defmodule FoundationWeb.PageControllerTest do
  use FoundationWeb.ConnCase

  test "GET /", %{conn: conn} do
    conn = get conn, "/"
    assert html_response(conn, 200) =~ "Welcome to Foundation"
  end
end
