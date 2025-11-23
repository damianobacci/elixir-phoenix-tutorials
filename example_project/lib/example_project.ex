defmodule ExampleProject do
  use Application
  alias UUID

  @x 5  # Module attribute

  def start(_type, _args) do
    IO.puts("ExampleProject started")
    IO.puts(ExampleProject.main())
    IO.puts(UUID.uuid4())
    Supervisor.start_link([], strategy: :one_for_one)
  end

  def main do
    y = 10 # local variable
    @x + y * 2
  end
end
