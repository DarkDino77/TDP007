#!/usr/bin/ruby -w

# Uppgift 1: Iteratorer
def n_times(num, &block)
  num.times { block.call }
end

# Uppgift 1: Forts.
class Repeat
  def initialize(number)
    @num = number
  end

  def each(&block)
    @num.times { block.call }
  end
end

# Uppgift 2: Beräkna fakultet
# puts (1..20).inject(:*) # one-liner utan funktion

def factorial(i)
  (1..i).inject(:*)
end

# Uppgift 3: Finn längsta strängen i en Array
def longest_string(my_array)
  my_array.max_by(&:length)
end

# Uppgift 3: Alternativ som också skapar en array av sina parametrar
def longest_string_alt(*my_array)
  my_array.max_by(&:length)
end

# Uppgift 4
def find_it(arr, &block)
  arr.reduce do |a, b|
    block.call(a, b) ? a : b
  end
end
