defmodule Elixirpay.Numbers do
  def sum_numbers_from_file(fileName) do
    "#{fileName}.csv"
    |> File.read()
    |> handle_file()
  end

  defp handle_file({:ok, file}) do
    result =
      String.split(file, ",")
      |> Stream.map(fn num -> String.to_integer(num) end)
      |> Enum.sum()

    {:ok, %{result: result}}
  end
  defp handle_file({:error, _reason}), do: {:error, %{message: "Invalid file!"}}
end
