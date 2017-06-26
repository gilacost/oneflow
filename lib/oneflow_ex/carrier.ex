defmodule OneflowEx.Carrier do

  use OneflowEx.Encoder

  @enforce_keys [ :code, :service ]

  defstruct [
    code: nil,
    service: nil,
    alias: nil
  ]

end
