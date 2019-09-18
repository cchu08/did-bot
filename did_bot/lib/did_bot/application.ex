defmodule DidBot.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  def start(_type, _args) do
    import Supervisor.Spec, warn: false

    slack_token = System.fetch_env!("SLACK_TOKEN")
  
    children = [
      worker(Slack.Bot, [DidBot.SlackBot, [], slack_token])
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: DidBot.Supervisor]
    Supervisor.start_link(children, opts)
  end
end
