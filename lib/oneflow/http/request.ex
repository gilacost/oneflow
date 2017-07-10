defmodule Oneflow.Http.Request do

  alias __MODULE__

  require Logger

  defstruct [
    :method, :path, :params, :body, :opts
  ]

  def new(method, path, params, payload \\ [], opts \\ []) do
    %__MODULE__{
      method: method,
      path: path,
      params: params,
      body: payload,
      opts: opts
    }
  end

  defp encode_param({k,v}) when is_map(v) do
    [ {k, Poison.encode!(v)} ]
  end

  defp encode_param({k,values}) when is_list(values) do
    key = Atom.to_string(k) <> "[]"
    values
    |> Enum.flat_map(fn(v) ->
      encode_param({key, v})
    end)
  end

  defp encode_param({k,v}) do
    [ {k, to_string v} ]
  end

  def encode_params(%Request{} = req) do
    Enum.flat_map(req.params, &encode_param/1)
  end

  def body(%Request{} = req) do
    Poison.encode!(req.body)
  end

  def query_string(%Request{method: method} = req) when method in [:get, :post] do
    encode_params(req)
  end
  def query_string(%Request{}) do
    []
  end

  def put_params(%Request{} = req, params) do
    %Request{ req | params: Map.merge(req.params, params)}
  end

end
