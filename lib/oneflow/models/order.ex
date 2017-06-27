defmodule Oneflow.Models.Order do
  alias Oneflow.Models.{Destination, OrderData}

  defstruct [
    destination: %Destination{
      name: ""
    },
    orderData: %OrderData{
      sourceOrderId: "",
      email: ""
    }
  ]

  def create_order(%Destination{} = destination) do
    %__MODULE__{
      destination: destination
    }
  end

end
