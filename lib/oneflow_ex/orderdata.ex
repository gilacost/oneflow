defmodule OneflowEx.OrderData do

  use OneflowEx.Encoder

  @enforce_keys [ :sourceOrderId, :email ]

  defstruct [
    printType: "digital",
    sourceOrderId: nil,
    email: nil,
    misCode: nil,
    customerName: nil,
    amount: 0,
    purchaseOrderNumber: nil,
    tags: nil,
    extraData: nil,
    additionalInformation: nil,
    items: nil,
    stockItems: nil,
    shipments: nil
  ]

end
