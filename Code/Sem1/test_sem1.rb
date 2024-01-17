require "./sem1"
require "test-unit"
class Test_sem < Test::Unit::TestCase

    def test_upg1
        i = 0
        n_times(3) { i+=1 }
        assert_equal(3, i, "Error")
        i = 0
        do_three = Repeat.new(3)
        do_three.each { i+=1 }
        assert_equal(3, i, "Error")
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
        assert_equal([["html"], ["head"], ["meta"], ["title"], ["script"], ["style"], ["g"], ["body"], ["div"], ["nobr"], ["b"], ["a"], ["u"], ["span"], ["center"], ["br"], ["img"], ["form"], ["table"], ["tr"], ["td"], ["input"], ["p"], ["k"]], tag_names(html), "Error")
    end
end