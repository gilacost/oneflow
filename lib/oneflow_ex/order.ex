defmodule OneflowEx.Order do
  alias OneflowEx.{Destination, OrderData}
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

  def create_order(destination) do
    %__MODULE__{
      destination: %Destination{
        name: destination
      }
    }
  end

end
