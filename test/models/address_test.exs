defmodule Models.AddressTest do
  use ExUnit.Case
  use Oneflow.ModelCase

  @valid_attributes %{
    name: "Peter Pan",
    companyName: "Disney Corporation",
    address1: "17 Disney Way",
    address2: "",
    address3: "",
    town: "Los Angeles",
    postcode: "34757",
    state: "California",
    isoCountry: "US",
    country: "United States of America",
    email: "peter@disney.com",
    phone: "+12345678910"
  }

  test "valid address returns a oneflow address struct" do
    assert struct!(Address, @valid_attributes)
  end

  test "address without required fields" do
    error_message = "#{@error_common} Oneflow.Models.Address: [:name, :address1, :town, :postcode, :isoCountry]"
    assert_raise ArgumentError, error_message, fn ->
      struct!(Address, %{})
    end
  end

  def get_valid_attributes(), do: @valid_attributes

end
