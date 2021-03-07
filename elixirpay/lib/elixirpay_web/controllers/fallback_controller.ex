defmodule ElixirpayWeb.FallbackController do
  use ElixirpayWeb, :controller

  def call(connection, {:error, result}) do
    connection
    |> put_status(:bad_request)
    |> put_view(ElixirpayWeb.ErrorView)
    |> render("400.json", result: result)
  end
end
