defmodule Oneflow.Http.Request do
  alias __MODULE__

  alias Oneflow.Config

  require Logger

  defstruct [
    :method,
    :path,
    :params,
    :body,
    :opts
  ]

  @doc """
  Given a method and a path instantiates a oneflow request.

  ## Examples
  iex> alias Oneflow.Http.Request
  iex> Request.new(:get, "/shipments")
  %Oneflow.Http.Request{body: %{}, method: :get, opts: [], params: %{}, path: "/shipments"}
  """
  @spec new(atom, String.t(), String.t(), List.t(), List.t()) :: %Request{}
  def new(method, path, params \\ %{}, payload \\ %{}, opts \\ []) do
    %__MODULE__{
      method: method,
      path: path,
      params: params,
      body: payload,
      opts: opts
    }
  end

  @doc """
  Oneflow api excpect request's content-type to be json. This
  function encodes the body with poison.

  ## Examples
  iex> alias Oneflow.Http.Request
  iex> request = Request.new(:get, "/shipments", %{}, %{"key" => "value"})
  iex> Request.body(request)
  "{\\"key\\":\\"value\\"}"
  """
  def body(%Request{} = req) do
    x = Poison.encode!(req.body)
    if Config.log?() do
      IO.puts("-------------")
      IO.puts(x)
    end
    x
  end
end
