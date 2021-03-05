defmodule Elixirpay.NumbersTest do
  use ExUnit.Case
  alias Elixirpay.Numbers

  describe "sum_numbers_from_file/1" do
    test "when there is a file matching the given name, returns the sum of numbers" do
      response = Numbers.sum_numbers_from_file("numbers")

      expected_response = {:ok, %{result: 37}}

      assert response == expected_response
    end

    test "when there is no file matching the given name, returns an error" do
      response = Numbers.sum_numbers_from_file("banana")

      expected_response = {:error, %{message: "Invalid file!"}}

      assert response == expected_response
    end
  end
end
