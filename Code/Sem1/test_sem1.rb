require "./sem1"
require "test-unit"
class Test_sem < Test::Unit::TestCase

    def test_upg1
        i = 0
        n_times(3) { i+=1 }
        assert_equal(3, i)
        i = 0
        do_three = Repeat.new(3)
        do_three.each { i+=1 }
        assert_equal(3, i)
    end

    def test_upg2
        assert_equal(nil, factorial(-1))
        assert_equal(nil, factorial(0))
        assert_equal(1, factorial(1))
        assert_equal(2, factorial(2))
        assert_equal(6, factorial(3))
        assert_equal(24, factorial(4))
        assert_equal(120, factorial(5))
        assert_equal(720, factorial(6))
        assert_equal(5040, factorial(7))
        assert_equal(40320, factorial(8))
        assert_equal(362880, factorial(9))
        assert_equal(2432902008176640000, factorial(20))
    end

    def test_upg3
        assert_equal("apelsin", longest_string(["apelsin", "banan", "citron"]))
        assert_not_equal("banan", longest_string(["apelsin", "banan", "citron"]))
        assert_not_equal("citron", longest_string(["apelsin", "banan", "citron"]))
    end

    def test_upg4
        assert_equal("banan", find_it(["apelsin", "banan", "citron"]) { |a,b| a.length < b.length })
        assert_equal("apelsin", find_it(["apelsin", "banan", "citron"]) { |a,b| a.length > b.length })
        assert_equal(3, find_it([1, 2, 3]) { |a,b| a > b })
        assert_equal(1, find_it([1, 2, 3]) { |a,b| a < b })
    end

    def test_upg5
        new_person = PersonName.new()
        new_person.fullname = "Dennis Abrikossov"
        assert_equal("Dennis Abrikossov", new_person.fullname)
    end

    def test_upg6
        new_person = Person.new("Dennis", "Abrikossov", 26)
        assert_equal("Dennis Abrikossov", new_person.fullname)
        assert_equal(26, new_person.age)
        assert_equal(1998, new_person.birthyear)
    end

    def test_upg7
        assert_equal(0, 0.fib)
        assert_equal(1, 1.fib)
        assert_equal(1, 2.fib)
        assert_equal(2, 3.fib)
        assert_equal(3, 4.fib)
        assert_equal(5, 5.fib) 
        assert_equal(8, 6.fib)
        assert_equal(13, 7.fib) 
        assert_equal(21, 8.fib) 
        assert_equal(34, 9.fib) 
        assert_equal(55, 10.fib)   
    end

    def test_upg8
        assert_equal("LOL", "Laugh out loud".acronym)
        assert_equal("DWIM", "Do what I mean!!".acronym)
        assert_equal("DWIM", "Do what I mean! !".acronym)
    end

    def test_upg9
        assert_equal([2, 3, 1], [1,2,3].rotate_left)
        assert_equal([1, 2, 3], [1,2,3].rotate_left(3))
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
        assert_equal([["html"], ["head"], ["meta"], ["title"], ["script"], ["style"], ["g"], ["body"], ["div"], ["nobr"], ["b"], ["a"], ["u"], ["span"], ["center"], ["br"], ["img"], ["form"], ["table"], ["tr"], ["td"], ["input"], ["p"], ["k"]], tag_names(html))
    end
end