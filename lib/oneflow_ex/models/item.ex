defmodule OneflowEx.Models.Item do

  use OneflowEx.Models.Encoder

  @enforce_keys [ :sourceItemId, :sku]

  defstruct [
    :description,
    :shipmentIndex,
    :sourceItemId,
    :sku,
    :quantity,
    :shrinkWrap,
    :binding,
    :folding,
    :barcode,
    :extraData,
    :tags,
    :components,
  ]

end
