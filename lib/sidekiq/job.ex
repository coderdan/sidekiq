defmodule Sidekiq.Job do
  use Task

  def start_link(filename) do
    Task.start_link(__MODULE__, :run, [filename])
  end

  def run(filename) do
    IO.puts("Counting to a billion #{filename}")
    for i <- 1..500_000_000 do
      i
    end
    {:ok, foo} = 100
    IO.puts("DONE")
  end
end
