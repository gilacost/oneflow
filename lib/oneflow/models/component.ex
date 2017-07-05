defmodule Oneflow.Models.Component do

  use Oneflow.Models.Encoder

  @enforce_keys [ :code, :path ]

  defstruct [
    :code,
    :path,
    :fetch,
    :localFile,
    :preflight,
    :sourceComponentId,
    :paper,
    :weight,
    :heigh,
    :width,
    :pages,
    :duplicate,
    :barcode,
    :attributes,
    :extraData,
  ]

end
