require 'test-unit'
require './uppg2.rb'

class TestSem < Test::Unit::TestCase
    def test_events1
        veventsArray = main("./events.html")

        # Test for the first event
        assert_equal("2008-01-04 10:00pm EST", veventsArray[0].datetime)
        assert_equal("The Dark Carnival - 101.9FM", veventsArray[0].summary)
        expected_location_0 = {
            "org" => "",
            "street-adress" => "",
            "region" => "Ontario",
            "locality" => "Kingston"
        }
        assert_equal(expected_location_0, veventsArray[0].location)
        assert_equal("\"The Dark Carnival is two hours of spooky goodness. Every week, expect the best goth, industrial, and other dark music, as well as news and reviews from the wider world of goth culture. Embrace the darkness! Fridays, from 10 PM until the Witching Hour.\"",
        veventsArray[0].description)

        assert_equal("2008-01-06", veventsArray[1].datetime)
        assert_equal("Sinister Sundays", veventsArray[1].summary)
        expected_location_1 = {
            "org" => "The Bohemian",
            "street-adress" => "248 Front Street",
            "region" => "Ontario",
            "locality" => "Belleville"
        }
        assert_equal(expected_location_1, veventsArray[1].location)

        # Add more tests for other events in veventsArray as needed

        # Test for events2.html
        veventsArray2 = main("https://www.ida.liu.se/~TDP007/current/material/seminarie2/events2.html")
        # Add tests for events in veventsArray2 similar to above
    end
    def test_events2
        veventsArray2 = main("https://www.ida.liu.se/~TDP007/current/material/seminarie2/events2.html")

        # Test for the first event in events2.html
        assert_equal("2008-01-04 10:00pm EST", veventsArray2[0].datetime)
        assert_equal("The Dark Carnival - 101.9FM", veventsArray2[0].summary)
        expected_location_0 = {
            "org" => "",
            "street-adress" => "",
            "region" => "Ontario",
            "locality" => "Kingston"
        }
        assert_equal(expected_location_0, veventsArray2[0].location)

        # Test for the second event in events2.html
        assert_equal("2008-01-06", veventsArray2[1].datetime)
        assert_equal("Sinister Sundays", veventsArray2[1].summary)
        expected_location_1 = {
            "org" => "The Bohemian",
            "street-adress" => "248 Front Street",
            "region" => "Ontario",
            "locality" => "Belleville"
        }
        assert_equal(expected_location_1, veventsArray2[1].location)
    end
end
