defmodule Models.DestinationTest do
  use ExUnit.Case
  use Oneflow.ModelCase

  @valid_attributes %{
    name: "printcompanyx"
  }

  test "valid destination returns a oneflow destination struct" do
    assert struct!(Destination, @valid_attributes)
  end

  test "destination without required fields" do
    error_message = "#{@error_common} Oneflow.Models.Destination: [:name]"
    assert_raise ArgumentError, error_message, fn ->
      struct!(Destination, %{})
    end
  end
end
