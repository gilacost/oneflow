defmodule Models.CarrierTest do
  use ExUnit.Case
  use Oneflow.ModelCase

  @valid_attributes %{
    code: "ups",
    service: "express",
    alias: "CUSTOM-SHIPPING"
  }

  test "valid carrier returns a oneflow carrier struct" do
    assert struct!(Carrier, @valid_attributes)
  end

  test "carrier without required fields" do
    error_message = "#{@error_common} Oneflow.Models.Carrier: [:code, :service]"

    assert_raise ArgumentError, error_message, fn ->
      struct!(Carrier, %{})
    end
  end

  def get_valid_attributes(), do: @valid_attributes
end
