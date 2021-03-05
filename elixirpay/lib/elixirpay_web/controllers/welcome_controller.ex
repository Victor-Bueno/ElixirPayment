defmodule ElixirpayWeb.WelcomeController do
  use ElixirpayWeb, :controller

  def index(connection, _params) do
    text(connection, "Welcome to ElixirPay API")
  end
end
