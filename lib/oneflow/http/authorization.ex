defmodule Oneflow.Http.Authorization do
  alias Oneflow.{Http.Request, Config}

  import Oneflow.Helpers, only: [prepend: 3]

  require Logger

  @moduledoc """
  This is the the module that allows generating the value for the
  x-oneflow-authorization header.
  """

  @doc """
  Generates authentication header value given the request
  `%Request{ method: :get, url: "/url"}`. and the timestamp
  `1498601557`.

  Returns `"token:6f88d384bd48daed9bf03efad5d5b5bdf89f3063"`.

  If the url contains a query string but the
  path is the same, the value must be the same.

  ## Examples

  iex> Oneflow.Http.Authorization.header_value(%Oneflow.Http.Request{ method: :get, path: "/url"}, 498601557)
  "token:6f88d384bd48daed9bf03efad5d5b5bdf89f3063"

  iex> Oneflow.Http.Authorization.header_value(%Oneflow.Http.Request{ method: :get, path: "/url?foo=bar"}, 498601557)
  "token:6f88d384bd48daed9bf03efad5d5b5bdf89f3063"

  """
  def header_value(%Request{} = req, timestamp) do
    req
    |> url_path
    |> generate_string_to_sign(req, timestamp)
    |> hmac
    |> prepend("#{Config.token}:", :string)
  end

  # private

  defp url_path(%Request{} = req)  do
    req.path
    |> URI.parse
    |> Map.get(:path, "")
    |> prepend("/api", :url)
  end

  defp generate_string_to_sign(url_path, %Request{} = req, timestamp) do
    req.method
    |> Atom.to_string
    |> String.upcase
    |> Kernel.<>(" #{url_path} #{timestamp}")
  end

  defp hmac(string_to_sign) do
    if Config.log?, do: Logger.log(:info, "[oneflow][string_to_sign] #{string_to_sign}")
    :sha
    |> :crypto.hmac(Config.secret, string_to_sign)
    |> Base.encode16
    |> String.downcase
  end
end
