defmodule Oneflow.Http.AuthorizationTest do
  use ExUnit.Case
  doctest Oneflow.Http.Authorization

  setup do
    Application.put_env(:oneflow, :token, "token")
    Application.put_env(:oneflow, :secret, "secret")
    {:ok, %{}}
  end

end
