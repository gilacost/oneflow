defmodule OneflowEx.Models.Destination do

  use OneflowEx.Models.Encoder

  @enforce_keys [:name]

  defstruct [
    :id,
    :name
  ]

end
