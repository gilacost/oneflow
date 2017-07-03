defmodule Oneflow do
  alias Oneflow.{Config, Http.Request, Http.Authorization, Models.Order}
  alias HTTPoison.Response

  require Logger

  @search_topics [
    "cases",
    "shipments",
    "skus",
    "stocks",
    "shippingmethods",
    "printers",
    "devices",
    "clients"
  ]


  def get!(path, params \\ %{}, opts \\ []) do
    case get(path, params, opts) do
      {:ok, res} -> res
      {:error, err} -> raise inspect(err)
    end
  end

  defp get(path, params, opts) do
    Request.new(:get, path, params, [] , opts)
    |> call
  end

  def post!(path, params \\ %{}, body \\ %{}, opts \\ []) do
    case post(path, params, body, opts) do
      {:ok, res} -> res
      {:error, err} -> raise inspect(err)
    end
  end

  defp post(path, params, body, opts) do
    Request.new(:post, path, params, body, opts)
    |> call
  end


  def call(%Request{} = req) do
    body = Request.body(req)
    qs = Request.query_string(req)

    url = "#{Config.endpoint}#{req.path}#{qs}"

    timestamp = :os.system_time(:seconds)

    headers = [
      {"Content-Type", "application/json"},
      {"x-oneflow-date", timestamp},
      {"x-oneflow-authorization", Authorization.header_value(req, timestamp)}
    ]

    if Config.log? do
      Logger.log(:info, "[oneflow] #{req.method} #{String.trim_trailing(req.path, "/")} #{inspect req.params}")
      Logger.log(:info, "[oneflow][headers] #{inspect headers}")
      Logger.log(:info, "[oneflow][url] #{url}")
      Logger.log(:info, "[oneflow][body] #{inspect body}")
    end



    with {:ok, %Response{ body: body, status_code: status_code }} <- HTTPoison.request(req.method, url, body, headers, req.opts),
         {:ok, parsed_body } <- Poison.decode(body, keys: :atoms) do

      case status_code do
        code when code in [200,201] -> {:ok, parsed_body}
        _   -> {:error, parsed_body}
      end

    end
  end

  def search(query, topic \\ "shipments", filters \\ [] ) when topic in @search_topics do
    body = %{query: query, facetFilters: filters}
    post!("/search/facet/#{topic}", %{}, body)
  end

  def submit_order(%Order{} = order) do
    body = order
    post!("/order", %{}, body)
  end
end
