require './xml_handling.rb'
require 'test/unit'

class Test_XML_Handling < Test::Unit::TestCase
    def test_xml_lemao
        xml_doc1 = XML_Handling.new("events.html")
        xml_doc2 = XML_Handling.new("events2.html")
        assert(xml_doc1.events)
        assert(xml_doc2.events)
        assert_equal(capture_output {xml_doc1.print_events}, capture_output {xml_doc2.print_events})
        xml_doc1.print_events
    end
end

