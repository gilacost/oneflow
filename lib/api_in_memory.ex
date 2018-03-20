defmodule Oneflow.ApiInMemory do
  alias HTTPoison.Response

  def request(method, url, body, headers, opts) do
    [
      method,
      url,
      body,
      headers,
      opts
    ]
    |> IO.inspect()

    {:ok,
     %Response{
       body:
         Poison.encode(%{
           "param_one" => "param_one",
           "param_two" => 2
         }),
       status_code: 200
     }}
  end
end
