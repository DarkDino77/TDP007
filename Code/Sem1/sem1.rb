#sudo gem install test-unit to install test_unit
#läste webhemsida instructioner.
require "test-unit"

require "date"

# Uppgift 1
# Kopierar kod från den givna föreläsnings filen.
def n_times(value, &block)
    value.times do 
        block.call
    end
    return value # Specificerar return för att enkelt veta vad functionen returnera
end

n_times(3) { puts "Hello!" }

class Repeat
    def initialize(value)
        @value = value
    end 

    def each(&block)
        return n_times(@value) {block.call} # 
    end
end
#hur gör man dessa tester
do_three = Repeat.new(3)

do_three.each { puts "Hooray!" }

#Uppgift2 
#Fråga klass kamrat och chatgpt om hur Range#inject
# 0 är inte ett positivt heltal
def factorial(n)
    return (1..n).inject(:*)
end

#Uppgift3 Antog att length fanns och kopiera hur man iterarea med en for loop genom en sträng från föreläsningen
def longest_string(list_of_words)
    longest_word = ""
    for word in list_of_words do
        if longest_word.length < word.length
            longest_word = word
        end
    end
    return longest_word
end

#Uppgift4
def find_it(list_of_values, &block)
    longest_word = list_of_values[0]
    for value in list_of_values do
        if block.call(value,longest_word)
            longest_word = value
        end
    end
    return longest_word
    
end

#Uppgift5
class PersonName

    #initialiserar namnet med tomma strängar
    def initialize()
        @name = ""
        @surname = ""
    end 

    # Returnerar full name
    # returnerar nil om ett namn inte har givits
    def fullname()
        fullname = @name + " " + @surname
        if fullname == " "
            return nil
        end
        return fullname
    end

    #Sparar ett nytt namn med hjälp av split 
    def fullname=(new_name)
        name = new_name.split
        @name = name[0]
        @surname = name[1]
    end
end

#uppgift 6
class Person 
    def initialize(name = "", surname = "", age = 0)
        @name = PersonName.new()
        @name.fullname = name + " " + surname
        @age = age
        @birthyear = Date.today.year - @age
    end 
    def age=(new_age)
        @age = new_age
        @birthyear = Date.today.year - @age
    end

    def birthyear=(new_birthyear)
        year_diff = @birthyear - new_birthyear
        @birthyear = new_birthyear
        @age +=year_diff
    end
    
    attr_reader :age
    attr_reader :birthyear

    def fullname()
        return @name.fullname
    end
end

# Uppgift 7
# Kålla hur man accesa inbygda klasser i föreläsning slidens
# Self fick från chat gpt
class Integer
    def fib()
        if self == 0
            return self 
        elsif self <= 1 
            return 1
        end
        return (self-1).fib + (self-2).fib
    end
end

#Uppgift8
class String
    def acronym
        words = self.split
        acronym = ""
        for word in words do
            # FÖ2
            if word[0] =~ /[a-zA-z]/
                acronym += word[0].upcase
            end
        end
        return acronym
    end
end

#Uppgift 9
class Array
    def rotate_left(steps = 1)
        length = self.size
        if steps%length == 0; return self; end
        steps.times do 
            for i in (0..length) do
                temp = self.shift
                self.push(temp)
            end
        end
        return self
    end
end

#Uppgift 10
def find_username(str)
    reg = /([a-öA-Ö]+: )(.*)/.match(str)

    if not reg 
        return ""
    end

    return reg[2] 
end

#Uppgitf 11 

# require 'net/http'

# url = URI.parse('http://www.google.com/')
# http = Net::HTTP.new(url.host, url.port)

# response = http.request(Net::HTTP::Get.new(url.path))
# html = response.body
# puts html



def tag_names(html)
    matches = html.scan(/<([a-z]+).*?>/).uniq
    return matches
end

#Uppgift 12
def regnr?(str)
    #return \[A\.find(str).bool
end

class Test_sem < Test::Unit::TestCase

    def test_upg1
        assert_equal(3, n_times(3) { puts "Hello!" }, "Error")
    end

    def test_upg2
        assert_equal(nil, factorial(-1), "Error")
        assert_equal(nil, factorial(0), "Error")
        assert_equal(1, factorial(1), "Error")
        assert_equal(2, factorial(2), "Error")
        assert_equal(6, factorial(3), "Error")
        assert_equal(24, factorial(4), "Error")
        assert_equal(120, factorial(5), "Error")
        assert_equal(720, factorial(6), "Error")
        assert_equal(5040, factorial(7), "Error")
        assert_equal(40320, factorial(8), "Error")
        assert_equal(362880, factorial(9), "Error")
        assert_equal(2432902008176640000, factorial(20), "Error")
    end

    def test_upg3
        assert_equal("apelsin", longest_string(["apelsin", "banan", "citron"]), "Error")
        assert_not_equal("banan", longest_string(["apelsin", "banan", "citron"]), "Error")
        assert_not_equal("citron", longest_string(["apelsin", "banan", "citron"]), "Error")
    end

    def test_upg4
        assert_equal("banan", find_it(["apelsin", "banan", "citron"]) { |a,b| a.length < b.length }, "Error")
        assert_equal("apelsin", find_it(["apelsin", "banan", "citron"]) { |a,b| a.length > b.length }, "Error")
        assert_equal(3, find_it([1, 2, 3]) { |a,b| a > b }, "Error")
        assert_equal(1, find_it([1, 2, 3]) { |a,b| a < b }, "Error")
    end

    def test_upg5
        new_person = PersonName.new()
        new_person.fullname = "Dennis Abrikossov"
        assert_equal("Dennis Abrikossov", new_person.fullname, "Error")
    end

    def test_upg6
        new_person = Person.new("Dennis", "Abrikossov", 26)
        assert_equal("Dennis Abrikossov", new_person.fullname, "Error")
        assert_equal(26, new_person.age, "Error")
        assert_equal(1998, new_person.birthyear, "Error")
    end

    def test_upg7
        assert_equal(0, 0.fib, "Error")
        assert_equal(1, 1.fib, "Error")
        assert_equal(1, 2.fib, "Error")
        assert_equal(2, 3.fib, "Error")
        assert_equal(3, 4.fib, "Error")
        assert_equal(5, 5.fib, "Error") 
        assert_equal(8, 6.fib, "Error")
        assert_equal(13, 7.fib, "Error") 
        assert_equal(21, 8.fib, "Error") 
        assert_equal(34, 9.fib, "Error") 
        assert_equal(55, 10.fib, "Error")   
    end

    def test_upg8
        assert_equal("LOL", "Laugh out loud".acronym, "Error")
        assert_equal("DWIM", "Do what I mean!!".acronym, "Error")
        assert_equal("DWIM", "Do what I mean! !".acronym, "Error")
    end

    def test_upg9
        assert_equal([2, 3, 1], [1,2,3].rotate_left, "Error")
        assert_equal([1, 2, 3], [1,2,3].rotate_left(3), "Error")
    end

    def test_uppg10
        assert_equal("Brian", find_username("USERNAME: Brian"))
        assert_equal("Brian", find_username("USERaksjdNAME: Brian"))
        assert_equal("", find_username(": Brian"))
        assert_equal("", find_username(" : Brian"))
        assert_equal("", find_username("USERNAME!!: Brian"))
        assert_equal("Brian", find_username("USER\nNAME: Brian"))
        assert_equal("Brian!", find_username("USERNAME: Brian!"))
    end

    def test_upg11
        require 'open-uri.rb'
        html = URI.open("http://www.google.com/") { |f| f.read }

        assert_equal([2, 3, 1], tag_names(html), "Error")
        assert_equal([1, 2, 3], [1,2,3].rotate_left(3), "Error")
    end
end