class Person
    attr_reader :points
    def initialize(car,zip,license_age,gender,age)
        @car = car
        @zip = zip
        @license_age = license_age
        @gender = gender
        @age = age

        # Hash används för att mappa kategorier från DSLen till medlemsvariabler.
        # Vi kan då komma åt personens bilmärke med @table["carbrand"] 
        @table = {"carbrand" => @car, 
                  "zip" => @zip,
                  "license_age" => @license_age,
                  "gender" => @gender,
                  "age" => @age}
        @points = 0
        @rules_factor = 1
        
    end
    def evaluate_policy(filename)
        file_content = File.read(filename)
        instance_eval(file_content)
        @points *= @rules_factor
        return @points.round(2)
    end
    def calc_points(name, args)
        # Denna funktions används för att kolla om en regel appliceras på personen.
        if args == []
            return 0
        end

        # En loop används för att kolla flera matchningar på en rad,
        # exempelvis 'carbrand "BMW", "Volvo", "Fiat", 4
        for arg in args[0...-1]
            if arg.is_a?(String) && arg.include?("*") 
                arg = arg.gsub("*", ".")
                arg = Regexp.new("\\A" + arg + "\\z")
            end
            if arg.is_a?(Regexp)
                return args[-1] if arg =~ @table[name.to_s].to_s 
            end
            if arg.is_a?(Range) && arg.include?(@table[name.to_s]) 
                return args[-1]
            end

            # Detta är det mest generella. Här kollas om "arg",
            # vilket skulle vara "BMW" i raden 'carbrand "BMW", 2,
            # är detsamma som @table["carbrand"], vilket är det bilmärke
            # som personen har.
            if arg == @table[name.to_s]
                return args[-1]
            end
        end
        return 0
    end
    def method_missing(name, *args)
        if name.to_s == "rule"
            # Här har vi ett specialfall för "rule".
            # Eftersom en sådan rad anger flera regler kollar om flera regler uppfylls
            # behövde vi göra den checken till en funktion som kan återanvändas och
            # vars resultat sparas.
            rule_points = args[-1]
            fail = false
            for arg in args[0...-1]
                name, arg = arg
                if calc_points(name, [arg, rule_points]) == 0
                    fail = true
                end
            end
            if !fail
                @rules_factor *= rule_points
            end
        else
            @points += calc_points(name, args)
        end
    end
end