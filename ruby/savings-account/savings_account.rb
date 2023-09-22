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
    updated_balance = current_balance
    years = 0
    while updated_balance < desired_balance
      years += 1
      updated_balance = annual_balance_update(updated_balance)
    end
    years
  end
end

# puts SavingsAccount.interest_rate(200.75) #=> 0.5
# puts SavingsAccount.annual_balance_update(200.75) #=> 201.75375
puts SavingsAccount.years_before_desired_balance(200.75, 214.88) #=> 14
