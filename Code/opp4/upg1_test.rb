require './constraint_networks.rb'
require 'test/unit'

class TestUppgift1 < Test::Unit::TestCase
    def test_adder
        a = Connector.new("a")
        b = Connector.new("b")
        c = Connector.new("c")
        Adder.new(a, b, c)

        #1
        a.user_assign(2)
        b.user_assign(2)
        assert_equal(4, c.value)

        #2
        a.user_assign(10)
        b.user_assign(4)
        a.user_assign(1)
        assert_equal(5, c.value)

        #3
        a.user_assign(5.5)
        b.user_assign(-25)
        assert_equal(-19.5, c.value)

    end

    def test_multiplier
            x = Connector.new("x")
            y = Connector.new("y")
            z = Connector.new("z")
            Multiplier.new(x, y, z)

            #1
            x.user_assign(10)
            y.user_assign(5)
            assert_equal(50, z.value)

            #2
            x.user_assign(-10)
            y.user_assign(-5)
            assert_equal(50, z.value)

            #3
            x.user_assign(10.5)
            y.user_assign(5)
            assert_equal(52.5, z.value)

    end

    def test_cel2fahr
        c, f = celsius2fahrenheit

        #celsius--->fahrenheit
        c.user_assign 100
        assert_equal(212, f.value)

        c.user_assign 0
        assert_equal(32, f.value)
        
        #fahrenheit-->celsius
        c.forget_value "user"

        f.user_assign 100
        assert_equal(37.77777777777778, c.value)

        f.user_assign 32
        assert_equal(0, c.value)
    end

end
