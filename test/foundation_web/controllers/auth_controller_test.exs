defmodule FoundationWeb.AuthControllerTest do
  use FoundationWeb.ConnCase
  alias Foundation.Repo
  alias Foundation.User

  @ueberauth_auth %{credentials: %{token: "fdsnoafhnoofh08h38h"},
                    info: %{email: "tesla@example.com", first_name: "Nikola", last_name: "Tesla"},
                    provider: :google}

  test "redirects user to Google for auth", %{conn: conn} do
    conn = get conn, "/auth/google?scope=email%20profile"
    assert redirected_to(conn, 302)
  end

  test "create user from Google information", %{conn: conn} do
    conn = conn
    |> assign(:ueberauth_auth, @ueberauth_auth)
    |> get("/auth/google/callback")

    users = User |> Repo.all
    assert Enum.count(users) == 1
    assert get_flash(conn, :info) == "Thank you for signing in!"
  end
end
