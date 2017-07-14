defmodule Oneflow.Helpers do

  @moduledoc """
  This module contains generic useful functions.
  """

  @doc """
  Removes any key value pair with a nil value in Enum. Given
  the map `%{test: nil, key: 1}` it should return a map
  with jsut `key`.

  Returns `%{key: 1}`.

  ## Examples

  iex> Oneflow.Helpers.remove_nil_values(%{test: nil, key: 1})
  [key: 1]

  iex> Oneflow.Helpers.remove_nil_values([test: nil, key: 1])
  [key: 1]
  """
  @spec remove_nil_values(Map.t) :: Enum.t
  def remove_nil_values(map) do
    Enum.reject(map, fn({_key, value}) -> value == nil end)
  end

  @doc """
  Prepends given prefix to the given string.

  ## Examples

  iex> Oneflow.Helpers.prepend("/accounts", "/api", :url)
  "/api/accounts"

  iex> Oneflow.Helpers.prepend("secret", "token:", :string)
  "token:secret"
  """
  @spec prepend(String.t, String.t, atom ) :: String.t
  def prepend( "/" <> string, prefix, :url ), do: "#{prefix}/#{string}"
  def prepend( _string, _prefix, :url ), do: raise ArgumentError, message: "path must start with /"
  def prepend( string, prefix, :string ), do: "#{prefix}#{string}"

end
