class Tournament

  def self.tally(input)
    matches = {}

    input.each_line do |line|
      team_a, team_b, result = line.split(';')

      # if table columns do not exist, initialize
      matches[team_a] ||= { MP: 0, W: 0, D: 0, L: 0, P: 0 }
      matches[team_b] ||= { MP: 0, W: 0, D: 0, L: 0, P: 0 }

      # Update match count
      matches[team_a][:MP] += 1
      matches[team_b][:MP] += 1

      # Update results for both teams
      case result
      when 'win'
        matches[team_a][:W] += 1
        matches[team_a][:P] += 3
        matches[team_b][:L] += 1
      when 'loss'
        matches[team_b][:W] += 1
        matches[team_b][:P] += 3
        matches[team_a][:L] += 1
      when 'draw'
        matches[team_a][:P] += 1
        matches[team_b][:P] += 1
        matches[team_a][:D] += 1
        matches[team_b][:D] += 1
      end
    end
    matches
  end

  def self.generate_table(matches)
    # table header
    table = "Team                           | MP |  W |  D |  L |  P\n"
    # Order matches by points in descending order (hash.sort_by {|k, v| -v})
    matches_sorted = matches.sort_by { |_, value| -value[:P] }
    matches_sorted.each do |team, value|
      table += "#{team.ljust(30)}| #{value[:MP]} | #{value[:W]} | #{value[:D]} | #{value[:L]} | #{value[:P]}\n"
    end
    table
  end
end
