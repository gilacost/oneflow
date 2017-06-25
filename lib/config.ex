defmodule OneflowEx.Config do

  @endpoint "https://pro-api.oneflowcloud.com/api"

  def endpoint() do
    Application.get_env(:oneflow_ex, :endpoint, @endpoint)
  end

  def http() do
    Application.get_env(:oneflow_ex, :http, [])
  end

  def app_id do
    Application.get_env(:oneflow_ex, :app_id, nil)
  end

  def app_secret do
    Application.get_env(:oneflow_ex, :app_secret, nil)
  end

  def log? do
    Application.get_env(:oneflow_ex, :log, true)
  end

end
