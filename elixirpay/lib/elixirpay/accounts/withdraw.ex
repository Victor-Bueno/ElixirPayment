defmodule Elixirpay.Accounts.Withdraw do
  alias Elixirpay.Accounts.Operation
  alias Elixirpay.Repo

  def call(params) do
    Operation.call(params, :withdraw)
    |> run_transaction()
  end

  defp run_transaction(multi) do
    case Repo.transaction(multi) do
      {:error, _operation, reason, _changes} -> {:error, reason}
      {:ok, %{account_withdraw: account}} -> {:ok, account}
    end
  end
end
