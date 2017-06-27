defmodule Oneflow.Models.Destination do

  use Oneflow.Models.Encoder

  @enforce_keys [:name]

  defstruct [
    :id,
    :name
  ]

end
