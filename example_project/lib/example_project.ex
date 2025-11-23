defmodule ExampleProject do
  use Application
  alias UUID # Using the UUID module from the uuid dependency

  @x 5  # Module attribute

  def start(_type, _args) do
    ExampleProject.main() # Calling the main function
    IO.puts(UUID.uuid4()) # Using a dependency function
    Supervisor.start_link([], strategy: :one_for_one) # the module must return a supervisor
  end

  def main do
    y = 10 # local variable
    IO.puts(@x + (y * 2)) # using module attribute and local variable

    IO.puts(:atom) # atom, constant value, useful for a small set of words that represent states or options
    IO.puts(:"hello atom") # atom with multiple words
    IO.puts("string") # string

    name = "Caleb"
    status = Enum.random([:gold, :silver, :bronze]) # random atom from a list

    if status === :gold do # if statement using an atom
      IO.puts("Welcome back, esteemed #{name} customer!")
    else
      IO.puts("Welcome, #{name}!")
    end

    case status do # case statement using an atom
      :gold -> IO.puts("You have access to the VIP lounge.")
      :silver -> IO.puts("You have access to the regular lounge.")
      :bronze -> IO.puts("You have access to the general area.")
    end

    IO.puts(?a) # character literal, numerical representation of a Unicode character

    time = Time.new!(14, 30, 0, 0) # creating a Time struct
    date = Date.new!(2024, 1, 15) # creating a Date struct
    dateTime = DateTime.new!(date, time) # creating a DateTime struct
    IO.inspect(time)
    IO.inspect(date)
    IO.inspect(dateTime)
    IO.puts(dateTime.year) # accessing a field in a struct
  end
end
