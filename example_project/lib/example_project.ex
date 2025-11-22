defmodule ExampleProject do
  use Application

  def start(_type, _args) do
    IO.puts("ExampleProject started")
    Supervisor.start_link([], strategy: :one_for_one)
  end
end
