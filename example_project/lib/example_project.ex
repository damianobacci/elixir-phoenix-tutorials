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


    memberships = {:bronze, :silver} # tuple
    memberships = Tuple.append(memberships, :gold) # adding an element to a tuple
    IO.inspect(memberships)

    prices = {19.99, 29.99, 39.99}
    avg = Tuple.sum(prices) / tuple_size(prices) # calculating average from tuple elements
    IO.puts("Average price: #{avg}")
    IO.puts("Price for #{elem(memberships, 0)}: $#{elem(prices, 0)}") # accessing tuple elements

    user1 = {"Caleb", 30} # tuple with mixed types
    user2 = {"Alice", 25}
    user3 = {"Bob", 28}


    {name, age} = user1 # pattern matching to extract values
    IO.puts("#{name} is #{age} years old.")

    users = [user1, user2, user3] # list of tuples

    Enum.each(users, fn {name, age} -> # iterating over the list with pattern matching
      IO.puts("#{name} is #{age} years old.")
    end)

    memberships = %{ # map
      gold: :gold,
      silver: :silver,
      bronze: :bronze,
      none: :none
    }

    prices = %{
      gold: 39.99,
      silver: 29.99,
      bronze: 19.99,
      none: 0.0
    }

    new_users = [
      {"Caleb", memberships.gold},
      {"Alice", memberships.silver},
      {"Bob", memberships.bronze},
      {"Eve", memberships.none}
    ]

    Enum.each(new_users, fn {name, membership} ->
      IO.puts("#{name} has #{membership} membership, paying $#{prices[membership]}.")
    end)
  end
end
