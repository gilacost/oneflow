defmodule Models.StockItemTest do
  use ExUnit.Case
  use Oneflow.ModelCase

  @valid_attributes %{
    code: "coupon",
    name: "Default Coupon",
    quantity: 1,
    barcode: "COUP0001",
    stockId: "562918afc8b9191e004b0890",
    scanned: 0,
    shipmentIndex: 0,
    unitPrice: 0.25,
    weight: 0,
    sourceItemId: "STOCK-ITEM-43243231-1"
  }

  test "valid stock item returns a oneflow stock item struct" do
    assert struct!(StockItem, @valid_attributes)
  end

  test "stock item without required fields" do
    error_message = "#{@error_common} Oneflow.Models.StockItem: [:code, :quantity]"

    assert_raise ArgumentError, error_message, fn ->
      struct!(StockItem, %{})
    end
  end
end
