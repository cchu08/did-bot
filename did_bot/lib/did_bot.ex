defmodule DidBot.SlackBot do
  use Slack

  # commands
  @action_create "add"

  @task_name "(?<task_name>\\w+)"
  @slack_user_mentions "(?<users>(<[@].+>))"

  def handle_connect(slack, state) do
    IO.puts("Connected to Slack as #{slack.me.name}")
    {:ok, state}
  end

  def handle_event(message = %{type: "message"}, slack, state) do
    msg = get_message(message.text, slack)

    send_message("I got a message that said: #{msg}", message.channel, slack)

    {:ok, state}
  end

  def handle_event(_, _, state), do: {:ok, state}

  def get_message(text, s) do
    matches = Regex.run(bot_exp, text)
    IO.puts(matches)

    matches
  end
end
