defmodule OneflowEx.Destination do

  use OneflowEx.Encoder

  @enforce_keys [:name]

  defstruct [
    :id,
    :name
  ]

end
