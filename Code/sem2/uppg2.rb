require 'nokogiri'
require 'open-uri'
class Vevent
    def initialize(_node)
        @node = _node
        @datetime = @node.css("*[class='dtstart']").text 
        @summary = @node.css("*[class='summary']").text 
        @description = @node.css("*[class='description']").children.css("p").text
        @uid = @node.css("*[class='url uid']").first['href']
        

        @location = {}
        locationRoot = @node.css("*[class='location']")
        @location["org"] =  locationRoot.css("*[class='org fn']").text 
        @location["street-adress"] = locationRoot.css("*[class='street-address']").text
        @location["region"] = locationRoot.css("*[class='region']").text
        @location["locality"] = locationRoot.css("*[class='locality']").text
    end
    attr_reader :datetime, :description, :location, :summary, :uid
end

def find_all_calander_events(file)
    src = nil
    if file.start_with?("http")
        src = URI.open(file)
    else 
        src = File.open(file)
    end
    if !src; return; end;
    doc = Nokogiri::XML(src)

    # Loop through all div elements (or adjust the selector as needed)
    veventsArray = []
    doc.css('div[class="vevent"]').each do |node|
        veventsArray.push(Vevent.new(node))
    end
    
    return veventsArray
end
