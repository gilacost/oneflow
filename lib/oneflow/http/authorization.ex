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
  iex> request = %Oneflow.Http.Request{ method: :get, path: "/url"}
  iex> Oneflow.Http.Authorization.header_value(request, 498601557)
  "token:6f88d384bd48daed9bf03efad5d5b5bdf89f3063"

  iex> request = %Oneflow.Http.Request{ method: :get, path: "/url?foo=bar"}
  iex> Oneflow.Http.Authorization.header_value(request, 498601557)
  "token:6f88d384bd48daed9bf03efad5d5b5bdf89f3063"

  """
  @spec header_value(Request.t(), integer) :: String.t()
  def header_value(%Request{} = req, timestamp) do
    req
    |> url_path
    |> generate_string_to_sign(req, timestamp)
    |> hmac
    |> prepend("#{Config.token()}:", :string)
  end

  # private

  @doc """
  Gets the url path and preppeds /api to it.
  """
  @spec url_path(Request.t()) :: String.t()
  def url_path(%Request{} = req) do
    req.path
    |> URI.parse()
    |> Map.get(:path, "")
    |> prepend("/api", :url)
  end

  @doc """
  Forms an string with http method, empty space, then path without query string,
  then another empty space and then the timestamp.
  """
  @spec generate_string_to_sign(String.t(), Request.t(), integer) :: String.t()
  def generate_string_to_sign(url_path, %Request{} = req, timestamp) do
    req.method
    |> Atom.to_string()
    |> String.upcase()
    |> Kernel.<>(" #{url_path} #{timestamp}")
  end

  @doc """
  Hashes the given string given to sign using the config secret as key.
  """
  @spec hmac(String.t()) :: String.t()
  def hmac(string_to_sign) do
    if Config.log?(), do: Logger.log(:info, "[oneflow][string_to_sign] #{string_to_sign}")

    :sha
    |> :crypto.hmac(Config.secret(), string_to_sign)
    |> Base.encode16()
    |> String.downcase()
  end
end
