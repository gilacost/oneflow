defmodule Models.OrderTest do
  use ExUnit.Case
  use Oneflow.ModelCase

  @valid_attributes %Destination{
    name: "printcompanyx"
  }
  @valid_order %Order{
    destination: %Destination{
      name: "printcompanyx"
    },
    orderData: %OrderData{
      sourceOrderId: "",
      email: ""
    }
  }

  test "creates a valid order" do
    assert @valid_order == Order.create_order(@valid_attributes)
  end
end
