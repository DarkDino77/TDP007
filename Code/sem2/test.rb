require 'test-unit'
require './main.rb'
class Test_sem < Test::Unit::TestCase
    def test_upg1
        min_goal_diff, table = find_differential("football.txt", 1, 6, 8)
        assert_equal("Aston_Villa", min_goal_diff)

        min_goal_diff, table = find_differential("empty.txt", 1, 6, 8)
        assert_equal("", min_goal_diff)

        min_goal_diff, table = find_differential("", 1, 6, 8)
    end
end