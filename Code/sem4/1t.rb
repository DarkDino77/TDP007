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
end
