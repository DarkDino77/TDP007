require './constraint-parser.rb'
require 'test/unit'

class TestUppgift2 < Test::Unit::TestCase
    def test_1
        cp = ConstraintParser.new
        c, f = cp.parse "9*c=5*(f-32)"

        f.user_assign 0
        assert_equal(0, f.value)
        assert_equal(-18, c.value)
    end
    def test_2
        cp = ConstraintParser.new
        c, f = cp.parse "9*c=5*(f-32)"
        
        f.user_assign 100
        assert_equal(100, f.value)
        assert_equal(37, c.value)

    end
    def setup
        @cp = ConstraintParser.new
      end
      def test_simple_sub
        f = @cp.parse("f=5-2")
        p f
        assert_equal(3, f[0].value, "Conversion from Fahrenheit to Celsius failed")
      end
    
      def test_simple_sub2
        f,a = @cp.parse("f=5-a")
        a.user_assign(2)
        assert_equal(3, f.value, "Conversion from Fahrenheit to Celsius failed")
      end
    
      def test_simple_div
        f = @cp.parse("f=6/2")
        assert_equal(3, f[0].value, "Conversion from Fahrenheit to Celsius failed")
      end
    
      def test_simple_div2
        f,a = @cp.parse("f=6/a")
        a.user_assign(2)
        assert_equal(3, f.value, "Conversion from Fahrenheit to Celsius failed")
      end
    
      def test_simple_add
        f = @cp.parse("f=6+2")
        assert_equal(8, f[0].value, "Conversion from Fahrenheit to Celsius failed")
      end
      
      def test_simple_add2
        f,a = @cp.parse("f=6+a")
        a.user_assign(2)
        assert_equal(8, f.value, "Conversion from Fahrenheit to Celsius failed")
      end
    
      def test_simple_mult
        f = @cp.parse("f=6*2")
        p "test", f
        assert_equal(12, f.value, "Conversion from Fahrenheit to Celsius failed")
      end
    
      def test_simple_mult2
        f,a = @cp.parse("f=6*a")
        a.user_assign(2)
        assert_equal(12, f.value, "Conversion from Fahrenheit to Celsius failed")
      end
      
      def test_complex_sub
        f = @cp.parse("f=(5-2)*2")
        assert_equal(6, f[0].value, "Conversion from Fahrenheit to Celsius failed")
      end
    
      def test_complex_div
        f = @cp.parse("f=(6/2)*2")
        assert_equal(6, f[0].value, "Conversion from Fahrenheit to Celsius failed")
      end
    
      def test_constant
        f = @cp.parse("f=7")
        assert_equal(7, f[0].value, "Conversion from Fahrenheit to Celsius failed")
      end
    
      def test_reassignment
        @cp.parse("a=10")
        result = @cp.parse("a=5")
        assert_equal(5, result[0].value, "Reassignment failed")
      end
    
      def test_simple_addition
        result = @cp.parse("x=2+3")
        assert_equal(5, result[0].value, "Simple addition failed")
      end
    
      def test_complex_expression
        result = @cp.parse("y=(2+3)*4-5/1")
        assert_equal(15, result[0].value, "Complex expression evaluation failed")
      end
    
      def test_expression_with_parentheses
        result = @cp.parse("z=(2*(3+4))-6")
        assert_equal(8, result[0].value, "Expression with parentheses failed")
      end
    
      def test_parse_temperature_conversion
        c, f = @cp.parse("9*c=(f-32)*5")
    
        # Ensure the returned objects are Connector instances
        assert_instance_of(Connector, c, "Parsing did not return a Connector for 'c'")
        assert_instance_of(Connector, f, "Parsing did not return a Connector for 'f'")
    
        # Test the equation with known values
        f.user_assign(212)
        assert_equal(100, c.value, "Conversion from Fahrenheit to Celsius failed")
    
        f.user_assign(32)
        assert_equal(0, c.value, "Conversion from Fahrenheit to Celsius failed")
    
        f.user_assign(0)
        assert_equal(-18, c.value, "Conversion from Fahrenheit to Celsius failed")
    
        f.user_assign(100)
        assert_equal(37, c.value, "Conversion from Fahrenheit to Celsius failed")
    
        f.forget_value("user")
        c.user_assign(100)
        assert_equal(212, f.value, "Conversion from Celsius to Fahrenheit failed")
    
        c.user_assign(0)
        assert_equal(32, f.value, "Conversion from Celsius to Fahrenheit failed")
      end
end