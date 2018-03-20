defmodule Models.ShipmentTest do
  use ExUnit.Case
  use Oneflow.ModelCase

  @valid_attributes %{
    sourceShipmentId: "SHIPMENT-13243124-1",
    shipmentIndex: 0,
    shipByDate: "2013-07-12",
    canShipEarly: true,
    cost: 22.44,
    shipTo: %{},
    returnAddress: %{},
    carrier: %{},
    attachments: [
      %{
        path: "http://some.site.com/files/insert.pdf",
        type: "insert"
      }
    ]
  }

  test "valid shipment returns a oneflow shipment struct" do
    valid_nested_attributes = %{
      shipTo: Models.AddressTest.get_valid_attributes(),
      returnAddress: Models.AddressTest.get_valid_attributes(),
      carrier: Models.CarrierTest.get_valid_attributes()
    }

    assert struct!(Shipment, Map.merge(@valid_attributes, valid_nested_attributes))
  end

  test "shipment without required fields" do
    error_message = "#{@error_common} Oneflow.Models.Shipment: [:shipTo, :carrier]"

    assert_raise ArgumentError, error_message, fn ->
      struct!(Shipment, %{})
    end
  end
end
