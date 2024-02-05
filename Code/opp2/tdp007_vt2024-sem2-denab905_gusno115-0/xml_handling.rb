require 'rexml/document'


class XML_Handling
    attr_reader :events
    def initialize(filename)
        src = File.open(filename)
        doc = REXML::Document.new src
        src.close
        @events = Array.new

        doc.elements.each("//div[@class='vevent']") do |temp|
            @events << [temp.elements[".//span[@class='summary']"].text,
                        temp.elements[".//span[@class='dtstart']"].text,
                        temp.elements[".//span[@class='locality']"].text,
                        temp.elements[".//span[@class='region']"].text,
                        temp.elements[".//a[@class='userLink ']"].text,
                        temp.elements[".//td[@class='description']/p"].text]
        end
    end

    def print_events
        @events.each do | temp_arr |
            print "********** ", temp_arr[0], " **********\n"
            print "When: ", temp_arr[1], "\n"
            print "Location: ", temp_arr[2], ", ", temp_arr[3], "\n"
            print "Posted by: ", temp_arr[4], "\n\n"
            print "Desc: ", temp_arr[5], "\n"
            print "------------------------------------------\n\n"
        end
    end
end
