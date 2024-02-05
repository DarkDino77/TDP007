require 'test/unit'
require_relative './rdparse.rb'

class TestLogicalParser < Test::Unit::TestCase
  def setup
    @parser = LogicalParser.new
  end

  def test_variable_assignment
    @parser.logicParser.parse('( set a true )')
    assert_equal(true, @parser.variables['a'])
  end

  def test_and_operation
    @parser.logicParser.parse('( set a true )')
    @parser.logicParser.parse('( set b false )')
    result = @parser.logicParser.parse('( and a b )')
    assert_equal(false, result)
  end

  def test_or_operation
    @parser.logicParser.parse('( set a false )')
    @parser.logicParser.parse('( set b true )')
    result = @parser.logicParser.parse('( or a b )')
    assert_equal(true, result)
  end

  def test_not_operation
    @parser.logicParser.parse('( set a false )')
    result = @parser.logicParser.parse('( not a )')
    assert_equal(true, result)
  end

  def test_complex_expression
    @parser.logicParser.parse('( set a true )')
    @parser.logicParser.parse('( set b false )')
    result = @parser.logicParser.parse('( and a ( not b ) )')
    assert_equal(true, result)
  end
  def test_false_variable_assignment
    @parser.logicParser.parse('( set c false )')
    assert_equal(false, @parser.variables['c'])
  end

  def test_complex_logical_expression
    @parser.logicParser.parse('( set x true )')
    @parser.logicParser.parse('( set y false )')
    @parser.logicParser.parse('( set z true )')
    result = @parser.logicParser.parse('( and x ( or y z ) )')
    assert_equal(true, result)
  end

  def test_nested_logical_expression
    @parser.logicParser.parse('( set m false )')
    @parser.logicParser.parse('( set n true )')
    result = @parser.logicParser.parse('( or m ( and n ( not m ) ) )')
    assert_equal(true, result)
  end

  def test_variable_reassignment
    @parser.logicParser.parse('( set reassign true )')
    assert_equal(true, @parser.variables['reassign'])
    @parser.logicParser.parse('( set reassign false )')
    assert_equal(false, @parser.variables['reassign'])
  end

  def test_true_false

    result = @parser.logicParser.parse('( and true true  )')
    assert_equal(true, result)
    result = @parser.logicParser.parse('( and true false  )')
    assert_equal(false, result)
    result = @parser.logicParser.parse('( and false false  )')
    assert_equal(false, result)

    result = @parser.logicParser.parse('( or true true  )')
    assert_equal(true, result)
    result = @parser.logicParser.parse('( or true false  )')
    assert_equal(true, result)
    result = @parser.logicParser.parse('( or false false  )')
    assert_equal(false, result)

    result = @parser.logicParser.parse('( not true )')
    assert_equal(false, result)
    result = @parser.logicParser.parse('( not false )')
    assert_equal(true, result)

  end
end
