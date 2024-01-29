class Weather
    def initialize(filename)
        @results = Hash.new
        file = File.open(filename, 'r')
        @lines = file.readlines.map(&:chomp)
        file.close

        weather_re = /(?<=\d\s\s)\d+(\s|\*)\s{3}\d+/
        counter = 0
        @lines.each do | line |
            if temp = line.match(weather_re)
                temperature = temp[0].split(" ")
                highest_temperature = temperature[0].to_i
                lowest_temperature = temperature[1].to_i
                counter += 1
                @results["day " + counter.to_s] = highest_temperature - lowest_temperature
            end
        end 
    end

    def get_table
        return @results.sort_by(&:last).reverse #exakt likadan som fotboll
    end

    def get_lowest_difference
        return get_table[-1]
    end

    def get_value(key)
        return @results.fetch(key)
    end
end