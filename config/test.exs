use Mix.Config

config :oneflow,
  token: "token",
  secret: "secret",
  log: true,
  endpoint: "https://endpoint.com/api",
  http: [], # these will be passed to hackney
  client: Oneflow.ApiInMemory
