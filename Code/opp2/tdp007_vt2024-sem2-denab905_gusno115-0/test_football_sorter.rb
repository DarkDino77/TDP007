require './football_sorter'
require 'test/unit'

class Uppgift1 < Test::Unit::TestCase
    def test_table
        table1 = Football_Table.new("football.txt")
        assert_equal(["Leicester", -34], table1.get_worst_team)
        assert_equal(43, table1.get_goal_difference('Arsenal'))
        assert_not_equal(34, table1.get_goal_difference('Leicester'))
        table2 = Football_Table.new("small_scale_football.txt")
        assert_equal([['Arsenal', 43],['Manchester_U', 42],['Liverpool', 37]], table2.get_table)
        pp table1.get_table
    end
end