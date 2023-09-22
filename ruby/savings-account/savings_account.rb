module SavingsAccount
  def self.interest_rate(balance)
    return 3.213 if balance.negative?
    return 0.5 if balance < 1000
    return 1.621 if balance < 5000
    return 2.475 if balance >= 5000
  end

  def self.annual_balance_update(balance)
    balance + (balance * (interest_rate(balance) / 100))
  end

  def self.years_before_desired_balance(current_balance, desired_balance)
    updated_balance = annual_balance_update(current_balance)
    years = 0
    while current_balance < desired_balance
      years += 1
      current_balance = updated_balance + annual_balance_update(updated_balance)
    end

    years
  end
end

puts SavingsAccount.years_before_desired_balance(200.75, 214.88)
#=> 14

# Formula: Interest = P * R * T
# P = Principal amount (the beginning balance).
# R = Interest rate (usually per year, expressed as a decimal).
# T = Number of time periods (generally one-year time periods).
