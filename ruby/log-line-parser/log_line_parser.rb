class LogLineParser
  def initialize(line)
    @line = line
  end

  def message
    @line.split(':').last.strip
  end

  def log_level
    match_data = @line.match(/\[([^:]+)\]/) # <MatchData "[ERROR]" 1:"ERROR">
    match_data[1].downcase if match_data
  end

  def reformat
    "#{message} (#{log_level})"
  end
end

# puts LogLineParser.new("[WARNING]:  Disk almost full\r\n").message
# log_line_parser = LogLineParser.new('[ERROR]: Invalid operation')
# puts log_line_parser.log_level
# puts LogLineParser.new('[INFO]: Operation completed').reformat
