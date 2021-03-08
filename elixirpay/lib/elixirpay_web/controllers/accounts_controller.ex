defmodule ElixirpayWeb.AccountsController do
  use ElixirpayWeb, :controller

  alias Elixirpay.Account

  action_fallback ElixirpayWeb.FallbackController

  def deposit(connection, params) do
    with {:ok, %Account{} = account} <- Elixirpay.deposit(params) do
      connection
      |> put_status(:ok)
      |> render("update.json", account: account)
    end
  end

  def withdraw(connection, params) do
    with {:ok, %Account{} = account} <- Elixirpay.withdraw(params) do
      connection
      |> put_status(:ok)
      |> render("update.json", account: account)
    end
  end
end
