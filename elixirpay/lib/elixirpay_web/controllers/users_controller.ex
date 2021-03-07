defmodule ElixirpayWeb.UsersController do
  use ElixirpayWeb, :controller
  alias Elixirpay.User

  action_fallback ElixirpayWeb.FallbackController

  def create(connection, params) do
    with {:ok, %User{} = user} <- Elixirpay.create_user(params) do
      connection
      |> put_status(:created)
      |> render("create.json", user: user)
    end
  end
end
