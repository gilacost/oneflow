defmodule Oneflow.Models.Shipment do
  use Oneflow.Models.Encoder

  @enforce_keys [:shipTo, :carrier]

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
