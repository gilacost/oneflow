defmodule Oneflow.Http.Request do

  alias Oneflow.Config
  alias __MODULE__

  require Logger

  defstruct [
    :method, :path, :params, :body, :http_opts, :opts
  ]

  def get(path, params, opts \\ []) do
    new(:get, path, params, opts)
  end

  def post(path, params, opts \\ []) do
    new(:post, path, params, opts)
  end

  def new(method, path, params, payload \\ [], opts \\ []) do
    http_opts = Keyword.get(opts, :http_opts, Config.http)

    %__MODULE__{
      method: method,
      path: path,
      params: params,
      body: payload,
      opts: opts,
      http_opts: http_opts
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

  def body(%Request{method: :get} = req) do
    []
  end
  def body(%Request{} = req) do
    Poison.encode!(req.body)
  end

  def query_string(%Request{method: :get} = req) do
    encode_params(req)
  end
  def query_string(%Request{} = req) do
    []
  end

  def put_params(%Request{} = req, params) do
    %Request{ req | params: Map.merge(req.params, params)}
  end

  def generate_token(%Request{} = req, timestamp) do
    %URI{ path: path } = URI.parse(req.path)
    url_without_query_params = "/api#{path}"
    string_to_sign = "#{String.upcase(Atom.to_string(req.method))} #{url_without_query_params} #{timestamp}"
    hmac = :crypto.hmac(:sha, Config.secret, string_to_sign ) |> Base.encode16 |> String.downcase
    if Config.log? do
      Logger.log(:info, "[oneflow][app_secret] #{Config.secret}")
      Logger.log(:info, "[oneflow][string_to_sign] #{string_to_sign}")
      Logger.log(:info, "[oneflow][hmac] #{hmac}")
    end
    "#{Config.token}:#{hmac}"
  end

end
