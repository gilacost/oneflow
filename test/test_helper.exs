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

      alias Oneflow.Models.{
        Address,
        Carrier,
        Component,
        Destination,
        Item,
        Order,
        OrderData,
        StockItem,
        Shipment
      }

      import Oneflow.ModelCase

      @error_common "the following keys must also be given when building struct"
    end
  end
end
