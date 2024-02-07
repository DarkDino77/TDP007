#!/bin/env ruby -w

require './upg1'
require 'test/unit'

class TestPerson < Test::Unit::TestCase
    def test_brand
        kalle=Person.new("Volvo")
        kalle.evaluate_policy("policy.rb")
        assert_equal(5, kalle.points)
    end

    def test_post_number
        pelle = Person.new(nil, 58937)
        pelle.evaluate_policy("policy.rb")
        assert_equal(9, pelle.points)
    end

    def test_licence
        sven = Person.new(nil, nil, 2)
        sven.evaluate_policy("policy.rb")
        assert_equal(4, sven.points)
    end

    def test_gender
        per = Person.new(nil, nil, nil, "M")
        per.evaluate_policy("policy.rb")
        assert_equal(1, per.points)
    end

    def test_age
        gunn_britt = Person.new(nil, nil, nil, nil, 73)
        gunn_britt.evaluate_policy("policy.rb")
        assert_equal(3, gunn_britt.points)
    end

    def test_instruction_example
        # test utfört enligt körexempel från instruktionerna
        ulla = Person.new("Volvo","58435",2,"M",32)
        ulla.evaluate_policy("policy.rb")
        assert_equal(15.66, ulla.points)
    end
    
end