# frozen_string_literal: true

# contains functions to deposit into and withdraw from account
class Account
  attr_reader :transactions
  def initialize
    @balance = 0
    @transactions = []
  end

  def deposit(amount)
    @balance += amount
    date = Time.now
    transaction = { "date" => date, "credit" => amount, "debit" => "", "balance" => @balance }
    @transactions.push(transaction)
  end

  def withdraw(amount)
    @balance -= amount
    date = Time.now
    transaction = { "date" => date, "credit" => "", "debit" => amount, "balance" => @balance }
    @transactions.push(transaction)
  end
end
