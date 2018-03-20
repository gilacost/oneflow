defmodule Models.OrderDataTest do
  use ExUnit.Case
  use Oneflow.ModelCase

  @valid_attributes %{
    printType: "digital",
    sourceOrderId: "41324132",
    email: "email@customer.com",
    misCode: "12341341234132",
    amount: 123.45,
    customerName: "Customer Name",
    purchaseOrderNumber: "XF1234234",
    tags: ["abc123", "def456"],
    extraData: %{},
    items: [],
    stockItems: [],
    shipments: []
  }

  test "valid order data returns a oneflow order data struct" do
    assert struct!(OrderData, @valid_attributes)
  end

  test "order data without required fields" do
    error_message = "#{@error_common} Oneflow.Models.OrderData: [:sourceOrderId, :email]"

    assert_raise ArgumentError, error_message, fn ->
      struct!(OrderData, %{})
    end
  end
end
