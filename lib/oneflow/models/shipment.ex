defmodule Oneflow.Models.Shipment do

  use Oneflow.Models.Encoder

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
