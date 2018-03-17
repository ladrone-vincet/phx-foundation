defmodule Foundation.Factory do
  use ExMachina.Ecto, repo: Foundation.Repo
  alias Foundation.User

  def user_factory do
    %User{
      token: "ffnebyt73bich9",
      email: "Leanardo@florence.it",
      first_name: "Leonardo",
      last_name: "Da Vinci",
      provider: "google"
    }
  end
end
