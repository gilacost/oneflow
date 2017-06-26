defmodule OneflowEx.Models.Shipment do

  use OneflowEx.Models.Encoder

  defstruct [
    :sourceShipmentId,
    :shipmentIndex,
    :shipByDate,
    :canShipEarly,
    :cost,
    :attachments,
    :shipTo,
    :carrier,
    :returnAddress
  ]

end
