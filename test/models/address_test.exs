defmodule Models.AddressTest do
  use ExUnit.Case
  use Oneflow.ModelCase

  @valid_attributes %{
    name: "josep lluis",
    companyName: "The Book of Everyone",
    address1: "Plaça catalunya",
    address2: "on els coloms",
    address3: "2on floor",
    town: "barcelona",
    state: "barcelona",
    postcode: "90098Z2H",
    isoCountry: "CA",
    phone: "604604604"
  }

  test "valid address returns a oneflow address struct" do
    assert address = struct!(Address, @valid_attributes)
  end

  test "address without required fields" do
    error_message = "the following keys must also be given when building struct Oneflow.Models.Address: [:name, :address1, :town, :postcode, :isoCountry]"
    assert_raise ArgumentError, error_message, fn ->
      struct!(Address, %{})
    end
  end
end
