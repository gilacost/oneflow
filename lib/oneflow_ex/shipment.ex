defmodule OneflowEx.Shipment do

  use OneflowEx.Encoder

  defstruct [
    sourceShipmentId: nil,
    shipmentIndex: nil,
    shipByDate: nil,
    canShipEarly: true,
    cost: nil,
    attachments: nil,
    shipTo: nil,
    carrier: nil,
    returnAddress: nil,
  ]

end
