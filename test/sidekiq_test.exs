defmodule SidekiqTest do
  use ExUnit.Case
  doctest Sidekiq

  test "greets the world" do
    assert Sidekiq.hello() == :world
  end
end
