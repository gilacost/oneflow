defmodule Oneflow.Models.StockItem do

  use Oneflow.Models.Encoder

  @enforce_keys [ :code, :quantity ]

  defstruct [
    :code,
    :name,
    :quantity,
    :barcode,
    :stockId,
    :scanned,
    :shipmentIndex,
    :unitPrice,
    :weight,
    :sourceItemId
  ]

end
