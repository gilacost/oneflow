defmodule OneflowEx.Models.StockItems do

  use OneflowEx.Models.Encoder

  @enforce_keys [ :code, :quantity, :unitPrice, :weight ]

  defstruct [
    code: nil,
    name: nil,
    quantity: 1,
    barcode: nil,
    stockId: nil,
    scanned: 0,
    shipmentIndex: 0,
    unitPrice: 0,
    weight: 0,
    sourceItemId: nil
  ]

end
