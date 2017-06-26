defmodule OneflowEx.Carrier do

  @enforce_keys [ :code, :service ]

  defstruct [
    code: nil,
    service: nil,
    alias: nil
  ]
end
