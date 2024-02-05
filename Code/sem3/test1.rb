require 'test-unit'
require './upg1.rb'
class Test_sem < Test::Unit::TestCase
    def setup
        @policy_file = "./policy.rb"
    end
    def test1
        test = Person.new("Volvo",58435,2,"M",32)
        assert_equal(15.66, test.evaluate_policy("./policy.rb"))
    end
    def test2
        person = Person.new("Fiat", 58647, 21, "M", 71)
        assert_equal(15, person.evaluate_policy("./policy.rb"))
    end
    def test_evaluate_policy
        person = Person.new("Citroen", 58937, 5, "M", 30)
        points = person.evaluate_policy("./policy.rb")
        assert_equal(23, points)
    end
    def test_rule_application
        person = Person.new("Volvo", 58726, 2, "M", 30)
        points = person.evaluate_policy(@policy_file)
        expected_points = (5 + 5 + 4 + 1 + 4.5) * 0.9 * 1.2 
        assert_equal(expected_points, points)
    end
    def test_1_match
        person = Person.new("UnknownBrand", 00000, 0, "UnknownGender", 100)
        points = person.evaluate_policy(@policy_file)
        assert_equal(3, points)
    end
    def test_no_match
        person = Person.new("UnknownBrand", 00000, -1, "UnknownGender", 100)
        points = person.evaluate_policy(@policy_file)
        assert_equal(0, points)
    end
end