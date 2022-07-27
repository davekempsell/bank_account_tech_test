# frozen_string_literal: true

require 'statement'
require 'account'

RSpec.describe Statement do
  it 'receives an instance of Account' do
    my_account = Account.new
    expect { Statement.new(my_account) }.to_not raise_error
  end

  it 'prints a statement with no transactions when none have been made' do
    my_account = Account.new
    my_statement = Statement.new(my_account)
    expect(my_statement.print_statement).to include 'date || credit || debit || balance'
  end

  it 'includes a deposit of 10 to be shown on statement' do
    my_account = Account.new
    my_account.deposit(10)
    my_statement = Statement.new(my_account)
    expect(my_statement.print_statement).to include "10.00"
  end
end
