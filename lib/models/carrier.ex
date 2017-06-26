defmodule OneflowEx.Models.Carrier do

  use OneflowEx.Models.Encoder

  @enforce_keys [ :code, :service ]

  defstruct [
    :code,
    :service,
    :alias
  ]

end
