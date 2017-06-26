defmodule OneflowEx.Component do

  @enforce_keys [ :code, :path]

  defstruct [
    code: nil ,
    path: nil ,
    fetch: false,
    localFile: false,
    preflight: false,
    sourceComponentId: nil,
    paper: nil,
    weight: "90gsms",
    heigh: nil,
    pages: 1,
    dpulicate: 1,
    barcode: nil,
    attributes: nil,
    extraData: nil,
  ]

end
