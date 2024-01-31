class Person
    attr_reader :points
    def initialize(car,posnr,licensage,gender,age)
        @car = car
        @posnr = posnr
        @licensage = licensage
        @gender = gender
        @age = age
        @table = {"carbrand" => @car, 
                  "posnr" => @posnr,
                  "licensage" => @licensage,
                  "gender" => @gender,
                  "age" => @age}
        @points = 0
        
    end
    def evaluate_policy(filename)
        file_content = File.read(filename)
        instance_eval(file_content)
        pp @points
        return @points
    end

    def method_missing(name, *args)
        # pp "hello"
        if args == []
            return name
        end
        if (args[0].is_a?(Range) && args[0].include?(@table[name.to_s])) 
            @points += args[-1]
        end
        if args[0] != @table[name.to_s]
            return
        end
        p("name, args:", name, args, "\n", "args[0].is_a?(Range): ", args[0].is_a?(Range), "args[0].include?(@table[name.to_s]): ", args[0].include?(@table[name.to_s]))
        
        @points += args[-1]
        #     if args[-1] == "Poäng"
        #         pp table[name] = {}
        #     else
        #         pp table[&:last][name] = args[-1]
        #     end
        # end
    end

end

test = Person.new("Fiat",58647,1,"M",22)
test.evaluate_policy("./policy.rb")
pp test.table