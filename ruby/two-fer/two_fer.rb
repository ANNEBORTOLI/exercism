class TwoFer
  def self.two_fer(name = '')
    name.empty? ? "One for you, one for me." : "One for #{name}, one for me."
  end
end

# Better solution

# class TwoFer
#   def self.two_fer(name = "you")
#     "One for #{name}, one for me."
#   end
# end
