require './weather_sorter'
require 'test/unit'

class Uppgift < Test::Unit::TestCase
    def test_table
        weather1 = Weather.new("weather.txt")
        assert_equal(2, weather1.get_value("day 14"))
        assert_equal(["day 14", 2], weather1.get_lowest_difference)
        assert_not_equal(2, weather1.get_value('day 15'))
        weather2 = Weather.new("small_scale_weather.txt")
        assert_equal([["day 1", 29], ["day 3", 22], ["day 2", 16]], weather2.get_table)
    end
end