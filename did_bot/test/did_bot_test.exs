defmodule DidBotTest do
  use ExUnit.Case
  doctest DidBot

  test "greets the world" do
    assert DidBot.hello() == :world
  end
end
