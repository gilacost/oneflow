defmodule Oneflow.Models.OrderData do

  use Oneflow.Models.Encoder

  @enforce_keys [ :sourceOrderId, :email ]

  defstruct [
    :printType,
    :sourceOrderId,
    :email,
    :misCode,
    :customerName,
    :amount,
    :purchaseOrderNumber,
    :tags,
    :extraData,
    :additionalInformation,
    :items,
    :stockItems,
    :shipments
  ]

end
