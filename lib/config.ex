defmodule OneflowEx.Config do

  @endpoint "https://pro-api.oneflowcloud.com/api"

  def endpoint() do
    Application.get_env(:oneflow_ex, :endpoint, @endpoint)
  end

  def http() do
    Application.get_env(:oneflow_ex, :http, [])
  end

  def token do
    Application.get_env(:oneflow_ex, :token, nil)
  end

  def secret do
    Application.get_env(:oneflow_ex, :secret, nil)
  end

  def log? do
    Application.get_env(:oneflow_ex, :log, true)
  end

end
