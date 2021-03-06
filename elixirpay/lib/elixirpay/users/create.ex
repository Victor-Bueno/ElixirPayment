defmodule Elixirpay.Users.Create do
  alias Elixirpay.{Repo, User}

  def call(params) do
    User.changeset(params)
    |> Repo.insert()
  end
end
