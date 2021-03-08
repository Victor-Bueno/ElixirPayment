defmodule Elixirpay.Users.CreateTest do
  use Elixirpay.DataCase

  alias Elixirpay.User
  alias Elixirpay.Users.Create

  describe "call/1" do
    test "when all params are valid, returns an user" do
      params = %{
        name: "Test",
        password: "12345678",
        nickname: "LittleTest",
        email: "test@test.com"
        age: 21
      }

      {:ok, %User{id: user_id}} = Create.call()
      user = Repo.get(User, user_id)

      assert %User{name: "Test", age: 21, id: ^user_id} = user
    end
  end

  test "when there are invalid params, returns an error" do
    params = %{
      name: "Test",
      nickname: "LittleTest",
      email: "test@test.com"
      age: 13
    }

    {:error, changeset} = Create.call()
    expected_response = %{
      age: ["must be greater than or equal to 18"],
      password: ["can't be blank"]
    }

    assert errors_on(changeset) == expected_response
  end
end
end
