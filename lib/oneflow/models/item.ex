defmodule Oneflow.Models.Item do

  use Oneflow.Models.Encoder

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
