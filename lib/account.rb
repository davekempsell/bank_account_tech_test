# frozen_string_literal: true

# contains functions to deposit into and withdraw from account
class Account
  attr_reader :transactions
  def initialize
    @transactions = []
  end

  def deposit(amount)
    transaction = { "credit" => amount, "debit" => "" }
    @transactions.push(transaction)
  end

  def withdraw(amount)
    transaction = { "credit" => "", "debit" => amount }
    @transactions.push(transaction)
  end
end
