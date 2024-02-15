require 'test/unit'
require './constraint_networksX3000'  # Adjust this to the path of your file

class TestArithmeticConstraints < Test::Unit::TestCase
  def setup
    @a = Connector.new("A")
    @b = Connector.new("B")
    @c = Connector.new("C")  # Output for Adder and Multiplier
    @d = Connector.new("D")  # Additional connector for bidirectional tests
  end

  def test_adder
    Adder.new(@a, @b, @c)
    @a.user_assign(10)
    @b.user_assign(5)
    assert_equal(15, @c.value, "Adder did not correctly add A and B")

    @b.user_assign(10)
    assert_equal(20, @c.value, "Adder did not update C when B changed")
  end

  def test_multiplier
    Multiplier.new(@a, @b, @c)
    @a.user_assign(10)
    @b.user_assign(5)
    assert_equal(50, @c.value, "Multiplier did not correctly multiply A and B")

    @a.user_assign(2)
    assert_equal(10, @c.value, "Multiplier did not update C when A changed")
  end

  # Example of a bidirectional test, if applicable
  def test_bidirectional_behavior
    # Assuming Adder/Multiplier can propagate changes from output to inputs
    # This is a conceptual example; actual implementation may vary
    Adder.new(@a, @b, @c)
    @a.user_assign(10)
    @c.user_assign(15)  # Set the output directly
    # Test if B is correctly updated based on the new output C and input A
    assert_equal(5, @b.value, "Adder did not correctly update B when C and A were set")
  end

  def test_handling_of_false_values
    Adder.new(@a, @b, @c)
    assert_raise(ContradictionException) do
      @a.user_assign(false)
    end
  end
  def test_celsius2fahrenheit
    f, c = celsius2fahrenheit()
    c.user_assign(0)
    assert_equal(32, f.value.floor, "Conversion from Celsius to Fahrenheit failed")
    c.user_assign(100)
    assert_equal(212, f.value.floor, "Conversion from Celsius to Fahrenheit failed")
    c.forget_value("user")
    f.user_assign(100)
    assert_equal(37, c.value.floor, "Conversion from Fahrenheit to Celsius failed")
  end
  def test_constraints
    bee = Connector.new("b",5)
    cee = Connector.new("c",2)
    hihi = Connector.new("hihi")
    Adder.new(bee,cee,hihi)
    assert_equal(7, hihi.value)
  end
  def test_temperature_conversion
    f = Connector.new("f")
    c = Connector.new("c")
  
    # Create connectors for constants in the equation
    const_9 = Connector.new("const_9", 9)
    const_5 = Connector.new("const_5", 5)
    const_32 = Connector.new("const_32", 32)
  
    # Create connectors for intermediate values
    f_minus_32 = Connector.new("f_minus_32")
    five_times_f_minus_32 = Connector.new("five_times_f_minus_32")
  
    # Set up constraints according to the equation
    Adder.new(f_minus_32, const_32, f)
    Multiplier.new(const_5, f_minus_32, five_times_f_minus_32)
    Multiplier.new(const_9, c, five_times_f_minus_32)
  
    # Test the equation with known values
    f.user_assign(212)
    assert_equal(100, c.value, "Conversion from Fahrenheit to Celsius failed")
    f.user_assign(32)
    assert_equal(0, c.value, "Conversion from Fahrenheit to Celsius failed")
    f.forget_value("user")
    c.user_assign(100)
    assert_equal(212, f.value, "Conversion from Celsius to Fahrenheit failed")
  
    c.user_assign(0)
    assert_equal(32, f.value, "Conversion from Celsius to Fahrenheit failed")
  end
  


end
