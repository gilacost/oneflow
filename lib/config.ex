defmodule Oneflow.Config do

  @endpoint "https://pro-api.oneflowcloud.com/api"

  def endpoint() do
    Application.get_env(:oneflow, :endpoint, @endpoint)
  end

  def token do
    Application.get_env(:oneflow, :token, nil)
  end

  def secret do
    Application.get_env(:oneflow, :secret, nil)
  end

  def log? do
    Application.get_env(:oneflow, :log, true)
  end

end
