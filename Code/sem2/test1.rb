require 'test-unit'
require './uppg1.rb'
class Test_sem < Test::Unit::TestCase
    def test_uppg1
        min_goal_diff, table = find_differential("football.txt", 1, 6, 8)
        assert_equal("Aston_Villa", min_goal_diff)
        assert_equal([["Arsenal", 43],
            ["Manchester_U", 42],
            ["Liverpool", 37],
            ["Chelsea", 28],
            ["Newcastle", 22],
            ["Leeds", 16],
            ["Blackburn", 4],
            ["Aston_Villa", -1],
            ["Tottenham", -4],
            ["Fulham", -8],
            ["Southampton", -8],
            ["West_Ham", -9],
            ["Charlton", -11],
            ["Everton", -12],
            ["Middlesbrough", -12],
            ["Bolton", -18],
            ["Sunderland", -22],
            ["Ipswich", -23],
            ["Derby", -30],
            ["Leicester", -34]], table)

        min_goal_diff, table = find_differential("empty.txt", 1, 6, 8)
        assert_equal("", min_goal_diff)

        min_goal_diff, table = find_differential("", 1, 6, 8)
        assert_equal(nil, min_goal_diff)
        assert_equal(nil, table)
    end
    def test_uppg2
        min_temp_diff, table = find_differential("weather.txt", 0, 2, 1)
        assert_equal("14", min_temp_diff)
        assert_equal([["14", -2],
            ["15", -9],
            ["13", -11],
            ["24", -13],
            ["12", -15],
            ["28", -16],
            ["7", -16],
            ["2", -16],
            ["25", -18],
            ["4", -18],
            ["27", -19],
            ["19", -20],
            ["16", -20],
            ["10", -20],
            ["6", -20],
            ["8", -21],
            ["mo", -22],
            ["29", -22],
            ["23", -22],
            ["3", -22],
            ["17", -24],
            ["5", -24],
            ["22", -26],
            ["21", -27],
            ["20", -27],
            ["1", -29],
            ["18", -30],
            ["11", -32],
            ["26", -33],
            ["30", -45],
            ["9", -54]], table)
        min_temp_diff, table = find_differential("empty.txt", 0, 2, 1)
        assert_equal("", min_temp_diff)

        min_temp_diff, table = find_differential("", 0, 2, 1)
        assert_equal(nil, min_temp_diff)
        assert_equal(nil, table)
    end
end