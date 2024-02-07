#!/bin/env ruby -w

class Person
     
    def initialize(brand="", post_number=0, licence_age=nil, gender="", age=nil)
        if gender == "M"
            gender = "Man"
        elsif gender == "K"
            gender = "Kvinna"
        else
            gender = gender
        end
        @person_data = {"brand"=>brand, "post_number"=>post_number.to_s, "licence"=>licence_age.to_s, "gender"=>gender, "age"=>age.to_s}
        
        @points = 0.0
        @function_name = ""
    end

    attr_reader :brand, :post_number, :licence_age, :gender, :age, :points, :active, :person_data
    attr_writer :points, :active

    def evaluate_policy(file_name)
        self.instance_eval(File.read(file_name))
        if @person_data["gender"] == "Man" && @person_data["licence"].to_f < 3 && @person_data["licence"] != "" 
            puts nil.to_s
            @points *= 0.9
        end
        if @person_data["brand"] == "Volvo" && @person_data["post_number"][0..1] == "58"
            @points *= 1.2
        end
    end

    def calc_age_funcs(name, args)
        # hittar och adderar poängen för de delar som var beroende av ålder (ex. körkort)

        keyword = ""
        case @function_name
        when "k"
            keyword = "licence"
        when "a"
            keyword = "age"
        else
            ""
        end
        if(@person_data[keyword] == "")
            return 
        end
        arguments = /^(\d*)-(\d*)\D*(\d*),?(\d*)/.match(args[0])
        
        min_age = arguments[1].to_f
        max_age = arguments[2].to_f
        if (@person_data[keyword].to_f >= min_age && @person_data[keyword].to_f <= max_age) 
            # kollar om det som finns angivet vid initiering är inom intervallet som hittats av regex
            points = (arguments[3].to_i+ (arguments[4].to_i/10.0)).to_f
            @points += points
        end
    end

    def method_missing(name, *args)
        # puts "name: #{name}, args: #{args}"
        @function_name = name.to_s
        
        if @function_name[0] == "p" && @function_name != "poäng"
            @function_name = @function_name[1..-1]
        elsif @function_name == "k"|| @function_name =="a"
            calc_age_funcs(name, args)
        end

        found = false
        @person_data.each do |key, value|
            # loopar igenom all information om personen och kollar om något värde matchar namnet på "funktionen"
            if value.to_s == @function_name
                found = true
            end
        end

        if found == true
            points = args[0].to_f  
            if args.length > 1
                # kollar om poängen är decimaltal eller inte
                points = (args[0]+(args[1]/10.0)).to_f
            end
            @points += points
        end
    end
end

kalle=Person.new("Volvo","58435",2,"K",32)
#kalle=Person.new(nil, nil, nil, "M", nil)
kalle.evaluate_policy("policy.rb")
puts kalle.points
