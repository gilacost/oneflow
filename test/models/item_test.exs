defmodule Models.ItemTest do
  use ExUnit.Case
  use Oneflow.ModelCase

  @valid_attributes %{
    description: "Photo Book",
    shipmentIndex: 0,
    sourceItemId: "ORDER-13243124",
    sku: "SKU-CODE-X",
    quantity: 1,
    shrinkWrap: false,
    binding: "wiro",
    folding: "half",
    barcode: "13243124",
    extraData: %{},
    additionalInformation: "Any additional information relating to this order"
  }

  test "valid item returns a oneflow item struct" do
    assert struct!(Item, @valid_attributes)
  end

  test "item without required fields" do
    error_message = "#{@error_common} Oneflow.Models.Item: [:sourceItemId, :sku]"
    assert_raise ArgumentError, error_message, fn ->
      struct!(Item, %{})
    end
  end
end
