
class Football_Table
    def initialize(filename)
        @results = Hash.new
        file = File.open(filename, 'r')
        @lines = file.readlines.map(&:chomp)
        file.close

        team_name_re =  /(?<=\d\. )\w+/
        goal_difference_re = /\d+\s{2}\-\s{2}\d+/

        @lines.each do | line |
            if line.match?(team_name_re)
                key = line.match(team_name_re)[0] 
                val = eval(line.match(goal_difference_re)[0])
                @results[key] = val
            end
        end
    end

    def get_table
        return @results.sort_by(&:last).reverse
    end

    def get_worst_team 
        return get_table[-1]
    end

    def get_goal_difference(key)
         return @results.fetch(key)
    end

end