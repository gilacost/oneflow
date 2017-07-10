defmodule Oneflow.Helpers do

  @moduledoc """
  This module contains generic usful functions.
  """

  @doc """
  Removes any key value pair with a nil value in Enum. Given
  the map `%{test: nil, camarera: 1}` it should return a map
  with jsut `camarera`.

  Returns `%{camarera: 1}`.

  ## Examples

  iex> Oneflow.Helpers.remove_nil_values(%{test: nil, camarera: 1})
  [camarera: 1]

  iex> Oneflow.Helpers.remove_nil_values([test: nil, camarera: 1])
  [camarera: 1]
  """
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
  def prepend( "/" <> string, prefix, :url ), do: "#{prefix}/#{string}"
  def prepend( _string, _prefix, :url ), do: raise ArgumentError, message: "path must start with /"
  def prepend( string, prefix, :string ), do: "#{prefix}#{string}"

end
