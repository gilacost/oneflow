defmodule Oneflow.Models.Order do
  alias Oneflow.Models.{Destination, OrderData}
  alias __MODULE__

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
