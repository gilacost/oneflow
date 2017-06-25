defmodule OneflowEx.Order do
  alias OneflowEx.{Destination, OrderData}

  defstruct [
    destination: %Destination{},
    orderData: %OrderData{}
  ]
  def new(destination \\ "") do
    %__MODULE__{
      destination: %Destination{ name: destination}
    }
  end

  def create_order(destination) do
    new(destination)
  end

end
