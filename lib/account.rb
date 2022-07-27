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
    @transactions.push({
                         'date' => Time.now,
                         'credit' => amount,
                         'debit' => 0,
                         'balance' => @balance
                       })
  end

  def withdraw(amount)
    @balance -= amount
    @transactions.push({
                         'date' => Time.now,
                         'credit' => 0,
                         'debit' => amount,
                         'balance' => @balance
                       })
  end
end
