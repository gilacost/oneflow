defmodule Models.ComponentTest do
  use ExUnit.Case
  use Oneflow.ModelCase

  @valid_attributes %{
    code: "text",
    path: "http://www.site.com/order/13243124/text.pdf",
    fetch: true,
    localFile: false,
    preflight: true,
    sourceComponentId: "ORDER-13243124-1",
    paper: "chromat",
    weight: "90gsm",
    heigh: 210,
    width: 297,
    pages: 16,
    duplicate: 10,
    barcode: "",
    attributes: %{
      corners: "rounded"
    },
    extraData: %{}
  }

  test "valid component returns a oneflow component struct" do
    assert struct!(Component, @valid_attributes)
  end

  test "component without required fields" do
    error_message = "#{@error_common} Oneflow.Models.Component: [:code, :path]"

    assert_raise ArgumentError, error_message, fn ->
      struct!(Component, %{})
    end
  end
end
