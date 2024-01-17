#sudo gem install test-unit to install test_unit
#läste webhemsida instructioner.


require "date"

# Uppgift 1
# Kopierar kod från den givna föreläsnings filen.
def n_times(value, &block)
    value.times do 
        block.call
    end
    return value # Specificerar return för att enkelt veta vad functionen returnera
end

class Repeat
    def initialize(value)
        @value = value
    end 

    def each(&block)
        return n_times(@value) {block.call} # 
    end
end


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
def tag_names(html)
    matches = html.scan(/<([a-z]+).*?>/).uniq
    return matches
end

#Uppgift 12
def regnr?(str)
    #return \[A\.find(str).bool
end

