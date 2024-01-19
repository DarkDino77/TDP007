def find_differential(file, name_line, diff_line1, diff_line2)
    if !File.exist?(file) 
        return puts "file does not exist"
    end
    lines = File.readlines(file)
    football_table = []
    found = false
    for line in lines do
        if line == "</pre>\n"
            found = false
        end
        if found
            if not /--+/ =~ line  
                football_table.push(line)
            end
        end
        if line == "<pre>\n"
            found = true
        end
    end
    goal_differentials = {}
    found_stats = false
    for team_stats in football_table do
        splitted = team_stats.split
        if (splitted[0] != nil && splitted[0].start_with?("1"))
            found_stats = true
        end
        if found_stats
            team_name = splitted[name_line]
            goals = splitted[diff_line1]
            goals_lost = splitted[diff_line2]
            goal_differentials[team_name] = goals.to_i - goals_lost.to_i
        end
    end
    res = ""
    sorted_goal_differentials1 = goal_differentials.sort_by { |key, value| value.abs }
    if sorted_goal_differentials1.length > 0
        res = sorted_goal_differentials1[0][0]
    end
    sorted_goal_differentials2 = goal_differentials.sort_by { |key, value| value }
    return res, sorted_goal_differentials2.reverse
end