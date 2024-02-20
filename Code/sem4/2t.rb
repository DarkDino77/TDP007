require 'test/unit'
require './constraint-parser.rb'  # Adjust this to the path of your file

class TestConstraintParser < Test::Unit::TestCase
  def setup
    @cp = ConstraintParser.new
  end
  def test_simple_sub
    f = @cp.parse("f=5-2")
    assert_equal(3, f[0].value, "Simple subtraction failed")
  end

  def test_simple_sub2
    f,a = @cp.parse("f=5-a")
    a.user_assign(2)
    assert_equal(3, f.value, "Subtraction with 2 unknowns failed")
  end

  def test_simple_div
    f = @cp.parse("f=6/2")
    assert_equal(3, f[0].value, "Simple division failed")
  end

  def test_simple_div2
    f,a = @cp.parse("f=6/a")
    a.user_assign(2)
    assert_equal(3, f.value, "Division with 2 unknowns failed")
  end

  def test_simple_mult2
    f,a = @cp.parse("f=6*a")
    a.user_assign(2)
    assert_equal(12, f.value, "Multiplication with 2 unknowns failed")
  end
  
  def test_complex_sub
    f = @cp.parse("f=(5-2)*2")
    assert_equal(6, f[0].value, "Complex subtraction failed")
  end

  def test_complex_div
    f = @cp.parse("f=(6/2)*2")
    assert_equal(6, f[0].value, "Complex division failed")
  end

  def test_constant
    f = @cp.parse("f=7")
    assert_equal(7, f[0].value, "Constant assignment failed")
  end

  def test_reassignment
    @cp.parse("a=10")
    result = @cp.parse("a=5")
    assert_equal(5, result[0].value, "Reassignment failed")
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
