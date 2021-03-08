defmodule ElixirpayWeb.AccountsController do
  use ElixirpayWeb, :controller

  alias Elixirpay.Account
  alias Elixirpay.Accounts.Transaction.Response, as: TransactionResponse

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

  def transaction(connection, params) do
    with {:ok, %TransactionResponse{} = transaction} <- Elixirpay.transaction(params) do
      connection
      |> put_status(:ok)
      |> render("transaction.json", transaction: transaction)
    end
  end
end
