defmodule OneflowEx.Helpers do

  def remove_nil_values(map) do
    map
    |> Map.from_struct
    |> Enum.filter(fn {_, v} -> v != nil end)
    |> Enum.into(%{})
  end

end
