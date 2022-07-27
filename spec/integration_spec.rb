# frozen_string_literal: true

require 'statement'
require 'account'

RSpec.describe Statement do
  before(:each) do
    allow(Time).to receive(:now).and_return Time.new(2000, 1, 1)
  end
  it 'returns statement in the correct format, in reverse chronological order' do
    my_account = Account.new
    my_account.deposit(1000)
    my_account.deposit(2000)
    my_account.withdraw(500)
    my_statement = Statement.new(my_account)
    expect(my_statement.print_statement).to include 'date || credit || debit || balance'
    expect(my_statement.print_statement).to include '01/01/2000 ||  || 500.00 || 2500.00'
    expect(my_statement.print_statement).to include '01/01/2000 || 2000.00 ||  || 3000.00'
    expect(my_statement.print_statement).to include '01/01/2000 || 1000.00 ||  || 1000.00'
  end
end
