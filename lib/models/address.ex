defmodule OneflowEx.Models.Address do

  use OneflowEx.Models.Encoder

  @enforce_keys [ :name, :address1, :town, :postcode, :isoCountry ]

  defstruct [
    :name,
    :companyName,
    :address1,
    :address2,
    :address3,
    :town,
    :state,
    :postcode,
    :isoCountry,
    :phone
  ]

end
