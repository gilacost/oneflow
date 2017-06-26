defmodule OneflowEx.Models.Encoder do
  defmacro __using__(_) do
    quote do
      defimpl Poison.Encoder, for: __MODULE__ do
        import OneflowEx.Helpers
        def encode(struct, options) do
          remove_nil_values(struct)
          |> Poison.Encoder.Map.encode(options)
        end
      end
    end
  end
end
