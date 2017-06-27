defmodule Oneflow.Helpers do

  def remove_nil_values(map) do
    map
    |> Map.from_struct
    |> Enum.filter(fn {_, v} -> v != nil end)
    |> Enum.into(%{})
  end

  def prepend( "/" <> string, prefix, :url ), do: "#{prefix}/#{string}"
  def prepend( string, prefix, :url ), do: raise ArgumentError, message: "path must start with /"
  def prepend( string, prefix, :string ), do: "#{prefix}#{string}"

end
