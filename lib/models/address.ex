defmodule OneflowEx.Models.Address do

  use OneflowEx.Models.Encoder

  @enforce_keys [ :name, :address1, :town, :postcode, :isoCountry ]

  defstruct [
    name: nil,
    companyName: nil,
    address1: nil,
    address2: nil,
    address3: nil,
    town: nil,
    state: nil,
    postcode: nil,
    isoCountry: nil,
    phone: nil
  ]

end
