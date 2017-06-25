defmodule OneflowEx.OrderData do

  defstruct [
    shipments: [],
    items: [],
    printType: "digital",
    sourceOrderId: nil,
    amount: 0,
    email: "",
    customerName: ""
  ]

end
