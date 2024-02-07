#!/bin/env ruby -w

require './upg2'
require 'test/unit'

class TestParser < Test::Unit::TestCase
    
    def test_set
        assert_true(Evaluator.new.evaluate_test("(set a true)"))
        assert_false(Evaluator.new.evaluate_test("(set b false)"))
    end

    def test_or
        e = Evaluator.new
        e.evaluate_test("(set a true)")
        e.evaluate_test("(set b false)")
        assert_true(e.evaluate_test("(or a b)"))

        e.evaluate_test("(set a false)")
        assert_false(e.evaluate_test("(or a b)"))

        e.evaluate_test("(set a true)")
        e.evaluate_test("(set b true)")
        assert_true(e.evaluate_test("(or a b)"))
    end

    def test_and
        e = Evaluator.new
        e.evaluate_test("(set a true)")
        e.evaluate_test("(set b false)")
        assert_false(e.evaluate_test("(and a b)"))

        e.evaluate_test("(set b true)")
        assert_true(e.evaluate_test("(and (or a b) (not false))"))

        e.evaluate_test("(set a false)")
        e.evaluate_test("(set b false)")
        assert_false(e.evaluate_test("(and a b)"))
    end

    def test_not
        e = Evaluator.new
        e.evaluate_test("(set a true)")
        assert_false(e.evaluate_test("(not a)"))
        
        e.evaluate_test("(set b false)")
        assert_true(e.evaluate_test("(not b)"))
    end
end