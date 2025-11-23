defmodule Guessing do
  use Application

  def start(_type, _args) do
    Guessing.main()
    Supervisor.start_link([], strategy: :one_for_one) # the module must return a supervisor
  end

  def main do
    IO.puts(:world)
  end
end
