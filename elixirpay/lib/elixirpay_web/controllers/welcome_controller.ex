defmodule ElixirpayWeb.WelcomeController do
  use ElixirpayWeb, :controller

  alias Elixirpay.Numbers

  def index(connection, %{"fileName" => fileName}) do
    fileName
    |> Numbers.sum_numbers_from_file()
    |> handle_response(connection)
  end

  defp handle_response({:ok, %{result: result}}, connection) do
    connection
    |> put_status(:ok)
    |> json(%{message: "Welcome to Elixirpay API, here is your number #{result}"})
  end

  defp handle_response({:error, %{result: reason}}, connection) do
    connection
    |> put_status(:bad_request)
    |> json(reason)
  end
end
