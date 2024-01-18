# Uppgift 7: Utökade Integer-klassen
class Integer
  def fib(n=self)
    return n if n <= 1

    fib(n - 1) + fib(n - 2)
  end
end

# Uppgift 8: Utökade String-klassen
class String
  def acronym(input=self)
    word_array = input.split
    result = '' # Denna deklaration går nog att undvika.
    word_array.each do |word|
      result += word.chr
    end
    result.upcase
  end
end

# Uppgift 9: Utökade String-klassen
class Array
  def rotate_left(n = 1, input_arr = self)
    n.times do input_arr.insert(-1, input_arr.shift) end
    input_arr
  end
end
