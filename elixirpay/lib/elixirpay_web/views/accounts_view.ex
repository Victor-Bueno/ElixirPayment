defmodule ElixirpayWeb.AccountsView do
  alias Elixirpay.Account
  def render("update.json", %{account: %Account{id: account_id, balance: balance}}) do
    %{
      message: "Ballance changed succesfully!",
      account: %{
        id: account_id,
        balance: balance
      }
    }
  end
end
