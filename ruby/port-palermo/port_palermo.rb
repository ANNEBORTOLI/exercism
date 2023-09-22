module Port
  # TODO: define the 'IDENTIFIER' constant
  IDENTIFIER = :PALE

  def self.get_identifier(city)
    city.size >= 4 ? city[0..3].upcase.to_sym : city.upcase.to_sym
  end

  def self.get_terminal(ship_identifier)
    # %w[OIL GAS].member?(ship_identifier[..2]) ? :A : :B
    ship_identifier.to_s[0..2] == 'OIL' || ship_identifier.to_s[0..2] == 'GAS' ? :A : :B
  end
end

# puts Port::IDENTIFIER # => :PALE
# puts Port.get_identifier("Hamburg") # => :HAMB
# puts Port.get_identifier("Rome") # => :ROME
# puts Port.get_identifier("KIEL") # => :KIEL
# puts Port.get_terminal(:OIL123) # => :A
# puts Port.get_terminal(:GAS123) # => :A
# puts Port.get_terminal(:SSS123) # => :B
