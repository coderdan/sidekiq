defmodule Sidekiq.JobSupervisor do
  # Automatically defines child_spec/1
  use DynamicSupervisor

  def start_link do
    DynamicSupervisor.start_link(__MODULE__, [], name: __MODULE__)
  end

  @impl true
  def init(_init_arg) do
    DynamicSupervisor.init(strategy: :one_for_one, max_seconds: 1000)
    #start_job_tracker()
  end

  #def start_job_tracker do
  #  spec = {Sidekiq.JobTracker, []}
  #  DynamicSupervisor.start_child(__MODULE__, spec)
  #end

  def start_upload(filename) do
    # If MyWorker is not using the new child specs, we need to pass a map:
    # spec = %{id: MyWorker, start: {MyWorker, :start_link, [foo, bar, baz]}}
    spec = {Sidekiq.Job, [filename]}
    DynamicSupervisor.start_child(__MODULE__, spec)
  end
end
