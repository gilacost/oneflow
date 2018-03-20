defmodule Oneflow.Config do
  @endpoint "https://pro-api.oneflowcloud.com/api"

  @spec endpoint() :: String.t()
  def endpoint() do
    Application.get_env(:oneflow, :endpoint, @endpoint)
  end

  @spec token() :: String.t() | nil
  def token() do
    Application.get_env(:oneflow, :token, nil)
  end

  @spec secret() :: String.t() | nil
  def secret() do
    Application.get_env(:oneflow, :secret, nil)
  end

  @spec log? :: boolean
  def log? do
    Application.get_env(:oneflow, :log, true)
  end
end
