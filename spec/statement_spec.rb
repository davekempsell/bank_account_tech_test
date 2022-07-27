# frozen_string_literal: true

require 'statement'
require 'account'

RSpec.describe Statement do
  it 'receives an instance of Account' do
    my_account = Account.new
    expect{my_statement = Statement.new(my_account)}.to_not raise_error
  end
  it 'prints a statement with no transactions when none have been made' do
    my_account = Account.new
    my_statement = Statement.new(my_account)
    expect(my_statement.print_statement).to eq "date || credit || debit || balance"
  end
end