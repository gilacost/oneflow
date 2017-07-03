ExUnit.start()
defmodule Oneflow.ModelCase do
  use ExUnit.CaseTemplate

  setup do
    Application.put_env(:oneflow, :token, "token")
    Application.put_env(:oneflow, :secret, "secret")
    {:ok, %{}}
  end

  using do
    quote do
      alias Oneflow.Helpers
      alias Oneflow.Models.Address
      import Oneflow.ModelCase
    end
  end
end
