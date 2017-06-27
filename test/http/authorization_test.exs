defmodule Oneflow.Http.AuthorizationTest do
  use ExUnit.Case

  alias Oneflow.{Http.Request, Http.Authorization}

  doctest Oneflow.Http.Authorization

  setup do
    Application.put_env(:oneflow, :token, "token")
    Application.put_env(:oneflow, :secret, "secret")
    {:ok, %{}}
  end

  describe "authorization header" do
    test "raises an error if path does not start with slash" do
      request = %Request{ method: :get, path: "url?foo=bar"}
      assert_raise ArgumentError, "path must start with /", fn ->
        Authorization.header_value(request, 123456789)
      end
    end
  end
end
