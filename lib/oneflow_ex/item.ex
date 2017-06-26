defmodule OneflowEx.Item do

  @enforce_keys [ :sourceItemId, :sku]

  defstruct [
    description: nil,
    shipmentIndex: 0,
    sourceItemId: nil,
    sku: nil,
    quantity: 1,
    shrinkWrap: false,
    binding: "none",
    folding: "none",
    barcode: nil,
    extraData: nil,
    tags: nil,
    components: nil,
  ]

end
