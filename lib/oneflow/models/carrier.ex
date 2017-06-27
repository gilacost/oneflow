defmodule Oneflow.Models.Carrier do

  use Oneflow.Models.Encoder

  @enforce_keys [ :code, :service ]

  defstruct [
    :code,
    :service,
    :alias
  ]

end
